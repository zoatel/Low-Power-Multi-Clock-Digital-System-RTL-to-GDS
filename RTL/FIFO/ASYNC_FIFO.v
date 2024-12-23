module ASYNC_FIFO #(
    parameter FIFO_WIDTH = 8,
    parameter FIFO_DEPTH = 8,
    parameter ADDRSIZE = 3
)(
    input  wire                  W_CLK,
    input  wire                  W_RST,
    input  wire                  W_INC,
    input  wire                  R_CLK,
    input  wire                  R_RST,
    input  wire                  R_INC,
    input  wire [FIFO_WIDTH-1:0] WR_DATA,
    output wire                  FULL,
    output wire [FIFO_WIDTH-1:0] RD_DATA,
    output wire                  EMPTY
);

wire [ADDRSIZE - 1 : 0] w_addr_wire;
wire [ADDRSIZE - 1 : 0] r_addr_wire;

wire [ADDRSIZE : 0] sync_r2w_ptr_wire;
wire [ADDRSIZE : 0] gray_w2r_ptr_wire;

wire [ADDRSIZE : 0] sync_w2r_ptr_wire;
wire [ADDRSIZE : 0] gray_r2w_ptr_wire;

FIFO_MEM_CNTRL #(
.FIFO_WIDTH(FIFO_WIDTH),
.FIFO_DEPTH(FIFO_DEPTH),
.ADDRSIZE(ADDRSIZE)
) U0_FIFO_MEM (
.wCLK   (W_CLK),
.wRST   (W_RST),
.w_DATA (WR_DATA),
.w_ADDR (w_addr_wire),
.r_ADDR (r_addr_wire),
.w_INC  (W_INC),
.w_FULL (FULL),
.r_DATA (RD_DATA)
);

FIFO_WR #(
.ADDRSIZE(ADDRSIZE)
) U1_FIFO_WR (
.wCLK (W_CLK),
.wRST (W_RST),
.wINC (W_INC),
.wq2_rptr (sync_r2w_ptr_wire),
.wADDR (w_addr_wire),
.wPTR (gray_w2r_ptr_wire),
.wFULL (FULL)
);

FIFO_RD #(
.ADDRSIZE(ADDRSIZE)
) U2_FIFO_RD (
.rCLK (R_CLK),
.rRST (R_RST),
.rINC (R_INC),
.rq2_wptr (sync_w2r_ptr_wire),
.rADDR (r_addr_wire),
.rPTR (gray_r2w_ptr_wire),
.rEMPTY (EMPTY)
);

SYNC #(
.ADDRSIZE(ADDRSIZE)
) Sync_r2w (
.CLK (W_CLK),
.RST (W_RST),
.ptr (gray_r2w_ptr_wire),
.q2_ptr (sync_r2w_ptr_wire)
);

SYNC #(
.ADDRSIZE(ADDRSIZE)
) Sync_w2r (
.CLK (R_CLK),
.RST (R_RST),
.ptr (gray_w2r_ptr_wire),
.q2_ptr (sync_w2r_ptr_wire)
);

endmodule
