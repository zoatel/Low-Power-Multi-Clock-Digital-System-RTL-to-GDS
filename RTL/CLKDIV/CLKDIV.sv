module CLKDIV #(
    parameter RATIO_WIDTH = 8     // Parameter to define the width of the division ratio input
) (
    input  wire                         CLK,        // Input clock signal
    input  wire                         RST,        // Reset signal (active low)
    input  wire                         CLK_EN,     // Clock enable signal
    input  wire  [RATIO_WIDTH - 1 : 0]  DIV_RATIO,  // Division ratio for the clock divider
    output wire                         DIV_CLK     // Output divided clock signal
);

reg [RATIO_WIDTH - 1 : 0] bit_count;   // Counter to keep track of clock cycles
reg DIV_CLK_O;                         // Internal divided clock signal
wire odd, CLK_EN_CC;                   // Wires to determine if the division ratio is odd and clock enable logic


// Check if the division ratio is odd (least significant bit is 1)
assign odd = DIV_RATIO[0];
// Enable clock division only if CLK_EN is high, the division ratio is non-zero, and not equal to 1
assign CLK_EN_CC = CLK_EN && (|DIV_RATIO) && !(DIV_RATIO == 1'b1);
// Output DIV_CLK will be the divided clock when enabled, otherwise just pass through the original clock
assign DIV_CLK = CLK_EN_CC ? DIV_CLK_O : CLK;

always @(posedge CLK or negedge RST)
begin
    if(!RST)
        begin
            bit_count <= 0;
            DIV_CLK_O <= 0;
        end
    else if (CLK_EN_CC)
        begin
            // For even division ratios, toggle the clock when the bit count reaches half of DIV_RATIO - 1
            if(!odd && (bit_count == ((DIV_RATIO >> 1) - 1)))
                begin
                    bit_count <= 0;      // Reset the counter
                    DIV_CLK_O <= ~DIV_CLK_O;  // Toggle the divided clock output
                end
            // For odd division ratios, additional conditions based on the divided clock output state
            else if((odd && (bit_count == ((DIV_RATIO >> 1) - 1)) && DIV_CLK_O) || 
                    (odd && (bit_count == (DIV_RATIO >> 1)) && !DIV_CLK_O))
                begin
                    bit_count <= 0;      // Reset the counter
                    DIV_CLK_O <= ~DIV_CLK_O;  // Toggle the divided clock output
                end
            // Increment the counter until the above conditions are met
            else
                bit_count <= bit_count + 1'b1;
        end
end

endmodule
