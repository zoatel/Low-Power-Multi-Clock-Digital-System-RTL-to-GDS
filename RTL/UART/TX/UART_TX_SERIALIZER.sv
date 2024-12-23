module UART_TX_SERIALIZER(
    input   wire         CLK,        // Clock signal
    input   wire         RST,        // Reset signal (active low)
    input   wire  [7:0]  P_DATA,     // Parallel data input (8-bit)
    input   wire         DATA_VALID, // Data valid signal, indicating new data available
    input   wire         SER_EN,     // Serializer enable signal
    output  reg          SER_OUT,    // Serialized output bit
    output  reg          SER_DONE    // Serializer done flag
);

reg  [7:0]    shift_reg;   // Shift register to hold and shift data
reg  [2:0]          bit_count;   // Counter for tracking the number of bits shifted
reg                 busy;        // Indicates whether serializer is currently transmitting data

always @(posedge CLK or negedge RST) 
begin
    if (!RST) 
        begin
            shift_reg <= 'b0;
            busy <= 1'b0;
            bit_count <= 'b0;
        end
    else 
        begin
            // If data is valid and serializer is not busy, load data into shift register and start transmission
            if (DATA_VALID && !busy) 
                begin
                    shift_reg <= P_DATA; // Load parallel data into shift register
                    busy <= 1'b1;        // Set busy flag to indicate ongoing transmission
                end
            // If serializer is enabled and busy, shift the data and increment the bit count
            else if (SER_EN && busy) 
                begin
                    shift_reg <= shift_reg >> 1;    // Right shift the data to send out LSB first
                    bit_count <= bit_count + 'b1;   // Increment the bit count for each shifted bit
                end
            else 
                begin
                    // If serializer is not enabled or not busy, reset the bit count
                    bit_count <= 'b0;
                end

            // Once transmission is done (SER_DONE is high), clear the busy flag
            if (SER_DONE) 
                begin
                    busy <= 1'b0;   // Transmission completed, mark as not busy
                end
        end
end

// Assert SER_DONE when all bits have been transmitted
assign SER_DONE = (bit_count == 3'd7) ? 1'b1 : 1'b0;

// Output the least significant bit of the shift register as the serialized output
assign SER_OUT = shift_reg[0];

endmodule
