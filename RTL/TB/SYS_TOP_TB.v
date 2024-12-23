`timescale 1ns/1ps
module SYS_TOP_TB;

parameter WR_CMD = 'hAA;
parameter RD_CMD = 'hBB;
parameter ALU_WLODA_CMD = 'hCC;
parameter ALU_NLOAD_CMD = 'hDD;

parameter REF_CLK_period = 10;
parameter UART_CLK_period = 271.267;

reg REF_CLK_TB;
reg RST_TB;
reg UART_CLK_TB;
reg RX_IN_TB;
wire TX_OUT_TB;
wire PAR_ERR_TB;
wire STP_ERR_TB;

SYS_TOP DUT (
   .REF_CLK(REF_CLK_TB),
   .RST(RST_TB),
   .UART_CLK(UART_CLK_TB),
   .UART_RX_IN(RX_IN_TB),
   .UART_TX_O(TX_OUT_TB),
   .PAR_ERR(PAR_ERR_TB),
   .STP_ERR(STP_ERR_TB)
);

always
    #(REF_CLK_period / 2.0) REF_CLK_TB = ~REF_CLK_TB;

always
    #(UART_CLK_period / 2.0) UART_CLK_TB = ~UART_CLK_TB;

initial 
begin

   $dumpfile("SYS_TOP_VCD.vcd");
   $dumpvars;

   initialize();
   reset();
   // PARTITY ODD //
   SEND_WR_CMD(8'h02, 8'b100000_01, 1'b1, 1'b0);

   SEND_WR_CMD(8'h06, 8'hA5, 1'b1, 1'b0);
   SEND_RD_CMD(8'h06, 1'b1, 1'b0);
   CHECK(8'hA5, 1'b1, 1'b0);

   SEND_ALU_WLODA_CMD(8'h05, 8'h04, 8'h00, 1'b1, 1'b0);
   CHECK_ALU(8'h09, 1'b1, 1'b0);

   SEND_ALU_NLOAD_CMD(8'h01, 1'b1, 1'b0);
   CHECK_ALU(8'h01, 1'b1, 1'b0);

   // PARITY EVEN //
   SEND_WR_CMD(8'h02, 8'b100000_11, 1'b1, 1'b0);

   SEND_WR_CMD(8'h07, 8'hA6, 1'b1, 1'b1);
   SEND_RD_CMD(8'h07, 1'b1, 1'b1);
   CHECK(8'hA6, 1'b1, 1'b1);

   SEND_ALU_WLODA_CMD(8'h06, 8'h03, 8'h00, 1'b1, 1'b1);
   CHECK_ALU(8'h09, 1'b1, 1'b1);

   SEND_ALU_NLOAD_CMD(8'h01, 1'b1, 1'b1);
   CHECK_ALU(8'h03, 1'b1, 1'b1);

   // PARITY DISABLED //
   SEND_WR_CMD(8'h02, 8'b100000_00, 1'b1, 1'b1);

   SEND_WR_CMD(8'h07, 8'hA6, 1'b0, 1'b0);
   SEND_RD_CMD(8'h07, 1'b0, 1'b0);
   CHECK(8'hA6, 1'b0, 1'b0);

   SEND_ALU_WLODA_CMD(8'h06, 8'h03, 8'h00, 1'b0, 1'b0);
   CHECK_ALU(8'h09, 1'b0, 1'b0);

   SEND_ALU_NLOAD_CMD(8'h01, 1'b0, 1'b0);
   CHECK_ALU(8'h03, 1'b0, 1'b0);

   $finish;

end

task initialize;
    begin
        UART_CLK_TB = 1'b0;
        REF_CLK_TB = 1'b0;
        RST_TB = 1'b1;
        RX_IN_TB = 1'b1;
    end
endtask

task reset;
    begin
        #(REF_CLK_period);
        RST_TB = 1'b0;
        #(REF_CLK_period);
        RST_TB = 1'b1;
        #(REF_CLK_period);
    end
endtask

task SEND_DATA;
    input [7:0] FRAME_DATA;
    input PAR_EN; 
    input PAR_TYP;

    integer i;
    begin
        @(posedge DUT.U0_UART.TX_CLK);
        RX_IN_TB <= 1'b0;

        for (i = 0; i < 8; i = i + 1)
            @(posedge DUT.U0_UART.TX_CLK) RX_IN_TB <= FRAME_DATA[i];

        if (PAR_EN) 
        begin
            @(posedge DUT.U0_UART.TX_CLK)
            begin
                case(PAR_TYP)
                    1'b0 : RX_IN_TB <= ^FRAME_DATA;
                    1'b1 : RX_IN_TB <= ~^FRAME_DATA;
                endcase	
            end
        end

        @(posedge DUT.U0_UART.TX_CLK);
        RX_IN_TB <= 1'b1;
    end
endtask

task SEND_WR_CMD;
    input [7:0] ADDR; 
    input [7:0] DATA; 
    input PAR_EN; 
    input PAR_TYP;

    begin
        SEND_DATA(WR_CMD, PAR_EN, PAR_TYP);
        SEND_DATA(ADDR, PAR_EN, PAR_TYP);
        SEND_DATA(DATA, PAR_EN, PAR_TYP);
    end
endtask

task SEND_RD_CMD;
    input [7:0] ADDR;
    input PAR_EN; 
    input PAR_TYP;

    begin
        SEND_DATA(RD_CMD, PAR_EN, PAR_TYP);
        SEND_DATA(ADDR, PAR_EN, PAR_TYP);
    end
endtask

task SEND_ALU_WLODA_CMD;
    input [7:0] OP_A;
    input [7:0] OP_B; 
    input [7:0] OPERATION; 
    input PAR_EN; 
    input PAR_TYP;

    begin
        SEND_DATA(ALU_WLODA_CMD, PAR_EN, PAR_TYP);
        SEND_DATA(OP_A, PAR_EN, PAR_TYP);
        SEND_DATA(OP_B, PAR_EN, PAR_TYP);
        SEND_DATA(OPERATION, PAR_EN, PAR_TYP);
    end
endtask

task SEND_ALU_NLOAD_CMD;
    input [7:0] OPERATION; 
    input PAR_EN; 
    input PAR_TYP;

    begin
        SEND_DATA(ALU_NLOAD_CMD, PAR_EN, PAR_TYP);
        SEND_DATA(OPERATION, PAR_EN, PAR_TYP);
    end
endtask

task CHECK;
    input [7:0] DATA;
    input PAR_EN;
    input PAR_TYP;

    reg [10:0] gener_out, expec_out;
    reg parity_bit;
    integer i;
    begin
        @(posedge DUT.U0_UART.TX_OUT_V);
        for (i = 0; i < 11; i = i + 1)
            @(negedge DUT.U0_UART.TX_CLK) gener_out[i] = TX_OUT_TB;

        if (PAR_EN)
            parity_bit = PAR_TYP ? ~^DATA : ^DATA;
        else
            parity_bit = 1'b1;

        if (PAR_EN)
            expec_out = {1'b1, parity_bit, DATA, 1'b0};
        else
            expec_out = {1'b1, 1'b1, DATA, 1'b0};

        if (gener_out == expec_out)
            $display("Test Case Passed: Generated Out = %h, Expected Out = %h", gener_out, expec_out);
        else
            $display("Test Case Failed: Generated Out = %h, Expected Out = %h", gener_out, expec_out);
    end
endtask

task CHECK_ALU;
    input [15:0] ALU_OUT_RESULT;
    input PAR_EN;
    input PAR_TYP;
    
    reg [10:0] gener_byte0, gener_byte1;
    reg [10:0] expec_byte0, expec_byte1;
    reg parity_bit0, parity_bit1;
    integer i;

    begin
        @(posedge DUT.U0_UART.TX_OUT_V)
        for (i = 0; i < 11; i = i + 1)
            @(negedge DUT.U0_UART.TX_CLK) gener_byte0[i] = TX_OUT_TB;

        @(posedge DUT.U0_UART.TX_OUT_V)
        for (i = 0; i < 11; i = i + 1)
            @(negedge DUT.U0_UART.TX_CLK) gener_byte1[i] = TX_OUT_TB;

        if (PAR_EN)
            parity_bit0 = PAR_TYP ? ~^ALU_OUT_RESULT[7:0] : ^ALU_OUT_RESULT[7:0];
        else
            parity_bit0 = 1'b1;
        if (PAR_EN)
            parity_bit1 = PAR_TYP ? ~^ALU_OUT_RESULT[15:8] : ^ALU_OUT_RESULT[15:8];
        else
            parity_bit1 = 1'b1;

        expec_byte0 = (PAR_EN) ? {1'b1, parity_bit0, ALU_OUT_RESULT[7:0], 1'b0} : {1'b1, 1'b1, ALU_OUT_RESULT[7:0], 1'b0};
        expec_byte1 = (PAR_EN) ? {1'b1, parity_bit1, ALU_OUT_RESULT[15:8], 1'b0} : {1'b1, 1'b1, ALU_OUT_RESULT[15:8], 1'b0};

        if (gener_byte0 == expec_byte0 && gener_byte1 == expec_byte1)
            $display("Test Case Passed: Generated Out0 = %h, Expected Out0 = %h, Generated Out1 = %h, Expected Out1 = %h", gener_byte0, expec_byte0, gener_byte1, expec_byte1);
        else
            $display("Test Case Failed: Generated Out0= %h, Expected Out0 = %h, Generated Out1 = %h, Expected Out1 = %h", gener_byte0, expec_byte0, gener_byte1, expec_byte1);
    end
endtask


endmodule
