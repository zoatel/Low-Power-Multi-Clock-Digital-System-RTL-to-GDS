module SYS_CNTRL (
    input   wire            CLK,
    input   wire            RST,
    input   wire  [15 : 0]  ALU_OUT,
    input   wire            ALU_OUT_VLD,
    input   wire  [7 : 0]   RDDATA,
    input   wire            RDDATA_VLD,
    input   wire  [7 : 0]   RX_P_DATA,
    input   wire            RX_D_VLD,
    input   wire            FIFO_FULL,
    output  reg   [3 : 0]   ALU_FUN,
    output  reg             ALU_EN,
    output  reg             CLK_EN,
    output  reg   [3 : 0]   ADDRESS,
    output  reg             WR_EN,
    output  reg             RD_EN,
    output  reg   [7 : 0]   WR_DATA,
    output  reg   [7 : 0]   TX_P_DATA,
    output  reg             TX_D_VLD,
    output  reg             CLK_DIV_EN
);

reg address_save_flag;
reg [3 : 0] address_save;

typedef enum bit [3:0] {
    IDLE      = 4'b0000,
    DECODE    = 4'b0001,
    RF_W_ADDR = 4'b0011,
    RF_W_DATA = 4'b0010, 
    RF_R_ADDR = 4'b0110,
    OPER_A    = 4'b0111,
    OPER_B    = 4'b0101,
    ALU_FUNC  = 4'b0100,
    OUTPUT    = 4'b1100
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
                if(RX_D_VLD)
                    ns = DECODE;
                else
                    ns = IDLE;
            end
        DECODE:
            begin
                case (RX_P_DATA)
                    8'hAA : ns = RF_W_ADDR;
                    8'hBB : ns = RF_R_ADDR;
                    8'hCC : ns = OPER_A;
                    8'hDD : ns = ALU_FUNC;
                    default : ns = IDLE;
                endcase
            end
        RF_W_ADDR:
            begin
                if(RX_D_VLD)
                    ns = RF_W_DATA;
                else
                    ns = RF_W_ADDR;
            end
        RF_W_DATA:
            begin
                if(RX_D_VLD)
                    ns = IDLE;
                else
                    ns = RF_W_DATA;
            end
        RF_R_ADDR:
            begin
                if(RX_D_VLD)
                    ns = OUTPUT;
                else
                    ns = RF_R_ADDR;
            end
        OPER_A:
            begin
                if(RX_D_VLD)
                    ns = OPER_B;
                else
                    ns = OPER_A;
            end
        OPER_B:
            begin
                if(RX_D_VLD)
                    ns = ALU_FUNC;
                else
                    ns = OPER_B;
            end
        ALU_FUNC:
            begin
                if(RX_D_VLD)
                    ns = OUTPUT;
                else
                    ns = ALU_FUNC;
            end
        OUTPUT:
            begin
                if(!FIFO_FULL && RDDATA_VLD)
                    begin
                        if(RX_D_VLD)
                            ns = DECODE;
                        else
                            ns = IDLE;
                    end
                else if (!FIFO_FULL && ALU_OUT_VLD)
                    begin
                        ns = OUTPUT;
                    end
                else
                    begin
                        if(RX_D_VLD)
                            ns = DECODE;
                        else
                            ns = IDLE;
                    end
            end
        default:
            begin
                ns = IDLE;
            end
    endcase
end

// Combinational logic for output signals based on current state
always @(*)
begin
    address_save_flag = 1'b0;
    case(cs)
        IDLE:
            begin
                ALU_FUN    = 4'b1111;
                ALU_EN     = 1'b0;
                CLK_EN     = 1'b0;
                ADDRESS    = 4'b0000;
                WR_EN      = 1'b0;
                RD_EN      = 1'b0;
                WR_DATA    = 8'b00000000;
                TX_P_DATA  = 8'b00000000;
                TX_D_VLD   = 1'b0;
                CLK_DIV_EN = 1'b1;
            end
        DECODE:
            begin
                ALU_FUN    = 4'b1111;
                ALU_EN     = 1'b0;
                CLK_EN     = 1'b0;
                ADDRESS    = 4'b0000;
                WR_EN      = 1'b0;
                RD_EN      = 1'b0;
                WR_DATA    = 8'b00000000;
                TX_P_DATA  = 8'b00000000;
                TX_D_VLD   = 1'b0;
                CLK_DIV_EN = 1'b1;
            end
        RF_W_ADDR:
            begin
                ALU_FUN    = 4'b1111;
                ALU_EN     = 1'b0;
                CLK_EN     = 1'b0;
                ADDRESS    = RX_P_DATA;
                WR_EN      = 1'b0;
                RD_EN      = 1'b0;
                WR_DATA    = 8'b00000000;
                TX_P_DATA  = 8'b00000000;
                TX_D_VLD   = 1'b0;
                CLK_DIV_EN = 1'b1;
                address_save_flag = 1'b1;
            end
        RF_W_DATA:
            begin
                ALU_FUN    = 4'b1111;
                ALU_EN     = 1'b0;
                CLK_EN     = 1'b0;
                ADDRESS    = address_save;
                WR_EN      = (address_save != RX_P_DATA);
                RD_EN      = 1'b0;
                WR_DATA    = RX_P_DATA;
                TX_P_DATA  = 8'b00000000;
                TX_D_VLD   = 1'b0;
                CLK_DIV_EN = 1'b1;
            end
        RF_R_ADDR:
            begin
                ALU_FUN    = 4'b1111;
                ALU_EN     = 1'b0;
                CLK_EN     = 1'b0;
                ADDRESS    = RX_P_DATA;
                WR_EN      = 1'b0;
                RD_EN      = 1'b1;
                WR_DATA    = 8'b00000000;
                TX_P_DATA  = 8'b00000000;
                TX_D_VLD   = 1'b0;
                CLK_DIV_EN = 1'b1;
                //address_save_flag = 1'b1;
            end
        OPER_A:
            begin
                ALU_FUN    = 4'b1111;
                ALU_EN     = 1'b0;
                CLK_EN     = 1'b0;
                ADDRESS    = 4'b0000;
                WR_EN      = 1'b1;
                RD_EN      = 1'b0;
                WR_DATA    = RX_P_DATA;
                TX_P_DATA  = 8'b00000000;
                TX_D_VLD   = 1'b0;
                CLK_DIV_EN = 1'b1; 
            end
        OPER_B:
            begin
                ALU_FUN    = 4'b1111;
                ALU_EN     = 1'b0;
                CLK_EN     = 1'b0;
                ADDRESS    = 4'b0001;
                WR_EN      = 1'b1;
                RD_EN      = 1'b0;
                WR_DATA    = RX_P_DATA;
                TX_P_DATA  = 8'b00000000;
                TX_D_VLD   = 1'b0;
                CLK_DIV_EN = 1'b1; 
            end
        ALU_FUNC:
            begin
                ALU_FUN    = RX_P_DATA;
                ALU_EN     = 1'b1;
                CLK_EN     = 1'b1;
                ADDRESS    = 4'b0000;
                WR_EN      = 1'b0;
                RD_EN      = 1'b0;
                WR_DATA    = 8'b00000000;
                TX_P_DATA  = 8'b00000000;
                TX_D_VLD   = 1'b0;
                CLK_DIV_EN = 1'b1;
            end
        OUTPUT:
            begin
                ALU_FUN    = 4'b1111;
                ALU_EN     = 1'b0;
                CLK_EN     = 1'b1;
                ADDRESS    = 4'b0000;
                WR_EN      = 1'b0;
                RD_EN      = 1'b0;
                WR_DATA    = 8'b00000000;
                TX_D_VLD   = 1'b1;
                CLK_DIV_EN = 1'b1;
                if(RDDATA_VLD)
                    TX_P_DATA = RDDATA;
                else if(ALU_OUT_VLD)
                    TX_P_DATA = ALU_OUT[7 : 0];
                else
                    TX_P_DATA = ALU_OUT[15 : 8];
            end
        default:
            begin
                ALU_FUN    = 4'b1111;
                ALU_EN     = 1'b0;
                CLK_EN     = 1'b0;
                ADDRESS    = 4'b0000;
                WR_EN      = 1'b0;
                RD_EN      = 1'b0;
                WR_DATA    = 8'b00000000;
                TX_P_DATA  = 8'b00000000;
                TX_D_VLD   = 1'b0;
                CLK_DIV_EN = 1'b1;
                address_save_flag = 1'b0;
            end
    endcase
end


always @(posedge CLK or negedge RST) 
begin
	if(!RST) 
        begin
            address_save <= 4'b0;
        end 
    else if(address_save_flag) 
        begin
            address_save <= ADDRESS;
        end
end

endmodule