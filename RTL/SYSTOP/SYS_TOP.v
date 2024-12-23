
module SYS_TOP 
(
 input   wire                          UART_CLK,
 input   wire                          REF_CLK,
 input   wire                          RST,
 input   wire                          UART_RX_IN,
 output  wire                          UART_TX_O,
 output  wire                          PAR_ERR,
 output  wire                          STP_ERR
);

wire RST_SYNC_UART, RST_SYNC_REF;

wire UART_TX_VLD;
wire BUSY_PULSE_GEN;
wire [7 : 0] UART_IN_UNSYNC;
wire [7 : 0] UART_IN_SYNC;
wire FIFO_FULL;
wire TX_VLD_SYNC;
wire TX_BUSY_SIG;
wire CLKDIV_EN, UART_TX_CLK, UART_RX_CLK;
wire [7 : 0] DIV_RATIO_SIG;
wire [7 : 0] DIV_RATIO_RX_SIG;
wire [7 : 0] UART_CONFIG;
wire [7 : 0] RX_OUT_UNSY, RX_OUT_SYNC;
wire RX_OUT_V_UNSY, RX_OUT_V_SYNC;
wire [15 : 0] ALU_OUT;
wire ALU_OUT_VLD;
wire [7 : 0] RDDATA;
wire RDDATA_VLD;
wire [3 : 0] ALU_FUN;
wire ALU_EN, CLK_EN;
wire [3 : 0] ADDRESS;
wire WR_EN, RD_EN;
wire [7 : 0] WR_DATA;
wire [7 : 0] OP_A, OP_B;
wire ALU_CLK;
///********************************************************///
//////////////////// Reset synchronizers /////////////////////
///********************************************************///

RST_SYNC #(.NUM_STAGES(2)) U0_RST_SYNC(
.CLK(UART_CLK),
.RST(RST),
.SYNC_RST(RST_SYNC_UART)
);

RST_SYNC #(.NUM_STAGES(2)) U1_RST_SYNC(
.CLK(REF_CLK),
.RST(RST),
.SYNC_RST(RST_SYNC_REF)
);


///********************************************************///
///////////////////// Data Synchronizers /////////////////////
///********************************************************///

DATA_SYNC #(.NUM_STAGES(2), .BUS_WIDTH(8)) U0_DATA_SYNC(
.CLK(REF_CLK),
.RST(RST_SYNC_REF),
.unsync_bus(RX_OUT_UNSY),
.bus_enable(RX_OUT_V_UNSY),
.sync_bus(RX_OUT_SYNC),
.enable_pulse(RX_OUT_V_SYNC)
);

///********************************************************///
///////////////////////// Async FIFO /////////////////////////
///********************************************************///

ASYNC_FIFO #(.FIFO_WIDTH(8), .FIFO_DEPTH(8), .ADDRSIZE(3)) U0_ASYNC_FIFO(
.W_CLK(REF_CLK),
.W_RST(RST_SYNC_REF),
.W_INC(UART_TX_VLD),
.R_CLK(UART_CLK),
.R_RST(RST_SYNC_UART),
.R_INC(BUSY_PULSE_GEN),
.WR_DATA(UART_IN_UNSYNC),
.FULL(FIFO_FULL),
.RD_DATA(UART_IN_SYNC),
.EMPTY(TX_VLD_SYNC)
);

///********************************************************///
//////////////////////// Pulse Generator /////////////////////
///********************************************************///

PULSE_GEN U0_PULSE_GEN (
.clk(UART_CLK),
.rst(RST_SYNC_UART),
.lvl_sig(TX_BUSY_SIG),
.pulse_sig(BUSY_PULSE_GEN)
);

///********************************************************///
//////////// Clock Divider for UART_TX Clock /////////////////
///********************************************************///

CLKDIV #(.RATIO_WIDTH(8)) U0_CLKDIV (
.CLK(UART_CLK),
.RST(RST_SYNC_UART),
.CLK_EN(CLKDIV_EN),
.DIV_RATIO(DIV_RATIO_SIG),
.DIV_CLK(UART_TX_CLK)
);

///********************************************************///
/////////////////////// Custom Mux Clock /////////////////////
///********************************************************///

CLKDIV_MUX U0_CLKDIV_MUX(
.IN(UART_CONFIG[7:2]),
.OUT(DIV_RATIO_RX_SIG)
);

///********************************************************///
//////////// Clock Divider for UART_RX Clock /////////////////
///********************************************************///

CLKDIV #(.RATIO_WIDTH(8)) U1_CLKDIV (
.CLK(UART_CLK),
.RST(RST_SYNC_UART),
.CLK_EN(CLKDIV_EN),
.DIV_RATIO(DIV_RATIO_RX_SIG),
.DIV_CLK(UART_RX_CLK)
);

///********************************************************///
/////////////////////////// UART /////////////////////////////
///********************************************************///

UART #(.DATA_WIDTH(8)) U0_UART (
.RST(RST_SYNC_UART),
.TX_CLK(UART_TX_CLK),
.RX_CLK(UART_RX_CLK),
.RX_IN_S(UART_RX_IN),
.TX_IN_P(UART_IN_SYNC), 
.TX_IN_V(!TX_VLD_SYNC), 
.PRESCALE(UART_CONFIG[7:2]), 
.PAR_EN(UART_CONFIG[0]),
.PAR_TYP(UART_CONFIG[1]),
.RX_OUT_P(RX_OUT_UNSY), 
.RX_OUT_V(RX_OUT_V_UNSY),
.TX_OUT_S(UART_TX_O),
.TX_OUT_V(TX_BUSY_SIG),  
.PAR_ERR(PAR_ERR),
.STP_ERR(STP_ERR)
);

///********************************************************///
//////////////////// System Controller ///////////////////////
///********************************************************///

SYS_CNTRL U0_SYS_CNTRL (
.CLK(REF_CLK),
.RST(RST_SYNC_REF),
.ALU_OUT(ALU_OUT),
.ALU_OUT_VLD(ALU_OUT_VLD),
.RDDATA(RDDATA),
.RDDATA_VLD(RDDATA_VLD),
.RX_P_DATA(RX_OUT_SYNC),
.RX_D_VLD(RX_OUT_V_SYNC),
.FIFO_FULL(FIFO_FULL),
.ALU_FUN(ALU_FUN),
.ALU_EN(ALU_EN),
.CLK_EN(CLK_EN),
.ADDRESS(ADDRESS),
.WR_EN(WR_EN),
.RD_EN(RD_EN),
.WR_DATA(WR_DATA),
.TX_P_DATA(UART_IN_UNSYNC),
.TX_D_VLD(UART_TX_VLD),
.CLK_DIV_EN(CLKDIV_EN)
);

///********************************************************///
/////////////////////// Register File ////////////////////////
///********************************************************///

RegisterFile #(.WIDTH(8), .DEPTH(16), .ADDR(4)) U0_RF (
.CLK(REF_CLK),
.RST(RST_SYNC_REF),
.WrEn(WR_EN),
.RdEn(RD_EN),
.Address(ADDRESS),
.WrData(WR_DATA),
.RdData(RDDATA),
.RdData_VLD(RDDATA_VLD),
.REG0(OP_A),
.REG1(OP_B),
.REG2(UART_CONFIG),
.REG3(DIV_RATIO_SIG)
);

///********************************************************///
//////////////////////////// ALU /////////////////////////////
///********************************************************///
 
ALU #(.IN_WIDTH(8), .OUT_WIDTH(16)) U0_ALU (
.CLK(ALU_CLK),
.RST(RST_SYNC_REF),  
.A(OP_A), 
.B(OP_B),
.EN(ALU_EN),
.ALU_FUN(ALU_FUN),
.ALU_OUT(ALU_OUT),
.OUT_VALID(ALU_OUT_VLD)  
);

///********************************************************///
///////////////////////// Clock Gating ///////////////////////
///********************************************************///

CLK_GATE U0_CLK_GATE (
.CLK_EN(CLK_EN),
.CLK(REF_CLK),
.GATED_CLK(ALU_CLK)
);


endmodule
 