module UART_RX (
    input   wire           CLK,            // Clock signal
    input   wire           RST,            // Reset signal (active low)
    input   wire           RX_IN,          // UART RX input signal
    input   wire  [5 : 0]  PRESCALE,       // Prescaler value
    input   wire           PAR_EN,         // Enable signal for parity check
    input   wire           PAR_TYP,        // Parity type: 0 for even, 1 for odd
    output  reg   [7 : 0]  P_DATA,         // Parallel data output
    output  reg            PAR_ERR,        // Parity error output
    output  reg            STP_ERR,        // Stop bit error output
    output  reg            DATA_VALID      // Data valid output signal
);

// Internal wire declarations to connect submodules
wire [3 : 0] BIT_CNT_wr;       // Bit counter wire (4 bits)
wire [4 : 0] EDG_CNT_wr;       // Edge counter wire (5 bits)

wire STRT_ERR_wr,              // Start bit error wire
     EDG_BIT_CNT_EN_wr,        // Edge/bit counter enable wire
     DAT_SAMP_EN_wr,           // Data sampling enable wire
     STRT_CHK_EN_wr,           // Start bit check enable wire
     DESER_EN_wr,              // Deserializer enable wire
     PAR_CHK_EN_wr,            // Parity check enable wire
     STP_CHK_EN_wr,            // Stop bit check enable wire
     SAMPLED_BIT_wr;           // Sampled bit wire

// UART_RX_FSM: Finite state machine for controlling UART RX behavior
UART_RX_FSM  U0_FSM (
.CLK(CLK),
.RST(RST),
.RX_IN(RX_IN),
.PAR_EN(PAR_EN),
.PRESCALE(PRESCALE),
.BIT_CNT(BIT_CNT_wr),
.EDG_CNT(EDG_CNT_wr),
.PAR_ERR(PAR_ERR),
.STRT_ERR(STRT_ERR_wr),
.STP_ERR(STP_ERR),
.EDG_BIT_CNT_EN(EDG_BIT_CNT_EN_wr),
.DAT_SAMP_EN(DAT_SAMP_EN_wr),
.STRT_CHK_EN(STRT_CHK_EN_wr),
.DESER_EN(DESER_EN_wr),
.PAR_CHK_EN(PAR_CHK_EN_wr),
.STP_CHK_EN(STP_CHK_EN_wr),
.DATA_VALID(DATA_VALID)
);

// UART_RX_EDG_BIT_COUNTER: Handles bit counting and edge counting
UART_RX_EDG_BIT_COUNTER  U0_EDG_BIT_COUNTER (
.CLK(CLK),
.RST(RST),
.EDG_BIT_CNT_EN(EDG_BIT_CNT_EN_wr),
.PRESCALE(PRESCALE),
.BIT_CNT(BIT_CNT_wr),
.EDG_CNT(EDG_CNT_wr)
);

// UART_RX_DATA_SAMPLING: Samples the RX input based on prescale value
UART_RX_DATA_SAMPLING  U0_DATA_SAMPLING (
.CLK(CLK),
.RST(RST),
.RX_IN(RX_IN),
.PRESCALE(PRESCALE),
.DAT_SAMP_EN(DAT_SAMP_EN_wr),
.EDG_CNT(EDG_CNT_wr),
.SAMPLED_BIT(SAMPLED_BIT_wr)
);

// UART_RX_DESERIALIZER: Deserializes the incoming bits into parallel data
UART_RX_DESERIALIZER  U0_DESERIALIZER (
.CLK(CLK),
.RST(RST),
.SAMPLED_BIT(SAMPLED_BIT_wr),
.DESER_EN(DESER_EN_wr),
.PRESCALE(PRESCALE),
.EDG_CNT(EDG_CNT_wr),
.P_DATA(P_DATA)
);

// UART_RX_PAR_CHK: Checks the parity of the received data
UART_RX_PAR_CHK  U0_PAR_CHK (
.CLK(CLK),
.RST(RST),
.SAMPLED_BIT(SAMPLED_BIT_wr),
.PAR_CHK_EN(PAR_CHK_EN_wr),
.PAR_TYP(PAR_TYP),
.P_DATA(P_DATA),
.PAR_ERR(PAR_ERR)
);

// UART_RX_STP_CHK: Checks the stop bit for errors
UART_RX_STP_CHK  U0_STP_CHK (
.CLK(CLK),
.RST(RST),
.SAMPLED_BIT(SAMPLED_BIT_wr),
.STP_CHK_EN(STP_CHK_EN_wr),
.STP_ERR(STP_ERR)
);

// UART_RX_STRT_CHK: Checks the start bit for errors
UART_RX_STRT_CHK  U0_STRT_CHK (
.CLK(CLK),
.RST(RST),
.SAMPLED_BIT(SAMPLED_BIT_wr),
.STRT_CHK_EN(STRT_CHK_EN_wr),
.STRT_ERR(STRT_ERR_wr)
);

endmodule