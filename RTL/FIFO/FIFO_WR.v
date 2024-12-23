module FIFO_WR # (
  parameter ADDRSIZE = 4
) (
  input  wire                     wCLK,
  input  wire                     wRST,
  input  wire                     wINC, 
  input  wire  [ADDRSIZE : 0]     wq2_rptr,
  output wire  [ADDRSIZE - 1 : 0] wADDR,
  output reg   [ADDRSIZE : 0]     wPTR,
  output wire                     wFULL
);

reg  [ADDRSIZE:0] wbin;
wire wfull_c;

always @(posedge wCLK, negedge wRST)
begin
    if (!wRST)
        wbin <= 'b0;
    else if (wINC && !wFULL)
        wbin <= wbin + 1'b1;
end

assign wADDR = wbin[ADDRSIZE-1:0];

always @(posedge wCLK, negedge wRST)
begin
    if (!wRST)
        wPTR <= 'b0;
    else
        wPTR <= (wbin >> 1) ^ wbin;
end

assign wfull_c = (wPTR == {~wq2_rptr[ADDRSIZE:ADDRSIZE-1], wq2_rptr[ADDRSIZE-2:0]});
assign wFULL = wfull_c;

endmodule
