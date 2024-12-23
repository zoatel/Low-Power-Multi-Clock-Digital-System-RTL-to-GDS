module UART_RX_DESERIALIZER (
    input   wire            CLK,            // Clock signal
    input   wire            RST,            // Reset signal, active low
    input   wire            SAMPLED_BIT,    // The bit sampled from the RX_IN line
    input   wire            DESER_EN,       // Deserializer enable signal
    input   wire [5 : 0]    PRESCALE,       // Prescale value
    input   wire [4 : 0]    EDG_CNT,        // Edge counter to track when to shift in a new bit
    output  reg  [7 : 0]    P_DATA          // Parallel data output (8-bit)
);

always @(posedge CLK or negedge RST)
begin
    if(!RST)
        P_DATA <= 8'b0;                     // Clear the parallel data register
    else if(DESER_EN && EDG_CNT == (PRESCALE - 1'b1)) // If deserialization is enabled and at the correct edge
        P_DATA <= {SAMPLED_BIT, P_DATA[7 : 1]}; // Shift the sampled bit into P_DATA
end

endmodule
