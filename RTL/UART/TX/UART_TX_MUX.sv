module UART_TX_MUX (
    input   wire         CLK,    // Clock signal
    input   wire         RST,    // Reset signal (active low)
    input   wire  [1:0]  SEL,    // 2-bit select signal
    input   wire         IN0,    // Input data line 0
    input   wire         IN1,    // Input data line 1
    input   wire         IN2,    // Input data line 2
    input   wire         IN3,    // Input data line 3
    output  reg          TX_OUT  // Output data
);

always @(posedge CLK or negedge RST) 
begin
    if (!RST) 
        begin
            TX_OUT <= 1'b0;
        end
    else 
        begin
            case (SEL)
                2'b00: TX_OUT <= IN0; // Select input IN0 when sel = 00
                2'b01: TX_OUT <= IN1; // Select input IN1 when sel = 01
                2'b10: TX_OUT <= IN2; // Select input IN2 when sel = 10
                2'b11: TX_OUT <= IN3; // Select input IN3 when sel = 11
                default: TX_OUT <= 1'b0; // Default output
            endcase
        end
end

endmodule
