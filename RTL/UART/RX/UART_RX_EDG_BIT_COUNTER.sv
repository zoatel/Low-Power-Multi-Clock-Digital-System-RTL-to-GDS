module UART_RX_EDG_BIT_COUNTER (
    input   wire            CLK,            // Clock signal
    input   wire            RST,            // Reset signal, active low
    input   wire            EDG_BIT_CNT_EN, // Enable signal for edge and bit counting
    input   wire  [5 : 0]   PRESCALE,       // Prescale value
    output  reg   [3 : 0]   BIT_CNT,        // Counter for the number of bits received
    output  reg   [4 : 0]   EDG_CNT         // Counter for edges within a single TX period
);

always @(posedge CLK or negedge RST)
begin
    if(!RST)
        begin
            BIT_CNT <= 4'd0;                    // Clear the bit counter
            EDG_CNT <= 5'd0;                    // Clear the edge counter
        end
    else if(EDG_BIT_CNT_EN)                     // If counting is enabled
        begin
            if(EDG_CNT != (PRESCALE - 1'b1))    // If the edge count hasn't reached the prescale value
                begin
                    EDG_CNT <= EDG_CNT + 1'b1;  // Increment edge counter
                end
            else                                // If the edge count has reached the prescale value
                begin
                    EDG_CNT <= 4'd0;            // Reset the edge counter
                    BIT_CNT <= BIT_CNT + 1'b1;  // Increment the bit counter (next bit)
                end
        end
    else                                        // If counting is disabled
        begin
            BIT_CNT <= 4'd0;                    // Reset the bit counter
            EDG_CNT <= 5'd0;                    // Reset the edge counter
        end
end

endmodule
