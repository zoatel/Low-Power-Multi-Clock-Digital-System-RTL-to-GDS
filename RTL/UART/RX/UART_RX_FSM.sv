module UART_RX_FSM (
    input   wire            CLK,            // Clock signal
    input   wire            RST,            // Reset signal, active low
    input   wire            RX_IN,          // Received data input
    input   wire            PAR_EN,         // Parity enable signal
    input   wire  [5 : 0]   PRESCALE,       // Prescale value
    input   wire  [3 : 0]   BIT_CNT,        // Bit counter from edge counter module
    input   wire  [4 : 0]   EDG_CNT,        // Edge counter from edge counter module
    input   wire            PAR_ERR,        // Parity error flag
    input   wire            STRT_ERR,       // Start bit error flag
    input   wire            STP_ERR,        // Stop bit error flag
    output  reg             EDG_BIT_CNT_EN, // Enable signal for edge and bit counting
    output  reg             DAT_SAMP_EN,    // Enable signal for data sampling
    output  reg             STRT_CHK_EN,    // Enable signal for start bit check
    output  reg             DESER_EN,       // Enable signal for deserializing data
    output  reg             PAR_CHK_EN,     // Enable signal for parity check
    output  reg             STP_CHK_EN,     // Enable signal for stop bit check
    output  reg             DATA_VALID      // Indicates that valid data has been received
);

// Enumeration for FSM states
typedef enum bit [2:0] {
    IDLE    = 3'b000,       // Idle state
    START   = 3'b001,       // Start bit detection state
    DATA    = 3'b011,       // Data reception state
    PARITY  = 3'b010,       // Parity bit checking state
    STOP    = 3'b110,       // Stop bit checking state
    CHK_ERR = 3'b111,       // Error checking state
    VLD     = 3'b101        // Valid data state
} state_enum;

state_enum  cs, ns;         // Current state (cs), next state (ns)

// Sequential logic for state transition on clock or reset
always @(posedge CLK or negedge RST)
begin
    if (!RST)
        cs <= IDLE;         // Reset to IDLE state
    else
        cs <= ns;           // Move to the next state
end

// Combinational logic for next state decision
always @(*)
begin
    case(cs)
        IDLE:
            begin
                if (!RX_IN)   // If RX_IN is low, it indicates start of transmission
                    ns = START;
                else
                    ns = IDLE;
            end
        START:
            begin
                if (BIT_CNT == 4'd0 && EDG_CNT == (PRESCALE - 1'b1)) // After detecting start bit
                    if (!STRT_ERR)
                        ns = DATA;      // Move to DATA state if no start error
                    else
                        ns = IDLE;      // Return to IDLE if start error
                else
                    ns = START;
            end
        DATA:
            begin
                if (BIT_CNT == 4'd8 && EDG_CNT == (PRESCALE - 1'b1)) // After receiving 8 bits of data
                    if (PAR_EN)
                        ns = PARITY;    // Move to PARITY state if parity is enabled
                    else
                        ns = STOP;      // Otherwise move to STOP state
                else
                    ns = DATA;
            end
        PARITY:
            begin
                if (BIT_CNT == 4'd9 && EDG_CNT == (PRESCALE - 1'b1)) // After parity bit
                    ns = STOP;
                else
                    ns = PARITY;
            end
        STOP:
            begin
                if ((BIT_CNT == 4'd9 || BIT_CNT == 4'd10) && EDG_CNT == (PRESCALE - 1'b1)) // After stop bit
                    ns = CHK_ERR;
                else
                    ns = STOP;
            end
        CHK_ERR:
            begin
                if (PAR_ERR || STP_ERR)  // If there are parity or stop bit errors
                    ns = IDLE;           // Return to IDLE
                else
                    ns = VLD;            // Otherwise, move to valid data state
            end
        VLD:
            begin
                if (!RX_IN)              // If another transmission is detected
                    ns = START;          // Start receiveing
                else
                    ns = IDLE;          // Otherwise, return to IDLE
            end
        default:
            ns = IDLE;                   // Default state is IDLE
    endcase
end

// Combinational logic for output signals based on current state
always @(*)
begin
    EDG_BIT_CNT_EN  = 1'b0;
    DAT_SAMP_EN     = 1'b0;
    STRT_CHK_EN     = 1'b0;
    DESER_EN        = 1'b0;
    PAR_CHK_EN      = 1'b0;
    STP_CHK_EN      = 1'b0;
    DATA_VALID      = 1'b0;

    case(cs)
        IDLE:
            begin
                if(!RX_IN)
                    begin
                        EDG_BIT_CNT_EN  = 1'b1;
                        DAT_SAMP_EN     = 1'b1;
                        STRT_CHK_EN     = 1'b1;
                        DESER_EN        = 1'b0;
                        PAR_CHK_EN      = 1'b0;
                        STP_CHK_EN      = 1'b0;
                        DATA_VALID      = 1'b0;
                    end
                else
                    begin
                        EDG_BIT_CNT_EN  = 1'b0;
                        DAT_SAMP_EN     = 1'b0;
                        STRT_CHK_EN     = 1'b0;
                        DESER_EN        = 1'b0;
                        PAR_CHK_EN      = 1'b0;
                        STP_CHK_EN      = 1'b0;
                        DATA_VALID      = 1'b0;
                    end
            end
        START:
            begin
                EDG_BIT_CNT_EN  = 1'b1;
                DAT_SAMP_EN     = 1'b1;
                STRT_CHK_EN     = 1'b1;
                DESER_EN        = 1'b0;
                PAR_CHK_EN      = 1'b0;
                STP_CHK_EN      = 1'b0;
                DATA_VALID      = 1'b0;
            end
        DATA:
            begin
                EDG_BIT_CNT_EN  = 1'b1;
                DAT_SAMP_EN     = 1'b1;
                STRT_CHK_EN     = 1'b0;
                DESER_EN        = 1'b1;
                PAR_CHK_EN      = 1'b0;
                STP_CHK_EN      = 1'b0;
                DATA_VALID      = 1'b0;
            end
        PARITY:
            begin
                EDG_BIT_CNT_EN  = 1'b1;
                DAT_SAMP_EN     = 1'b1;
                STRT_CHK_EN     = 1'b0;
                DESER_EN        = 1'b0;
                PAR_CHK_EN      = 1'b1;
                STP_CHK_EN      = 1'b0;
                DATA_VALID      = 1'b0;
            end
        STOP:
            begin
                EDG_BIT_CNT_EN  = 1'b1;
                DAT_SAMP_EN     = 1'b1;
                STRT_CHK_EN     = 1'b0;
                DESER_EN        = 1'b0;
                PAR_CHK_EN      = 1'b0;
                STP_CHK_EN      = 1'b1;
                DATA_VALID      = 1'b0;
            end
        CHK_ERR:
            begin
                EDG_BIT_CNT_EN  = 1'b0;
                DAT_SAMP_EN     = 1'b0;
                STRT_CHK_EN     = 1'b0;
                DESER_EN        = 1'b0;
                PAR_CHK_EN      = 1'b0;
                STP_CHK_EN      = 1'b0;
                DATA_VALID      = 1'b0;
            end
        VLD:
            begin
                EDG_BIT_CNT_EN  = 1'b0;
                DAT_SAMP_EN     = 1'b0;
                STRT_CHK_EN     = 1'b0;
                DESER_EN        = 1'b0;
                PAR_CHK_EN      = 1'b0;
                STP_CHK_EN      = 1'b0;
                DATA_VALID      = 1'b1; 
            end
        default:
            begin
                EDG_BIT_CNT_EN  = 1'b0;
                DAT_SAMP_EN     = 1'b0;
                STRT_CHK_EN     = 1'b0;
                DESER_EN        = 1'b0;
                PAR_CHK_EN      = 1'b0;
                STP_CHK_EN      = 1'b0;
                DATA_VALID      = 1'b0;
            end
    endcase

end

endmodule