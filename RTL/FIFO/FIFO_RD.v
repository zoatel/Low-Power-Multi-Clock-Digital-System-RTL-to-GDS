module FIFO_RD # (
  parameter ADDRSIZE = 4
) (
  input  wire                     rCLK,
  input  wire                     rRST,
  input  wire                     rINC, 
  input  wire  [ADDRSIZE : 0]     rq2_wptr,
  output wire  [ADDRSIZE - 1 : 0] rADDR,
  output reg   [ADDRSIZE : 0]     rPTR,
  output wire                     rEMPTY
);

reg  [ADDRSIZE:0] rbin;
wire rempty_c;

always @(posedge rCLK, negedge rRST)
begin
    if (!rRST)
        rbin <= 'b0;
    else if (rINC && !rEMPTY)
        rbin <= rbin + 1'b1;
end

assign rADDR = rbin[ADDRSIZE-1:0];

always @(posedge rCLK, negedge rRST)
begin
    if (!rRST)
        rPTR <= 'b0;
    else
        rPTR <= (rbin >> 1) ^ rbin;
end

assign rempty_c = (rPTR == rq2_wptr);
assign rEMPTY = rempty_c;

endmodule
