module SYNC # (
    parameter ADDRSIZE = 4
) (
    input  wire                 CLK,
    input  wire                 RST,
    input  wire [ADDRSIZE : 0]  ptr,
    output reg  [ADDRSIZE : 0]  q2_ptr
);

reg [ADDRSIZE : 0] ff;

always @(posedge CLK or negedge RST) 
    begin
        if (!RST) 
            begin
                {q2_ptr, ff} <= 0;
            end
        else
            begin
                {q2_ptr, ff} <= {ff, ptr};
            end           
    end
    
endmodule