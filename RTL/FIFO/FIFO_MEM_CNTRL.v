module FIFO_MEM_CNTRL #(
    parameter FIFO_WIDTH = 8,
    parameter FIFO_DEPTH = 8,
    parameter ADDRSIZE = 4
) (
    input  wire                         wCLK,
    input  wire                         wRST,
    input  wire [FIFO_WIDTH - 1 : 0]    w_DATA,
    input  wire [ADDRSIZE - 1 : 0]      w_ADDR,
    input  wire [ADDRSIZE - 1 : 0]      r_ADDR,
    input  wire                         w_INC,
    input  wire                         w_FULL,
    output wire [FIFO_WIDTH - 1 : 0]    r_DATA
);

reg [FIFO_WIDTH-1:0] FIFO_MEM [FIFO_DEPTH-1:0];

integer i;

always @(posedge wCLK or negedge wRST) 
begin
    if (!wRST)
        begin
            for (i = 0; i < FIFO_DEPTH; i = i + 1) 
                begin
                    FIFO_MEM[i] <= {FIFO_WIDTH{1'b0}};
                end
        end
    else if (w_INC && !w_FULL) 
        begin
            FIFO_MEM[w_ADDR] <= w_DATA;
        end
end

assign r_DATA = FIFO_MEM[r_ADDR];

endmodule
