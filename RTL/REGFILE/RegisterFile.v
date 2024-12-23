module RegisterFile #(
    parameter WIDTH = 8, 
    parameter DEPTH = 16,
    parameter ADDR  = 4 
)(
    input  wire                     CLK,
    input  wire                     RST,
    input  wire                     WrEn,
    input  wire                     RdEn,
    input  wire [ADDR - 1 : 0]      Address,
    input  wire [WIDTH - 1 : 0]     WrData,
    output reg  [WIDTH - 1 : 0]     RdData,
    output reg                      RdData_VLD,
    output wire [WIDTH - 1 : 0]     REG0,
    output wire [WIDTH - 1 : 0]     REG1,
    output wire [WIDTH - 1 : 0]     REG2,
    output wire [WIDTH - 1 : 0]     REG3
);

integer i; 
reg [WIDTH - 1 : 0] Reg_File [DEPTH - 1 : 0];

always @(posedge CLK or negedge RST) 
begin
    if (!RST) 
        begin
            RdData_VLD <= 1'b0 ;
            RdData     <= 'b0 ;
            for (i=0 ; i < DEPTH ; i = i +1)
                begin
                    if(i == 2)
                        Reg_File[i] <= 'b100000_01;
                    else if (i == 3) 
                        Reg_File[i] <= 'b0010_0000;
                    else
                        Reg_File[i] <= 'b0;		 
                end
        end 
    else if (WrEn && !RdEn)
        begin
            Reg_File[Address] <= WrData;
        end
    else if (RdEn && !WrEn)
        begin    
            RdData <= Reg_File[Address];
            RdData_VLD <= 1'b1;
        end  
    else
        begin
            RdData_VLD <= 1'b0;
        end	
end

assign REG0 = Reg_File[0];
assign REG1 = Reg_File[1];
assign REG2 = Reg_File[2];
assign REG3 = Reg_File[3];

endmodule
