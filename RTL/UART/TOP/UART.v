
module UART # (
    parameter DATA_WIDTH = 8
)(
    input   wire                          RST,
    input   wire                          TX_CLK,
    input   wire                          RX_CLK,
    input   wire                          RX_IN_S,
    input   wire   [DATA_WIDTH - 1 : 0]   TX_IN_P, 
    input   wire                          TX_IN_V, 
    input   wire   [5 : 0]                PRESCALE, 
    input   wire                          PAR_EN,
    input   wire                          PAR_TYP,
    output  wire   [DATA_WIDTH - 1 : 0]   RX_OUT_P, 
    output  wire                          RX_OUT_V,
    output  wire                          TX_OUT_S,
    output  wire                          TX_OUT_V,  
    output  wire                          PAR_ERR,
    output  wire                          STP_ERR
);


UART_TX U0_UART_TX (
.CLK(TX_CLK),
.RST(RST),
.P_DATA(TX_IN_P),
.DATA_VALID(TX_IN_V),
.PAR_EN(PAR_EN),
.PAR_TYP(PAR_TYP), 
.TX_OUT(TX_OUT_S),
.BUSY(TX_OUT_V)
);

  /*
UART_TX U0_UART_TX (
.CLK(TX_CLK),
.RST(RST),
.P_DATA(TX_IN_P),
.Data_Valid(TX_IN_V),
.parity_enable(PAR_EN),
.parity_type(PAR_TYP), 
.TX_OUT(TX_OUT_S),
.busy(TX_OUT_V)
);
 */
UART_RX U0_UART_RX (
.CLK(RX_CLK),
.RST(RST),
.RX_IN(RX_IN_S),
.PRESCALE(PRESCALE),
.PAR_EN(PAR_EN),
.PAR_TYP(PAR_TYP),
.P_DATA(RX_OUT_P), 
.DATA_VALID(RX_OUT_V),
.PAR_ERR(PAR_ERR),
.STP_ERR(STP_ERR)
);
 



endmodule
 
