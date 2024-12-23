module UART_RX_STRT_CHK (
    input   wire    CLK,            // Clock signal
    input   wire    RST,            // Reset signal (active low)
    input   wire    SAMPLED_BIT,    // The start bit sampled from the received data
    input   wire    STRT_CHK_EN,    // Enable signal for start bit check
    output  reg     STRT_ERR        // Output signal indicating a start bit error
);

always @(posedge CLK or negedge RST)
begin
    if(!RST)
        STRT_ERR <= 1'b0;  // Clear the start error flag
    else if (STRT_CHK_EN)  // If start bit check is enabled
        STRT_ERR <= SAMPLED_BIT;  // Set STRT_ERR if the sampled start bit is not '0'
end

endmodule
