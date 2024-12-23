module UART_TX_PARITY_CALC (
    input   wire        CLK,        // Clock signal
    input   wire        RST,        // Reset signal (active low)
    input   wire        PAR_EN,     // Parity enable signal
    input   wire        PAR_TYP,    // Parity type (0 for even, 1 for odd)
    input   wire [7:0]  P_DATA,     // Input data for which parity is to be calculated
    input   wire        BUSY,
    input   wire        DATA_VALID, // Indicates valid data is present
    output  reg         PAR_BIT     // Output parity bit
);

reg  [7 : 0]    DATA_V ;


always @ (posedge CLK or negedge RST)
begin
    if(!RST)
        DATA_V <= 'b0 ;
  else if(DATA_VALID && !BUSY)
        DATA_V <= P_DATA ;
end

always @(posedge CLK or negedge RST) 
begin
    if (!RST) 
        PAR_BIT <= 1'b0;  // Reset the parity bit
    else if (PAR_EN) 
        begin
            if (PAR_TYP)
                PAR_BIT <= ~(^DATA_V);
            else
                PAR_BIT <= ^DATA_V;
        end
end

endmodule
