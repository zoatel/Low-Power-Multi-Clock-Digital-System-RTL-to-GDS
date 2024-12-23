module UART_RX_PAR_CHK (
    input   wire            CLK,            // Clock signal
    input   wire            RST,            // Reset signal (active low)
    input   wire            SAMPLED_BIT,    // Parity bit sampled from the received data
    input   wire            PAR_CHK_EN,     // Enable signal for parity check
    input   wire            PAR_TYP,        // Parity type: 0 for even, 1 for odd
    input   wire  [7 : 0]   P_DATA,         // 8-bit received data
    output  reg             PAR_ERR         // Output signal indicating a parity error
);

reg par;  // Internal register to store calculated parity

always @(posedge CLK or negedge RST)
begin
    if(!RST)
        begin
            PAR_ERR <= 1'b0;   // Clear parity error flag
            par <= 1'b0;       // Reset the calculated parity
        end
    else if(PAR_CHK_EN)  // If parity check is enabled
        begin
            if(!PAR_TYP)  // If even parity is selected (PAR_TYP = 0)
                par <= ^P_DATA;   // Calculate even parity using XOR of P_DATA bits
            else          // If odd parity is selected (PAR_TYP = 1)
                par <= ~^P_DATA;  // Calculate odd parity using inverted XOR of P_DATA bits
            
            PAR_ERR <= (par != SAMPLED_BIT);  // Set PAR_ERR if calculated parity doesn't match sampled parity
        end
end

endmodule
