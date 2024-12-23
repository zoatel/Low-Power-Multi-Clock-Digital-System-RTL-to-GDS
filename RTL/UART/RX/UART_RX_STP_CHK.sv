module UART_RX_STP_CHK (
    input   wire    CLK,            // Clock signal
    input   wire    RST,            // Reset signal (active low)
    input   wire    SAMPLED_BIT,    // The stop bit sampled from the received data
    input   wire    STP_CHK_EN,     // Enable signal for stop bit check
    output  reg     STP_ERR         // Output signal indicating a stop bit error
);

always @(posedge CLK or negedge RST)
begin
    if(!RST)
        STP_ERR <= 1'b0;  // Clear the stop error flag
    else if (STP_CHK_EN)  // If stop bit check is enabled
        STP_ERR <= ~SAMPLED_BIT;  // Set STP_ERR if the sampled stop bit is not '1'
end

endmodule
