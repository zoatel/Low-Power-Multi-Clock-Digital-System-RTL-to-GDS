module UART_TX  (
    input  wire         CLK,
    input  wire         RST,
    input  wire  [7:0]  P_DATA,
    input  wire         DATA_VALID,
    input  wire         PAR_EN,
    input  wire         PAR_TYP, 
    output wire         TX_OUT,
    output wire         BUSY
);

wire         SER_EN_wr, SER_DONE_wr, SER_OUT_wr, PAR_BIT_Wr;
			
wire  [1:0]  MUX_SEL_wr;

UART_TX_FSM  U0_FSM (
.CLK(CLK),
.RST(RST),
.DATA_VALID(DATA_VALID), 
.PAR_EN(PAR_EN),
.SER_DONE(SER_DONE_wr), 
.SER_EN(SER_EN_wr),
.MUX_SEL(MUX_SEL_wr), 
.BUSY(BUSY)
);

UART_TX_SERIALIZER U0_SERIALIZER (
.CLK(CLK),
.RST(RST),
.P_DATA(P_DATA),
.DATA_VALID(DATA_VALID),
.SER_EN(SER_EN_wr),
.SER_OUT(SER_OUT_wr),
.SER_DONE(SER_DONE_wr)
);

UART_TX_MUX U0_MUX (
.CLK(CLK),
.RST(RST),
.SEL(MUX_SEL_wr),
.IN0(1'b0),
.IN1(1'b1),
.IN2(SER_OUT_wr),
.IN3(PAR_BIT_Wr),
.TX_OUT(TX_OUT) 
);

UART_TX_PARITY_CALC U0_PARITY_CALC (
.CLK(CLK),
.RST(RST),
.PAR_EN(PAR_EN),
.PAR_TYP(PAR_TYP),
.P_DATA(P_DATA),
.BUSY(BUSY),
.DATA_VALID(DATA_VALID), 
.PAR_BIT(PAR_BIT_Wr)
); 


endmodule
 