module UART_RX_DATA_SAMPLING (
    input   wire            CLK,            // Clock signal
    input   wire            RST,            // Reset signal, active low
    input   wire            RX_IN,          // Input serial data (RX)
    input   wire  [5 : 0]   PRESCALE,       // Prescale value
    input   wire            DAT_SAMP_EN,    // Data sampling enable signal
    input   wire  [4 : 0]   EDG_CNT,        // Edge counter to track sample points
    output  reg             SAMPLED_BIT     // Output bit after sampling
);

reg  [2 : 0]  sample;                       // 3-bit register to store sampled values

always @(posedge CLK or negedge RST)
begin
    if(!RST)
        begin
            SAMPLED_BIT <= 1'b0;            // Clear the sampled bit
            sample <= 3'b0;                 // Reset the sample register
        end
    else if(DAT_SAMP_EN)                    // If data sampling is enabled
        begin
            // Sampling logic: based on the edge count and prescale value
            if(EDG_CNT == ((PRESCALE >> 1'b1) - 1'b1))    // First sample point (before mid-bit)
                sample[0] <= RX_IN;
            else if(EDG_CNT == (PRESCALE >> 1'b1))        // Mid-bit sample point
                sample[1] <= RX_IN;
            else if(EDG_CNT == ((PRESCALE >> 1'b1) + 1'b1)) // Last sample point (after mid-bit)
                begin
                    sample[2] <= RX_IN;
                    
                    // Decision logic: based on majority of the three samples
                    case(sample)
                        3'b000: SAMPLED_BIT <= 1'b0;  // Majority 0
                        3'b001: SAMPLED_BIT <= 1'b0;  // Majority 0
                        3'b010: SAMPLED_BIT <= 1'b0;  // Majority 0
                        3'b011: SAMPLED_BIT <= 1'b1;  // Majority 1
                        3'b100: SAMPLED_BIT <= 1'b0;  // Majority 0
                        3'b101: SAMPLED_BIT <= 1'b1;  // Majority 1
                        3'b110: SAMPLED_BIT <= 1'b1;  // Majority 1
                        3'b111: SAMPLED_BIT <= 1'b1;  // Majority 1
                    endcase
                end
        end
    else                                    // If data sampling is disabled
        begin
            SAMPLED_BIT <= 1'b0;            // Clear the sampled bit
            sample <= 3'b0;                 // Clear the sample register
        end
end

endmodule
