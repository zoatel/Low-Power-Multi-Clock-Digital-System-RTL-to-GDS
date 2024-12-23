module UART_TX_FSM (
    input   wire        CLK,        // Clock signal
    input   wire        RST,        // Reset signal (active low)
    input   wire        DATA_VALID, // Signal indicating valid data is ready for transmission
    input   wire        PAR_EN,     // Parity enable signal
    input   wire        SER_DONE,   // Signal indicating serial transmission is done
    output  reg         SER_EN,     // Signal to enable serial transmission
    output  reg  [1:0]  MUX_SEL,    // 2-bit signal for multiplexer select
    output  reg         BUSY        // Signal indicating UART TX is busy
);

// Local parameters to define states for MUX selection
localparam [1:0] S0 = 2'b00, // START_BIT
                 S1 = 2'b01, // STOP_BIT
                 S2 = 2'b10, // SER_DATA (serial data transmission)
                 S3 = 2'b11; // PARITY_BIT

// State encoding using typedef for state machine
typedef enum bit [2:0] {
    IDLE = 3'b000,   // UART TX is idle
    START = 3'b001,  // Start bit transmission
    DATA = 3'b011,   // Data transmission
    PARITY = 3'b010, // Parity bit transmission
    STOP = 3'b110    // Stop bit transmission
} state_enum;

state_enum  cs, ns;  // cs = current state, ns = next state

reg         busy_reg;        // Register to hold the busy state

// Sequential logic: State transition on the rising edge of CLK or reset on the falling edge of RST
always @(posedge CLK or negedge RST) 
begin
    if (!RST)
        begin
            cs <= IDLE;      // Reset to IDLE state
            BUSY <= 1'b0;    // UART TX is not busy
        end
    else
        begin
            cs <= ns;        // Move to next state
            BUSY <= busy_reg; // Update BUSY signal
        end
end

// Combinational logic: Define next state transitions based on the current state and input signals
always @(*)
begin
    case(cs)
        IDLE:
            begin
                if (DATA_VALID)    // If data is valid, move to START state
                    ns <= START;
                else               // Stay in IDLE state if no data is valid
                    ns <= IDLE;
            end
        START:
            begin
                ns <= DATA;        // After START state, move to DATA state
            end
        DATA:
            begin
                if (SER_DONE)      // If serial transmission is done
                    begin
                        if (PAR_EN)  // If parity is enabled, move to PARITY state
                            ns <= PARITY;
                        else         // Otherwise, move to STOP state
                            ns <= STOP;
                    end
                else
                    begin
                        ns <= DATA; // Continue in DATA state until SER_DONE is asserted
                    end
            end
        PARITY:
            begin
                ns <= STOP;         // After transmitting the parity bit, move to STOP state
            end
        STOP:
            begin
                ns <= IDLE;         // After STOP state, move back to IDLE
            end
        default:
            begin
                ns <= IDLE;         // Default to IDLE state in case of an unknown state
            end
    endcase
end

// Combinational logic: Control signals based on the current state
always @(*)
begin
    // Default values for output signals
    SER_EN = 1'b0;       // Disable serial transmission by default
    MUX_SEL = S1;        // Default MUX select to STOP bit (S1)
    busy_reg = 1'b0;     // UART TX is not busy by default
    
    // State-dependent control signal logic
    case(cs)
        IDLE:
            begin
                SER_EN = 1'b0;      // No serial transmission in IDLE
                MUX_SEL = S1;       // Select STOP bit (S1) for MUX
                busy_reg = 1'b0;    // Not busy in IDLE state
            end
        START:
            begin
                SER_EN = 1'b0;      // No serial transmission during START bit
                MUX_SEL = S0;       // Select START bit (S0) for MUX
                busy_reg = 1'b1;    // UART TX is busy
            end
        DATA:
            begin
                SER_EN = 1'b1;      // Enable serial transmission during data transmission
                MUX_SEL = S2;       // Select DATA (S2) for MUX
                busy_reg = 1'b1;    // UART TX is busy
                if (SER_DONE)       // If serial transmission is done
                    SER_EN = 1'b0; // Reset SER_EN
                else
                    SER_EN = 1'b1; // Keep SER_EN asserted
            end
        PARITY:
            begin
                SER_EN = 1'b0;      // No serial transmission during parity bit
                MUX_SEL = S3;       // Select PARITY bit (S3) for MUX
                busy_reg = 1'b1;    // UART TX is busy
            end
        STOP:
            begin
                SER_EN = 1'b0;      // No serial transmission during stop bit
                MUX_SEL = S1;       // Select STOP bit (S1) for MUX
                busy_reg = 1'b1;    // UART TX is busy
            end
        default:
            begin
                SER_EN = 1'b0;      // Default case: no serial transmission
                MUX_SEL = S1;       // Default MUX select to STOP bit (S1)
                busy_reg = 1'b0;    // Not busy
            end
    endcase
end

endmodule
