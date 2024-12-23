/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : K-2015.06
// Date      : Wed Oct 23 00:10:24 2024
/////////////////////////////////////////////////////////////


module RST_SYNC_NUM_STAGES2_0 ( CLK, RST, SYNC_RST );
  input CLK, RST;
  output SYNC_RST;
  wire   \sync_reg[0] ;

  DFFRQX2M \sync_reg_reg[1]  ( .D(\sync_reg[0] ), .CK(CLK), .RN(RST), .Q(
        SYNC_RST) );
  DFFRQX2M \sync_reg_reg[0]  ( .D(1'b1), .CK(CLK), .RN(RST), .Q(\sync_reg[0] )
         );
endmodule


module RST_SYNC_NUM_STAGES2_1 ( CLK, RST, SYNC_RST );
  input CLK, RST;
  output SYNC_RST;
  wire   \sync_reg[0] ;

  DFFRQX2M \sync_reg_reg[1]  ( .D(\sync_reg[0] ), .CK(CLK), .RN(RST), .Q(
        SYNC_RST) );
  DFFRQX2M \sync_reg_reg[0]  ( .D(1'b1), .CK(CLK), .RN(RST), .Q(\sync_reg[0] )
         );
endmodule


module DATA_SYNC_NUM_STAGES2_BUS_WIDTH8 ( CLK, RST, unsync_bus, bus_enable, 
        sync_bus, enable_pulse );
  input [7:0] unsync_bus;
  output [7:0] sync_bus;
  input CLK, RST, bus_enable;
  output enable_pulse;
  wire   in_flop, n1, n2, n3, n4, n5, n6, n7, n8, n9, n10;
  wire   [1:0] sync_reg;

  DFFRQX2M in_flop_reg ( .D(sync_reg[1]), .CK(CLK), .RN(RST), .Q(in_flop) );
  DFFRQX2M \sync_reg_reg[1]  ( .D(sync_reg[0]), .CK(CLK), .RN(RST), .Q(
        sync_reg[1]) );
  DFFRQX2M enable_pulse_reg ( .D(n10), .CK(CLK), .RN(RST), .Q(enable_pulse) );
  DFFRQX2M \sync_bus_reg[7]  ( .D(n9), .CK(CLK), .RN(RST), .Q(sync_bus[7]) );
  DFFRQX2M \sync_bus_reg[3]  ( .D(n5), .CK(CLK), .RN(RST), .Q(sync_bus[3]) );
  DFFRQX2M \sync_bus_reg[6]  ( .D(n8), .CK(CLK), .RN(RST), .Q(sync_bus[6]) );
  DFFRQX2M \sync_bus_reg[4]  ( .D(n6), .CK(CLK), .RN(RST), .Q(sync_bus[4]) );
  DFFRQX2M \sync_bus_reg[5]  ( .D(n7), .CK(CLK), .RN(RST), .Q(sync_bus[5]) );
  DFFRQX2M \sync_bus_reg[1]  ( .D(n3), .CK(CLK), .RN(RST), .Q(sync_bus[1]) );
  DFFRQX2M \sync_bus_reg[2]  ( .D(n4), .CK(CLK), .RN(RST), .Q(sync_bus[2]) );
  DFFRQX2M \sync_bus_reg[0]  ( .D(n2), .CK(CLK), .RN(RST), .Q(sync_bus[0]) );
  DFFRQX2M \sync_reg_reg[0]  ( .D(bus_enable), .CK(CLK), .RN(RST), .Q(
        sync_reg[0]) );
  INVX2M U3 ( .A(n1), .Y(n10) );
  NAND2BX2M U4 ( .AN(in_flop), .B(sync_reg[1]), .Y(n1) );
  AO22X1M U5 ( .A0(unsync_bus[0]), .A1(n10), .B0(sync_bus[0]), .B1(n1), .Y(n2)
         );
  AO22X1M U6 ( .A0(unsync_bus[1]), .A1(n10), .B0(sync_bus[1]), .B1(n1), .Y(n3)
         );
  AO22X1M U7 ( .A0(unsync_bus[2]), .A1(n10), .B0(sync_bus[2]), .B1(n1), .Y(n4)
         );
  AO22X1M U8 ( .A0(unsync_bus[3]), .A1(n10), .B0(sync_bus[3]), .B1(n1), .Y(n5)
         );
  AO22X1M U9 ( .A0(unsync_bus[4]), .A1(n10), .B0(sync_bus[4]), .B1(n1), .Y(n6)
         );
  AO22X1M U10 ( .A0(unsync_bus[5]), .A1(n10), .B0(sync_bus[5]), .B1(n1), .Y(n7) );
  AO22X1M U11 ( .A0(unsync_bus[6]), .A1(n10), .B0(sync_bus[6]), .B1(n1), .Y(n8) );
  AO22X1M U12 ( .A0(unsync_bus[7]), .A1(n10), .B0(sync_bus[7]), .B1(n1), .Y(n9) );
endmodule


module FIFO_MEM_CNTRL_FIFO_WIDTH8_FIFO_DEPTH8_ADDRSIZE3 ( wCLK, wRST, w_DATA, 
        w_ADDR, r_ADDR, w_INC, w_FULL, r_DATA );
  input [7:0] w_DATA;
  input [2:0] w_ADDR;
  input [2:0] r_ADDR;
  output [7:0] r_DATA;
  input wCLK, wRST, w_INC, w_FULL;
  wire   N9, N10, N11, \FIFO_MEM[7][7] , \FIFO_MEM[7][6] , \FIFO_MEM[7][5] ,
         \FIFO_MEM[7][4] , \FIFO_MEM[7][3] , \FIFO_MEM[7][2] ,
         \FIFO_MEM[7][1] , \FIFO_MEM[7][0] , \FIFO_MEM[6][7] ,
         \FIFO_MEM[6][6] , \FIFO_MEM[6][5] , \FIFO_MEM[6][4] ,
         \FIFO_MEM[6][3] , \FIFO_MEM[6][2] , \FIFO_MEM[6][1] ,
         \FIFO_MEM[6][0] , \FIFO_MEM[5][7] , \FIFO_MEM[5][6] ,
         \FIFO_MEM[5][5] , \FIFO_MEM[5][4] , \FIFO_MEM[5][3] ,
         \FIFO_MEM[5][2] , \FIFO_MEM[5][1] , \FIFO_MEM[5][0] ,
         \FIFO_MEM[4][7] , \FIFO_MEM[4][6] , \FIFO_MEM[4][5] ,
         \FIFO_MEM[4][4] , \FIFO_MEM[4][3] , \FIFO_MEM[4][2] ,
         \FIFO_MEM[4][1] , \FIFO_MEM[4][0] , \FIFO_MEM[3][7] ,
         \FIFO_MEM[3][6] , \FIFO_MEM[3][5] , \FIFO_MEM[3][4] ,
         \FIFO_MEM[3][3] , \FIFO_MEM[3][2] , \FIFO_MEM[3][1] ,
         \FIFO_MEM[3][0] , \FIFO_MEM[2][7] , \FIFO_MEM[2][6] ,
         \FIFO_MEM[2][5] , \FIFO_MEM[2][4] , \FIFO_MEM[2][3] ,
         \FIFO_MEM[2][2] , \FIFO_MEM[2][1] , \FIFO_MEM[2][0] ,
         \FIFO_MEM[1][7] , \FIFO_MEM[1][6] , \FIFO_MEM[1][5] ,
         \FIFO_MEM[1][4] , \FIFO_MEM[1][3] , \FIFO_MEM[1][2] ,
         \FIFO_MEM[1][1] , \FIFO_MEM[1][0] , \FIFO_MEM[0][7] ,
         \FIFO_MEM[0][6] , \FIFO_MEM[0][5] , \FIFO_MEM[0][4] ,
         \FIFO_MEM[0][3] , \FIFO_MEM[0][2] , \FIFO_MEM[0][1] ,
         \FIFO_MEM[0][0] , n11, n12, n13, n14, n15, n16, n17, n18, n19, n20,
         n21, n22, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32, n33, n34,
         n35, n36, n37, n38, n39, n40, n41, n42, n43, n44, n45, n46, n47, n48,
         n49, n50, n51, n52, n53, n54, n55, n56, n57, n58, n59, n60, n61, n62,
         n63, n64, n65, n66, n67, n68, n69, n70, n71, n72, n73, n74, n75, n76,
         n77, n78, n79, n80, n81, n82, n83, n84, n85, n1, n2, n3, n4, n5, n6,
         n7, n8, n9, n10, n86, n87, n88, n89, n90, n91, n92, n93, n94, n95,
         n96, n97, n98, n99, n100, n101, n102, n103, n104, n105, n106, n107,
         n108, n109, n110, n111, n112, n113, n114;
  assign N9 = r_ADDR[0];
  assign N10 = r_ADDR[1];
  assign N11 = r_ADDR[2];

  DFFRQX2M \FIFO_MEM_reg[5][7]  ( .D(n69), .CK(wCLK), .RN(n101), .Q(
        \FIFO_MEM[5][7] ) );
  DFFRQX2M \FIFO_MEM_reg[5][6]  ( .D(n68), .CK(wCLK), .RN(n101), .Q(
        \FIFO_MEM[5][6] ) );
  DFFRQX2M \FIFO_MEM_reg[5][5]  ( .D(n67), .CK(wCLK), .RN(n101), .Q(
        \FIFO_MEM[5][5] ) );
  DFFRQX2M \FIFO_MEM_reg[5][4]  ( .D(n66), .CK(wCLK), .RN(n101), .Q(
        \FIFO_MEM[5][4] ) );
  DFFRQX2M \FIFO_MEM_reg[5][3]  ( .D(n65), .CK(wCLK), .RN(n101), .Q(
        \FIFO_MEM[5][3] ) );
  DFFRQX2M \FIFO_MEM_reg[5][2]  ( .D(n64), .CK(wCLK), .RN(n101), .Q(
        \FIFO_MEM[5][2] ) );
  DFFRQX2M \FIFO_MEM_reg[5][1]  ( .D(n63), .CK(wCLK), .RN(n101), .Q(
        \FIFO_MEM[5][1] ) );
  DFFRQX2M \FIFO_MEM_reg[5][0]  ( .D(n62), .CK(wCLK), .RN(n101), .Q(
        \FIFO_MEM[5][0] ) );
  DFFRQX2M \FIFO_MEM_reg[1][7]  ( .D(n37), .CK(wCLK), .RN(n103), .Q(
        \FIFO_MEM[1][7] ) );
  DFFRQX2M \FIFO_MEM_reg[1][6]  ( .D(n36), .CK(wCLK), .RN(n103), .Q(
        \FIFO_MEM[1][6] ) );
  DFFRQX2M \FIFO_MEM_reg[1][5]  ( .D(n35), .CK(wCLK), .RN(n103), .Q(
        \FIFO_MEM[1][5] ) );
  DFFRQX2M \FIFO_MEM_reg[1][4]  ( .D(n34), .CK(wCLK), .RN(n103), .Q(
        \FIFO_MEM[1][4] ) );
  DFFRQX2M \FIFO_MEM_reg[1][3]  ( .D(n33), .CK(wCLK), .RN(n104), .Q(
        \FIFO_MEM[1][3] ) );
  DFFRQX2M \FIFO_MEM_reg[1][2]  ( .D(n32), .CK(wCLK), .RN(n104), .Q(
        \FIFO_MEM[1][2] ) );
  DFFRQX2M \FIFO_MEM_reg[1][1]  ( .D(n31), .CK(wCLK), .RN(n104), .Q(
        \FIFO_MEM[1][1] ) );
  DFFRQX2M \FIFO_MEM_reg[1][0]  ( .D(n30), .CK(wCLK), .RN(n104), .Q(
        \FIFO_MEM[1][0] ) );
  DFFRQX2M \FIFO_MEM_reg[7][7]  ( .D(n85), .CK(wCLK), .RN(n100), .Q(
        \FIFO_MEM[7][7] ) );
  DFFRQX2M \FIFO_MEM_reg[7][6]  ( .D(n84), .CK(wCLK), .RN(n100), .Q(
        \FIFO_MEM[7][6] ) );
  DFFRQX2M \FIFO_MEM_reg[7][5]  ( .D(n83), .CK(wCLK), .RN(n100), .Q(
        \FIFO_MEM[7][5] ) );
  DFFRQX2M \FIFO_MEM_reg[7][4]  ( .D(n82), .CK(wCLK), .RN(n100), .Q(
        \FIFO_MEM[7][4] ) );
  DFFRQX2M \FIFO_MEM_reg[7][3]  ( .D(n81), .CK(wCLK), .RN(n100), .Q(
        \FIFO_MEM[7][3] ) );
  DFFRQX2M \FIFO_MEM_reg[7][2]  ( .D(n80), .CK(wCLK), .RN(n100), .Q(
        \FIFO_MEM[7][2] ) );
  DFFRQX2M \FIFO_MEM_reg[7][1]  ( .D(n79), .CK(wCLK), .RN(n100), .Q(
        \FIFO_MEM[7][1] ) );
  DFFRQX2M \FIFO_MEM_reg[7][0]  ( .D(n78), .CK(wCLK), .RN(n100), .Q(
        \FIFO_MEM[7][0] ) );
  DFFRQX2M \FIFO_MEM_reg[3][7]  ( .D(n53), .CK(wCLK), .RN(n102), .Q(
        \FIFO_MEM[3][7] ) );
  DFFRQX2M \FIFO_MEM_reg[3][6]  ( .D(n52), .CK(wCLK), .RN(n102), .Q(
        \FIFO_MEM[3][6] ) );
  DFFRQX2M \FIFO_MEM_reg[3][5]  ( .D(n51), .CK(wCLK), .RN(n102), .Q(
        \FIFO_MEM[3][5] ) );
  DFFRQX2M \FIFO_MEM_reg[3][4]  ( .D(n50), .CK(wCLK), .RN(n102), .Q(
        \FIFO_MEM[3][4] ) );
  DFFRQX2M \FIFO_MEM_reg[3][3]  ( .D(n49), .CK(wCLK), .RN(n102), .Q(
        \FIFO_MEM[3][3] ) );
  DFFRQX2M \FIFO_MEM_reg[3][2]  ( .D(n48), .CK(wCLK), .RN(n102), .Q(
        \FIFO_MEM[3][2] ) );
  DFFRQX2M \FIFO_MEM_reg[3][1]  ( .D(n47), .CK(wCLK), .RN(n102), .Q(
        \FIFO_MEM[3][1] ) );
  DFFRQX2M \FIFO_MEM_reg[3][0]  ( .D(n46), .CK(wCLK), .RN(n103), .Q(
        \FIFO_MEM[3][0] ) );
  DFFRQX2M \FIFO_MEM_reg[6][7]  ( .D(n77), .CK(wCLK), .RN(n100), .Q(
        \FIFO_MEM[6][7] ) );
  DFFRQX2M \FIFO_MEM_reg[6][6]  ( .D(n76), .CK(wCLK), .RN(n100), .Q(
        \FIFO_MEM[6][6] ) );
  DFFRQX2M \FIFO_MEM_reg[6][5]  ( .D(n75), .CK(wCLK), .RN(n100), .Q(
        \FIFO_MEM[6][5] ) );
  DFFRQX2M \FIFO_MEM_reg[6][4]  ( .D(n74), .CK(wCLK), .RN(n100), .Q(
        \FIFO_MEM[6][4] ) );
  DFFRQX2M \FIFO_MEM_reg[6][3]  ( .D(n73), .CK(wCLK), .RN(n100), .Q(
        \FIFO_MEM[6][3] ) );
  DFFRQX2M \FIFO_MEM_reg[6][2]  ( .D(n72), .CK(wCLK), .RN(n101), .Q(
        \FIFO_MEM[6][2] ) );
  DFFRQX2M \FIFO_MEM_reg[6][1]  ( .D(n71), .CK(wCLK), .RN(n101), .Q(
        \FIFO_MEM[6][1] ) );
  DFFRQX2M \FIFO_MEM_reg[6][0]  ( .D(n70), .CK(wCLK), .RN(n101), .Q(
        \FIFO_MEM[6][0] ) );
  DFFRQX2M \FIFO_MEM_reg[2][7]  ( .D(n45), .CK(wCLK), .RN(n103), .Q(
        \FIFO_MEM[2][7] ) );
  DFFRQX2M \FIFO_MEM_reg[2][6]  ( .D(n44), .CK(wCLK), .RN(n103), .Q(
        \FIFO_MEM[2][6] ) );
  DFFRQX2M \FIFO_MEM_reg[2][5]  ( .D(n43), .CK(wCLK), .RN(n103), .Q(
        \FIFO_MEM[2][5] ) );
  DFFRQX2M \FIFO_MEM_reg[2][4]  ( .D(n42), .CK(wCLK), .RN(n103), .Q(
        \FIFO_MEM[2][4] ) );
  DFFRQX2M \FIFO_MEM_reg[2][3]  ( .D(n41), .CK(wCLK), .RN(n103), .Q(
        \FIFO_MEM[2][3] ) );
  DFFRQX2M \FIFO_MEM_reg[2][2]  ( .D(n40), .CK(wCLK), .RN(n103), .Q(
        \FIFO_MEM[2][2] ) );
  DFFRQX2M \FIFO_MEM_reg[2][1]  ( .D(n39), .CK(wCLK), .RN(n103), .Q(
        \FIFO_MEM[2][1] ) );
  DFFRQX2M \FIFO_MEM_reg[2][0]  ( .D(n38), .CK(wCLK), .RN(n103), .Q(
        \FIFO_MEM[2][0] ) );
  DFFRQX2M \FIFO_MEM_reg[4][7]  ( .D(n61), .CK(wCLK), .RN(n101), .Q(
        \FIFO_MEM[4][7] ) );
  DFFRQX2M \FIFO_MEM_reg[4][6]  ( .D(n60), .CK(wCLK), .RN(n101), .Q(
        \FIFO_MEM[4][6] ) );
  DFFRQX2M \FIFO_MEM_reg[4][5]  ( .D(n59), .CK(wCLK), .RN(n102), .Q(
        \FIFO_MEM[4][5] ) );
  DFFRQX2M \FIFO_MEM_reg[4][4]  ( .D(n58), .CK(wCLK), .RN(n102), .Q(
        \FIFO_MEM[4][4] ) );
  DFFRQX2M \FIFO_MEM_reg[4][3]  ( .D(n57), .CK(wCLK), .RN(n102), .Q(
        \FIFO_MEM[4][3] ) );
  DFFRQX2M \FIFO_MEM_reg[4][2]  ( .D(n56), .CK(wCLK), .RN(n102), .Q(
        \FIFO_MEM[4][2] ) );
  DFFRQX2M \FIFO_MEM_reg[4][1]  ( .D(n55), .CK(wCLK), .RN(n102), .Q(
        \FIFO_MEM[4][1] ) );
  DFFRQX2M \FIFO_MEM_reg[4][0]  ( .D(n54), .CK(wCLK), .RN(n102), .Q(
        \FIFO_MEM[4][0] ) );
  DFFRQX2M \FIFO_MEM_reg[0][7]  ( .D(n29), .CK(wCLK), .RN(n104), .Q(
        \FIFO_MEM[0][7] ) );
  DFFRQX2M \FIFO_MEM_reg[0][6]  ( .D(n28), .CK(wCLK), .RN(n104), .Q(
        \FIFO_MEM[0][6] ) );
  DFFRQX2M \FIFO_MEM_reg[0][5]  ( .D(n27), .CK(wCLK), .RN(n104), .Q(
        \FIFO_MEM[0][5] ) );
  DFFRQX2M \FIFO_MEM_reg[0][4]  ( .D(n26), .CK(wCLK), .RN(n104), .Q(
        \FIFO_MEM[0][4] ) );
  DFFRQX2M \FIFO_MEM_reg[0][3]  ( .D(n25), .CK(wCLK), .RN(n104), .Q(
        \FIFO_MEM[0][3] ) );
  DFFRQX2M \FIFO_MEM_reg[0][2]  ( .D(n24), .CK(wCLK), .RN(n104), .Q(
        \FIFO_MEM[0][2] ) );
  DFFRQX2M \FIFO_MEM_reg[0][1]  ( .D(n23), .CK(wCLK), .RN(n104), .Q(
        \FIFO_MEM[0][1] ) );
  DFFRQX2M \FIFO_MEM_reg[0][0]  ( .D(n22), .CK(wCLK), .RN(n104), .Q(
        \FIFO_MEM[0][0] ) );
  BUFX2M U2 ( .A(n20), .Y(n95) );
  BUFX2M U3 ( .A(n21), .Y(n94) );
  BUFX2M U4 ( .A(n14), .Y(n97) );
  BUFX2M U5 ( .A(n19), .Y(n96) );
  BUFX2M U6 ( .A(n98), .Y(n102) );
  BUFX2M U7 ( .A(n98), .Y(n101) );
  BUFX2M U8 ( .A(n98), .Y(n100) );
  BUFX2M U9 ( .A(n99), .Y(n103) );
  BUFX2M U10 ( .A(n99), .Y(n104) );
  NOR2BX2M U11 ( .AN(w_INC), .B(w_FULL), .Y(n16) );
  BUFX2M U12 ( .A(wRST), .Y(n98) );
  BUFX2M U13 ( .A(wRST), .Y(n99) );
  NAND3X2M U14 ( .A(n105), .B(n106), .C(n18), .Y(n17) );
  NAND3X2M U15 ( .A(n105), .B(n106), .C(n12), .Y(n11) );
  NAND3X2M U16 ( .A(w_ADDR[0]), .B(n12), .C(w_ADDR[1]), .Y(n15) );
  NAND3X2M U17 ( .A(n12), .B(n106), .C(w_ADDR[0]), .Y(n13) );
  NOR2BX2M U18 ( .AN(n16), .B(w_ADDR[2]), .Y(n12) );
  OAI2BB2X1M U19 ( .B0(n11), .B1(n114), .A0N(\FIFO_MEM[0][0] ), .A1N(n11), .Y(
        n22) );
  OAI2BB2X1M U20 ( .B0(n11), .B1(n113), .A0N(\FIFO_MEM[0][1] ), .A1N(n11), .Y(
        n23) );
  OAI2BB2X1M U21 ( .B0(n11), .B1(n112), .A0N(\FIFO_MEM[0][2] ), .A1N(n11), .Y(
        n24) );
  OAI2BB2X1M U22 ( .B0(n11), .B1(n111), .A0N(\FIFO_MEM[0][3] ), .A1N(n11), .Y(
        n25) );
  OAI2BB2X1M U23 ( .B0(n11), .B1(n110), .A0N(\FIFO_MEM[0][4] ), .A1N(n11), .Y(
        n26) );
  OAI2BB2X1M U24 ( .B0(n11), .B1(n109), .A0N(\FIFO_MEM[0][5] ), .A1N(n11), .Y(
        n27) );
  OAI2BB2X1M U25 ( .B0(n11), .B1(n108), .A0N(\FIFO_MEM[0][6] ), .A1N(n11), .Y(
        n28) );
  OAI2BB2X1M U26 ( .B0(n11), .B1(n107), .A0N(\FIFO_MEM[0][7] ), .A1N(n11), .Y(
        n29) );
  OAI2BB2X1M U27 ( .B0(n114), .B1(n15), .A0N(\FIFO_MEM[3][0] ), .A1N(n15), .Y(
        n46) );
  OAI2BB2X1M U28 ( .B0(n113), .B1(n15), .A0N(\FIFO_MEM[3][1] ), .A1N(n15), .Y(
        n47) );
  OAI2BB2X1M U29 ( .B0(n112), .B1(n15), .A0N(\FIFO_MEM[3][2] ), .A1N(n15), .Y(
        n48) );
  OAI2BB2X1M U30 ( .B0(n111), .B1(n15), .A0N(\FIFO_MEM[3][3] ), .A1N(n15), .Y(
        n49) );
  OAI2BB2X1M U31 ( .B0(n110), .B1(n15), .A0N(\FIFO_MEM[3][4] ), .A1N(n15), .Y(
        n50) );
  OAI2BB2X1M U32 ( .B0(n109), .B1(n15), .A0N(\FIFO_MEM[3][5] ), .A1N(n15), .Y(
        n51) );
  OAI2BB2X1M U33 ( .B0(n108), .B1(n15), .A0N(\FIFO_MEM[3][6] ), .A1N(n15), .Y(
        n52) );
  OAI2BB2X1M U34 ( .B0(n107), .B1(n15), .A0N(\FIFO_MEM[3][7] ), .A1N(n15), .Y(
        n53) );
  OAI2BB2X1M U35 ( .B0(n114), .B1(n13), .A0N(\FIFO_MEM[1][0] ), .A1N(n13), .Y(
        n30) );
  OAI2BB2X1M U36 ( .B0(n113), .B1(n13), .A0N(\FIFO_MEM[1][1] ), .A1N(n13), .Y(
        n31) );
  OAI2BB2X1M U37 ( .B0(n112), .B1(n13), .A0N(\FIFO_MEM[1][2] ), .A1N(n13), .Y(
        n32) );
  OAI2BB2X1M U38 ( .B0(n111), .B1(n13), .A0N(\FIFO_MEM[1][3] ), .A1N(n13), .Y(
        n33) );
  OAI2BB2X1M U39 ( .B0(n110), .B1(n13), .A0N(\FIFO_MEM[1][4] ), .A1N(n13), .Y(
        n34) );
  OAI2BB2X1M U40 ( .B0(n109), .B1(n13), .A0N(\FIFO_MEM[1][5] ), .A1N(n13), .Y(
        n35) );
  OAI2BB2X1M U41 ( .B0(n108), .B1(n13), .A0N(\FIFO_MEM[1][6] ), .A1N(n13), .Y(
        n36) );
  OAI2BB2X1M U42 ( .B0(n107), .B1(n13), .A0N(\FIFO_MEM[1][7] ), .A1N(n13), .Y(
        n37) );
  OAI2BB2X1M U43 ( .B0(n114), .B1(n17), .A0N(\FIFO_MEM[4][0] ), .A1N(n17), .Y(
        n54) );
  OAI2BB2X1M U44 ( .B0(n113), .B1(n17), .A0N(\FIFO_MEM[4][1] ), .A1N(n17), .Y(
        n55) );
  OAI2BB2X1M U45 ( .B0(n112), .B1(n17), .A0N(\FIFO_MEM[4][2] ), .A1N(n17), .Y(
        n56) );
  OAI2BB2X1M U46 ( .B0(n111), .B1(n17), .A0N(\FIFO_MEM[4][3] ), .A1N(n17), .Y(
        n57) );
  OAI2BB2X1M U47 ( .B0(n110), .B1(n17), .A0N(\FIFO_MEM[4][4] ), .A1N(n17), .Y(
        n58) );
  OAI2BB2X1M U48 ( .B0(n109), .B1(n17), .A0N(\FIFO_MEM[4][5] ), .A1N(n17), .Y(
        n59) );
  OAI2BB2X1M U49 ( .B0(n108), .B1(n17), .A0N(\FIFO_MEM[4][6] ), .A1N(n17), .Y(
        n60) );
  OAI2BB2X1M U50 ( .B0(n107), .B1(n17), .A0N(\FIFO_MEM[4][7] ), .A1N(n17), .Y(
        n61) );
  INVX2M U51 ( .A(w_DATA[0]), .Y(n114) );
  OAI2BB2X1M U52 ( .B0(n114), .B1(n97), .A0N(\FIFO_MEM[2][0] ), .A1N(n97), .Y(
        n38) );
  OAI2BB2X1M U53 ( .B0(n113), .B1(n97), .A0N(\FIFO_MEM[2][1] ), .A1N(n97), .Y(
        n39) );
  OAI2BB2X1M U54 ( .B0(n112), .B1(n97), .A0N(\FIFO_MEM[2][2] ), .A1N(n97), .Y(
        n40) );
  OAI2BB2X1M U55 ( .B0(n111), .B1(n97), .A0N(\FIFO_MEM[2][3] ), .A1N(n97), .Y(
        n41) );
  OAI2BB2X1M U56 ( .B0(n110), .B1(n97), .A0N(\FIFO_MEM[2][4] ), .A1N(n97), .Y(
        n42) );
  OAI2BB2X1M U57 ( .B0(n109), .B1(n97), .A0N(\FIFO_MEM[2][5] ), .A1N(n97), .Y(
        n43) );
  OAI2BB2X1M U58 ( .B0(n108), .B1(n97), .A0N(\FIFO_MEM[2][6] ), .A1N(n97), .Y(
        n44) );
  OAI2BB2X1M U59 ( .B0(n107), .B1(n97), .A0N(\FIFO_MEM[2][7] ), .A1N(n97), .Y(
        n45) );
  OAI2BB2X1M U60 ( .B0(n114), .B1(n96), .A0N(\FIFO_MEM[5][0] ), .A1N(n96), .Y(
        n62) );
  OAI2BB2X1M U61 ( .B0(n113), .B1(n96), .A0N(\FIFO_MEM[5][1] ), .A1N(n96), .Y(
        n63) );
  OAI2BB2X1M U62 ( .B0(n112), .B1(n96), .A0N(\FIFO_MEM[5][2] ), .A1N(n96), .Y(
        n64) );
  OAI2BB2X1M U63 ( .B0(n111), .B1(n96), .A0N(\FIFO_MEM[5][3] ), .A1N(n96), .Y(
        n65) );
  OAI2BB2X1M U64 ( .B0(n110), .B1(n96), .A0N(\FIFO_MEM[5][4] ), .A1N(n96), .Y(
        n66) );
  OAI2BB2X1M U65 ( .B0(n109), .B1(n96), .A0N(\FIFO_MEM[5][5] ), .A1N(n96), .Y(
        n67) );
  OAI2BB2X1M U66 ( .B0(n108), .B1(n96), .A0N(\FIFO_MEM[5][6] ), .A1N(n96), .Y(
        n68) );
  OAI2BB2X1M U67 ( .B0(n107), .B1(n96), .A0N(\FIFO_MEM[5][7] ), .A1N(n96), .Y(
        n69) );
  OAI2BB2X1M U68 ( .B0(n114), .B1(n95), .A0N(\FIFO_MEM[6][0] ), .A1N(n95), .Y(
        n70) );
  OAI2BB2X1M U69 ( .B0(n113), .B1(n95), .A0N(\FIFO_MEM[6][1] ), .A1N(n95), .Y(
        n71) );
  OAI2BB2X1M U70 ( .B0(n112), .B1(n95), .A0N(\FIFO_MEM[6][2] ), .A1N(n95), .Y(
        n72) );
  OAI2BB2X1M U71 ( .B0(n111), .B1(n95), .A0N(\FIFO_MEM[6][3] ), .A1N(n95), .Y(
        n73) );
  OAI2BB2X1M U72 ( .B0(n110), .B1(n95), .A0N(\FIFO_MEM[6][4] ), .A1N(n95), .Y(
        n74) );
  OAI2BB2X1M U73 ( .B0(n109), .B1(n95), .A0N(\FIFO_MEM[6][5] ), .A1N(n95), .Y(
        n75) );
  OAI2BB2X1M U74 ( .B0(n108), .B1(n95), .A0N(\FIFO_MEM[6][6] ), .A1N(n95), .Y(
        n76) );
  OAI2BB2X1M U75 ( .B0(n107), .B1(n95), .A0N(\FIFO_MEM[6][7] ), .A1N(n95), .Y(
        n77) );
  OAI2BB2X1M U76 ( .B0(n114), .B1(n94), .A0N(\FIFO_MEM[7][0] ), .A1N(n94), .Y(
        n78) );
  OAI2BB2X1M U77 ( .B0(n113), .B1(n94), .A0N(\FIFO_MEM[7][1] ), .A1N(n94), .Y(
        n79) );
  OAI2BB2X1M U78 ( .B0(n112), .B1(n94), .A0N(\FIFO_MEM[7][2] ), .A1N(n94), .Y(
        n80) );
  OAI2BB2X1M U79 ( .B0(n111), .B1(n94), .A0N(\FIFO_MEM[7][3] ), .A1N(n94), .Y(
        n81) );
  OAI2BB2X1M U80 ( .B0(n110), .B1(n94), .A0N(\FIFO_MEM[7][4] ), .A1N(n94), .Y(
        n82) );
  OAI2BB2X1M U81 ( .B0(n109), .B1(n94), .A0N(\FIFO_MEM[7][5] ), .A1N(n94), .Y(
        n83) );
  OAI2BB2X1M U82 ( .B0(n108), .B1(n94), .A0N(\FIFO_MEM[7][6] ), .A1N(n94), .Y(
        n84) );
  OAI2BB2X1M U83 ( .B0(n107), .B1(n94), .A0N(\FIFO_MEM[7][7] ), .A1N(n94), .Y(
        n85) );
  AND2X2M U84 ( .A(w_ADDR[2]), .B(n16), .Y(n18) );
  NAND3X2M U85 ( .A(n12), .B(n105), .C(w_ADDR[1]), .Y(n14) );
  NAND3X2M U86 ( .A(w_ADDR[0]), .B(n106), .C(n18), .Y(n19) );
  NAND3X2M U87 ( .A(w_ADDR[1]), .B(n105), .C(n18), .Y(n20) );
  NAND3X2M U88 ( .A(w_ADDR[1]), .B(w_ADDR[0]), .C(n18), .Y(n21) );
  INVX2M U89 ( .A(w_ADDR[1]), .Y(n106) );
  INVX2M U90 ( .A(w_ADDR[0]), .Y(n105) );
  INVX2M U91 ( .A(w_DATA[1]), .Y(n113) );
  INVX2M U92 ( .A(w_DATA[2]), .Y(n112) );
  INVX2M U93 ( .A(w_DATA[3]), .Y(n111) );
  INVX2M U94 ( .A(w_DATA[4]), .Y(n110) );
  INVX2M U95 ( .A(w_DATA[5]), .Y(n109) );
  INVX2M U96 ( .A(w_DATA[6]), .Y(n108) );
  INVX2M U97 ( .A(w_DATA[7]), .Y(n107) );
  MX2X2M U98 ( .A(n2), .B(n1), .S0(N11), .Y(r_DATA[0]) );
  MX4X1M U99 ( .A(\FIFO_MEM[0][0] ), .B(\FIFO_MEM[1][0] ), .C(\FIFO_MEM[2][0] ), .D(\FIFO_MEM[3][0] ), .S0(n93), .S1(N10), .Y(n2) );
  MX4X1M U100 ( .A(\FIFO_MEM[4][0] ), .B(\FIFO_MEM[5][0] ), .C(
        \FIFO_MEM[6][0] ), .D(\FIFO_MEM[7][0] ), .S0(n92), .S1(N10), .Y(n1) );
  MX2X2M U101 ( .A(n4), .B(n3), .S0(N11), .Y(r_DATA[1]) );
  MX4X1M U102 ( .A(\FIFO_MEM[0][1] ), .B(\FIFO_MEM[1][1] ), .C(
        \FIFO_MEM[2][1] ), .D(\FIFO_MEM[3][1] ), .S0(n93), .S1(N10), .Y(n4) );
  MX4X1M U103 ( .A(\FIFO_MEM[4][1] ), .B(\FIFO_MEM[5][1] ), .C(
        \FIFO_MEM[6][1] ), .D(\FIFO_MEM[7][1] ), .S0(n92), .S1(N10), .Y(n3) );
  MX2X2M U104 ( .A(n6), .B(n5), .S0(N11), .Y(r_DATA[2]) );
  MX4X1M U105 ( .A(\FIFO_MEM[0][2] ), .B(\FIFO_MEM[1][2] ), .C(
        \FIFO_MEM[2][2] ), .D(\FIFO_MEM[3][2] ), .S0(n93), .S1(N10), .Y(n6) );
  MX4X1M U106 ( .A(\FIFO_MEM[4][2] ), .B(\FIFO_MEM[5][2] ), .C(
        \FIFO_MEM[6][2] ), .D(\FIFO_MEM[7][2] ), .S0(n92), .S1(N10), .Y(n5) );
  MX2X2M U107 ( .A(n8), .B(n7), .S0(N11), .Y(r_DATA[3]) );
  MX4X1M U108 ( .A(\FIFO_MEM[0][3] ), .B(\FIFO_MEM[1][3] ), .C(
        \FIFO_MEM[2][3] ), .D(\FIFO_MEM[3][3] ), .S0(n93), .S1(N10), .Y(n8) );
  MX4X1M U109 ( .A(\FIFO_MEM[4][3] ), .B(\FIFO_MEM[5][3] ), .C(
        \FIFO_MEM[6][3] ), .D(\FIFO_MEM[7][3] ), .S0(n92), .S1(N10), .Y(n7) );
  MX2X2M U110 ( .A(n10), .B(n9), .S0(N11), .Y(r_DATA[4]) );
  MX4X1M U111 ( .A(\FIFO_MEM[0][4] ), .B(\FIFO_MEM[1][4] ), .C(
        \FIFO_MEM[2][4] ), .D(\FIFO_MEM[3][4] ), .S0(n93), .S1(N10), .Y(n10)
         );
  MX4X1M U112 ( .A(\FIFO_MEM[4][4] ), .B(\FIFO_MEM[5][4] ), .C(
        \FIFO_MEM[6][4] ), .D(\FIFO_MEM[7][4] ), .S0(n92), .S1(N10), .Y(n9) );
  MX2X2M U113 ( .A(n87), .B(n86), .S0(N11), .Y(r_DATA[5]) );
  MX4X1M U114 ( .A(\FIFO_MEM[0][5] ), .B(\FIFO_MEM[1][5] ), .C(
        \FIFO_MEM[2][5] ), .D(\FIFO_MEM[3][5] ), .S0(n93), .S1(N10), .Y(n87)
         );
  MX4X1M U115 ( .A(\FIFO_MEM[4][5] ), .B(\FIFO_MEM[5][5] ), .C(
        \FIFO_MEM[6][5] ), .D(\FIFO_MEM[7][5] ), .S0(n92), .S1(N10), .Y(n86)
         );
  MX2X2M U116 ( .A(n89), .B(n88), .S0(N11), .Y(r_DATA[6]) );
  MX4X1M U117 ( .A(\FIFO_MEM[0][6] ), .B(\FIFO_MEM[1][6] ), .C(
        \FIFO_MEM[2][6] ), .D(\FIFO_MEM[3][6] ), .S0(n93), .S1(N10), .Y(n89)
         );
  MX4X1M U118 ( .A(\FIFO_MEM[4][6] ), .B(\FIFO_MEM[5][6] ), .C(
        \FIFO_MEM[6][6] ), .D(\FIFO_MEM[7][6] ), .S0(n92), .S1(N10), .Y(n88)
         );
  MX2X2M U119 ( .A(n91), .B(n90), .S0(N11), .Y(r_DATA[7]) );
  MX4X1M U120 ( .A(\FIFO_MEM[0][7] ), .B(\FIFO_MEM[1][7] ), .C(
        \FIFO_MEM[2][7] ), .D(\FIFO_MEM[3][7] ), .S0(n93), .S1(N10), .Y(n91)
         );
  MX4X1M U121 ( .A(\FIFO_MEM[4][7] ), .B(\FIFO_MEM[5][7] ), .C(
        \FIFO_MEM[6][7] ), .D(\FIFO_MEM[7][7] ), .S0(n92), .S1(N10), .Y(n90)
         );
  BUFX2M U122 ( .A(N9), .Y(n92) );
  BUFX2M U123 ( .A(N9), .Y(n93) );
endmodule


module FIFO_WR_ADDRSIZE3 ( wCLK, wRST, wINC, wq2_rptr, wADDR, wPTR, wFULL );
  input [3:0] wq2_rptr;
  output [2:0] wADDR;
  output [3:0] wPTR;
  input wCLK, wRST, wINC;
  output wFULL;
  wire   \wbin[3] , N7, N8, N9, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12,
         n13, n14, n1;

  DFFRQX2M \wbin_reg[3]  ( .D(n11), .CK(wCLK), .RN(wRST), .Q(\wbin[3] ) );
  DFFRQX2M \wPTR_reg[0]  ( .D(N9), .CK(wCLK), .RN(wRST), .Q(wPTR[0]) );
  DFFRQX2M \wPTR_reg[1]  ( .D(N8), .CK(wCLK), .RN(wRST), .Q(wPTR[1]) );
  DFFRQX2M \wbin_reg[2]  ( .D(n12), .CK(wCLK), .RN(wRST), .Q(wADDR[2]) );
  DFFRQX2M \wbin_reg[0]  ( .D(n14), .CK(wCLK), .RN(wRST), .Q(wADDR[0]) );
  DFFRQX2M \wPTR_reg[3]  ( .D(\wbin[3] ), .CK(wCLK), .RN(wRST), .Q(wPTR[3]) );
  DFFRQX2M \wPTR_reg[2]  ( .D(N7), .CK(wCLK), .RN(wRST), .Q(wPTR[2]) );
  DFFRQX2M \wbin_reg[1]  ( .D(n13), .CK(wCLK), .RN(wRST), .Q(wADDR[1]) );
  NOR2X2M U3 ( .A(n1), .B(n6), .Y(n5) );
  NAND2X2M U4 ( .A(wINC), .B(n2), .Y(n6) );
  INVX2M U5 ( .A(n2), .Y(wFULL) );
  XNOR2X2M U6 ( .A(wADDR[2]), .B(n4), .Y(n12) );
  XNOR2X2M U7 ( .A(\wbin[3] ), .B(n3), .Y(n11) );
  NAND2BX2M U8 ( .AN(n4), .B(wADDR[2]), .Y(n3) );
  NAND4X2M U9 ( .A(n7), .B(n8), .C(n9), .D(n10), .Y(n2) );
  XNOR2X2M U10 ( .A(wq2_rptr[1]), .B(wPTR[1]), .Y(n7) );
  XNOR2X2M U11 ( .A(wq2_rptr[0]), .B(wPTR[0]), .Y(n8) );
  CLKXOR2X2M U12 ( .A(wq2_rptr[3]), .B(wPTR[3]), .Y(n9) );
  NAND2X2M U13 ( .A(wADDR[1]), .B(n5), .Y(n4) );
  CLKXOR2X2M U14 ( .A(wq2_rptr[2]), .B(wPTR[2]), .Y(n10) );
  CLKXOR2X2M U15 ( .A(wADDR[1]), .B(n5), .Y(n13) );
  XNOR2X2M U16 ( .A(wADDR[1]), .B(n1), .Y(N9) );
  XNOR2X2M U17 ( .A(wADDR[0]), .B(n6), .Y(n14) );
  INVX2M U18 ( .A(wADDR[0]), .Y(n1) );
  CLKXOR2X2M U19 ( .A(wADDR[2]), .B(wADDR[1]), .Y(N8) );
  CLKXOR2X2M U20 ( .A(\wbin[3] ), .B(wADDR[2]), .Y(N7) );
endmodule


module FIFO_RD_ADDRSIZE3 ( rCLK, rRST, rINC, rq2_wptr, rADDR, rPTR, rEMPTY );
  input [3:0] rq2_wptr;
  output [2:0] rADDR;
  output [3:0] rPTR;
  input rCLK, rRST, rINC;
  output rEMPTY;
  wire   \rbin[3] , N7, N8, N9, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12,
         n13, n14, n1;

  DFFRQX2M \rbin_reg[3]  ( .D(n11), .CK(rCLK), .RN(rRST), .Q(\rbin[3] ) );
  DFFRQX2M \rPTR_reg[0]  ( .D(N9), .CK(rCLK), .RN(rRST), .Q(rPTR[0]) );
  DFFRQX2M \rPTR_reg[3]  ( .D(\rbin[3] ), .CK(rCLK), .RN(rRST), .Q(rPTR[3]) );
  DFFRQX2M \rPTR_reg[2]  ( .D(N7), .CK(rCLK), .RN(rRST), .Q(rPTR[2]) );
  DFFRQX2M \rPTR_reg[1]  ( .D(N8), .CK(rCLK), .RN(rRST), .Q(rPTR[1]) );
  DFFRQX2M \rbin_reg[0]  ( .D(n14), .CK(rCLK), .RN(rRST), .Q(rADDR[0]) );
  DFFRQX2M \rbin_reg[2]  ( .D(n12), .CK(rCLK), .RN(rRST), .Q(rADDR[2]) );
  DFFRQX2M \rbin_reg[1]  ( .D(n13), .CK(rCLK), .RN(rRST), .Q(rADDR[1]) );
  NOR2X2M U3 ( .A(n1), .B(n6), .Y(n5) );
  INVX2M U4 ( .A(n2), .Y(rEMPTY) );
  XNOR2X2M U5 ( .A(rq2_wptr[2]), .B(rPTR[2]), .Y(n10) );
  XNOR2X2M U6 ( .A(rADDR[2]), .B(n4), .Y(n12) );
  XNOR2X2M U7 ( .A(\rbin[3] ), .B(n3), .Y(n11) );
  NAND2BX2M U8 ( .AN(n4), .B(rADDR[2]), .Y(n3) );
  XNOR2X2M U9 ( .A(rADDR[0]), .B(n6), .Y(n14) );
  NAND4X2M U10 ( .A(n7), .B(n8), .C(n9), .D(n10), .Y(n2) );
  XNOR2X2M U11 ( .A(rq2_wptr[1]), .B(rPTR[1]), .Y(n7) );
  XNOR2X2M U12 ( .A(rq2_wptr[0]), .B(rPTR[0]), .Y(n8) );
  XNOR2X2M U13 ( .A(rq2_wptr[3]), .B(rPTR[3]), .Y(n9) );
  NAND2X2M U14 ( .A(rADDR[1]), .B(n5), .Y(n4) );
  NAND2X2M U15 ( .A(rINC), .B(n2), .Y(n6) );
  INVX2M U16 ( .A(rADDR[0]), .Y(n1) );
  CLKXOR2X2M U17 ( .A(rADDR[1]), .B(n5), .Y(n13) );
  XNOR2X2M U18 ( .A(rADDR[1]), .B(n1), .Y(N9) );
  CLKXOR2X2M U19 ( .A(rADDR[2]), .B(rADDR[1]), .Y(N8) );
  CLKXOR2X2M U20 ( .A(\rbin[3] ), .B(rADDR[2]), .Y(N7) );
endmodule


module SYNC_ADDRSIZE3_0 ( CLK, RST, ptr, q2_ptr );
  input [3:0] ptr;
  output [3:0] q2_ptr;
  input CLK, RST;

  wire   [3:0] ff;

  DFFRQX2M \q2_ptr_reg[1]  ( .D(ff[1]), .CK(CLK), .RN(RST), .Q(q2_ptr[1]) );
  DFFRQX2M \q2_ptr_reg[0]  ( .D(ff[0]), .CK(CLK), .RN(RST), .Q(q2_ptr[0]) );
  DFFRQX2M \q2_ptr_reg[3]  ( .D(ff[3]), .CK(CLK), .RN(RST), .Q(q2_ptr[3]) );
  DFFRQX2M \q2_ptr_reg[2]  ( .D(ff[2]), .CK(CLK), .RN(RST), .Q(q2_ptr[2]) );
  DFFRQX2M \ff_reg[3]  ( .D(ptr[3]), .CK(CLK), .RN(RST), .Q(ff[3]) );
  DFFRQX2M \ff_reg[2]  ( .D(ptr[2]), .CK(CLK), .RN(RST), .Q(ff[2]) );
  DFFRQX2M \ff_reg[1]  ( .D(ptr[1]), .CK(CLK), .RN(RST), .Q(ff[1]) );
  DFFRQX2M \ff_reg[0]  ( .D(ptr[0]), .CK(CLK), .RN(RST), .Q(ff[0]) );
endmodule


module SYNC_ADDRSIZE3_1 ( CLK, RST, ptr, q2_ptr );
  input [3:0] ptr;
  output [3:0] q2_ptr;
  input CLK, RST;

  wire   [3:0] ff;

  DFFRQX2M \q2_ptr_reg[3]  ( .D(ff[3]), .CK(CLK), .RN(RST), .Q(q2_ptr[3]) );
  DFFRQX2M \q2_ptr_reg[2]  ( .D(ff[2]), .CK(CLK), .RN(RST), .Q(q2_ptr[2]) );
  DFFRQX2M \q2_ptr_reg[1]  ( .D(ff[1]), .CK(CLK), .RN(RST), .Q(q2_ptr[1]) );
  DFFRQX2M \q2_ptr_reg[0]  ( .D(ff[0]), .CK(CLK), .RN(RST), .Q(q2_ptr[0]) );
  DFFRQX2M \ff_reg[3]  ( .D(ptr[3]), .CK(CLK), .RN(RST), .Q(ff[3]) );
  DFFRQX2M \ff_reg[2]  ( .D(ptr[2]), .CK(CLK), .RN(RST), .Q(ff[2]) );
  DFFRQX2M \ff_reg[1]  ( .D(ptr[1]), .CK(CLK), .RN(RST), .Q(ff[1]) );
  DFFRQX2M \ff_reg[0]  ( .D(ptr[0]), .CK(CLK), .RN(RST), .Q(ff[0]) );
endmodule


module ASYNC_FIFO_FIFO_WIDTH8_FIFO_DEPTH8_ADDRSIZE3 ( W_CLK, W_RST, W_INC, 
        R_CLK, R_RST, R_INC, WR_DATA, FULL, RD_DATA, EMPTY );
  input [7:0] WR_DATA;
  output [7:0] RD_DATA;
  input W_CLK, W_RST, W_INC, R_CLK, R_RST, R_INC;
  output FULL, EMPTY;
  wire   n1, n2;
  wire   [2:0] w_addr_wire;
  wire   [2:0] r_addr_wire;
  wire   [3:0] sync_r2w_ptr_wire;
  wire   [3:0] gray_w2r_ptr_wire;
  wire   [3:0] sync_w2r_ptr_wire;
  wire   [3:0] gray_r2w_ptr_wire;

  FIFO_MEM_CNTRL_FIFO_WIDTH8_FIFO_DEPTH8_ADDRSIZE3 U0_FIFO_MEM ( .wCLK(W_CLK), 
        .wRST(n1), .w_DATA(WR_DATA), .w_ADDR(w_addr_wire), .r_ADDR(r_addr_wire), .w_INC(W_INC), .w_FULL(FULL), .r_DATA(RD_DATA) );
  FIFO_WR_ADDRSIZE3 U1_FIFO_WR ( .wCLK(W_CLK), .wRST(n1), .wINC(W_INC), 
        .wq2_rptr(sync_r2w_ptr_wire), .wADDR(w_addr_wire), .wPTR(
        gray_w2r_ptr_wire), .wFULL(FULL) );
  FIFO_RD_ADDRSIZE3 U2_FIFO_RD ( .rCLK(R_CLK), .rRST(R_RST), .rINC(R_INC), 
        .rq2_wptr(sync_w2r_ptr_wire), .rADDR(r_addr_wire), .rPTR(
        gray_r2w_ptr_wire), .rEMPTY(EMPTY) );
  SYNC_ADDRSIZE3_0 Sync_r2w ( .CLK(W_CLK), .RST(n1), .ptr(gray_r2w_ptr_wire), 
        .q2_ptr(sync_r2w_ptr_wire) );
  SYNC_ADDRSIZE3_1 Sync_w2r ( .CLK(R_CLK), .RST(R_RST), .ptr(gray_w2r_ptr_wire), .q2_ptr(sync_w2r_ptr_wire) );
  INVX2M U1 ( .A(n2), .Y(n1) );
  INVX2M U2 ( .A(W_RST), .Y(n2) );
endmodule


module PULSE_GEN ( clk, rst, lvl_sig, pulse_sig );
  input clk, rst, lvl_sig;
  output pulse_sig;
  wire   pls_flop, rcv_flop;

  DFFRQX2M rcv_flop_reg ( .D(lvl_sig), .CK(clk), .RN(rst), .Q(rcv_flop) );
  DFFRQX2M pls_flop_reg ( .D(rcv_flop), .CK(clk), .RN(rst), .Q(pls_flop) );
  NOR2BX2M U3 ( .AN(rcv_flop), .B(pls_flop), .Y(pulse_sig) );
endmodule


module CLKDIV_RATIO_WIDTH8_0_DW01_inc_0 ( A, SUM );
  input [7:0] A;
  output [7:0] SUM;

  wire   [7:2] carry;

  ADDHX1M U1_1_6 ( .A(A[6]), .B(carry[6]), .CO(carry[7]), .S(SUM[6]) );
  ADDHX1M U1_1_5 ( .A(A[5]), .B(carry[5]), .CO(carry[6]), .S(SUM[5]) );
  ADDHX1M U1_1_4 ( .A(A[4]), .B(carry[4]), .CO(carry[5]), .S(SUM[4]) );
  ADDHX1M U1_1_3 ( .A(A[3]), .B(carry[3]), .CO(carry[4]), .S(SUM[3]) );
  ADDHX1M U1_1_2 ( .A(A[2]), .B(carry[2]), .CO(carry[3]), .S(SUM[2]) );
  ADDHX1M U1_1_1 ( .A(A[1]), .B(A[0]), .CO(carry[2]), .S(SUM[1]) );
  CLKXOR2X2M U1 ( .A(carry[7]), .B(A[7]), .Y(SUM[7]) );
  CLKINVX1M U2 ( .A(A[0]), .Y(SUM[0]) );
endmodule


module CLKDIV_RATIO_WIDTH8_0 ( CLK, RST, CLK_EN, DIV_RATIO, DIV_CLK );
  input [7:0] DIV_RATIO;
  input CLK, RST, CLK_EN;
  output DIV_CLK;
  wire   N0, DIV_CLK_O, N8, N10, N11, N12, N13, N14, N15, N16, N19, N23, N24,
         N25, N26, N27, N28, N29, N30, n11, n12, n13, n14, n15, n16, n17, n18,
         n19, n20, n21, n22, n23, n24, n25, n26, n1, n2, n3, n4, n5, n6, n7,
         n8, n9, n10, n27, n28, n29, n30, n31, n32, n33, n34, n35, n36, n37,
         n38, n39, n40, n41, n42, n43, n44, n45, n46, n47, n48;
  wire   [7:0] bit_count;

  CLKDIV_RATIO_WIDTH8_0_DW01_inc_0 add_47 ( .A(bit_count), .SUM({N30, N29, N28, 
        N27, N26, N25, N24, N23}) );
  DFFRQX2M \bit_count_reg[7]  ( .D(n19), .CK(CLK), .RN(RST), .Q(bit_count[7])
         );
  DFFRQX2M DIV_CLK_O_reg ( .D(n18), .CK(CLK), .RN(RST), .Q(DIV_CLK_O) );
  DFFRQX2M \bit_count_reg[2]  ( .D(n24), .CK(CLK), .RN(RST), .Q(bit_count[2])
         );
  DFFRQX2M \bit_count_reg[1]  ( .D(n25), .CK(CLK), .RN(RST), .Q(bit_count[1])
         );
  DFFRQX2M \bit_count_reg[0]  ( .D(n26), .CK(CLK), .RN(RST), .Q(bit_count[0])
         );
  DFFRQX2M \bit_count_reg[6]  ( .D(n20), .CK(CLK), .RN(RST), .Q(bit_count[6])
         );
  DFFRQX2M \bit_count_reg[5]  ( .D(n21), .CK(CLK), .RN(RST), .Q(bit_count[5])
         );
  DFFRQX2M \bit_count_reg[4]  ( .D(n22), .CK(CLK), .RN(RST), .Q(bit_count[4])
         );
  DFFRQX2M \bit_count_reg[3]  ( .D(n23), .CK(CLK), .RN(RST), .Q(bit_count[3])
         );
  AOI2BB2XLM U3 ( .B0(n47), .B1(N16), .A0N(n15), .A1N(n47), .Y(n12) );
  MX2X2M U4 ( .A(CLK), .B(DIV_CLK_O), .S0(N0), .Y(DIV_CLK) );
  XNOR2X2M U5 ( .A(n48), .B(n11), .Y(n18) );
  NOR2X2M U6 ( .A(n12), .B(n2), .Y(n11) );
  NOR2BX2M U7 ( .AN(n12), .B(n2), .Y(n14) );
  INVX2M U8 ( .A(n2), .Y(N0) );
  INVX2M U9 ( .A(DIV_RATIO[0]), .Y(n47) );
  AOI22X1M U10 ( .A0(N19), .A1(n48), .B0(N16), .B1(DIV_CLK_O), .Y(n15) );
  AO22X1M U11 ( .A0(bit_count[1]), .A1(n2), .B0(N24), .B1(n14), .Y(n25) );
  AO22X1M U12 ( .A0(bit_count[2]), .A1(n2), .B0(N25), .B1(n14), .Y(n24) );
  AO22X1M U13 ( .A0(bit_count[3]), .A1(n2), .B0(N26), .B1(n14), .Y(n23) );
  AO22X1M U14 ( .A0(bit_count[4]), .A1(n2), .B0(N27), .B1(n14), .Y(n22) );
  AO22X1M U15 ( .A0(bit_count[5]), .A1(n2), .B0(N28), .B1(n14), .Y(n21) );
  AO22X1M U16 ( .A0(bit_count[6]), .A1(n2), .B0(N29), .B1(n14), .Y(n20) );
  AO22X1M U17 ( .A0(bit_count[7]), .A1(n2), .B0(N30), .B1(n14), .Y(n19) );
  AO22X1M U18 ( .A0(bit_count[0]), .A1(n2), .B0(N23), .B1(n14), .Y(n26) );
  INVX2M U19 ( .A(bit_count[0]), .Y(n35) );
  INVX2M U20 ( .A(DIV_CLK_O), .Y(n48) );
  OR2X2M U21 ( .A(DIV_RATIO[2]), .B(DIV_RATIO[1]), .Y(n3) );
  BUFX2M U22 ( .A(n13), .Y(n2) );
  OAI2BB1X2M U23 ( .A0N(n16), .A1N(n17), .B0(CLK_EN), .Y(n13) );
  NOR3X2M U24 ( .A(DIV_RATIO[1]), .B(DIV_RATIO[3]), .C(DIV_RATIO[2]), .Y(n16)
         );
  NOR4X1M U25 ( .A(DIV_RATIO[7]), .B(DIV_RATIO[6]), .C(DIV_RATIO[5]), .D(
        DIV_RATIO[4]), .Y(n17) );
  AOI21BX2M U26 ( .A0(DIV_RATIO[1]), .A1(DIV_RATIO[2]), .B0N(n3), .Y(n1) );
  CLKINVX1M U27 ( .A(DIV_RATIO[1]), .Y(N8) );
  OR2X1M U28 ( .A(n3), .B(DIV_RATIO[3]), .Y(n4) );
  OAI2BB1X1M U29 ( .A0N(n3), .A1N(DIV_RATIO[3]), .B0(n4), .Y(N10) );
  OR2X1M U30 ( .A(n4), .B(DIV_RATIO[4]), .Y(n5) );
  OAI2BB1X1M U31 ( .A0N(n4), .A1N(DIV_RATIO[4]), .B0(n5), .Y(N11) );
  OR2X1M U32 ( .A(n5), .B(DIV_RATIO[5]), .Y(n6) );
  OAI2BB1X1M U33 ( .A0N(n5), .A1N(DIV_RATIO[5]), .B0(n6), .Y(N12) );
  XNOR2X1M U34 ( .A(DIV_RATIO[6]), .B(n6), .Y(N13) );
  NOR3X1M U35 ( .A(DIV_RATIO[6]), .B(DIV_RATIO[7]), .C(n6), .Y(N15) );
  OAI21X1M U36 ( .A0(DIV_RATIO[6]), .A1(n6), .B0(DIV_RATIO[7]), .Y(n7) );
  NAND2BX1M U37 ( .AN(N15), .B(n7), .Y(N14) );
  XNOR2X1M U38 ( .A(N10), .B(bit_count[2]), .Y(n34) );
  NOR2X1M U39 ( .A(n35), .B(N8), .Y(n8) );
  OAI22X1M U40 ( .A0(bit_count[1]), .A1(n8), .B0(n8), .B1(n1), .Y(n33) );
  CLKNAND2X2M U41 ( .A(N8), .B(n35), .Y(n9) );
  AOI22X1M U42 ( .A0(n9), .A1(n1), .B0(n9), .B1(bit_count[1]), .Y(n10) );
  NOR3X1M U43 ( .A(n10), .B(N15), .C(bit_count[7]), .Y(n32) );
  CLKXOR2X2M U44 ( .A(N11), .B(bit_count[3]), .Y(n30) );
  CLKXOR2X2M U45 ( .A(N12), .B(bit_count[4]), .Y(n29) );
  CLKXOR2X2M U46 ( .A(N13), .B(bit_count[5]), .Y(n28) );
  CLKXOR2X2M U47 ( .A(N14), .B(bit_count[6]), .Y(n27) );
  NOR4X1M U48 ( .A(n30), .B(n29), .C(n28), .D(n27), .Y(n31) );
  AND4X1M U49 ( .A(n34), .B(n33), .C(n32), .D(n31), .Y(N16) );
  NOR2BX1M U50 ( .AN(bit_count[0]), .B(DIV_RATIO[1]), .Y(n36) );
  OAI2B2X1M U51 ( .A1N(DIV_RATIO[2]), .A0(n36), .B0(bit_count[1]), .B1(n36), 
        .Y(n40) );
  XNOR2X1M U52 ( .A(DIV_RATIO[3]), .B(bit_count[2]), .Y(n39) );
  NOR2BX1M U53 ( .AN(DIV_RATIO[1]), .B(bit_count[0]), .Y(n37) );
  OAI2B2X1M U54 ( .A1N(bit_count[1]), .A0(n37), .B0(DIV_RATIO[2]), .B1(n37), 
        .Y(n38) );
  NAND4BX1M U55 ( .AN(bit_count[7]), .B(n40), .C(n39), .D(n38), .Y(n46) );
  XNOR2X1M U56 ( .A(DIV_RATIO[7]), .B(bit_count[6]), .Y(n44) );
  XNOR2X1M U57 ( .A(DIV_RATIO[6]), .B(bit_count[5]), .Y(n43) );
  XNOR2X1M U58 ( .A(DIV_RATIO[5]), .B(bit_count[4]), .Y(n42) );
  XNOR2X1M U59 ( .A(DIV_RATIO[4]), .B(bit_count[3]), .Y(n41) );
  NAND4X1M U60 ( .A(n44), .B(n43), .C(n42), .D(n41), .Y(n45) );
  NOR2X1M U61 ( .A(n46), .B(n45), .Y(N19) );
endmodule


module CLKDIV_MUX ( IN, OUT );
  input [5:0] IN;
  output [7:0] OUT;
  wire   n5, n6, n7, n8, n9, n14, n15, n16, n17;

  INVX2M U3 ( .A(1'b1), .Y(OUT[4]) );
  INVX2M U5 ( .A(1'b1), .Y(OUT[5]) );
  INVX2M U7 ( .A(1'b1), .Y(OUT[6]) );
  INVX2M U9 ( .A(1'b1), .Y(OUT[7]) );
  NOR3X2M U11 ( .A(n7), .B(IN[1]), .C(IN[0]), .Y(OUT[1]) );
  NAND4BX1M U12 ( .AN(IN[4]), .B(IN[3]), .C(n15), .D(n14), .Y(n6) );
  NAND4BX1M U13 ( .AN(IN[3]), .B(IN[4]), .C(n15), .D(n14), .Y(n7) );
  NOR3X2M U14 ( .A(n6), .B(IN[1]), .C(IN[0]), .Y(OUT[2]) );
  NOR4X1M U15 ( .A(n5), .B(IN[3]), .C(IN[5]), .D(IN[4]), .Y(OUT[3]) );
  NAND3X2M U16 ( .A(n17), .B(n16), .C(IN[2]), .Y(n5) );
  OAI211X2M U17 ( .A0(n8), .A1(n9), .B0(n17), .C0(n16), .Y(OUT[0]) );
  NAND2X2M U18 ( .A(n7), .B(n6), .Y(n9) );
  NOR4X1M U19 ( .A(IN[5]), .B(IN[4]), .C(IN[3]), .D(n15), .Y(n8) );
  INVX2M U20 ( .A(IN[0]), .Y(n17) );
  INVX2M U21 ( .A(IN[2]), .Y(n15) );
  INVX2M U22 ( .A(IN[1]), .Y(n16) );
  INVX2M U23 ( .A(IN[5]), .Y(n14) );
endmodule


module CLKDIV_RATIO_WIDTH8_1_DW01_inc_0 ( A, SUM );
  input [7:0] A;
  output [7:0] SUM;

  wire   [7:2] carry;

  ADDHX1M U1_1_6 ( .A(A[6]), .B(carry[6]), .CO(carry[7]), .S(SUM[6]) );
  ADDHX1M U1_1_5 ( .A(A[5]), .B(carry[5]), .CO(carry[6]), .S(SUM[5]) );
  ADDHX1M U1_1_4 ( .A(A[4]), .B(carry[4]), .CO(carry[5]), .S(SUM[4]) );
  ADDHX1M U1_1_3 ( .A(A[3]), .B(carry[3]), .CO(carry[4]), .S(SUM[3]) );
  ADDHX1M U1_1_2 ( .A(A[2]), .B(carry[2]), .CO(carry[3]), .S(SUM[2]) );
  ADDHX1M U1_1_1 ( .A(A[1]), .B(A[0]), .CO(carry[2]), .S(SUM[1]) );
  CLKXOR2X2M U1 ( .A(carry[7]), .B(A[7]), .Y(SUM[7]) );
  CLKINVX1M U2 ( .A(A[0]), .Y(SUM[0]) );
endmodule


module CLKDIV_RATIO_WIDTH8_1 ( CLK, RST, CLK_EN, DIV_RATIO, DIV_CLK );
  input [7:0] DIV_RATIO;
  input CLK, RST, CLK_EN;
  output DIV_CLK;
  wire   N0, DIV_CLK_O, N8, N10, N11, N12, N13, N14, N15, N16, N19, N23, N24,
         N25, N26, N27, N28, N29, N30, n1, n2, n3, n4, n5, n6, n7, n8, n9, n10,
         n27, n28, n29, n30, n31, n32, n33, n34, n35, n36, n37, n38, n39, n40,
         n41, n42, n43, n44, n45, n46, n47, n48, n49, n50, n51, n52, n53, n54,
         n55, n56, n57, n58, n59, n60, n61, n62, n63, n64;
  wire   [7:0] bit_count;

  CLKDIV_RATIO_WIDTH8_1_DW01_inc_0 add_47 ( .A(bit_count), .SUM({N30, N29, N28, 
        N27, N26, N25, N24, N23}) );
  DFFRQX2M \bit_count_reg[7]  ( .D(n56), .CK(CLK), .RN(RST), .Q(bit_count[7])
         );
  DFFRQX2M DIV_CLK_O_reg ( .D(n57), .CK(CLK), .RN(RST), .Q(DIV_CLK_O) );
  DFFRQX2M \bit_count_reg[2]  ( .D(n51), .CK(CLK), .RN(RST), .Q(bit_count[2])
         );
  DFFRQX2M \bit_count_reg[1]  ( .D(n50), .CK(CLK), .RN(RST), .Q(bit_count[1])
         );
  DFFRQX2M \bit_count_reg[0]  ( .D(n49), .CK(CLK), .RN(RST), .Q(bit_count[0])
         );
  DFFRQX2M \bit_count_reg[6]  ( .D(n55), .CK(CLK), .RN(RST), .Q(bit_count[6])
         );
  DFFRQX2M \bit_count_reg[5]  ( .D(n54), .CK(CLK), .RN(RST), .Q(bit_count[5])
         );
  DFFRQX2M \bit_count_reg[4]  ( .D(n53), .CK(CLK), .RN(RST), .Q(bit_count[4])
         );
  DFFRQX2M \bit_count_reg[3]  ( .D(n52), .CK(CLK), .RN(RST), .Q(bit_count[3])
         );
  AOI2BB2XLM U3 ( .B0(n48), .B1(N16), .A0N(n60), .A1N(n48), .Y(n63) );
  MX2X2M U4 ( .A(CLK), .B(DIV_CLK_O), .S0(N0), .Y(DIV_CLK) );
  XNOR2X2M U5 ( .A(n47), .B(n64), .Y(n57) );
  NOR2X2M U6 ( .A(n63), .B(n2), .Y(n64) );
  NOR2BX2M U7 ( .AN(n63), .B(n2), .Y(n61) );
  OR2X2M U8 ( .A(DIV_RATIO[2]), .B(DIV_RATIO[1]), .Y(n3) );
  AOI21BX2M U9 ( .A0(DIV_RATIO[1]), .A1(DIV_RATIO[2]), .B0N(n3), .Y(n1) );
  INVX2M U10 ( .A(n2), .Y(N0) );
  INVX2M U11 ( .A(DIV_RATIO[0]), .Y(n48) );
  AOI22X1M U12 ( .A0(N19), .A1(n47), .B0(N16), .B1(DIV_CLK_O), .Y(n60) );
  AO22X1M U13 ( .A0(bit_count[1]), .A1(n2), .B0(N24), .B1(n61), .Y(n50) );
  AO22X1M U14 ( .A0(bit_count[2]), .A1(n2), .B0(N25), .B1(n61), .Y(n51) );
  AO22X1M U15 ( .A0(bit_count[3]), .A1(n2), .B0(N26), .B1(n61), .Y(n52) );
  AO22X1M U16 ( .A0(bit_count[4]), .A1(n2), .B0(N27), .B1(n61), .Y(n53) );
  AO22X1M U17 ( .A0(bit_count[5]), .A1(n2), .B0(N28), .B1(n61), .Y(n54) );
  AO22X1M U18 ( .A0(bit_count[6]), .A1(n2), .B0(N29), .B1(n61), .Y(n55) );
  AO22X1M U19 ( .A0(bit_count[7]), .A1(n2), .B0(N30), .B1(n61), .Y(n56) );
  AO22X1M U20 ( .A0(bit_count[0]), .A1(n2), .B0(N23), .B1(n61), .Y(n49) );
  INVX2M U21 ( .A(bit_count[0]), .Y(n35) );
  INVX2M U22 ( .A(DIV_CLK_O), .Y(n47) );
  BUFX2M U23 ( .A(n62), .Y(n2) );
  OAI2BB1X2M U24 ( .A0N(n59), .A1N(n58), .B0(CLK_EN), .Y(n62) );
  NOR4X1M U25 ( .A(DIV_RATIO[7]), .B(DIV_RATIO[6]), .C(DIV_RATIO[5]), .D(
        DIV_RATIO[4]), .Y(n58) );
  NOR3X2M U26 ( .A(DIV_RATIO[1]), .B(DIV_RATIO[3]), .C(DIV_RATIO[2]), .Y(n59)
         );
  CLKINVX1M U27 ( .A(DIV_RATIO[1]), .Y(N8) );
  OR2X1M U28 ( .A(n3), .B(DIV_RATIO[3]), .Y(n4) );
  OAI2BB1X1M U29 ( .A0N(n3), .A1N(DIV_RATIO[3]), .B0(n4), .Y(N10) );
  OR2X1M U30 ( .A(n4), .B(DIV_RATIO[4]), .Y(n5) );
  OAI2BB1X1M U31 ( .A0N(n4), .A1N(DIV_RATIO[4]), .B0(n5), .Y(N11) );
  OR2X1M U32 ( .A(n5), .B(DIV_RATIO[5]), .Y(n6) );
  OAI2BB1X1M U33 ( .A0N(n5), .A1N(DIV_RATIO[5]), .B0(n6), .Y(N12) );
  XNOR2X1M U34 ( .A(DIV_RATIO[6]), .B(n6), .Y(N13) );
  NOR3X1M U35 ( .A(DIV_RATIO[6]), .B(DIV_RATIO[7]), .C(n6), .Y(N15) );
  OAI21X1M U36 ( .A0(DIV_RATIO[6]), .A1(n6), .B0(DIV_RATIO[7]), .Y(n7) );
  NAND2BX1M U37 ( .AN(N15), .B(n7), .Y(N14) );
  XNOR2X1M U38 ( .A(N10), .B(bit_count[2]), .Y(n34) );
  NOR2X1M U39 ( .A(n35), .B(N8), .Y(n8) );
  OAI22X1M U40 ( .A0(bit_count[1]), .A1(n8), .B0(n8), .B1(n1), .Y(n33) );
  CLKNAND2X2M U41 ( .A(N8), .B(n35), .Y(n9) );
  AOI22X1M U42 ( .A0(n9), .A1(n1), .B0(n9), .B1(bit_count[1]), .Y(n10) );
  NOR3X1M U43 ( .A(n10), .B(N15), .C(bit_count[7]), .Y(n32) );
  CLKXOR2X2M U44 ( .A(N11), .B(bit_count[3]), .Y(n30) );
  CLKXOR2X2M U45 ( .A(N12), .B(bit_count[4]), .Y(n29) );
  CLKXOR2X2M U46 ( .A(N13), .B(bit_count[5]), .Y(n28) );
  CLKXOR2X2M U47 ( .A(N14), .B(bit_count[6]), .Y(n27) );
  NOR4X1M U48 ( .A(n30), .B(n29), .C(n28), .D(n27), .Y(n31) );
  AND4X1M U49 ( .A(n34), .B(n33), .C(n32), .D(n31), .Y(N16) );
  NOR2BX1M U50 ( .AN(bit_count[0]), .B(DIV_RATIO[1]), .Y(n36) );
  OAI2B2X1M U51 ( .A1N(DIV_RATIO[2]), .A0(n36), .B0(bit_count[1]), .B1(n36), 
        .Y(n40) );
  XNOR2X1M U52 ( .A(DIV_RATIO[3]), .B(bit_count[2]), .Y(n39) );
  NOR2BX1M U53 ( .AN(DIV_RATIO[1]), .B(bit_count[0]), .Y(n37) );
  OAI2B2X1M U54 ( .A1N(bit_count[1]), .A0(n37), .B0(DIV_RATIO[2]), .B1(n37), 
        .Y(n38) );
  NAND4BX1M U55 ( .AN(bit_count[7]), .B(n40), .C(n39), .D(n38), .Y(n46) );
  XNOR2X1M U56 ( .A(DIV_RATIO[7]), .B(bit_count[6]), .Y(n44) );
  XNOR2X1M U57 ( .A(DIV_RATIO[6]), .B(bit_count[5]), .Y(n43) );
  XNOR2X1M U58 ( .A(DIV_RATIO[5]), .B(bit_count[4]), .Y(n42) );
  XNOR2X1M U59 ( .A(DIV_RATIO[4]), .B(bit_count[3]), .Y(n41) );
  NAND4X1M U60 ( .A(n44), .B(n43), .C(n42), .D(n41), .Y(n45) );
  NOR2X1M U61 ( .A(n46), .B(n45), .Y(N19) );
endmodule


module UART_TX_FSM ( CLK, RST, DATA_VALID, PAR_EN, SER_DONE, SER_EN, MUX_SEL, 
        BUSY );
  output [1:0] MUX_SEL;
  input CLK, RST, DATA_VALID, PAR_EN, SER_DONE;
  output SER_EN, BUSY;
  wire   busy_reg, n4, n5, n6, n7, n8, n1, n2;
  wire   [2:0] cs;
  wire   [2:0] ns;

  DFFRQX2M \cs_reg[0]  ( .D(ns[0]), .CK(CLK), .RN(RST), .Q(cs[0]) );
  DFFRQX2M \cs_reg[1]  ( .D(ns[1]), .CK(CLK), .RN(RST), .Q(cs[1]) );
  DFFRQX2M \cs_reg[2]  ( .D(ns[2]), .CK(CLK), .RN(RST), .Q(cs[2]) );
  DFFRQX2M BUSY_reg ( .D(busy_reg), .CK(CLK), .RN(RST), .Q(BUSY) );
  NAND2X2M U3 ( .A(n5), .B(MUX_SEL[1]), .Y(n6) );
  INVX2M U4 ( .A(n8), .Y(MUX_SEL[0]) );
  OAI22X1M U5 ( .A0(SER_DONE), .A1(MUX_SEL[0]), .B0(cs[1]), .B1(n7), .Y(ns[0])
         );
  AOI2B1X1M U6 ( .A1N(cs[2]), .A0(DATA_VALID), .B0(n8), .Y(n7) );
  XNOR2X2M U7 ( .A(cs[0]), .B(cs[1]), .Y(n5) );
  NOR2X2M U8 ( .A(n2), .B(cs[2]), .Y(MUX_SEL[1]) );
  NOR2X2M U9 ( .A(SER_DONE), .B(n6), .Y(SER_EN) );
  INVX2M U10 ( .A(cs[1]), .Y(n2) );
  NOR2X2M U11 ( .A(n1), .B(cs[2]), .Y(n8) );
  OAI21X2M U12 ( .A0(cs[2]), .A1(n5), .B0(n6), .Y(ns[1]) );
  OAI21X2M U13 ( .A0(cs[0]), .A1(n2), .B0(MUX_SEL[0]), .Y(busy_reg) );
  NOR2BX2M U14 ( .AN(MUX_SEL[1]), .B(n4), .Y(ns[2]) );
  AOI2B1X1M U15 ( .A1N(PAR_EN), .A0(SER_DONE), .B0(n1), .Y(n4) );
  INVX2M U16 ( .A(cs[0]), .Y(n1) );
endmodule


module UART_TX_SERIALIZER ( CLK, RST, P_DATA, DATA_VALID, SER_EN, SER_OUT, 
        SER_DONE );
  input [7:0] P_DATA;
  input CLK, RST, DATA_VALID, SER_EN;
  output SER_OUT, SER_DONE;
  wire   busy, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16, n17, n18,
         n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30, n1, n2,
         n3, n4, n5, n31;
  wire   [7:1] shift_reg;
  wire   [2:0] bit_count;

  DFFRQX2M \shift_reg_reg[6]  ( .D(n23), .CK(CLK), .RN(RST), .Q(shift_reg[6])
         );
  DFFRQX2M \shift_reg_reg[5]  ( .D(n24), .CK(CLK), .RN(RST), .Q(shift_reg[5])
         );
  DFFRQX2M \shift_reg_reg[4]  ( .D(n25), .CK(CLK), .RN(RST), .Q(shift_reg[4])
         );
  DFFRQX2M \shift_reg_reg[3]  ( .D(n26), .CK(CLK), .RN(RST), .Q(shift_reg[3])
         );
  DFFRQX2M \shift_reg_reg[2]  ( .D(n27), .CK(CLK), .RN(RST), .Q(shift_reg[2])
         );
  DFFRQX2M \shift_reg_reg[1]  ( .D(n28), .CK(CLK), .RN(RST), .Q(shift_reg[1])
         );
  DFFRQX2M \shift_reg_reg[0]  ( .D(n29), .CK(CLK), .RN(RST), .Q(SER_OUT) );
  DFFRQX2M \shift_reg_reg[7]  ( .D(n22), .CK(CLK), .RN(RST), .Q(shift_reg[7])
         );
  DFFRQX2M busy_reg ( .D(n30), .CK(CLK), .RN(RST), .Q(busy) );
  DFFRQX2M \bit_count_reg[2]  ( .D(n21), .CK(CLK), .RN(RST), .Q(bit_count[2])
         );
  DFFRQX2M \bit_count_reg[1]  ( .D(n19), .CK(CLK), .RN(RST), .Q(bit_count[1])
         );
  DFFRQX2M \bit_count_reg[0]  ( .D(n20), .CK(CLK), .RN(RST), .Q(bit_count[0])
         );
  NOR2X2M U3 ( .A(n2), .B(n1), .Y(n11) );
  NOR2X2M U4 ( .A(n9), .B(n31), .Y(SER_DONE) );
  INVX2M U5 ( .A(n6), .Y(n2) );
  INVX2M U6 ( .A(n9), .Y(n4) );
  OAI32X1M U7 ( .A0(n3), .A1(bit_count[1]), .A2(n6), .B0(n7), .B1(n5), .Y(n19)
         );
  INVX2M U8 ( .A(bit_count[1]), .Y(n5) );
  AOI21X2M U9 ( .A0(n2), .A1(n3), .B0(n1), .Y(n7) );
  INVX2M U10 ( .A(bit_count[0]), .Y(n3) );
  OAI32X1M U11 ( .A0(n9), .A1(bit_count[2]), .A2(n6), .B0(n10), .B1(n31), .Y(
        n21) );
  AOI2BB1X2M U12 ( .A0N(n11), .A1N(n4), .B0(n1), .Y(n10) );
  OAI2BB2X1M U13 ( .B0(bit_count[0]), .B1(n6), .A0N(bit_count[0]), .A1N(n1), 
        .Y(n20) );
  AOI2BB2XLM U14 ( .B0(bit_count[2]), .B1(n4), .A0N(busy), .A1N(DATA_VALID), 
        .Y(n30) );
  BUFX2M U15 ( .A(n8), .Y(n1) );
  NOR2BX2M U16 ( .AN(DATA_VALID), .B(busy), .Y(n8) );
  OAI2BB1X2M U17 ( .A0N(SER_OUT), .A1N(n11), .B0(n18), .Y(n29) );
  AOI22X1M U18 ( .A0(shift_reg[1]), .A1(n2), .B0(P_DATA[0]), .B1(n1), .Y(n18)
         );
  OAI2BB1X2M U19 ( .A0N(n11), .A1N(shift_reg[1]), .B0(n17), .Y(n28) );
  AOI22X1M U20 ( .A0(shift_reg[2]), .A1(n2), .B0(P_DATA[1]), .B1(n1), .Y(n17)
         );
  OAI2BB1X2M U21 ( .A0N(n11), .A1N(shift_reg[2]), .B0(n16), .Y(n27) );
  AOI22X1M U22 ( .A0(shift_reg[3]), .A1(n2), .B0(P_DATA[2]), .B1(n1), .Y(n16)
         );
  OAI2BB1X2M U23 ( .A0N(n11), .A1N(shift_reg[3]), .B0(n15), .Y(n26) );
  AOI22X1M U24 ( .A0(shift_reg[4]), .A1(n2), .B0(P_DATA[3]), .B1(n1), .Y(n15)
         );
  OAI2BB1X2M U25 ( .A0N(n11), .A1N(shift_reg[4]), .B0(n14), .Y(n25) );
  AOI22X1M U26 ( .A0(shift_reg[5]), .A1(n2), .B0(P_DATA[4]), .B1(n1), .Y(n14)
         );
  OAI2BB1X2M U27 ( .A0N(n11), .A1N(shift_reg[5]), .B0(n13), .Y(n24) );
  AOI22X1M U28 ( .A0(shift_reg[6]), .A1(n2), .B0(P_DATA[5]), .B1(n1), .Y(n13)
         );
  OAI2BB1X2M U29 ( .A0N(n11), .A1N(shift_reg[6]), .B0(n12), .Y(n23) );
  AOI22X1M U30 ( .A0(shift_reg[7]), .A1(n2), .B0(P_DATA[6]), .B1(n1), .Y(n12)
         );
  AO22X1M U31 ( .A0(n11), .A1(shift_reg[7]), .B0(P_DATA[7]), .B1(n1), .Y(n22)
         );
  NAND2X2M U32 ( .A(busy), .B(SER_EN), .Y(n6) );
  NAND2X2M U33 ( .A(bit_count[1]), .B(bit_count[0]), .Y(n9) );
  INVX2M U34 ( .A(bit_count[2]), .Y(n31) );
endmodule


module UART_TX_MUX ( CLK, RST, SEL, IN0, IN1, IN2, IN3, TX_OUT );
  input [1:0] SEL;
  input CLK, RST, IN0, IN1, IN2, IN3;
  output TX_OUT;
  wire   N13, n2, n3, n1;

  DFFRHQX8M TX_OUT_reg ( .D(N13), .CK(CLK), .RN(RST), .Q(TX_OUT) );
  OAI2B2X1M U3 ( .A1N(SEL[1]), .A0(n2), .B0(SEL[1]), .B1(n3), .Y(N13) );
  AOI22X1M U4 ( .A0(IN0), .A1(n1), .B0(SEL[0]), .B1(IN1), .Y(n3) );
  AOI22X1M U5 ( .A0(IN2), .A1(n1), .B0(IN3), .B1(SEL[0]), .Y(n2) );
  INVX2M U6 ( .A(SEL[0]), .Y(n1) );
endmodule


module UART_TX_PARITY_CALC ( CLK, RST, PAR_EN, PAR_TYP, P_DATA, BUSY, 
        DATA_VALID, PAR_BIT );
  input [7:0] P_DATA;
  input CLK, RST, PAR_EN, PAR_TYP, BUSY, DATA_VALID;
  output PAR_BIT;
  wire   n1, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16, n2
;
  wire   [7:0] DATA_V;

  DFFRQX2M \DATA_V_reg[1]  ( .D(n10), .CK(CLK), .RN(RST), .Q(DATA_V[1]) );
  DFFRQX2M \DATA_V_reg[0]  ( .D(n9), .CK(CLK), .RN(RST), .Q(DATA_V[0]) );
  DFFRQX2M \DATA_V_reg[2]  ( .D(n11), .CK(CLK), .RN(RST), .Q(DATA_V[2]) );
  DFFRQX2M PAR_BIT_reg ( .D(n8), .CK(CLK), .RN(RST), .Q(PAR_BIT) );
  DFFRQX2M \DATA_V_reg[3]  ( .D(n12), .CK(CLK), .RN(RST), .Q(DATA_V[3]) );
  DFFRQX2M \DATA_V_reg[5]  ( .D(n14), .CK(CLK), .RN(RST), .Q(DATA_V[5]) );
  DFFRQX2M \DATA_V_reg[4]  ( .D(n13), .CK(CLK), .RN(RST), .Q(DATA_V[4]) );
  DFFRQX2M \DATA_V_reg[6]  ( .D(n15), .CK(CLK), .RN(RST), .Q(DATA_V[6]) );
  DFFRQX2M \DATA_V_reg[7]  ( .D(n16), .CK(CLK), .RN(RST), .Q(DATA_V[7]) );
  NOR2BX2M U2 ( .AN(DATA_VALID), .B(BUSY), .Y(n7) );
  AO2B2X2M U3 ( .B0(P_DATA[0]), .B1(n7), .A0(DATA_V[0]), .A1N(n7), .Y(n9) );
  AO2B2X2M U4 ( .B0(P_DATA[1]), .B1(n7), .A0(DATA_V[1]), .A1N(n7), .Y(n10) );
  AO2B2X2M U5 ( .B0(P_DATA[2]), .B1(n7), .A0(DATA_V[2]), .A1N(n7), .Y(n11) );
  AO2B2X2M U6 ( .B0(P_DATA[3]), .B1(n7), .A0(DATA_V[3]), .A1N(n7), .Y(n12) );
  AO2B2X2M U7 ( .B0(P_DATA[4]), .B1(n7), .A0(DATA_V[4]), .A1N(n7), .Y(n13) );
  AO2B2X2M U8 ( .B0(P_DATA[5]), .B1(n7), .A0(DATA_V[5]), .A1N(n7), .Y(n14) );
  AO2B2X2M U9 ( .B0(P_DATA[6]), .B1(n7), .A0(DATA_V[6]), .A1N(n7), .Y(n15) );
  AO2B2X2M U10 ( .B0(P_DATA[7]), .B1(n7), .A0(DATA_V[7]), .A1N(n7), .Y(n16) );
  OAI2BB2X1M U11 ( .B0(n1), .B1(n2), .A0N(PAR_BIT), .A1N(n2), .Y(n8) );
  INVX2M U12 ( .A(PAR_EN), .Y(n2) );
  XOR3XLM U13 ( .A(n3), .B(PAR_TYP), .C(n4), .Y(n1) );
  XOR3XLM U14 ( .A(DATA_V[1]), .B(DATA_V[0]), .C(n5), .Y(n4) );
  XOR3XLM U15 ( .A(DATA_V[5]), .B(DATA_V[4]), .C(n6), .Y(n3) );
  CLKXOR2X2M U16 ( .A(DATA_V[7]), .B(DATA_V[6]), .Y(n6) );
  XNOR2X2M U17 ( .A(DATA_V[2]), .B(DATA_V[3]), .Y(n5) );
endmodule


module UART_TX ( CLK, RST, P_DATA, DATA_VALID, PAR_EN, PAR_TYP, TX_OUT, BUSY
 );
  input [7:0] P_DATA;
  input CLK, RST, DATA_VALID, PAR_EN, PAR_TYP;
  output TX_OUT, BUSY;
  wire   SER_DONE_wr, SER_EN_wr, SER_OUT_wr, PAR_BIT_Wr, n1, n2;
  wire   [1:0] MUX_SEL_wr;

  UART_TX_FSM U0_FSM ( .CLK(CLK), .RST(n1), .DATA_VALID(DATA_VALID), .PAR_EN(
        PAR_EN), .SER_DONE(SER_DONE_wr), .SER_EN(SER_EN_wr), .MUX_SEL(
        MUX_SEL_wr), .BUSY(BUSY) );
  UART_TX_SERIALIZER U0_SERIALIZER ( .CLK(CLK), .RST(n1), .P_DATA(P_DATA), 
        .DATA_VALID(DATA_VALID), .SER_EN(SER_EN_wr), .SER_OUT(SER_OUT_wr), 
        .SER_DONE(SER_DONE_wr) );
  UART_TX_MUX U0_MUX ( .CLK(CLK), .RST(n1), .SEL(MUX_SEL_wr), .IN0(1'b0), 
        .IN1(1'b1), .IN2(SER_OUT_wr), .IN3(PAR_BIT_Wr), .TX_OUT(TX_OUT) );
  UART_TX_PARITY_CALC U0_PARITY_CALC ( .CLK(CLK), .RST(n1), .PAR_EN(PAR_EN), 
        .PAR_TYP(PAR_TYP), .P_DATA(P_DATA), .BUSY(BUSY), .DATA_VALID(
        DATA_VALID), .PAR_BIT(PAR_BIT_Wr) );
  INVX2M U3 ( .A(n2), .Y(n1) );
  INVX2M U4 ( .A(RST), .Y(n2) );
endmodule


module UART_RX_FSM ( CLK, RST, RX_IN, PAR_EN, PRESCALE, BIT_CNT, EDG_CNT, 
        PAR_ERR, STRT_ERR, STP_ERR, EDG_BIT_CNT_EN, DAT_SAMP_EN, STRT_CHK_EN, 
        DESER_EN, PAR_CHK_EN, STP_CHK_EN, DATA_VALID );
  input [5:0] PRESCALE;
  input [3:0] BIT_CNT;
  input [4:0] EDG_CNT;
  input CLK, RST, RX_IN, PAR_EN, PAR_ERR, STRT_ERR, STP_ERR;
  output EDG_BIT_CNT_EN, DAT_SAMP_EN, STRT_CHK_EN, DESER_EN, PAR_CHK_EN,
         STP_CHK_EN, DATA_VALID;
  wire   N44, N45, N46, N47, N48, N49, N50, n13, n14, n15, n16, n17, n18, n19,
         n20, n21, n22, n23, n24, n25, n26, n27, n28, n2, n3, n4, n5, n6, n7,
         n8, n9, n10, n11, n12, n29, n30, n31, n32, n33, n34, n35, n36, n37;
  wire   [2:0] cs;
  wire   [2:0] ns;

  DFFRQX2M \cs_reg[1]  ( .D(ns[1]), .CK(CLK), .RN(RST), .Q(cs[1]) );
  DFFRQX2M \cs_reg[2]  ( .D(ns[2]), .CK(CLK), .RN(RST), .Q(cs[2]) );
  DFFRQX2M \cs_reg[0]  ( .D(ns[0]), .CK(CLK), .RN(RST), .Q(cs[0]) );
  INVX2M U3 ( .A(RX_IN), .Y(n37) );
  INVX2M U4 ( .A(N50), .Y(n31) );
  NAND3X2M U5 ( .A(n32), .B(n33), .C(n17), .Y(n18) );
  NOR2X2M U6 ( .A(n36), .B(n16), .Y(STP_CHK_EN) );
  OAI21X2M U7 ( .A0(cs[2]), .A1(n28), .B0(n16), .Y(EDG_BIT_CNT_EN) );
  NOR2X2M U8 ( .A(n37), .B(cs[0]), .Y(n28) );
  OAI211X2M U9 ( .A0(n34), .A1(n15), .B0(n22), .C0(n23), .Y(ns[0]) );
  AOI22X1M U10 ( .A0(DESER_EN), .A1(n18), .B0(DATA_VALID), .B1(n37), .Y(n23)
         );
  AOI33X2M U11 ( .A0(n17), .A1(n24), .A2(STP_CHK_EN), .B0(n35), .B1(n36), .B2(
        n25), .Y(n22) );
  CLKXOR2X2M U12 ( .A(BIT_CNT[1]), .B(BIT_CNT[0]), .Y(n24) );
  OAI22X1M U13 ( .A0(cs[0]), .A1(RX_IN), .B0(n26), .B1(n34), .Y(n25) );
  NOR4X1M U14 ( .A(n27), .B(BIT_CNT[1]), .C(BIT_CNT[3]), .D(BIT_CNT[2]), .Y(
        n26) );
  NAND3X2M U15 ( .A(N50), .B(n32), .C(STRT_ERR), .Y(n27) );
  NOR3X2M U16 ( .A(n28), .B(cs[2]), .C(cs[1]), .Y(STRT_CHK_EN) );
  NOR3BX2M U17 ( .AN(BIT_CNT[3]), .B(BIT_CNT[2]), .C(n31), .Y(n17) );
  NAND4BBX1M U18 ( .AN(n13), .BN(STP_CHK_EN), .C(n14), .D(n15), .Y(ns[2]) );
  NAND4BX1M U19 ( .AN(n16), .B(BIT_CNT[0]), .C(n17), .D(n33), .Y(n14) );
  NOR3BX2M U20 ( .AN(DESER_EN), .B(PAR_EN), .C(n18), .Y(n13) );
  OAI21X2M U21 ( .A0(cs[2]), .A1(n19), .B0(n16), .Y(ns[1]) );
  AOI31X2M U22 ( .A0(n20), .A1(cs[0]), .A2(n21), .B0(cs[1]), .Y(n19) );
  NOR4X1M U23 ( .A(STRT_ERR), .B(BIT_CNT[3]), .C(BIT_CNT[2]), .D(BIT_CNT[1]), 
        .Y(n21) );
  NOR2X2M U24 ( .A(BIT_CNT[0]), .B(n31), .Y(n20) );
  NOR3X2M U25 ( .A(n35), .B(cs[2]), .C(n34), .Y(DESER_EN) );
  NOR3X2M U26 ( .A(n36), .B(cs[1]), .C(n34), .Y(DATA_VALID) );
  NAND2X2M U27 ( .A(cs[1]), .B(n34), .Y(n16) );
  NOR2X2M U28 ( .A(cs[2]), .B(n16), .Y(PAR_CHK_EN) );
  INVX2M U29 ( .A(cs[0]), .Y(n34) );
  INVX2M U30 ( .A(cs[2]), .Y(n36) );
  INVX2M U31 ( .A(BIT_CNT[0]), .Y(n32) );
  INVX2M U32 ( .A(BIT_CNT[1]), .Y(n33) );
  INVX2M U33 ( .A(cs[1]), .Y(n35) );
  OR4X1M U34 ( .A(n35), .B(n36), .C(STP_ERR), .D(PAR_ERR), .Y(n15) );
  OR2X2M U35 ( .A(PRESCALE[1]), .B(PRESCALE[0]), .Y(n2) );
  INVX2M U36 ( .A(PRESCALE[3]), .Y(n6) );
  BUFX2M U37 ( .A(EDG_BIT_CNT_EN), .Y(DAT_SAMP_EN) );
  CLKINVX1M U38 ( .A(PRESCALE[0]), .Y(N44) );
  OAI2BB1X1M U39 ( .A0N(PRESCALE[0]), .A1N(PRESCALE[1]), .B0(n2), .Y(N45) );
  NOR2X1M U40 ( .A(n2), .B(PRESCALE[2]), .Y(n3) );
  AO21XLM U41 ( .A0(n2), .A1(PRESCALE[2]), .B0(n3), .Y(N46) );
  CLKNAND2X2M U42 ( .A(n3), .B(n6), .Y(n4) );
  OAI21X1M U43 ( .A0(n3), .A1(n6), .B0(n4), .Y(N47) );
  XNOR2X1M U44 ( .A(PRESCALE[4]), .B(n4), .Y(N48) );
  NOR2X1M U45 ( .A(PRESCALE[4]), .B(n4), .Y(n5) );
  CLKXOR2X2M U46 ( .A(PRESCALE[5]), .B(n5), .Y(N49) );
  NOR2BX1M U47 ( .AN(N44), .B(EDG_CNT[0]), .Y(n7) );
  OAI2B2X1M U48 ( .A1N(EDG_CNT[1]), .A0(n7), .B0(N45), .B1(n7), .Y(n10) );
  NOR2BX1M U49 ( .AN(EDG_CNT[0]), .B(N44), .Y(n8) );
  OAI2B2X1M U50 ( .A1N(N45), .A0(n8), .B0(EDG_CNT[1]), .B1(n8), .Y(n9) );
  NAND3BX1M U51 ( .AN(N49), .B(n10), .C(n9), .Y(n30) );
  CLKXOR2X2M U52 ( .A(N48), .B(EDG_CNT[4]), .Y(n29) );
  CLKXOR2X2M U53 ( .A(N46), .B(EDG_CNT[2]), .Y(n12) );
  CLKXOR2X2M U54 ( .A(N47), .B(EDG_CNT[3]), .Y(n11) );
  NOR4X1M U55 ( .A(n30), .B(n29), .C(n12), .D(n11), .Y(N50) );
endmodule


module UART_RX_EDG_BIT_COUNTER ( CLK, RST, EDG_BIT_CNT_EN, PRESCALE, BIT_CNT, 
        EDG_CNT );
  input [5:0] PRESCALE;
  output [3:0] BIT_CNT;
  output [4:0] EDG_CNT;
  input CLK, RST, EDG_BIT_CNT_EN;
  wire   N7, N8, N9, N10, N11, N12, N13, N16, N17, N18, N35, N36, N37, N38,
         N39, n10, n11, n12, n13, n14, n15, n16, n17, n18, n19,
         \add_21/carry[4] , \add_21/carry[3] , \add_21/carry[2] , n1, n2, n3,
         n4, n5, n6, n7, n8, n9, n20, n21, n22, n23, n24, n25, n26, n27, n28,
         n29, n30, n31, n32;

  DFFRQX2M \BIT_CNT_reg[3]  ( .D(n16), .CK(CLK), .RN(RST), .Q(BIT_CNT[3]) );
  DFFRQX2M \BIT_CNT_reg[2]  ( .D(n17), .CK(CLK), .RN(RST), .Q(BIT_CNT[2]) );
  DFFRQX2M \BIT_CNT_reg[0]  ( .D(n19), .CK(CLK), .RN(RST), .Q(BIT_CNT[0]) );
  DFFRQX2M \EDG_CNT_reg[4]  ( .D(N39), .CK(CLK), .RN(RST), .Q(EDG_CNT[4]) );
  DFFRQX2M \EDG_CNT_reg[1]  ( .D(N36), .CK(CLK), .RN(RST), .Q(EDG_CNT[1]) );
  DFFRQX2M \EDG_CNT_reg[0]  ( .D(N35), .CK(CLK), .RN(RST), .Q(EDG_CNT[0]) );
  DFFRQX2M \EDG_CNT_reg[3]  ( .D(N38), .CK(CLK), .RN(RST), .Q(EDG_CNT[3]) );
  DFFRQX2M \EDG_CNT_reg[2]  ( .D(N37), .CK(CLK), .RN(RST), .Q(EDG_CNT[2]) );
  DFFRQX2M \BIT_CNT_reg[1]  ( .D(n18), .CK(CLK), .RN(RST), .Q(BIT_CNT[1]) );
  INVX2M U3 ( .A(n2), .Y(n26) );
  AOI21X2M U4 ( .A0(n27), .A1(EDG_BIT_CNT_EN), .B0(n26), .Y(n15) );
  INVX2M U5 ( .A(EDG_BIT_CNT_EN), .Y(n32) );
  BUFX2M U6 ( .A(n10), .Y(n2) );
  NAND2X2M U7 ( .A(N13), .B(EDG_BIT_CNT_EN), .Y(n10) );
  NOR2BX2M U8 ( .AN(N16), .B(n2), .Y(N36) );
  NOR2BX2M U9 ( .AN(N17), .B(n2), .Y(N37) );
  NOR2BX2M U10 ( .AN(N18), .B(n2), .Y(N38) );
  OAI32X1M U11 ( .A0(n32), .A1(BIT_CNT[0]), .A2(n26), .B0(n27), .B1(n2), .Y(
        n19) );
  OAI32X1M U12 ( .A0(n13), .A1(BIT_CNT[2]), .A2(n29), .B0(n14), .B1(n30), .Y(
        n17) );
  INVX2M U13 ( .A(BIT_CNT[2]), .Y(n30) );
  OA21X2M U14 ( .A0(n32), .A1(BIT_CNT[1]), .B0(n15), .Y(n14) );
  OAI22X1M U15 ( .A0(n15), .A1(n29), .B0(BIT_CNT[1]), .B1(n13), .Y(n18) );
  NAND3X2M U16 ( .A(BIT_CNT[0]), .B(n2), .C(EDG_BIT_CNT_EN), .Y(n13) );
  OAI2BB2X1M U17 ( .B0(n31), .B1(n2), .A0N(n11), .A1N(EDG_BIT_CNT_EN), .Y(n16)
         );
  OAI32X1M U18 ( .A0(BIT_CNT[3]), .A1(N13), .A2(n12), .B0(n31), .B1(n28), .Y(
        n11) );
  INVX2M U19 ( .A(BIT_CNT[3]), .Y(n31) );
  INVX2M U20 ( .A(n12), .Y(n28) );
  NOR2X2M U21 ( .A(EDG_CNT[0]), .B(n2), .Y(N35) );
  NOR2X2M U22 ( .A(n1), .B(n2), .Y(N39) );
  XNOR2X2M U23 ( .A(\add_21/carry[4] ), .B(EDG_CNT[4]), .Y(n1) );
  NAND3X2M U24 ( .A(BIT_CNT[1]), .B(BIT_CNT[0]), .C(BIT_CNT[2]), .Y(n12) );
  INVX2M U25 ( .A(BIT_CNT[1]), .Y(n29) );
  INVX2M U26 ( .A(BIT_CNT[0]), .Y(n27) );
  ADDHX1M U27 ( .A(EDG_CNT[1]), .B(EDG_CNT[0]), .CO(\add_21/carry[2] ), .S(N16) );
  ADDHX1M U28 ( .A(EDG_CNT[2]), .B(\add_21/carry[2] ), .CO(\add_21/carry[3] ), 
        .S(N17) );
  ADDHX1M U29 ( .A(EDG_CNT[3]), .B(\add_21/carry[3] ), .CO(\add_21/carry[4] ), 
        .S(N18) );
  OR2X2M U30 ( .A(PRESCALE[1]), .B(PRESCALE[0]), .Y(n3) );
  INVX2M U31 ( .A(PRESCALE[3]), .Y(n7) );
  CLKINVX1M U32 ( .A(PRESCALE[0]), .Y(N7) );
  OAI2BB1X1M U33 ( .A0N(PRESCALE[0]), .A1N(PRESCALE[1]), .B0(n3), .Y(N8) );
  NOR2X1M U34 ( .A(n3), .B(PRESCALE[2]), .Y(n4) );
  AO21XLM U35 ( .A0(n3), .A1(PRESCALE[2]), .B0(n4), .Y(N9) );
  CLKNAND2X2M U36 ( .A(n4), .B(n7), .Y(n5) );
  OAI21X1M U37 ( .A0(n4), .A1(n7), .B0(n5), .Y(N10) );
  XNOR2X1M U38 ( .A(PRESCALE[4]), .B(n5), .Y(N11) );
  NOR2X1M U39 ( .A(PRESCALE[4]), .B(n5), .Y(n6) );
  CLKXOR2X2M U40 ( .A(PRESCALE[5]), .B(n6), .Y(N12) );
  NOR2BX1M U41 ( .AN(EDG_CNT[0]), .B(N7), .Y(n8) );
  OAI2B2X1M U42 ( .A1N(N8), .A0(n8), .B0(EDG_CNT[1]), .B1(n8), .Y(n25) );
  NOR2BX1M U43 ( .AN(N7), .B(EDG_CNT[0]), .Y(n9) );
  OAI2B2X1M U44 ( .A1N(EDG_CNT[1]), .A0(n9), .B0(N8), .B1(n9), .Y(n24) );
  CLKXOR2X2M U45 ( .A(N11), .B(EDG_CNT[4]), .Y(n22) );
  CLKXOR2X2M U46 ( .A(N9), .B(EDG_CNT[2]), .Y(n21) );
  CLKXOR2X2M U47 ( .A(N10), .B(EDG_CNT[3]), .Y(n20) );
  NOR3X1M U48 ( .A(n22), .B(n21), .C(n20), .Y(n23) );
  NAND4BX1M U49 ( .AN(N12), .B(n25), .C(n24), .D(n23), .Y(N13) );
endmodule


module UART_RX_DATA_SAMPLING ( CLK, RST, RX_IN, PRESCALE, DAT_SAMP_EN, EDG_CNT, 
        SAMPLED_BIT );
  input [5:0] PRESCALE;
  input [4:0] EDG_CNT;
  input CLK, RST, RX_IN, DAT_SAMP_EN;
  output SAMPLED_BIT;
  wire   N14, N15, N16, N17, N18, N19, N20, N21, N23, N24, N25, N26, N27, N28,
         n11, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28,
         \add_27/carry[4] , \add_27/carry[3] , \add_27/carry[2] , n1, n2, n3,
         n4, n5, n6, n7, n8, n9, n10, n12, n13, n14, n15, n16, n17, n29, n30,
         n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44,
         n45;
  wire   [2:0] sample;

  DFFRQX2M \sample_reg[0]  ( .D(n26), .CK(CLK), .RN(RST), .Q(sample[0]) );
  DFFRQX2M \sample_reg[1]  ( .D(n27), .CK(CLK), .RN(RST), .Q(sample[1]) );
  DFFRX1M \sample_reg[2]  ( .D(n28), .CK(CLK), .RN(RST), .QN(n11) );
  DFFRQX2M SAMPLED_BIT_reg ( .D(n25), .CK(CLK), .RN(RST), .Q(SAMPLED_BIT) );
  INVX2M U3 ( .A(DAT_SAMP_EN), .Y(n45) );
  INVX2M U4 ( .A(n24), .Y(n43) );
  OAI32X1M U5 ( .A0(n45), .A1(N20), .A2(n41), .B0(n22), .B1(n44), .Y(n26) );
  OAI32X1M U6 ( .A0(n45), .A1(n42), .A2(n40), .B0(n22), .B1(n23), .Y(n27) );
  INVX2M U7 ( .A(n23), .Y(n42) );
  NAND2X2M U8 ( .A(N21), .B(n44), .Y(n23) );
  NAND2X2M U9 ( .A(DAT_SAMP_EN), .B(n19), .Y(n24) );
  NAND2X2M U10 ( .A(RX_IN), .B(DAT_SAMP_EN), .Y(n22) );
  INVX2M U11 ( .A(N20), .Y(n44) );
  OAI31X1M U12 ( .A0(n45), .A1(n18), .A2(n19), .B0(n20), .Y(n25) );
  AOI21X2M U13 ( .A0(sample[1]), .A1(sample[0]), .B0(n21), .Y(n18) );
  NAND2X2M U14 ( .A(SAMPLED_BIT), .B(n43), .Y(n20) );
  AOI21X2M U15 ( .A0(n40), .A1(n41), .B0(n11), .Y(n21) );
  OAI22X1M U16 ( .A0(n11), .A1(n24), .B0(n43), .B1(n22), .Y(n28) );
  NAND3BX2M U17 ( .AN(N21), .B(n44), .C(N28), .Y(n19) );
  INVX2M U18 ( .A(sample[1]), .Y(n40) );
  INVX2M U19 ( .A(sample[0]), .Y(n41) );
  OR2X2M U20 ( .A(PRESCALE[2]), .B(PRESCALE[1]), .Y(n1) );
  ADDHX1M U21 ( .A(PRESCALE[3]), .B(\add_27/carry[2] ), .CO(\add_27/carry[3] ), 
        .S(N24) );
  ADDHX1M U22 ( .A(PRESCALE[4]), .B(\add_27/carry[3] ), .CO(\add_27/carry[4] ), 
        .S(N25) );
  ADDHX1M U23 ( .A(PRESCALE[2]), .B(PRESCALE[1]), .CO(\add_27/carry[2] ), .S(
        N23) );
  ADDHX1M U24 ( .A(PRESCALE[5]), .B(\add_27/carry[4] ), .CO(N27), .S(N26) );
  CLKINVX1M U25 ( .A(PRESCALE[1]), .Y(N14) );
  OAI2BB1X1M U26 ( .A0N(PRESCALE[1]), .A1N(PRESCALE[2]), .B0(n1), .Y(N15) );
  OR2X1M U27 ( .A(n1), .B(PRESCALE[3]), .Y(n2) );
  OAI2BB1X1M U28 ( .A0N(n1), .A1N(PRESCALE[3]), .B0(n2), .Y(N16) );
  XNOR2X1M U29 ( .A(PRESCALE[4]), .B(n2), .Y(N17) );
  NOR3X1M U30 ( .A(PRESCALE[4]), .B(PRESCALE[5]), .C(n2), .Y(N19) );
  OAI21X1M U31 ( .A0(PRESCALE[4]), .A1(n2), .B0(PRESCALE[5]), .Y(n3) );
  NAND2BX1M U32 ( .AN(N19), .B(n3), .Y(N18) );
  NOR2BX1M U33 ( .AN(N14), .B(EDG_CNT[0]), .Y(n4) );
  OAI2B2X1M U34 ( .A1N(EDG_CNT[1]), .A0(n4), .B0(N15), .B1(n4), .Y(n7) );
  NOR2BX1M U35 ( .AN(EDG_CNT[0]), .B(N14), .Y(n5) );
  OAI2B2X1M U36 ( .A1N(N15), .A0(n5), .B0(EDG_CNT[1]), .B1(n5), .Y(n6) );
  NAND3BX1M U37 ( .AN(N19), .B(n7), .C(n6), .Y(n12) );
  CLKXOR2X2M U38 ( .A(N18), .B(EDG_CNT[4]), .Y(n10) );
  CLKXOR2X2M U39 ( .A(N16), .B(EDG_CNT[2]), .Y(n9) );
  CLKXOR2X2M U40 ( .A(N17), .B(EDG_CNT[3]), .Y(n8) );
  NOR4X1M U41 ( .A(n12), .B(n10), .C(n9), .D(n8), .Y(N20) );
  CLKXOR2X2M U42 ( .A(PRESCALE[3]), .B(EDG_CNT[2]), .Y(n31) );
  NOR2BX1M U43 ( .AN(PRESCALE[1]), .B(EDG_CNT[0]), .Y(n13) );
  OAI2B2X1M U44 ( .A1N(EDG_CNT[1]), .A0(n13), .B0(PRESCALE[2]), .B1(n13), .Y(
        n16) );
  NOR2BX1M U45 ( .AN(EDG_CNT[0]), .B(PRESCALE[1]), .Y(n14) );
  OAI2B2X1M U46 ( .A1N(PRESCALE[2]), .A0(n14), .B0(EDG_CNT[1]), .B1(n14), .Y(
        n15) );
  CLKNAND2X2M U47 ( .A(n16), .B(n15), .Y(n30) );
  CLKXOR2X2M U48 ( .A(PRESCALE[4]), .B(EDG_CNT[3]), .Y(n29) );
  CLKXOR2X2M U49 ( .A(PRESCALE[5]), .B(EDG_CNT[4]), .Y(n17) );
  NOR4X1M U50 ( .A(n31), .B(n30), .C(n29), .D(n17), .Y(N21) );
  NOR2BX1M U51 ( .AN(N14), .B(EDG_CNT[0]), .Y(n32) );
  OAI2B2X1M U52 ( .A1N(EDG_CNT[1]), .A0(n32), .B0(N23), .B1(n32), .Y(n35) );
  NOR2BX1M U53 ( .AN(EDG_CNT[0]), .B(N14), .Y(n33) );
  OAI2B2X1M U54 ( .A1N(N23), .A0(n33), .B0(EDG_CNT[1]), .B1(n33), .Y(n34) );
  NAND3BX1M U55 ( .AN(N27), .B(n35), .C(n34), .Y(n39) );
  CLKXOR2X2M U56 ( .A(N26), .B(EDG_CNT[4]), .Y(n38) );
  CLKXOR2X2M U57 ( .A(N24), .B(EDG_CNT[2]), .Y(n37) );
  CLKXOR2X2M U58 ( .A(N25), .B(EDG_CNT[3]), .Y(n36) );
  NOR4X1M U59 ( .A(n39), .B(n38), .C(n37), .D(n36), .Y(N28) );
endmodule


module UART_RX_DESERIALIZER ( CLK, RST, SAMPLED_BIT, DESER_EN, PRESCALE, 
        EDG_CNT, P_DATA );
  input [5:0] PRESCALE;
  input [4:0] EDG_CNT;
  output [7:0] P_DATA;
  input CLK, RST, SAMPLED_BIT, DESER_EN;
  wire   N1, N2, N3, N4, N5, N6, N7, n1, n10, n11, n12, n13, n14, n15, n16,
         n17, n2, n3, n4, n5, n6, n7, n8, n9, n18, n19, n20, n21, n22, n23,
         n24, n25, n26, n27, n28, n29, n30;

  DFFRQX2M \P_DATA_reg[0]  ( .D(n10), .CK(CLK), .RN(RST), .Q(P_DATA[0]) );
  DFFRQX2M \P_DATA_reg[5]  ( .D(n15), .CK(CLK), .RN(RST), .Q(P_DATA[5]) );
  DFFRQX2M \P_DATA_reg[1]  ( .D(n11), .CK(CLK), .RN(RST), .Q(P_DATA[1]) );
  DFFRQX2M \P_DATA_reg[4]  ( .D(n14), .CK(CLK), .RN(RST), .Q(P_DATA[4]) );
  DFFRQX2M \P_DATA_reg[3]  ( .D(n13), .CK(CLK), .RN(RST), .Q(P_DATA[3]) );
  DFFRQX2M \P_DATA_reg[2]  ( .D(n12), .CK(CLK), .RN(RST), .Q(P_DATA[2]) );
  DFFRQX2M \P_DATA_reg[6]  ( .D(n16), .CK(CLK), .RN(RST), .Q(P_DATA[6]) );
  DFFRQX2M \P_DATA_reg[7]  ( .D(n17), .CK(CLK), .RN(RST), .Q(P_DATA[7]) );
  OAI22X1M U3 ( .A0(n30), .A1(n29), .B0(n1), .B1(n28), .Y(n11) );
  OAI22X1M U4 ( .A0(n30), .A1(n28), .B0(n1), .B1(n27), .Y(n12) );
  OAI22X1M U5 ( .A0(n30), .A1(n27), .B0(n1), .B1(n26), .Y(n13) );
  OAI22X1M U6 ( .A0(n30), .A1(n26), .B0(n1), .B1(n25), .Y(n14) );
  OAI22X1M U7 ( .A0(n30), .A1(n25), .B0(n1), .B1(n24), .Y(n15) );
  OAI22X1M U8 ( .A0(n30), .A1(n24), .B0(n1), .B1(n23), .Y(n16) );
  INVX2M U9 ( .A(n1), .Y(n30) );
  NAND2X2M U10 ( .A(N7), .B(DESER_EN), .Y(n1) );
  OAI2BB2X1M U11 ( .B0(n1), .B1(n29), .A0N(P_DATA[0]), .A1N(n1), .Y(n10) );
  OAI2BB2X1M U12 ( .B0(n30), .B1(n23), .A0N(SAMPLED_BIT), .A1N(n30), .Y(n17)
         );
  INVX2M U13 ( .A(P_DATA[7]), .Y(n23) );
  INVX2M U14 ( .A(P_DATA[6]), .Y(n24) );
  INVX2M U15 ( .A(P_DATA[2]), .Y(n28) );
  INVX2M U16 ( .A(P_DATA[3]), .Y(n27) );
  INVX2M U17 ( .A(P_DATA[1]), .Y(n29) );
  INVX2M U18 ( .A(P_DATA[4]), .Y(n26) );
  INVX2M U19 ( .A(P_DATA[5]), .Y(n25) );
  OR2X2M U20 ( .A(PRESCALE[1]), .B(PRESCALE[0]), .Y(n2) );
  INVX2M U21 ( .A(PRESCALE[3]), .Y(n6) );
  CLKINVX1M U22 ( .A(PRESCALE[0]), .Y(N1) );
  OAI2BB1X1M U23 ( .A0N(PRESCALE[0]), .A1N(PRESCALE[1]), .B0(n2), .Y(N2) );
  NOR2X1M U24 ( .A(n2), .B(PRESCALE[2]), .Y(n3) );
  AO21XLM U25 ( .A0(n2), .A1(PRESCALE[2]), .B0(n3), .Y(N3) );
  CLKNAND2X2M U26 ( .A(n3), .B(n6), .Y(n4) );
  OAI21X1M U27 ( .A0(n3), .A1(n6), .B0(n4), .Y(N4) );
  XNOR2X1M U28 ( .A(PRESCALE[4]), .B(n4), .Y(N5) );
  NOR2X1M U29 ( .A(PRESCALE[4]), .B(n4), .Y(n5) );
  CLKXOR2X2M U30 ( .A(PRESCALE[5]), .B(n5), .Y(N6) );
  NOR2BX1M U31 ( .AN(N1), .B(EDG_CNT[0]), .Y(n7) );
  OAI2B2X1M U32 ( .A1N(EDG_CNT[1]), .A0(n7), .B0(N2), .B1(n7), .Y(n18) );
  NOR2BX1M U33 ( .AN(EDG_CNT[0]), .B(N1), .Y(n8) );
  OAI2B2X1M U34 ( .A1N(N2), .A0(n8), .B0(EDG_CNT[1]), .B1(n8), .Y(n9) );
  NAND3BX1M U35 ( .AN(N6), .B(n18), .C(n9), .Y(n22) );
  CLKXOR2X2M U36 ( .A(N5), .B(EDG_CNT[4]), .Y(n21) );
  CLKXOR2X2M U37 ( .A(N3), .B(EDG_CNT[2]), .Y(n20) );
  CLKXOR2X2M U38 ( .A(N4), .B(EDG_CNT[3]), .Y(n19) );
  NOR4X1M U39 ( .A(n22), .B(n21), .C(n20), .D(n19), .Y(N7) );
endmodule


module UART_RX_PAR_CHK ( CLK, RST, SAMPLED_BIT, PAR_CHK_EN, PAR_TYP, P_DATA, 
        PAR_ERR );
  input [7:0] P_DATA;
  input CLK, RST, SAMPLED_BIT, PAR_CHK_EN, PAR_TYP;
  output PAR_ERR;
  wire   par, n1, n3, n4, n5, n6, n7, n8, n9, n2;

  DFFRQX2M par_reg ( .D(n9), .CK(CLK), .RN(RST), .Q(par) );
  DFFRHQX8M PAR_ERR_reg ( .D(n8), .CK(CLK), .RN(RST), .Q(PAR_ERR) );
  XNOR2X2M U2 ( .A(P_DATA[3]), .B(P_DATA[2]), .Y(n6) );
  OAI2BB2X1M U3 ( .B0(n3), .B1(n2), .A0N(n2), .A1N(par), .Y(n9) );
  XOR3XLM U4 ( .A(n4), .B(PAR_TYP), .C(n5), .Y(n3) );
  XOR3XLM U5 ( .A(P_DATA[1]), .B(P_DATA[0]), .C(n6), .Y(n5) );
  XOR3XLM U6 ( .A(P_DATA[5]), .B(P_DATA[4]), .C(n7), .Y(n4) );
  INVX2M U7 ( .A(PAR_CHK_EN), .Y(n2) );
  OAI2BB2X1M U8 ( .B0(n1), .B1(n2), .A0N(PAR_ERR), .A1N(n2), .Y(n8) );
  XNOR2X2M U9 ( .A(par), .B(SAMPLED_BIT), .Y(n1) );
  CLKXOR2X2M U10 ( .A(P_DATA[7]), .B(P_DATA[6]), .Y(n7) );
endmodule


module UART_RX_STP_CHK ( CLK, RST, SAMPLED_BIT, STP_CHK_EN, STP_ERR );
  input CLK, RST, SAMPLED_BIT, STP_CHK_EN;
  output STP_ERR;
  wire   n2, n1;

  DFFRHQX8M STP_ERR_reg ( .D(n2), .CK(CLK), .RN(RST), .Q(STP_ERR) );
  OAI2BB2X1M U2 ( .B0(SAMPLED_BIT), .B1(n1), .A0N(STP_ERR), .A1N(n1), .Y(n2)
         );
  INVX2M U3 ( .A(STP_CHK_EN), .Y(n1) );
endmodule


module UART_RX_STRT_CHK ( CLK, RST, SAMPLED_BIT, STRT_CHK_EN, STRT_ERR );
  input CLK, RST, SAMPLED_BIT, STRT_CHK_EN;
  output STRT_ERR;
  wire   n1;

  DFFRQX2M STRT_ERR_reg ( .D(n1), .CK(CLK), .RN(RST), .Q(STRT_ERR) );
  AO2B2X2M U2 ( .B0(STRT_CHK_EN), .B1(SAMPLED_BIT), .A0(STRT_ERR), .A1N(
        STRT_CHK_EN), .Y(n1) );
endmodule


module UART_RX ( CLK, RST, RX_IN, PRESCALE, PAR_EN, PAR_TYP, P_DATA, PAR_ERR, 
        STP_ERR, DATA_VALID );
  input [5:0] PRESCALE;
  output [7:0] P_DATA;
  input CLK, RST, RX_IN, PAR_EN, PAR_TYP;
  output PAR_ERR, STP_ERR, DATA_VALID;
  wire   STRT_ERR_wr, EDG_BIT_CNT_EN_wr, DAT_SAMP_EN_wr, STRT_CHK_EN_wr,
         DESER_EN_wr, PAR_CHK_EN_wr, STP_CHK_EN_wr, SAMPLED_BIT_wr, n1, n2;
  wire   [3:0] BIT_CNT_wr;
  wire   [4:0] EDG_CNT_wr;

  UART_RX_FSM U0_FSM ( .CLK(CLK), .RST(n1), .RX_IN(RX_IN), .PAR_EN(PAR_EN), 
        .PRESCALE(PRESCALE), .BIT_CNT(BIT_CNT_wr), .EDG_CNT(EDG_CNT_wr), 
        .PAR_ERR(PAR_ERR), .STRT_ERR(STRT_ERR_wr), .STP_ERR(STP_ERR), 
        .EDG_BIT_CNT_EN(EDG_BIT_CNT_EN_wr), .DAT_SAMP_EN(DAT_SAMP_EN_wr), 
        .STRT_CHK_EN(STRT_CHK_EN_wr), .DESER_EN(DESER_EN_wr), .PAR_CHK_EN(
        PAR_CHK_EN_wr), .STP_CHK_EN(STP_CHK_EN_wr), .DATA_VALID(DATA_VALID) );
  UART_RX_EDG_BIT_COUNTER U0_EDG_BIT_COUNTER ( .CLK(CLK), .RST(n1), 
        .EDG_BIT_CNT_EN(EDG_BIT_CNT_EN_wr), .PRESCALE(PRESCALE), .BIT_CNT(
        BIT_CNT_wr), .EDG_CNT(EDG_CNT_wr) );
  UART_RX_DATA_SAMPLING U0_DATA_SAMPLING ( .CLK(CLK), .RST(n1), .RX_IN(RX_IN), 
        .PRESCALE(PRESCALE), .DAT_SAMP_EN(DAT_SAMP_EN_wr), .EDG_CNT(EDG_CNT_wr), .SAMPLED_BIT(SAMPLED_BIT_wr) );
  UART_RX_DESERIALIZER U0_DESERIALIZER ( .CLK(CLK), .RST(n1), .SAMPLED_BIT(
        SAMPLED_BIT_wr), .DESER_EN(DESER_EN_wr), .PRESCALE(PRESCALE), 
        .EDG_CNT(EDG_CNT_wr), .P_DATA(P_DATA) );
  UART_RX_PAR_CHK U0_PAR_CHK ( .CLK(CLK), .RST(n1), .SAMPLED_BIT(
        SAMPLED_BIT_wr), .PAR_CHK_EN(PAR_CHK_EN_wr), .PAR_TYP(PAR_TYP), 
        .P_DATA(P_DATA), .PAR_ERR(PAR_ERR) );
  UART_RX_STP_CHK U0_STP_CHK ( .CLK(CLK), .RST(n1), .SAMPLED_BIT(
        SAMPLED_BIT_wr), .STP_CHK_EN(STP_CHK_EN_wr), .STP_ERR(STP_ERR) );
  UART_RX_STRT_CHK U0_STRT_CHK ( .CLK(CLK), .RST(n1), .SAMPLED_BIT(
        SAMPLED_BIT_wr), .STRT_CHK_EN(STRT_CHK_EN_wr), .STRT_ERR(STRT_ERR_wr)
         );
  INVX2M U1 ( .A(n2), .Y(n1) );
  INVX2M U2 ( .A(RST), .Y(n2) );
endmodule


module UART_DATA_WIDTH8 ( RST, TX_CLK, RX_CLK, RX_IN_S, TX_IN_P, TX_IN_V, 
        PRESCALE, PAR_EN, PAR_TYP, RX_OUT_P, RX_OUT_V, TX_OUT_S, TX_OUT_V, 
        PAR_ERR, STP_ERR );
  input [7:0] TX_IN_P;
  input [5:0] PRESCALE;
  output [7:0] RX_OUT_P;
  input RST, TX_CLK, RX_CLK, RX_IN_S, TX_IN_V, PAR_EN, PAR_TYP;
  output RX_OUT_V, TX_OUT_S, TX_OUT_V, PAR_ERR, STP_ERR;
  wire   n1, n2;

  UART_TX U0_UART_TX ( .CLK(TX_CLK), .RST(n1), .P_DATA(TX_IN_P), .DATA_VALID(
        TX_IN_V), .PAR_EN(PAR_EN), .PAR_TYP(PAR_TYP), .TX_OUT(TX_OUT_S), 
        .BUSY(TX_OUT_V) );
  UART_RX U0_UART_RX ( .CLK(RX_CLK), .RST(n1), .RX_IN(RX_IN_S), .PRESCALE(
        PRESCALE), .PAR_EN(PAR_EN), .PAR_TYP(PAR_TYP), .P_DATA(RX_OUT_P), 
        .PAR_ERR(PAR_ERR), .STP_ERR(STP_ERR), .DATA_VALID(RX_OUT_V) );
  INVX2M U1 ( .A(n2), .Y(n1) );
  INVX2M U2 ( .A(RST), .Y(n2) );
endmodule


module SYS_CNTRL ( CLK, RST, ALU_OUT, ALU_OUT_VLD, RDDATA, RDDATA_VLD, 
        RX_P_DATA, RX_D_VLD, FIFO_FULL, ALU_FUN, ALU_EN, CLK_EN, ADDRESS, 
        WR_EN, RD_EN, WR_DATA, TX_P_DATA, TX_D_VLD, CLK_DIV_EN );
  input [15:0] ALU_OUT;
  input [7:0] RDDATA;
  input [7:0] RX_P_DATA;
  output [3:0] ALU_FUN;
  output [3:0] ADDRESS;
  output [7:0] WR_DATA;
  output [7:0] TX_P_DATA;
  input CLK, RST, ALU_OUT_VLD, RDDATA_VLD, RX_D_VLD, FIFO_FULL;
  output ALU_EN, CLK_EN, WR_EN, RD_EN, TX_D_VLD, CLK_DIV_EN;
  wire   n11, n12, n13, n14, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44,
         n45, n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56, n57, n58,
         n59, n60, n61, n62, n63, n64, n65, n3, n4, n5, n6, n7, n8, n9, n10,
         n15, n16, n17, n18, n19, n20, n66, n67, n68, n69, n70, n71, n72, n73,
         n74, n75;
  wire   [3:0] cs;
  wire   [3:0] ns;
  wire   [3:0] address_save;

  DFFRX1M \address_save_reg[3]  ( .D(n62), .CK(CLK), .RN(RST), .Q(
        address_save[3]), .QN(n11) );
  DFFRX1M \address_save_reg[2]  ( .D(n63), .CK(CLK), .RN(RST), .Q(
        address_save[2]), .QN(n12) );
  DFFRX1M \address_save_reg[0]  ( .D(n65), .CK(CLK), .RN(RST), .Q(
        address_save[0]), .QN(n14) );
  DFFRX1M \address_save_reg[1]  ( .D(n64), .CK(CLK), .RN(RST), .Q(
        address_save[1]), .QN(n13) );
  DFFRQX2M \cs_reg[1]  ( .D(ns[1]), .CK(CLK), .RN(RST), .Q(cs[1]) );
  DFFRQX2M \cs_reg[2]  ( .D(ns[2]), .CK(CLK), .RN(RST), .Q(cs[2]) );
  DFFRQX2M \cs_reg[3]  ( .D(ns[3]), .CK(CLK), .RN(RST), .Q(cs[3]) );
  DFFRQX2M \cs_reg[0]  ( .D(ns[0]), .CK(CLK), .RN(RST), .Q(cs[0]) );
  INVX2M U3 ( .A(1'b0), .Y(CLK_DIV_EN) );
  OAI22X4M U5 ( .A0(n46), .A1(n11), .B0(n61), .B1(n72), .Y(ADDRESS[3]) );
  OAI22X2M U6 ( .A0(n46), .A1(n12), .B0(n61), .B1(n73), .Y(ADDRESS[2]) );
  INVX2M U7 ( .A(n6), .Y(TX_D_VLD) );
  INVX2M U8 ( .A(n58), .Y(ALU_EN) );
  NAND2X2M U9 ( .A(n58), .B(n5), .Y(CLK_EN) );
  AND2X2M U10 ( .A(n60), .B(n6), .Y(n59) );
  NAND2X2M U11 ( .A(n59), .B(n73), .Y(ALU_FUN[2]) );
  NOR2X2M U12 ( .A(n67), .B(RD_EN), .Y(n61) );
  NAND2X2M U13 ( .A(n59), .B(n72), .Y(ALU_FUN[3]) );
  NAND2X2M U14 ( .A(n59), .B(n74), .Y(ALU_FUN[1]) );
  NAND2X2M U15 ( .A(n59), .B(n75), .Y(ALU_FUN[0]) );
  BUFX2M U16 ( .A(n27), .Y(n6) );
  INVX2M U17 ( .A(n31), .Y(n67) );
  AND3X2M U18 ( .A(n40), .B(n36), .C(n46), .Y(n47) );
  NAND3X2M U19 ( .A(n66), .B(n69), .C(n33), .Y(n46) );
  NOR2X2M U20 ( .A(n47), .B(n70), .Y(WR_DATA[6]) );
  NOR2X2M U21 ( .A(n47), .B(n74), .Y(WR_DATA[1]) );
  NOR2X2M U22 ( .A(n47), .B(n73), .Y(WR_DATA[2]) );
  NOR2X2M U23 ( .A(n47), .B(n72), .Y(WR_DATA[3]) );
  NOR2X2M U24 ( .A(n47), .B(n71), .Y(WR_DATA[4]) );
  NOR2X2M U25 ( .A(n47), .B(n75), .Y(WR_DATA[0]) );
  INVX2M U26 ( .A(n29), .Y(n20) );
  NOR3X2M U27 ( .A(n6), .B(n4), .C(n28), .Y(n21) );
  NAND2X2M U28 ( .A(n60), .B(n68), .Y(n58) );
  NAND3X2M U29 ( .A(n75), .B(n71), .C(n34), .Y(n32) );
  BUFX2M U30 ( .A(n27), .Y(n5) );
  NOR2X2M U31 ( .A(n4), .B(n28), .Y(n42) );
  NAND2X2M U32 ( .A(n69), .B(n68), .Y(n41) );
  OAI221X1M U33 ( .A0(n61), .A1(n75), .B0(n46), .B1(n14), .C0(n40), .Y(
        ADDRESS[0]) );
  NOR3X2M U34 ( .A(cs[0]), .B(cs[1]), .C(n69), .Y(n60) );
  NOR3X2M U35 ( .A(cs[1]), .B(cs[3]), .C(n66), .Y(n45) );
  AND3X2M U36 ( .A(n33), .B(n66), .C(cs[2]), .Y(RD_EN) );
  NAND3X2M U37 ( .A(n33), .B(n69), .C(cs[0]), .Y(n31) );
  INVX2M U38 ( .A(cs[2]), .Y(n69) );
  INVX2M U39 ( .A(RX_P_DATA[0]), .Y(n75) );
  NAND2X2M U40 ( .A(n45), .B(cs[2]), .Y(n40) );
  AND2X2M U41 ( .A(cs[1]), .B(n68), .Y(n33) );
  INVX2M U42 ( .A(RX_P_DATA[2]), .Y(n73) );
  NAND2X2M U43 ( .A(cs[3]), .B(n60), .Y(n27) );
  INVX2M U44 ( .A(cs[3]), .Y(n68) );
  INVX2M U45 ( .A(cs[0]), .Y(n66) );
  AOI31X2M U46 ( .A0(RX_P_DATA[4]), .A1(n34), .A2(RX_P_DATA[0]), .B0(n19), .Y(
        n23) );
  INVX2M U47 ( .A(n35), .Y(n19) );
  OAI211X2M U48 ( .A0(n3), .A1(n46), .B0(n40), .C0(n36), .Y(WR_EN) );
  AND4X2M U49 ( .A(n18), .B(n17), .C(n16), .D(n15), .Y(n3) );
  OAI22X1M U50 ( .A0(n46), .A1(n13), .B0(n61), .B1(n74), .Y(ADDRESS[1]) );
  NOR2BX2M U51 ( .AN(ALU_OUT_VLD), .B(n4), .Y(n50) );
  NOR2X2M U52 ( .A(ALU_OUT_VLD), .B(n4), .Y(n49) );
  NAND4X2M U53 ( .A(RX_P_DATA[7]), .B(RX_P_DATA[3]), .C(n45), .D(n69), .Y(n29)
         );
  NOR2BX2M U54 ( .AN(RX_P_DATA[5]), .B(n47), .Y(WR_DATA[5]) );
  NOR2BX2M U55 ( .AN(RX_P_DATA[7]), .B(n47), .Y(WR_DATA[7]) );
  OAI211X2M U56 ( .A0(cs[3]), .A1(n69), .B0(n23), .C0(n24), .Y(ns[2]) );
  AOI21X2M U57 ( .A0(n25), .A1(n26), .B0(n21), .Y(n24) );
  NOR3X2M U58 ( .A(n70), .B(n71), .C(n73), .Y(n25) );
  NOR4X1M U59 ( .A(RX_P_DATA[5]), .B(RX_P_DATA[1]), .C(n29), .D(n75), .Y(n26)
         );
  NOR2X2M U60 ( .A(n57), .B(n5), .Y(TX_P_DATA[0]) );
  NAND4X2M U61 ( .A(n23), .B(n30), .C(n31), .D(n32), .Y(ns[1]) );
  NAND2BX2M U62 ( .AN(RX_D_VLD), .B(n33), .Y(n30) );
  OAI2BB2X1M U63 ( .B0(n67), .B1(n12), .A0N(ADDRESS[2]), .A1N(n67), .Y(n63) );
  OAI2BB2X1M U64 ( .B0(n67), .B1(n11), .A0N(ADDRESS[3]), .A1N(n67), .Y(n62) );
  NAND3X2M U65 ( .A(cs[2]), .B(n33), .C(cs[0]), .Y(n36) );
  INVX2M U66 ( .A(RX_P_DATA[1]), .Y(n74) );
  AND4X2M U67 ( .A(RX_P_DATA[5]), .B(RX_P_DATA[1]), .C(n43), .D(n20), .Y(n34)
         );
  NOR2X2M U68 ( .A(RX_P_DATA[6]), .B(RX_P_DATA[2]), .Y(n43) );
  BUFX2M U69 ( .A(RDDATA_VLD), .Y(n4) );
  INVX2M U70 ( .A(RX_P_DATA[3]), .Y(n72) );
  NAND4X2M U71 ( .A(RX_P_DATA[2]), .B(n20), .C(RX_P_DATA[6]), .D(n44), .Y(n35)
         );
  NOR4X1M U72 ( .A(RX_P_DATA[5]), .B(RX_P_DATA[4]), .C(RX_P_DATA[1]), .D(
        RX_P_DATA[0]), .Y(n44) );
  NOR2X2M U73 ( .A(n56), .B(n5), .Y(TX_P_DATA[1]) );
  AOI222X1M U74 ( .A0(RDDATA[1]), .A1(n4), .B0(ALU_OUT[9]), .B1(n49), .C0(
        ALU_OUT[1]), .C1(n50), .Y(n56) );
  NOR2X2M U75 ( .A(n55), .B(n5), .Y(TX_P_DATA[2]) );
  AOI222X1M U76 ( .A0(RDDATA[2]), .A1(n4), .B0(ALU_OUT[10]), .B1(n49), .C0(
        ALU_OUT[2]), .C1(n50), .Y(n55) );
  NOR2X2M U77 ( .A(n54), .B(n5), .Y(TX_P_DATA[3]) );
  AOI222X1M U78 ( .A0(RDDATA[3]), .A1(n4), .B0(ALU_OUT[11]), .B1(n49), .C0(
        ALU_OUT[3]), .C1(n50), .Y(n54) );
  NOR2X2M U79 ( .A(n53), .B(n5), .Y(TX_P_DATA[4]) );
  AOI222X1M U80 ( .A0(RDDATA[4]), .A1(n4), .B0(ALU_OUT[12]), .B1(n49), .C0(
        ALU_OUT[4]), .C1(n50), .Y(n53) );
  NOR2X2M U81 ( .A(n52), .B(n6), .Y(TX_P_DATA[5]) );
  AOI222X1M U82 ( .A0(RDDATA[5]), .A1(n4), .B0(ALU_OUT[13]), .B1(n49), .C0(
        ALU_OUT[5]), .C1(n50), .Y(n52) );
  NOR2X2M U83 ( .A(n51), .B(n6), .Y(TX_P_DATA[6]) );
  AOI222X1M U84 ( .A0(RDDATA[6]), .A1(n4), .B0(ALU_OUT[14]), .B1(n49), .C0(
        ALU_OUT[6]), .C1(n50), .Y(n51) );
  NOR2X2M U85 ( .A(n48), .B(n6), .Y(TX_P_DATA[7]) );
  AOI222X1M U86 ( .A0(n4), .A1(RDDATA[7]), .B0(ALU_OUT[15]), .B1(n49), .C0(
        ALU_OUT[7]), .C1(n50), .Y(n48) );
  OAI2BB2X1M U87 ( .B0(n67), .B1(n13), .A0N(ADDRESS[1]), .A1N(n67), .Y(n64) );
  OAI2BB2X1M U88 ( .B0(n67), .B1(n14), .A0N(ADDRESS[0]), .A1N(n67), .Y(n65) );
  NAND2BX2M U89 ( .AN(FIFO_FULL), .B(ALU_OUT_VLD), .Y(n28) );
  INVX2M U90 ( .A(RX_P_DATA[4]), .Y(n71) );
  NAND4X2M U91 ( .A(n35), .B(n32), .C(n36), .D(n37), .Y(ns[0]) );
  AOI21X2M U92 ( .A0(RX_D_VLD), .A1(n38), .B0(n39), .Y(n37) );
  AOI21X2M U93 ( .A0(n31), .A1(n40), .B0(RX_D_VLD), .Y(n39) );
  OAI32X1M U94 ( .A0(n41), .A1(cs[1]), .A2(cs[0]), .B0(n42), .B1(n6), .Y(n38)
         );
  INVX2M U95 ( .A(RX_P_DATA[6]), .Y(n70) );
  NAND2BX2M U96 ( .AN(n21), .B(n22), .Y(ns[3]) );
  OAI21X2M U97 ( .A0(RD_EN), .A1(ALU_EN), .B0(RX_D_VLD), .Y(n22) );
  AOI222X1M U98 ( .A0(RDDATA[0]), .A1(n4), .B0(ALU_OUT[8]), .B1(n49), .C0(
        ALU_OUT[0]), .C1(n50), .Y(n57) );
  NOR2BX1M U99 ( .AN(RX_P_DATA[0]), .B(address_save[0]), .Y(n7) );
  OAI2B2X1M U100 ( .A1N(address_save[1]), .A0(n7), .B0(RX_P_DATA[1]), .B1(n7), 
        .Y(n18) );
  NOR2BX1M U101 ( .AN(address_save[0]), .B(RX_P_DATA[0]), .Y(n8) );
  OAI2B2X1M U102 ( .A1N(RX_P_DATA[1]), .A0(n8), .B0(address_save[1]), .B1(n8), 
        .Y(n17) );
  CLKXOR2X2M U103 ( .A(RX_P_DATA[2]), .B(address_save[2]), .Y(n10) );
  CLKXOR2X2M U104 ( .A(RX_P_DATA[3]), .B(address_save[3]), .Y(n9) );
  NOR2X1M U105 ( .A(n10), .B(n9), .Y(n16) );
  NOR4X1M U106 ( .A(RX_P_DATA[7]), .B(RX_P_DATA[6]), .C(RX_P_DATA[5]), .D(
        RX_P_DATA[4]), .Y(n15) );
endmodule


module RegisterFile_WIDTH8_DEPTH16_ADDR4 ( CLK, RST, WrEn, RdEn, Address, 
        WrData, RdData, RdData_VLD, REG0, REG1, REG2, REG3 );
  input [3:0] Address;
  input [7:0] WrData;
  output [7:0] RdData;
  output [7:0] REG0;
  output [7:0] REG1;
  output [7:0] REG2;
  output [7:0] REG3;
  input CLK, RST, WrEn, RdEn;
  output RdData_VLD;
  wire   N11, N12, N13, N14, \Reg_File[15][7] , \Reg_File[15][6] ,
         \Reg_File[15][5] , \Reg_File[15][4] , \Reg_File[15][3] ,
         \Reg_File[15][2] , \Reg_File[15][1] , \Reg_File[15][0] ,
         \Reg_File[14][7] , \Reg_File[14][6] , \Reg_File[14][5] ,
         \Reg_File[14][4] , \Reg_File[14][3] , \Reg_File[14][2] ,
         \Reg_File[14][1] , \Reg_File[14][0] , \Reg_File[13][7] ,
         \Reg_File[13][6] , \Reg_File[13][5] , \Reg_File[13][4] ,
         \Reg_File[13][3] , \Reg_File[13][2] , \Reg_File[13][1] ,
         \Reg_File[13][0] , \Reg_File[12][7] , \Reg_File[12][6] ,
         \Reg_File[12][5] , \Reg_File[12][4] , \Reg_File[12][3] ,
         \Reg_File[12][2] , \Reg_File[12][1] , \Reg_File[12][0] ,
         \Reg_File[11][7] , \Reg_File[11][6] , \Reg_File[11][5] ,
         \Reg_File[11][4] , \Reg_File[11][3] , \Reg_File[11][2] ,
         \Reg_File[11][1] , \Reg_File[11][0] , \Reg_File[10][7] ,
         \Reg_File[10][6] , \Reg_File[10][5] , \Reg_File[10][4] ,
         \Reg_File[10][3] , \Reg_File[10][2] , \Reg_File[10][1] ,
         \Reg_File[10][0] , \Reg_File[9][7] , \Reg_File[9][6] ,
         \Reg_File[9][5] , \Reg_File[9][4] , \Reg_File[9][3] ,
         \Reg_File[9][2] , \Reg_File[9][1] , \Reg_File[9][0] ,
         \Reg_File[8][7] , \Reg_File[8][6] , \Reg_File[8][5] ,
         \Reg_File[8][4] , \Reg_File[8][3] , \Reg_File[8][2] ,
         \Reg_File[8][1] , \Reg_File[8][0] , \Reg_File[7][7] ,
         \Reg_File[7][6] , \Reg_File[7][5] , \Reg_File[7][4] ,
         \Reg_File[7][3] , \Reg_File[7][2] , \Reg_File[7][1] ,
         \Reg_File[7][0] , \Reg_File[6][7] , \Reg_File[6][6] ,
         \Reg_File[6][5] , \Reg_File[6][4] , \Reg_File[6][3] ,
         \Reg_File[6][2] , \Reg_File[6][1] , \Reg_File[6][0] ,
         \Reg_File[5][7] , \Reg_File[5][6] , \Reg_File[5][5] ,
         \Reg_File[5][4] , \Reg_File[5][3] , \Reg_File[5][2] ,
         \Reg_File[5][1] , \Reg_File[5][0] , \Reg_File[4][7] ,
         \Reg_File[4][6] , \Reg_File[4][5] , \Reg_File[4][4] ,
         \Reg_File[4][3] , \Reg_File[4][2] , \Reg_File[4][1] ,
         \Reg_File[4][0] , N36, N37, N38, N39, N40, N41, N42, N43, n12, n13,
         n14, n15, n16, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28,
         n29, n30, n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42,
         n43, n44, n45, n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56,
         n57, n58, n59, n60, n61, n62, n63, n64, n65, n66, n67, n68, n69, n70,
         n71, n72, n73, n74, n75, n76, n77, n78, n79, n80, n81, n82, n83, n84,
         n85, n86, n87, n88, n89, n90, n91, n92, n93, n94, n95, n96, n97, n98,
         n99, n100, n101, n102, n103, n104, n105, n106, n107, n108, n109, n110,
         n111, n112, n113, n114, n115, n116, n117, n118, n119, n120, n121,
         n122, n123, n124, n125, n126, n127, n128, n129, n130, n131, n132,
         n133, n134, n135, n136, n137, n138, n139, n140, n141, n142, n143,
         n144, n145, n146, n147, n148, n149, n150, n151, n152, n153, n154,
         n155, n156, n157, n158, n159, n160, n161, n162, n163, n164, n165,
         n166, n167, n168, n169, n170, n171, n172, n173, n174, n175, n176, n1,
         n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n17, n177, n178, n179, n180,
         n181, n182, n183, n184, n185, n186, n187, n188, n189, n190, n191,
         n192, n193, n194, n195, n196, n197, n198, n199, n200, n201, n202,
         n203, n204, n205, n206, n207, n208, n209, n210, n211, n212, n213,
         n214, n215, n216, n217, n218, n219, n220, n221, n222, n223, n224,
         n225, n226, n227, n228, n229, n230;
  assign N11 = Address[0];
  assign N12 = Address[1];
  assign N13 = Address[2];
  assign N14 = Address[3];

  DFFRQX2M \RdData_reg[0]  ( .D(n40), .CK(CLK), .RN(n208), .Q(RdData[0]) );
  DFFRQX2M \Reg_File_reg[13][7]  ( .D(n160), .CK(CLK), .RN(n212), .Q(
        \Reg_File[13][7] ) );
  DFFRQX2M \Reg_File_reg[13][6]  ( .D(n159), .CK(CLK), .RN(n212), .Q(
        \Reg_File[13][6] ) );
  DFFRQX2M \Reg_File_reg[13][5]  ( .D(n158), .CK(CLK), .RN(n211), .Q(
        \Reg_File[13][5] ) );
  DFFRQX2M \Reg_File_reg[13][4]  ( .D(n157), .CK(CLK), .RN(n211), .Q(
        \Reg_File[13][4] ) );
  DFFRQX2M \Reg_File_reg[13][3]  ( .D(n156), .CK(CLK), .RN(n211), .Q(
        \Reg_File[13][3] ) );
  DFFRQX2M \Reg_File_reg[13][2]  ( .D(n155), .CK(CLK), .RN(n211), .Q(
        \Reg_File[13][2] ) );
  DFFRQX2M \Reg_File_reg[13][1]  ( .D(n154), .CK(CLK), .RN(n211), .Q(
        \Reg_File[13][1] ) );
  DFFRQX2M \Reg_File_reg[13][0]  ( .D(n153), .CK(CLK), .RN(n211), .Q(
        \Reg_File[13][0] ) );
  DFFRQX2M \Reg_File_reg[9][7]  ( .D(n128), .CK(CLK), .RN(n209), .Q(
        \Reg_File[9][7] ) );
  DFFRQX2M \Reg_File_reg[9][6]  ( .D(n127), .CK(CLK), .RN(n209), .Q(
        \Reg_File[9][6] ) );
  DFFRQX2M \Reg_File_reg[9][5]  ( .D(n126), .CK(CLK), .RN(n209), .Q(
        \Reg_File[9][5] ) );
  DFFRQX2M \Reg_File_reg[9][4]  ( .D(n125), .CK(CLK), .RN(n209), .Q(
        \Reg_File[9][4] ) );
  DFFRQX2M \Reg_File_reg[9][3]  ( .D(n124), .CK(CLK), .RN(n209), .Q(
        \Reg_File[9][3] ) );
  DFFRQX2M \Reg_File_reg[9][2]  ( .D(n123), .CK(CLK), .RN(n209), .Q(
        \Reg_File[9][2] ) );
  DFFRQX2M \Reg_File_reg[9][1]  ( .D(n122), .CK(CLK), .RN(n209), .Q(
        \Reg_File[9][1] ) );
  DFFRQX2M \Reg_File_reg[9][0]  ( .D(n121), .CK(CLK), .RN(n209), .Q(
        \Reg_File[9][0] ) );
  DFFRQX2M \Reg_File_reg[5][7]  ( .D(n96), .CK(CLK), .RN(n207), .Q(
        \Reg_File[5][7] ) );
  DFFRQX2M \Reg_File_reg[5][6]  ( .D(n95), .CK(CLK), .RN(n207), .Q(
        \Reg_File[5][6] ) );
  DFFRQX2M \Reg_File_reg[5][5]  ( .D(n94), .CK(CLK), .RN(n207), .Q(
        \Reg_File[5][5] ) );
  DFFRQX2M \Reg_File_reg[5][4]  ( .D(n93), .CK(CLK), .RN(n207), .Q(
        \Reg_File[5][4] ) );
  DFFRQX2M \Reg_File_reg[5][3]  ( .D(n92), .CK(CLK), .RN(n207), .Q(
        \Reg_File[5][3] ) );
  DFFRQX2M \Reg_File_reg[5][2]  ( .D(n91), .CK(CLK), .RN(n207), .Q(
        \Reg_File[5][2] ) );
  DFFRQX2M \Reg_File_reg[5][1]  ( .D(n90), .CK(CLK), .RN(n207), .Q(
        \Reg_File[5][1] ) );
  DFFRQX2M \Reg_File_reg[5][0]  ( .D(n89), .CK(CLK), .RN(n207), .Q(
        \Reg_File[5][0] ) );
  DFFRQX2M \Reg_File_reg[15][7]  ( .D(n176), .CK(CLK), .RN(n204), .Q(
        \Reg_File[15][7] ) );
  DFFRQX2M \Reg_File_reg[15][6]  ( .D(n175), .CK(CLK), .RN(n213), .Q(
        \Reg_File[15][6] ) );
  DFFRQX2M \Reg_File_reg[15][5]  ( .D(n174), .CK(CLK), .RN(n213), .Q(
        \Reg_File[15][5] ) );
  DFFRQX2M \Reg_File_reg[15][4]  ( .D(n173), .CK(CLK), .RN(n212), .Q(
        \Reg_File[15][4] ) );
  DFFRQX2M \Reg_File_reg[15][3]  ( .D(n172), .CK(CLK), .RN(n212), .Q(
        \Reg_File[15][3] ) );
  DFFRQX2M \Reg_File_reg[15][2]  ( .D(n171), .CK(CLK), .RN(n212), .Q(
        \Reg_File[15][2] ) );
  DFFRQX2M \Reg_File_reg[15][1]  ( .D(n170), .CK(CLK), .RN(n212), .Q(
        \Reg_File[15][1] ) );
  DFFRQX2M \Reg_File_reg[15][0]  ( .D(n169), .CK(CLK), .RN(n212), .Q(
        \Reg_File[15][0] ) );
  DFFRQX2M \Reg_File_reg[11][7]  ( .D(n144), .CK(CLK), .RN(n211), .Q(
        \Reg_File[11][7] ) );
  DFFRQX2M \Reg_File_reg[11][6]  ( .D(n143), .CK(CLK), .RN(n210), .Q(
        \Reg_File[11][6] ) );
  DFFRQX2M \Reg_File_reg[11][5]  ( .D(n142), .CK(CLK), .RN(n210), .Q(
        \Reg_File[11][5] ) );
  DFFRQX2M \Reg_File_reg[11][4]  ( .D(n141), .CK(CLK), .RN(n210), .Q(
        \Reg_File[11][4] ) );
  DFFRQX2M \Reg_File_reg[11][3]  ( .D(n140), .CK(CLK), .RN(n210), .Q(
        \Reg_File[11][3] ) );
  DFFRQX2M \Reg_File_reg[11][2]  ( .D(n139), .CK(CLK), .RN(n210), .Q(
        \Reg_File[11][2] ) );
  DFFRQX2M \Reg_File_reg[11][1]  ( .D(n138), .CK(CLK), .RN(n210), .Q(
        \Reg_File[11][1] ) );
  DFFRQX2M \Reg_File_reg[11][0]  ( .D(n137), .CK(CLK), .RN(n210), .Q(
        \Reg_File[11][0] ) );
  DFFRQX2M \Reg_File_reg[7][7]  ( .D(n112), .CK(CLK), .RN(n208), .Q(
        \Reg_File[7][7] ) );
  DFFRQX2M \Reg_File_reg[7][6]  ( .D(n111), .CK(CLK), .RN(n208), .Q(
        \Reg_File[7][6] ) );
  DFFRQX2M \Reg_File_reg[7][5]  ( .D(n110), .CK(CLK), .RN(n208), .Q(
        \Reg_File[7][5] ) );
  DFFRQX2M \Reg_File_reg[7][4]  ( .D(n109), .CK(CLK), .RN(n208), .Q(
        \Reg_File[7][4] ) );
  DFFRQX2M \Reg_File_reg[7][3]  ( .D(n108), .CK(CLK), .RN(n208), .Q(
        \Reg_File[7][3] ) );
  DFFRQX2M \Reg_File_reg[7][2]  ( .D(n107), .CK(CLK), .RN(n208), .Q(
        \Reg_File[7][2] ) );
  DFFRQX2M \Reg_File_reg[7][1]  ( .D(n106), .CK(CLK), .RN(n208), .Q(
        \Reg_File[7][1] ) );
  DFFRQX2M \Reg_File_reg[7][0]  ( .D(n105), .CK(CLK), .RN(n208), .Q(
        \Reg_File[7][0] ) );
  DFFRQX2M \Reg_File_reg[14][7]  ( .D(n168), .CK(CLK), .RN(n212), .Q(
        \Reg_File[14][7] ) );
  DFFRQX2M \Reg_File_reg[14][6]  ( .D(n167), .CK(CLK), .RN(n212), .Q(
        \Reg_File[14][6] ) );
  DFFRQX2M \Reg_File_reg[14][5]  ( .D(n166), .CK(CLK), .RN(n212), .Q(
        \Reg_File[14][5] ) );
  DFFRQX2M \Reg_File_reg[14][4]  ( .D(n165), .CK(CLK), .RN(n212), .Q(
        \Reg_File[14][4] ) );
  DFFRQX2M \Reg_File_reg[14][3]  ( .D(n164), .CK(CLK), .RN(n212), .Q(
        \Reg_File[14][3] ) );
  DFFRQX2M \Reg_File_reg[14][2]  ( .D(n163), .CK(CLK), .RN(n212), .Q(
        \Reg_File[14][2] ) );
  DFFRQX2M \Reg_File_reg[14][1]  ( .D(n162), .CK(CLK), .RN(n212), .Q(
        \Reg_File[14][1] ) );
  DFFRQX2M \Reg_File_reg[14][0]  ( .D(n161), .CK(CLK), .RN(n212), .Q(
        \Reg_File[14][0] ) );
  DFFRQX2M \Reg_File_reg[10][7]  ( .D(n136), .CK(CLK), .RN(n210), .Q(
        \Reg_File[10][7] ) );
  DFFRQX2M \Reg_File_reg[10][6]  ( .D(n135), .CK(CLK), .RN(n210), .Q(
        \Reg_File[10][6] ) );
  DFFRQX2M \Reg_File_reg[10][5]  ( .D(n134), .CK(CLK), .RN(n210), .Q(
        \Reg_File[10][5] ) );
  DFFRQX2M \Reg_File_reg[10][4]  ( .D(n133), .CK(CLK), .RN(n210), .Q(
        \Reg_File[10][4] ) );
  DFFRQX2M \Reg_File_reg[10][3]  ( .D(n132), .CK(CLK), .RN(n210), .Q(
        \Reg_File[10][3] ) );
  DFFRQX2M \Reg_File_reg[10][2]  ( .D(n131), .CK(CLK), .RN(n210), .Q(
        \Reg_File[10][2] ) );
  DFFRQX2M \Reg_File_reg[10][1]  ( .D(n130), .CK(CLK), .RN(n210), .Q(
        \Reg_File[10][1] ) );
  DFFRQX2M \Reg_File_reg[10][0]  ( .D(n129), .CK(CLK), .RN(n210), .Q(
        \Reg_File[10][0] ) );
  DFFRQX2M \Reg_File_reg[6][7]  ( .D(n104), .CK(CLK), .RN(n208), .Q(
        \Reg_File[6][7] ) );
  DFFRQX2M \Reg_File_reg[6][6]  ( .D(n103), .CK(CLK), .RN(n208), .Q(
        \Reg_File[6][6] ) );
  DFFRQX2M \Reg_File_reg[6][5]  ( .D(n102), .CK(CLK), .RN(n208), .Q(
        \Reg_File[6][5] ) );
  DFFRQX2M \Reg_File_reg[6][4]  ( .D(n101), .CK(CLK), .RN(n208), .Q(
        \Reg_File[6][4] ) );
  DFFRQX2M \Reg_File_reg[6][3]  ( .D(n100), .CK(CLK), .RN(n208), .Q(
        \Reg_File[6][3] ) );
  DFFRQX2M \Reg_File_reg[6][2]  ( .D(n99), .CK(CLK), .RN(n207), .Q(
        \Reg_File[6][2] ) );
  DFFRQX2M \Reg_File_reg[6][1]  ( .D(n98), .CK(CLK), .RN(n207), .Q(
        \Reg_File[6][1] ) );
  DFFRQX2M \Reg_File_reg[6][0]  ( .D(n97), .CK(CLK), .RN(n207), .Q(
        \Reg_File[6][0] ) );
  DFFRQX2M \Reg_File_reg[12][7]  ( .D(n152), .CK(CLK), .RN(n211), .Q(
        \Reg_File[12][7] ) );
  DFFRQX2M \Reg_File_reg[12][6]  ( .D(n151), .CK(CLK), .RN(n211), .Q(
        \Reg_File[12][6] ) );
  DFFRQX2M \Reg_File_reg[12][5]  ( .D(n150), .CK(CLK), .RN(n211), .Q(
        \Reg_File[12][5] ) );
  DFFRQX2M \Reg_File_reg[12][4]  ( .D(n149), .CK(CLK), .RN(n211), .Q(
        \Reg_File[12][4] ) );
  DFFRQX2M \Reg_File_reg[12][3]  ( .D(n148), .CK(CLK), .RN(n211), .Q(
        \Reg_File[12][3] ) );
  DFFRQX2M \Reg_File_reg[12][2]  ( .D(n147), .CK(CLK), .RN(n211), .Q(
        \Reg_File[12][2] ) );
  DFFRQX2M \Reg_File_reg[12][1]  ( .D(n146), .CK(CLK), .RN(n211), .Q(
        \Reg_File[12][1] ) );
  DFFRQX2M \Reg_File_reg[12][0]  ( .D(n145), .CK(CLK), .RN(n211), .Q(
        \Reg_File[12][0] ) );
  DFFRQX2M \Reg_File_reg[8][7]  ( .D(n120), .CK(CLK), .RN(n209), .Q(
        \Reg_File[8][7] ) );
  DFFRQX2M \Reg_File_reg[8][6]  ( .D(n119), .CK(CLK), .RN(n209), .Q(
        \Reg_File[8][6] ) );
  DFFRQX2M \Reg_File_reg[8][5]  ( .D(n118), .CK(CLK), .RN(n209), .Q(
        \Reg_File[8][5] ) );
  DFFRQX2M \Reg_File_reg[8][4]  ( .D(n117), .CK(CLK), .RN(n209), .Q(
        \Reg_File[8][4] ) );
  DFFRQX2M \Reg_File_reg[8][3]  ( .D(n116), .CK(CLK), .RN(n209), .Q(
        \Reg_File[8][3] ) );
  DFFRQX2M \Reg_File_reg[8][2]  ( .D(n115), .CK(CLK), .RN(n209), .Q(
        \Reg_File[8][2] ) );
  DFFRQX2M \Reg_File_reg[8][1]  ( .D(n114), .CK(CLK), .RN(n209), .Q(
        \Reg_File[8][1] ) );
  DFFRQX2M \Reg_File_reg[8][0]  ( .D(n113), .CK(CLK), .RN(n208), .Q(
        \Reg_File[8][0] ) );
  DFFRQX2M \Reg_File_reg[4][7]  ( .D(n88), .CK(CLK), .RN(n207), .Q(
        \Reg_File[4][7] ) );
  DFFRQX2M \Reg_File_reg[4][6]  ( .D(n87), .CK(CLK), .RN(n207), .Q(
        \Reg_File[4][6] ) );
  DFFRQX2M \Reg_File_reg[4][5]  ( .D(n86), .CK(CLK), .RN(n207), .Q(
        \Reg_File[4][5] ) );
  DFFRQX2M \Reg_File_reg[4][4]  ( .D(n85), .CK(CLK), .RN(n207), .Q(
        \Reg_File[4][4] ) );
  DFFRQX2M \Reg_File_reg[4][3]  ( .D(n84), .CK(CLK), .RN(n206), .Q(
        \Reg_File[4][3] ) );
  DFFRQX2M \Reg_File_reg[4][2]  ( .D(n83), .CK(CLK), .RN(n206), .Q(
        \Reg_File[4][2] ) );
  DFFRQX2M \Reg_File_reg[4][1]  ( .D(n82), .CK(CLK), .RN(n206), .Q(
        \Reg_File[4][1] ) );
  DFFRQX2M \Reg_File_reg[4][0]  ( .D(n81), .CK(CLK), .RN(n206), .Q(
        \Reg_File[4][0] ) );
  DFFRQX2M \RdData_reg[7]  ( .D(n47), .CK(CLK), .RN(n204), .Q(RdData[7]) );
  DFFRQX2M \RdData_reg[6]  ( .D(n46), .CK(CLK), .RN(n204), .Q(RdData[6]) );
  DFFRQX2M \RdData_reg[5]  ( .D(n45), .CK(CLK), .RN(n204), .Q(RdData[5]) );
  DFFRQX2M \RdData_reg[4]  ( .D(n44), .CK(CLK), .RN(n206), .Q(RdData[4]) );
  DFFRQX2M \RdData_reg[3]  ( .D(n43), .CK(CLK), .RN(n204), .Q(RdData[3]) );
  DFFRQX2M \RdData_reg[2]  ( .D(n42), .CK(CLK), .RN(n204), .Q(RdData[2]) );
  DFFRQX2M \RdData_reg[1]  ( .D(n41), .CK(CLK), .RN(n204), .Q(RdData[1]) );
  DFFRQX2M \Reg_File_reg[2][1]  ( .D(n66), .CK(CLK), .RN(n205), .Q(REG2[1]) );
  DFFSQX2M \Reg_File_reg[2][0]  ( .D(n65), .CK(CLK), .SN(n204), .Q(REG2[0]) );
  DFFRQX2M \Reg_File_reg[3][0]  ( .D(n73), .CK(CLK), .RN(n206), .Q(REG3[0]) );
  DFFRQX2M \Reg_File_reg[3][3]  ( .D(n76), .CK(CLK), .RN(n206), .Q(REG3[3]) );
  DFFRQX2M \Reg_File_reg[3][2]  ( .D(n75), .CK(CLK), .RN(n206), .Q(REG3[2]) );
  DFFSQX2M \Reg_File_reg[3][5]  ( .D(n78), .CK(CLK), .SN(n204), .Q(REG3[5]) );
  DFFRQX2M \Reg_File_reg[3][7]  ( .D(n80), .CK(CLK), .RN(n206), .Q(REG3[7]) );
  DFFRQX2M \Reg_File_reg[3][6]  ( .D(n79), .CK(CLK), .RN(n206), .Q(REG3[6]) );
  DFFRQX2M \Reg_File_reg[3][4]  ( .D(n77), .CK(CLK), .RN(n206), .Q(REG3[4]) );
  DFFRQX2M \Reg_File_reg[3][1]  ( .D(n74), .CK(CLK), .RN(n206), .Q(REG3[1]) );
  DFFRQX2M \Reg_File_reg[2][4]  ( .D(n69), .CK(CLK), .RN(n206), .Q(REG2[4]) );
  DFFRQX2M \Reg_File_reg[2][3]  ( .D(n68), .CK(CLK), .RN(n205), .Q(REG2[3]) );
  DFFSQX2M \Reg_File_reg[2][7]  ( .D(n72), .CK(CLK), .SN(n204), .Q(REG2[7]) );
  DFFRQX2M \Reg_File_reg[2][2]  ( .D(n67), .CK(CLK), .RN(n205), .Q(REG2[2]) );
  DFFRQX2M \Reg_File_reg[2][6]  ( .D(n71), .CK(CLK), .RN(n206), .Q(REG2[6]) );
  DFFRQX2M RdData_VLD_reg ( .D(n48), .CK(CLK), .RN(n204), .Q(RdData_VLD) );
  DFFRQX2M \Reg_File_reg[0][2]  ( .D(n51), .CK(CLK), .RN(n205), .Q(REG0[2]) );
  DFFRQX2M \Reg_File_reg[0][1]  ( .D(n50), .CK(CLK), .RN(n205), .Q(REG0[1]) );
  DFFRQX2M \Reg_File_reg[0][0]  ( .D(n49), .CK(CLK), .RN(n204), .Q(REG0[0]) );
  DFFRQX2M \Reg_File_reg[0][3]  ( .D(n52), .CK(CLK), .RN(n205), .Q(REG0[3]) );
  DFFRQX2M \Reg_File_reg[0][4]  ( .D(n53), .CK(CLK), .RN(n205), .Q(REG0[4]) );
  DFFRQX2M \Reg_File_reg[2][5]  ( .D(n70), .CK(CLK), .RN(n206), .Q(REG2[5]) );
  DFFRQX1M \Reg_File_reg[0][5]  ( .D(n54), .CK(CLK), .RN(RST), .Q(REG0[5]) );
  DFFRHQX2M \Reg_File_reg[1][2]  ( .D(n59), .CK(CLK), .RN(n205), .Q(REG1[2])
         );
  DFFRHQX2M \Reg_File_reg[1][4]  ( .D(n61), .CK(CLK), .RN(n205), .Q(REG1[4])
         );
  DFFRHQX1M \Reg_File_reg[0][7]  ( .D(n56), .CK(CLK), .RN(n205), .Q(REG0[7])
         );
  DFFRQX2M \Reg_File_reg[0][6]  ( .D(n55), .CK(CLK), .RN(n205), .Q(REG0[6]) );
  DFFRHQX1M \Reg_File_reg[1][0]  ( .D(n57), .CK(CLK), .RN(n204), .Q(REG1[0])
         );
  DFFRHQX1M \Reg_File_reg[1][3]  ( .D(n60), .CK(CLK), .RN(n205), .Q(REG1[3])
         );
  DFFRHQX8M \Reg_File_reg[1][7]  ( .D(n64), .CK(CLK), .RN(n204), .Q(REG1[7])
         );
  DFFRHQX2M \Reg_File_reg[1][5]  ( .D(n62), .CK(CLK), .RN(n205), .Q(REG1[5])
         );
  DFFRHQX4M \Reg_File_reg[1][6]  ( .D(n63), .CK(CLK), .RN(n204), .Q(REG1[6])
         );
  DFFRHQX4M \Reg_File_reg[1][1]  ( .D(n58), .CK(CLK), .RN(n205), .Q(REG1[1])
         );
  MX2XLM U3 ( .A(REG1[7]), .B(WrData[7]), .S0(n1), .Y(n64) );
  NOR2X2M U4 ( .A(n221), .B(n220), .Y(n1) );
  NOR2BX2M U5 ( .AN(N13), .B(N12), .Y(n23) );
  NOR2BX2M U6 ( .AN(N13), .B(n203), .Y(n26) );
  NOR2X2M U7 ( .A(n203), .B(N13), .Y(n20) );
  MX2XLM U8 ( .A(REG0[5]), .B(WrData[5]), .S0(n219), .Y(n54) );
  MX2XLM U9 ( .A(REG0[6]), .B(WrData[6]), .S0(n219), .Y(n55) );
  INVX2M U10 ( .A(n199), .Y(n201) );
  INVX2M U11 ( .A(n199), .Y(n200) );
  BUFX2M U12 ( .A(n202), .Y(n199) );
  INVX2M U13 ( .A(n14), .Y(n219) );
  INVX2M U14 ( .A(n203), .Y(n198) );
  NAND2BX2M U15 ( .AN(n221), .B(n16), .Y(n14) );
  INVX2M U16 ( .A(n18), .Y(n220) );
  NOR2BX2M U17 ( .AN(n38), .B(n200), .Y(n30) );
  NOR2BX2M U18 ( .AN(n38), .B(n202), .Y(n32) );
  NOR2BX2M U19 ( .AN(n27), .B(n200), .Y(n16) );
  NOR2BX2M U20 ( .AN(n27), .B(n202), .Y(n18) );
  NAND2X2M U21 ( .A(n30), .B(n20), .Y(n33) );
  NAND2X2M U22 ( .A(n32), .B(n20), .Y(n34) );
  NAND2X2M U23 ( .A(n30), .B(n15), .Y(n29) );
  NAND2X2M U24 ( .A(n32), .B(n15), .Y(n31) );
  NAND2X2M U25 ( .A(n30), .B(n23), .Y(n35) );
  NAND2X2M U26 ( .A(n32), .B(n23), .Y(n36) );
  NAND2X2M U27 ( .A(n30), .B(n26), .Y(n37) );
  NAND2X2M U28 ( .A(n32), .B(n26), .Y(n39) );
  NAND2X2M U29 ( .A(n20), .B(n16), .Y(n19) );
  NAND2X2M U30 ( .A(n20), .B(n18), .Y(n21) );
  NAND2X2M U31 ( .A(n23), .B(n16), .Y(n22) );
  NAND2X2M U32 ( .A(n23), .B(n18), .Y(n24) );
  NAND2X2M U33 ( .A(n26), .B(n16), .Y(n25) );
  NAND2X2M U34 ( .A(n26), .B(n18), .Y(n28) );
  INVX2M U35 ( .A(WrData[0]), .Y(n222) );
  INVX2M U36 ( .A(WrData[1]), .Y(n223) );
  INVX2M U37 ( .A(WrData[2]), .Y(n224) );
  INVX2M U38 ( .A(WrData[3]), .Y(n225) );
  INVX2M U39 ( .A(WrData[4]), .Y(n226) );
  INVX2M U40 ( .A(WrData[6]), .Y(n228) );
  INVX2M U41 ( .A(n12), .Y(n230) );
  INVX2M U42 ( .A(n15), .Y(n221) );
  BUFX2M U43 ( .A(n218), .Y(n204) );
  BUFX2M U44 ( .A(n218), .Y(n205) );
  BUFX2M U45 ( .A(n217), .Y(n206) );
  BUFX2M U46 ( .A(n217), .Y(n207) );
  BUFX2M U47 ( .A(n216), .Y(n208) );
  BUFX2M U48 ( .A(n216), .Y(n209) );
  BUFX2M U49 ( .A(n215), .Y(n210) );
  BUFX2M U50 ( .A(n215), .Y(n211) );
  BUFX2M U51 ( .A(n214), .Y(n212) );
  BUFX2M U52 ( .A(n214), .Y(n213) );
  INVX2M U53 ( .A(N11), .Y(n202) );
  NOR2X2M U54 ( .A(N12), .B(N13), .Y(n15) );
  INVX2M U55 ( .A(WrData[5]), .Y(n227) );
  INVX2M U56 ( .A(WrData[7]), .Y(n229) );
  NAND2BX2M U57 ( .AN(WrEn), .B(RdEn), .Y(n12) );
  NOR2BX2M U58 ( .AN(n13), .B(N14), .Y(n27) );
  NOR2BX2M U59 ( .AN(WrEn), .B(RdEn), .Y(n13) );
  AND2X2M U60 ( .A(N14), .B(n13), .Y(n38) );
  INVX2M U61 ( .A(N12), .Y(n203) );
  BUFX2M U62 ( .A(RST), .Y(n217) );
  BUFX2M U63 ( .A(RST), .Y(n216) );
  BUFX2M U64 ( .A(RST), .Y(n215) );
  BUFX2M U65 ( .A(RST), .Y(n214) );
  BUFX2M U66 ( .A(RST), .Y(n218) );
  AO22X1M U67 ( .A0(N43), .A1(n230), .B0(RdData[0]), .B1(n12), .Y(n40) );
  MX4X1M U68 ( .A(n5), .B(n3), .C(n4), .D(n2), .S0(N14), .S1(N13), .Y(N43) );
  MX4X1M U69 ( .A(\Reg_File[8][0] ), .B(\Reg_File[9][0] ), .C(
        \Reg_File[10][0] ), .D(\Reg_File[11][0] ), .S0(n200), .S1(N12), .Y(n3)
         );
  MX4X1M U70 ( .A(\Reg_File[4][0] ), .B(\Reg_File[5][0] ), .C(\Reg_File[6][0] ), .D(\Reg_File[7][0] ), .S0(n200), .S1(N12), .Y(n4) );
  AO22X1M U71 ( .A0(N42), .A1(n230), .B0(RdData[1]), .B1(n12), .Y(n41) );
  MX4X1M U72 ( .A(n9), .B(n7), .C(n8), .D(n6), .S0(N14), .S1(N13), .Y(N42) );
  MX4X1M U73 ( .A(\Reg_File[8][1] ), .B(\Reg_File[9][1] ), .C(
        \Reg_File[10][1] ), .D(\Reg_File[11][1] ), .S0(n200), .S1(N12), .Y(n7)
         );
  MX4X1M U74 ( .A(\Reg_File[12][1] ), .B(\Reg_File[13][1] ), .C(
        \Reg_File[14][1] ), .D(\Reg_File[15][1] ), .S0(n200), .S1(N12), .Y(n6)
         );
  AO22X1M U75 ( .A0(N41), .A1(n230), .B0(RdData[2]), .B1(n12), .Y(n42) );
  MX4X1M U76 ( .A(n177), .B(n11), .C(n17), .D(n10), .S0(N14), .S1(N13), .Y(N41) );
  MX4XLM U77 ( .A(REG0[2]), .B(REG1[2]), .C(REG2[2]), .D(REG3[2]), .S0(n201), 
        .S1(N12), .Y(n177) );
  MX4X1M U78 ( .A(\Reg_File[8][2] ), .B(\Reg_File[9][2] ), .C(
        \Reg_File[10][2] ), .D(\Reg_File[11][2] ), .S0(n201), .S1(N12), .Y(n11) );
  AO22X1M U79 ( .A0(N40), .A1(n230), .B0(RdData[3]), .B1(n12), .Y(n43) );
  MX4X1M U80 ( .A(n181), .B(n179), .C(n180), .D(n178), .S0(N14), .S1(N13), .Y(
        N40) );
  MX4XLM U81 ( .A(REG0[3]), .B(REG1[3]), .C(REG2[3]), .D(REG3[3]), .S0(n201), 
        .S1(N12), .Y(n181) );
  MX4X1M U82 ( .A(\Reg_File[8][3] ), .B(\Reg_File[9][3] ), .C(
        \Reg_File[10][3] ), .D(\Reg_File[11][3] ), .S0(n201), .S1(N12), .Y(
        n179) );
  AO22X1M U83 ( .A0(N39), .A1(n230), .B0(RdData[4]), .B1(n12), .Y(n44) );
  MX4X1M U84 ( .A(n185), .B(n183), .C(n184), .D(n182), .S0(N14), .S1(N13), .Y(
        N39) );
  MX4XLM U85 ( .A(REG0[4]), .B(REG1[4]), .C(REG2[4]), .D(REG3[4]), .S0(n200), 
        .S1(N12), .Y(n185) );
  MX4X1M U86 ( .A(\Reg_File[8][4] ), .B(\Reg_File[9][4] ), .C(
        \Reg_File[10][4] ), .D(\Reg_File[11][4] ), .S0(n201), .S1(N12), .Y(
        n183) );
  AO22X1M U87 ( .A0(N38), .A1(n230), .B0(RdData[5]), .B1(n12), .Y(n45) );
  MX4X1M U88 ( .A(n189), .B(n187), .C(n188), .D(n186), .S0(N14), .S1(N13), .Y(
        N38) );
  MX4XLM U89 ( .A(REG0[5]), .B(REG1[5]), .C(REG2[5]), .D(REG3[5]), .S0(n200), 
        .S1(n198), .Y(n189) );
  MX4X1M U90 ( .A(\Reg_File[8][5] ), .B(\Reg_File[9][5] ), .C(
        \Reg_File[10][5] ), .D(\Reg_File[11][5] ), .S0(N11), .S1(n198), .Y(
        n187) );
  AO22X1M U91 ( .A0(N37), .A1(n230), .B0(RdData[6]), .B1(n12), .Y(n46) );
  MX4X1M U92 ( .A(n193), .B(n191), .C(n192), .D(n190), .S0(N14), .S1(N13), .Y(
        N37) );
  MX4X1M U93 ( .A(\Reg_File[8][6] ), .B(\Reg_File[9][6] ), .C(
        \Reg_File[10][6] ), .D(\Reg_File[11][6] ), .S0(N11), .S1(n198), .Y(
        n191) );
  MX4X1M U94 ( .A(\Reg_File[4][6] ), .B(\Reg_File[5][6] ), .C(\Reg_File[6][6] ), .D(\Reg_File[7][6] ), .S0(n201), .S1(n198), .Y(n192) );
  AO22X1M U95 ( .A0(N36), .A1(n230), .B0(RdData[7]), .B1(n12), .Y(n47) );
  MX4X1M U96 ( .A(n197), .B(n195), .C(n196), .D(n194), .S0(N14), .S1(N13), .Y(
        N36) );
  MX4X1M U97 ( .A(\Reg_File[8][7] ), .B(\Reg_File[9][7] ), .C(
        \Reg_File[10][7] ), .D(\Reg_File[11][7] ), .S0(N11), .S1(n198), .Y(
        n195) );
  MX4X1M U98 ( .A(\Reg_File[4][7] ), .B(\Reg_File[5][7] ), .C(\Reg_File[6][7] ), .D(\Reg_File[7][7] ), .S0(N11), .S1(n198), .Y(n196) );
  MX4XLM U99 ( .A(REG0[1]), .B(REG1[1]), .C(REG2[1]), .D(REG3[1]), .S0(n201), 
        .S1(N12), .Y(n9) );
  MX4X1M U100 ( .A(\Reg_File[4][1] ), .B(\Reg_File[5][1] ), .C(
        \Reg_File[6][1] ), .D(\Reg_File[7][1] ), .S0(n201), .S1(N12), .Y(n8)
         );
  MX4X1M U101 ( .A(\Reg_File[4][2] ), .B(\Reg_File[5][2] ), .C(
        \Reg_File[6][2] ), .D(\Reg_File[7][2] ), .S0(n201), .S1(N12), .Y(n17)
         );
  MX4X1M U102 ( .A(\Reg_File[4][3] ), .B(\Reg_File[5][3] ), .C(
        \Reg_File[6][3] ), .D(\Reg_File[7][3] ), .S0(n201), .S1(N12), .Y(n180)
         );
  MX4X1M U103 ( .A(\Reg_File[4][4] ), .B(\Reg_File[5][4] ), .C(
        \Reg_File[6][4] ), .D(\Reg_File[7][4] ), .S0(n201), .S1(N12), .Y(n184)
         );
  MX4X1M U104 ( .A(\Reg_File[4][5] ), .B(\Reg_File[5][5] ), .C(
        \Reg_File[6][5] ), .D(\Reg_File[7][5] ), .S0(N11), .S1(n198), .Y(n188)
         );
  MX4X1M U105 ( .A(\Reg_File[12][0] ), .B(\Reg_File[13][0] ), .C(
        \Reg_File[14][0] ), .D(\Reg_File[15][0] ), .S0(n200), .S1(n198), .Y(n2) );
  MX4X1M U106 ( .A(\Reg_File[12][2] ), .B(\Reg_File[13][2] ), .C(
        \Reg_File[14][2] ), .D(\Reg_File[15][2] ), .S0(n201), .S1(N12), .Y(n10) );
  MX4X1M U107 ( .A(\Reg_File[12][3] ), .B(\Reg_File[13][3] ), .C(
        \Reg_File[14][3] ), .D(\Reg_File[15][3] ), .S0(n201), .S1(N12), .Y(
        n178) );
  MX4X1M U108 ( .A(\Reg_File[12][4] ), .B(\Reg_File[13][4] ), .C(
        \Reg_File[14][4] ), .D(\Reg_File[15][4] ), .S0(n201), .S1(N12), .Y(
        n182) );
  MX4X1M U109 ( .A(\Reg_File[12][5] ), .B(\Reg_File[13][5] ), .C(
        \Reg_File[14][5] ), .D(\Reg_File[15][5] ), .S0(n200), .S1(n198), .Y(
        n186) );
  MX4X1M U110 ( .A(\Reg_File[12][6] ), .B(\Reg_File[13][6] ), .C(
        \Reg_File[14][6] ), .D(\Reg_File[15][6] ), .S0(n200), .S1(n198), .Y(
        n190) );
  MX4X1M U111 ( .A(\Reg_File[12][7] ), .B(\Reg_File[13][7] ), .C(
        \Reg_File[14][7] ), .D(\Reg_File[15][7] ), .S0(n200), .S1(n198), .Y(
        n194) );
  OAI2BB2X1M U112 ( .B0(n222), .B1(n22), .A0N(\Reg_File[4][0] ), .A1N(n22), 
        .Y(n81) );
  OAI2BB2X1M U113 ( .B0(n223), .B1(n22), .A0N(\Reg_File[4][1] ), .A1N(n22), 
        .Y(n82) );
  OAI2BB2X1M U114 ( .B0(n224), .B1(n22), .A0N(\Reg_File[4][2] ), .A1N(n22), 
        .Y(n83) );
  OAI2BB2X1M U115 ( .B0(n225), .B1(n22), .A0N(\Reg_File[4][3] ), .A1N(n22), 
        .Y(n84) );
  OAI2BB2X1M U116 ( .B0(n226), .B1(n22), .A0N(\Reg_File[4][4] ), .A1N(n22), 
        .Y(n85) );
  OAI2BB2X1M U117 ( .B0(n227), .B1(n22), .A0N(\Reg_File[4][5] ), .A1N(n22), 
        .Y(n86) );
  OAI2BB2X1M U118 ( .B0(n228), .B1(n22), .A0N(\Reg_File[4][6] ), .A1N(n22), 
        .Y(n87) );
  OAI2BB2X1M U119 ( .B0(n229), .B1(n22), .A0N(\Reg_File[4][7] ), .A1N(n22), 
        .Y(n88) );
  OAI2BB2X1M U120 ( .B0(n222), .B1(n24), .A0N(\Reg_File[5][0] ), .A1N(n24), 
        .Y(n89) );
  OAI2BB2X1M U121 ( .B0(n223), .B1(n24), .A0N(\Reg_File[5][1] ), .A1N(n24), 
        .Y(n90) );
  OAI2BB2X1M U122 ( .B0(n224), .B1(n24), .A0N(\Reg_File[5][2] ), .A1N(n24), 
        .Y(n91) );
  OAI2BB2X1M U123 ( .B0(n225), .B1(n24), .A0N(\Reg_File[5][3] ), .A1N(n24), 
        .Y(n92) );
  OAI2BB2X1M U124 ( .B0(n226), .B1(n24), .A0N(\Reg_File[5][4] ), .A1N(n24), 
        .Y(n93) );
  OAI2BB2X1M U125 ( .B0(n227), .B1(n24), .A0N(\Reg_File[5][5] ), .A1N(n24), 
        .Y(n94) );
  OAI2BB2X1M U126 ( .B0(n228), .B1(n24), .A0N(\Reg_File[5][6] ), .A1N(n24), 
        .Y(n95) );
  OAI2BB2X1M U127 ( .B0(n229), .B1(n24), .A0N(\Reg_File[5][7] ), .A1N(n24), 
        .Y(n96) );
  OAI2BB2X1M U128 ( .B0(n222), .B1(n25), .A0N(\Reg_File[6][0] ), .A1N(n25), 
        .Y(n97) );
  OAI2BB2X1M U129 ( .B0(n223), .B1(n25), .A0N(\Reg_File[6][1] ), .A1N(n25), 
        .Y(n98) );
  OAI2BB2X1M U130 ( .B0(n224), .B1(n25), .A0N(\Reg_File[6][2] ), .A1N(n25), 
        .Y(n99) );
  OAI2BB2X1M U131 ( .B0(n225), .B1(n25), .A0N(\Reg_File[6][3] ), .A1N(n25), 
        .Y(n100) );
  OAI2BB2X1M U132 ( .B0(n226), .B1(n25), .A0N(\Reg_File[6][4] ), .A1N(n25), 
        .Y(n101) );
  OAI2BB2X1M U133 ( .B0(n227), .B1(n25), .A0N(\Reg_File[6][5] ), .A1N(n25), 
        .Y(n102) );
  OAI2BB2X1M U134 ( .B0(n228), .B1(n25), .A0N(\Reg_File[6][6] ), .A1N(n25), 
        .Y(n103) );
  OAI2BB2X1M U135 ( .B0(n229), .B1(n25), .A0N(\Reg_File[6][7] ), .A1N(n25), 
        .Y(n104) );
  OAI2BB2X1M U136 ( .B0(n222), .B1(n28), .A0N(\Reg_File[7][0] ), .A1N(n28), 
        .Y(n105) );
  OAI2BB2X1M U137 ( .B0(n223), .B1(n28), .A0N(\Reg_File[7][1] ), .A1N(n28), 
        .Y(n106) );
  OAI2BB2X1M U138 ( .B0(n224), .B1(n28), .A0N(\Reg_File[7][2] ), .A1N(n28), 
        .Y(n107) );
  OAI2BB2X1M U139 ( .B0(n225), .B1(n28), .A0N(\Reg_File[7][3] ), .A1N(n28), 
        .Y(n108) );
  OAI2BB2X1M U140 ( .B0(n226), .B1(n28), .A0N(\Reg_File[7][4] ), .A1N(n28), 
        .Y(n109) );
  OAI2BB2X1M U141 ( .B0(n227), .B1(n28), .A0N(\Reg_File[7][5] ), .A1N(n28), 
        .Y(n110) );
  OAI2BB2X1M U142 ( .B0(n228), .B1(n28), .A0N(\Reg_File[7][6] ), .A1N(n28), 
        .Y(n111) );
  OAI2BB2X1M U143 ( .B0(n229), .B1(n28), .A0N(\Reg_File[7][7] ), .A1N(n28), 
        .Y(n112) );
  OAI2BB2X1M U144 ( .B0(n222), .B1(n29), .A0N(\Reg_File[8][0] ), .A1N(n29), 
        .Y(n113) );
  OAI2BB2X1M U145 ( .B0(n223), .B1(n29), .A0N(\Reg_File[8][1] ), .A1N(n29), 
        .Y(n114) );
  OAI2BB2X1M U146 ( .B0(n224), .B1(n29), .A0N(\Reg_File[8][2] ), .A1N(n29), 
        .Y(n115) );
  OAI2BB2X1M U147 ( .B0(n225), .B1(n29), .A0N(\Reg_File[8][3] ), .A1N(n29), 
        .Y(n116) );
  OAI2BB2X1M U148 ( .B0(n226), .B1(n29), .A0N(\Reg_File[8][4] ), .A1N(n29), 
        .Y(n117) );
  OAI2BB2X1M U149 ( .B0(n227), .B1(n29), .A0N(\Reg_File[8][5] ), .A1N(n29), 
        .Y(n118) );
  OAI2BB2X1M U150 ( .B0(n228), .B1(n29), .A0N(\Reg_File[8][6] ), .A1N(n29), 
        .Y(n119) );
  OAI2BB2X1M U151 ( .B0(n229), .B1(n29), .A0N(\Reg_File[8][7] ), .A1N(n29), 
        .Y(n120) );
  OAI2BB2X1M U152 ( .B0(n222), .B1(n31), .A0N(\Reg_File[9][0] ), .A1N(n31), 
        .Y(n121) );
  OAI2BB2X1M U153 ( .B0(n223), .B1(n31), .A0N(\Reg_File[9][1] ), .A1N(n31), 
        .Y(n122) );
  OAI2BB2X1M U154 ( .B0(n224), .B1(n31), .A0N(\Reg_File[9][2] ), .A1N(n31), 
        .Y(n123) );
  OAI2BB2X1M U155 ( .B0(n225), .B1(n31), .A0N(\Reg_File[9][3] ), .A1N(n31), 
        .Y(n124) );
  OAI2BB2X1M U156 ( .B0(n226), .B1(n31), .A0N(\Reg_File[9][4] ), .A1N(n31), 
        .Y(n125) );
  OAI2BB2X1M U157 ( .B0(n227), .B1(n31), .A0N(\Reg_File[9][5] ), .A1N(n31), 
        .Y(n126) );
  OAI2BB2X1M U158 ( .B0(n228), .B1(n31), .A0N(\Reg_File[9][6] ), .A1N(n31), 
        .Y(n127) );
  OAI2BB2X1M U159 ( .B0(n229), .B1(n31), .A0N(\Reg_File[9][7] ), .A1N(n31), 
        .Y(n128) );
  OAI2BB2X1M U160 ( .B0(n222), .B1(n33), .A0N(\Reg_File[10][0] ), .A1N(n33), 
        .Y(n129) );
  OAI2BB2X1M U161 ( .B0(n223), .B1(n33), .A0N(\Reg_File[10][1] ), .A1N(n33), 
        .Y(n130) );
  OAI2BB2X1M U162 ( .B0(n224), .B1(n33), .A0N(\Reg_File[10][2] ), .A1N(n33), 
        .Y(n131) );
  OAI2BB2X1M U163 ( .B0(n225), .B1(n33), .A0N(\Reg_File[10][3] ), .A1N(n33), 
        .Y(n132) );
  OAI2BB2X1M U164 ( .B0(n226), .B1(n33), .A0N(\Reg_File[10][4] ), .A1N(n33), 
        .Y(n133) );
  OAI2BB2X1M U165 ( .B0(n227), .B1(n33), .A0N(\Reg_File[10][5] ), .A1N(n33), 
        .Y(n134) );
  OAI2BB2X1M U166 ( .B0(n228), .B1(n33), .A0N(\Reg_File[10][6] ), .A1N(n33), 
        .Y(n135) );
  OAI2BB2X1M U167 ( .B0(n229), .B1(n33), .A0N(\Reg_File[10][7] ), .A1N(n33), 
        .Y(n136) );
  OAI2BB2X1M U168 ( .B0(n222), .B1(n34), .A0N(\Reg_File[11][0] ), .A1N(n34), 
        .Y(n137) );
  OAI2BB2X1M U169 ( .B0(n223), .B1(n34), .A0N(\Reg_File[11][1] ), .A1N(n34), 
        .Y(n138) );
  OAI2BB2X1M U170 ( .B0(n224), .B1(n34), .A0N(\Reg_File[11][2] ), .A1N(n34), 
        .Y(n139) );
  OAI2BB2X1M U171 ( .B0(n225), .B1(n34), .A0N(\Reg_File[11][3] ), .A1N(n34), 
        .Y(n140) );
  OAI2BB2X1M U172 ( .B0(n226), .B1(n34), .A0N(\Reg_File[11][4] ), .A1N(n34), 
        .Y(n141) );
  OAI2BB2X1M U173 ( .B0(n227), .B1(n34), .A0N(\Reg_File[11][5] ), .A1N(n34), 
        .Y(n142) );
  OAI2BB2X1M U174 ( .B0(n228), .B1(n34), .A0N(\Reg_File[11][6] ), .A1N(n34), 
        .Y(n143) );
  OAI2BB2X1M U175 ( .B0(n229), .B1(n34), .A0N(\Reg_File[11][7] ), .A1N(n34), 
        .Y(n144) );
  OAI2BB2X1M U176 ( .B0(n222), .B1(n35), .A0N(\Reg_File[12][0] ), .A1N(n35), 
        .Y(n145) );
  OAI2BB2X1M U177 ( .B0(n223), .B1(n35), .A0N(\Reg_File[12][1] ), .A1N(n35), 
        .Y(n146) );
  OAI2BB2X1M U178 ( .B0(n224), .B1(n35), .A0N(\Reg_File[12][2] ), .A1N(n35), 
        .Y(n147) );
  OAI2BB2X1M U179 ( .B0(n225), .B1(n35), .A0N(\Reg_File[12][3] ), .A1N(n35), 
        .Y(n148) );
  OAI2BB2X1M U180 ( .B0(n226), .B1(n35), .A0N(\Reg_File[12][4] ), .A1N(n35), 
        .Y(n149) );
  OAI2BB2X1M U181 ( .B0(n227), .B1(n35), .A0N(\Reg_File[12][5] ), .A1N(n35), 
        .Y(n150) );
  OAI2BB2X1M U182 ( .B0(n228), .B1(n35), .A0N(\Reg_File[12][6] ), .A1N(n35), 
        .Y(n151) );
  OAI2BB2X1M U183 ( .B0(n229), .B1(n35), .A0N(\Reg_File[12][7] ), .A1N(n35), 
        .Y(n152) );
  OAI2BB2X1M U184 ( .B0(n222), .B1(n36), .A0N(\Reg_File[13][0] ), .A1N(n36), 
        .Y(n153) );
  OAI2BB2X1M U185 ( .B0(n223), .B1(n36), .A0N(\Reg_File[13][1] ), .A1N(n36), 
        .Y(n154) );
  OAI2BB2X1M U186 ( .B0(n224), .B1(n36), .A0N(\Reg_File[13][2] ), .A1N(n36), 
        .Y(n155) );
  OAI2BB2X1M U187 ( .B0(n225), .B1(n36), .A0N(\Reg_File[13][3] ), .A1N(n36), 
        .Y(n156) );
  OAI2BB2X1M U188 ( .B0(n226), .B1(n36), .A0N(\Reg_File[13][4] ), .A1N(n36), 
        .Y(n157) );
  OAI2BB2X1M U189 ( .B0(n227), .B1(n36), .A0N(\Reg_File[13][5] ), .A1N(n36), 
        .Y(n158) );
  OAI2BB2X1M U190 ( .B0(n228), .B1(n36), .A0N(\Reg_File[13][6] ), .A1N(n36), 
        .Y(n159) );
  OAI2BB2X1M U191 ( .B0(n229), .B1(n36), .A0N(\Reg_File[13][7] ), .A1N(n36), 
        .Y(n160) );
  OAI2BB2X1M U192 ( .B0(n222), .B1(n37), .A0N(\Reg_File[14][0] ), .A1N(n37), 
        .Y(n161) );
  OAI2BB2X1M U193 ( .B0(n223), .B1(n37), .A0N(\Reg_File[14][1] ), .A1N(n37), 
        .Y(n162) );
  OAI2BB2X1M U194 ( .B0(n224), .B1(n37), .A0N(\Reg_File[14][2] ), .A1N(n37), 
        .Y(n163) );
  OAI2BB2X1M U195 ( .B0(n225), .B1(n37), .A0N(\Reg_File[14][3] ), .A1N(n37), 
        .Y(n164) );
  OAI2BB2X1M U196 ( .B0(n226), .B1(n37), .A0N(\Reg_File[14][4] ), .A1N(n37), 
        .Y(n165) );
  OAI2BB2X1M U197 ( .B0(n227), .B1(n37), .A0N(\Reg_File[14][5] ), .A1N(n37), 
        .Y(n166) );
  OAI2BB2X1M U198 ( .B0(n228), .B1(n37), .A0N(\Reg_File[14][6] ), .A1N(n37), 
        .Y(n167) );
  OAI2BB2X1M U199 ( .B0(n229), .B1(n37), .A0N(\Reg_File[14][7] ), .A1N(n37), 
        .Y(n168) );
  OAI2BB2X1M U200 ( .B0(n222), .B1(n39), .A0N(\Reg_File[15][0] ), .A1N(n39), 
        .Y(n169) );
  OAI2BB2X1M U201 ( .B0(n223), .B1(n39), .A0N(\Reg_File[15][1] ), .A1N(n39), 
        .Y(n170) );
  OAI2BB2X1M U202 ( .B0(n224), .B1(n39), .A0N(\Reg_File[15][2] ), .A1N(n39), 
        .Y(n171) );
  OAI2BB2X1M U203 ( .B0(n225), .B1(n39), .A0N(\Reg_File[15][3] ), .A1N(n39), 
        .Y(n172) );
  OAI2BB2X1M U204 ( .B0(n226), .B1(n39), .A0N(\Reg_File[15][4] ), .A1N(n39), 
        .Y(n173) );
  OAI2BB2X1M U205 ( .B0(n227), .B1(n39), .A0N(\Reg_File[15][5] ), .A1N(n39), 
        .Y(n174) );
  OAI2BB2X1M U206 ( .B0(n228), .B1(n39), .A0N(\Reg_File[15][6] ), .A1N(n39), 
        .Y(n175) );
  OAI2BB2X1M U207 ( .B0(n229), .B1(n39), .A0N(\Reg_File[15][7] ), .A1N(n39), 
        .Y(n176) );
  OAI2BB2X1M U208 ( .B0(n223), .B1(n19), .A0N(REG2[1]), .A1N(n19), .Y(n66) );
  OAI2BB2X1M U209 ( .B0(n224), .B1(n19), .A0N(REG2[2]), .A1N(n19), .Y(n67) );
  OAI2BB2X1M U210 ( .B0(n225), .B1(n19), .A0N(REG2[3]), .A1N(n19), .Y(n68) );
  OAI2BB2X1M U211 ( .B0(n226), .B1(n19), .A0N(REG2[4]), .A1N(n19), .Y(n69) );
  OAI2BB2X1M U212 ( .B0(n227), .B1(n19), .A0N(REG2[5]), .A1N(n19), .Y(n70) );
  OAI2BB2X1M U213 ( .B0(n228), .B1(n19), .A0N(REG2[6]), .A1N(n19), .Y(n71) );
  OAI2BB2X1M U214 ( .B0(n222), .B1(n21), .A0N(REG3[0]), .A1N(n21), .Y(n73) );
  OAI2BB2X1M U215 ( .B0(n223), .B1(n21), .A0N(REG3[1]), .A1N(n21), .Y(n74) );
  OAI2BB2X1M U216 ( .B0(n224), .B1(n21), .A0N(REG3[2]), .A1N(n21), .Y(n75) );
  OAI2BB2X1M U217 ( .B0(n225), .B1(n21), .A0N(REG3[3]), .A1N(n21), .Y(n76) );
  OAI2BB2X1M U218 ( .B0(n226), .B1(n21), .A0N(REG3[4]), .A1N(n21), .Y(n77) );
  OAI2BB2X1M U219 ( .B0(n228), .B1(n21), .A0N(REG3[6]), .A1N(n21), .Y(n79) );
  OAI2BB2X1M U220 ( .B0(n229), .B1(n21), .A0N(REG3[7]), .A1N(n21), .Y(n80) );
  OAI2BB2X1M U221 ( .B0(n222), .B1(n19), .A0N(REG2[0]), .A1N(n19), .Y(n65) );
  OAI2BB2X1M U222 ( .B0(n229), .B1(n19), .A0N(REG2[7]), .A1N(n19), .Y(n72) );
  OAI2BB2X1M U223 ( .B0(n227), .B1(n21), .A0N(REG3[5]), .A1N(n21), .Y(n78) );
  OAI2BB2X1M U224 ( .B0(n14), .B1(n222), .A0N(REG0[0]), .A1N(n14), .Y(n49) );
  OAI2BB2X1M U225 ( .B0(n14), .B1(n223), .A0N(REG0[1]), .A1N(n14), .Y(n50) );
  OAI2BB2X1M U226 ( .B0(n14), .B1(n224), .A0N(REG0[2]), .A1N(n14), .Y(n51) );
  OAI2BB2X1M U227 ( .B0(n14), .B1(n225), .A0N(REG0[3]), .A1N(n14), .Y(n52) );
  OAI2BB2X1M U228 ( .B0(n14), .B1(n226), .A0N(REG0[4]), .A1N(n14), .Y(n53) );
  MX2XLM U229 ( .A(REG1[5]), .B(WrData[5]), .S0(n1), .Y(n62) );
  MX2XLM U230 ( .A(REG1[1]), .B(WrData[1]), .S0(n1), .Y(n58) );
  MX2XLM U231 ( .A(REG1[2]), .B(WrData[2]), .S0(n1), .Y(n59) );
  MX2XLM U232 ( .A(REG1[3]), .B(WrData[3]), .S0(n1), .Y(n60) );
  MX2XLM U233 ( .A(REG1[4]), .B(WrData[4]), .S0(n1), .Y(n61) );
  OAI2BB1X2M U234 ( .A0N(RdData_VLD), .A1N(n13), .B0(n12), .Y(n48) );
  MX4XLM U235 ( .A(REG0[7]), .B(REG1[7]), .C(REG2[7]), .D(REG3[7]), .S0(n200), 
        .S1(n198), .Y(n197) );
  MX4XLM U236 ( .A(REG0[6]), .B(REG1[6]), .C(REG2[6]), .D(REG3[6]), .S0(n200), 
        .S1(n198), .Y(n193) );
  MX4XLM U237 ( .A(REG0[0]), .B(REG1[0]), .C(REG2[0]), .D(REG3[0]), .S0(n200), 
        .S1(N12), .Y(n5) );
  MX2XLM U238 ( .A(REG1[0]), .B(WrData[0]), .S0(n1), .Y(n57) );
  MX2XLM U239 ( .A(REG1[6]), .B(WrData[6]), .S0(n1), .Y(n63) );
  MX2XLM U240 ( .A(REG0[7]), .B(WrData[7]), .S0(n219), .Y(n56) );
endmodule


module ALU_IN_WIDTH8_OUT_WIDTH16_DW01_sub_0 ( A, B, CI, DIFF, CO );
  input [8:0] A;
  input [8:0] B;
  output [8:0] DIFF;
  input CI;
  output CO;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9;
  wire   [9:0] carry;

  ADDFX2M U2_1 ( .A(A[1]), .B(n8), .CI(carry[1]), .CO(carry[2]), .S(DIFF[1])
         );
  ADDFX2M U2_5 ( .A(A[5]), .B(n4), .CI(carry[5]), .CO(carry[6]), .S(DIFF[5])
         );
  ADDFX2M U2_4 ( .A(A[4]), .B(n5), .CI(carry[4]), .CO(carry[5]), .S(DIFF[4])
         );
  ADDFX2M U2_3 ( .A(A[3]), .B(n6), .CI(carry[3]), .CO(carry[4]), .S(DIFF[3])
         );
  ADDFX2M U2_2 ( .A(A[2]), .B(n7), .CI(carry[2]), .CO(carry[3]), .S(DIFF[2])
         );
  ADDFX2M U2_7 ( .A(A[7]), .B(n2), .CI(carry[7]), .CO(carry[8]), .S(DIFF[7])
         );
  ADDFX2M U2_6 ( .A(A[6]), .B(n3), .CI(carry[6]), .CO(carry[7]), .S(DIFF[6])
         );
  INVXLM U1 ( .A(B[2]), .Y(n7) );
  INVXLM U2 ( .A(B[3]), .Y(n6) );
  INVXLM U3 ( .A(B[4]), .Y(n5) );
  INVXLM U4 ( .A(B[5]), .Y(n4) );
  INVXLM U5 ( .A(B[1]), .Y(n8) );
  NAND2X2M U6 ( .A(B[0]), .B(n1), .Y(carry[1]) );
  INVX2M U7 ( .A(A[0]), .Y(n1) );
  XNOR2X2M U8 ( .A(n9), .B(A[0]), .Y(DIFF[0]) );
  INVXLM U9 ( .A(B[6]), .Y(n3) );
  INVXLM U10 ( .A(B[0]), .Y(n9) );
  INVXLM U11 ( .A(B[7]), .Y(n2) );
  CLKINVX1M U12 ( .A(carry[8]), .Y(DIFF[8]) );
endmodule


module ALU_IN_WIDTH8_OUT_WIDTH16_DW01_add_0 ( A, B, CI, SUM, CO );
  input [8:0] A;
  input [8:0] B;
  output [8:0] SUM;
  input CI;
  output CO;

  wire   [8:1] carry;

  ADDFX2M U1_6 ( .A(A[6]), .B(B[6]), .CI(carry[6]), .CO(carry[7]), .S(SUM[6])
         );
  ADDFX2M U1_5 ( .A(A[5]), .B(B[5]), .CI(carry[5]), .CO(carry[6]), .S(SUM[5])
         );
  ADDFX2M U1_4 ( .A(A[4]), .B(B[4]), .CI(carry[4]), .CO(carry[5]), .S(SUM[4])
         );
  ADDFX2M U1_3 ( .A(A[3]), .B(B[3]), .CI(carry[3]), .CO(carry[4]), .S(SUM[3])
         );
  ADDFX2M U1_2 ( .A(A[2]), .B(B[2]), .CI(carry[2]), .CO(carry[3]), .S(SUM[2])
         );
  ADDFX2M U1_1 ( .A(A[1]), .B(B[1]), .CI(carry[1]), .CO(carry[2]), .S(SUM[1])
         );
  ADDFX2M U1_7 ( .A(A[7]), .B(B[7]), .CI(carry[7]), .CO(SUM[8]), .S(SUM[7]) );
  ADDFX2M U1_0 ( .A(A[0]), .B(B[0]), .CI(1'b0), .CO(carry[1]), .S(SUM[0]) );
endmodule


module ALU_IN_WIDTH8_OUT_WIDTH16_DW01_add_1 ( A, B, CI, SUM, CO );
  input [13:0] A;
  input [13:0] B;
  output [13:0] SUM;
  input CI;
  output CO;
  wire   n1, n8, n9, n10, n11, n12, n13, n14, n15, n16, n17, n18, n19, n20,
         n21, n22, n23, n24, n25, n26, n27;

  AOI21BX2M U2 ( .A0(n18), .A1(A[12]), .B0N(n19), .Y(n1) );
  XNOR2X2M U3 ( .A(B[13]), .B(n1), .Y(SUM[13]) );
  NAND2X2M U4 ( .A(A[7]), .B(B[7]), .Y(n15) );
  XNOR2X2M U5 ( .A(A[7]), .B(n8), .Y(SUM[7]) );
  INVX2M U6 ( .A(B[7]), .Y(n8) );
  INVX2M U7 ( .A(A[6]), .Y(n9) );
  INVX2M U8 ( .A(n9), .Y(SUM[6]) );
  BUFX2M U9 ( .A(A[0]), .Y(SUM[0]) );
  BUFX2M U10 ( .A(A[1]), .Y(SUM[1]) );
  BUFX2M U11 ( .A(A[2]), .Y(SUM[2]) );
  BUFX2M U12 ( .A(A[3]), .Y(SUM[3]) );
  BUFX2M U13 ( .A(A[4]), .Y(SUM[4]) );
  BUFX2M U14 ( .A(A[5]), .Y(SUM[5]) );
  XNOR2X1M U15 ( .A(n10), .B(n11), .Y(SUM[9]) );
  NOR2X1M U16 ( .A(n12), .B(n13), .Y(n11) );
  CLKXOR2X2M U17 ( .A(n14), .B(n15), .Y(SUM[8]) );
  NAND2BX1M U18 ( .AN(n16), .B(n17), .Y(n14) );
  OAI21X1M U19 ( .A0(A[12]), .A1(n18), .B0(B[12]), .Y(n19) );
  XOR3XLM U20 ( .A(B[12]), .B(A[12]), .C(n18), .Y(SUM[12]) );
  OAI21BX1M U21 ( .A0(n20), .A1(n21), .B0N(n22), .Y(n18) );
  XNOR2X1M U22 ( .A(n21), .B(n23), .Y(SUM[11]) );
  NOR2X1M U23 ( .A(n22), .B(n20), .Y(n23) );
  NOR2X1M U24 ( .A(B[11]), .B(A[11]), .Y(n20) );
  AND2X1M U25 ( .A(B[11]), .B(A[11]), .Y(n22) );
  OA21X1M U26 ( .A0(n24), .A1(n25), .B0(n26), .Y(n21) );
  CLKXOR2X2M U27 ( .A(n27), .B(n25), .Y(SUM[10]) );
  AOI2BB1X1M U28 ( .A0N(n10), .A1N(n13), .B0(n12), .Y(n25) );
  AND2X1M U29 ( .A(B[9]), .B(A[9]), .Y(n12) );
  NOR2X1M U30 ( .A(B[9]), .B(A[9]), .Y(n13) );
  OA21X1M U31 ( .A0(n15), .A1(n16), .B0(n17), .Y(n10) );
  CLKNAND2X2M U32 ( .A(B[8]), .B(A[8]), .Y(n17) );
  NOR2X1M U33 ( .A(B[8]), .B(A[8]), .Y(n16) );
  NAND2BX1M U34 ( .AN(n24), .B(n26), .Y(n27) );
  CLKNAND2X2M U35 ( .A(B[10]), .B(A[10]), .Y(n26) );
  NOR2X1M U36 ( .A(B[10]), .B(A[10]), .Y(n24) );
endmodule


module ALU_IN_WIDTH8_OUT_WIDTH16_DW02_mult_0 ( A, B, TC, PRODUCT );
  input [7:0] A;
  input [7:0] B;
  output [15:0] PRODUCT;
  input TC;
  wire   \ab[7][7] , \ab[7][6] , \ab[7][5] , \ab[7][4] , \ab[7][3] ,
         \ab[7][2] , \ab[7][1] , \ab[7][0] , \ab[6][7] , \ab[6][6] ,
         \ab[6][5] , \ab[6][4] , \ab[6][3] , \ab[6][2] , \ab[6][1] ,
         \ab[6][0] , \ab[5][7] , \ab[5][6] , \ab[5][5] , \ab[5][4] ,
         \ab[5][3] , \ab[5][2] , \ab[5][1] , \ab[5][0] , \ab[4][7] ,
         \ab[4][6] , \ab[4][5] , \ab[4][4] , \ab[4][3] , \ab[4][2] ,
         \ab[4][1] , \ab[4][0] , \ab[3][7] , \ab[3][6] , \ab[3][5] ,
         \ab[3][4] , \ab[3][3] , \ab[3][2] , \ab[3][1] , \ab[3][0] ,
         \ab[2][7] , \ab[2][6] , \ab[2][5] , \ab[2][4] , \ab[2][3] ,
         \ab[2][2] , \ab[2][1] , \ab[2][0] , \ab[1][7] , \ab[1][6] ,
         \ab[1][5] , \ab[1][4] , \ab[1][3] , \ab[1][2] , \ab[1][1] ,
         \ab[1][0] , \ab[0][7] , \ab[0][6] , \ab[0][5] , \ab[0][4] ,
         \ab[0][3] , \ab[0][2] , \ab[0][1] , \CARRYB[7][6] , \CARRYB[7][5] ,
         \CARRYB[7][4] , \CARRYB[7][3] , \CARRYB[7][2] , \CARRYB[7][1] ,
         \CARRYB[7][0] , \CARRYB[6][6] , \CARRYB[6][5] , \CARRYB[6][4] ,
         \CARRYB[6][3] , \CARRYB[6][2] , \CARRYB[6][1] , \CARRYB[6][0] ,
         \CARRYB[5][6] , \CARRYB[5][5] , \CARRYB[5][4] , \CARRYB[5][3] ,
         \CARRYB[5][2] , \CARRYB[5][1] , \CARRYB[5][0] , \CARRYB[4][6] ,
         \CARRYB[4][5] , \CARRYB[4][4] , \CARRYB[4][3] , \CARRYB[4][2] ,
         \CARRYB[4][1] , \CARRYB[4][0] , \CARRYB[3][6] , \CARRYB[3][5] ,
         \CARRYB[3][4] , \CARRYB[3][3] , \CARRYB[3][2] , \CARRYB[3][1] ,
         \CARRYB[3][0] , \CARRYB[2][6] , \CARRYB[2][5] , \CARRYB[2][4] ,
         \CARRYB[2][3] , \CARRYB[2][2] , \CARRYB[2][1] , \CARRYB[2][0] ,
         \SUMB[7][6] , \SUMB[7][5] , \SUMB[7][4] , \SUMB[7][3] , \SUMB[7][2] ,
         \SUMB[7][1] , \SUMB[7][0] , \SUMB[6][6] , \SUMB[6][5] , \SUMB[6][4] ,
         \SUMB[6][3] , \SUMB[6][2] , \SUMB[6][1] , \SUMB[5][6] , \SUMB[5][5] ,
         \SUMB[5][4] , \SUMB[5][3] , \SUMB[5][2] , \SUMB[5][1] , \SUMB[4][6] ,
         \SUMB[4][5] , \SUMB[4][4] , \SUMB[4][3] , \SUMB[4][2] , \SUMB[4][1] ,
         \SUMB[3][6] , \SUMB[3][5] , \SUMB[3][4] , \SUMB[3][3] , \SUMB[3][2] ,
         \SUMB[3][1] , \SUMB[2][6] , \SUMB[2][5] , \SUMB[2][4] , \SUMB[2][3] ,
         \SUMB[2][2] , \SUMB[2][1] , \SUMB[1][6] , \SUMB[1][5] , \SUMB[1][4] ,
         \SUMB[1][3] , \SUMB[1][2] , \SUMB[1][1] , \A1[12] , \A1[11] ,
         \A1[10] , \A1[9] , \A1[8] , \A1[7] , \A1[6] , \A1[4] , \A1[3] ,
         \A1[2] , \A1[1] , \A1[0] , n3, n4, n5, n6, n7, n8, n9, n10, n11, n12,
         n13, n14, n15, n16, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26,
         n27, n28, n29, n30, n31, n32, n33, n34, n35, n36, n37, n38, n39;

  ALU_IN_WIDTH8_OUT_WIDTH16_DW01_add_1 FS_1 ( .A({1'b0, \A1[12] , \A1[11] , 
        \A1[10] , \A1[9] , \A1[8] , \A1[7] , \A1[6] , \SUMB[7][0] , \A1[4] , 
        \A1[3] , \A1[2] , \A1[1] , \A1[0] }), .B({n10, n16, n14, n15, n13, n11, 
        n12, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0}), .CI(1'b0), .SUM(
        PRODUCT[15:2]) );
  ADDFX2M S5_6 ( .A(\ab[7][6] ), .B(\CARRYB[6][6] ), .CI(\ab[6][7] ), .CO(
        \CARRYB[7][6] ), .S(\SUMB[7][6] ) );
  ADDFX2M S1_6_0 ( .A(\ab[6][0] ), .B(\CARRYB[5][0] ), .CI(\SUMB[5][1] ), .CO(
        \CARRYB[6][0] ), .S(\A1[4] ) );
  ADDFX2M S1_5_0 ( .A(\ab[5][0] ), .B(\CARRYB[4][0] ), .CI(\SUMB[4][1] ), .CO(
        \CARRYB[5][0] ), .S(\A1[3] ) );
  ADDFX2M S1_4_0 ( .A(\ab[4][0] ), .B(\CARRYB[3][0] ), .CI(\SUMB[3][1] ), .CO(
        \CARRYB[4][0] ), .S(\A1[2] ) );
  ADDFX2M S1_3_0 ( .A(\ab[3][0] ), .B(\CARRYB[2][0] ), .CI(\SUMB[2][1] ), .CO(
        \CARRYB[3][0] ), .S(\A1[1] ) );
  ADDFX2M S1_2_0 ( .A(\ab[2][0] ), .B(n9), .CI(\SUMB[1][1] ), .CO(
        \CARRYB[2][0] ), .S(\A1[0] ) );
  ADDFX2M S3_6_6 ( .A(\ab[6][6] ), .B(\CARRYB[5][6] ), .CI(\ab[5][7] ), .CO(
        \CARRYB[6][6] ), .S(\SUMB[6][6] ) );
  ADDFX2M S2_6_5 ( .A(\ab[6][5] ), .B(\CARRYB[5][5] ), .CI(\SUMB[5][6] ), .CO(
        \CARRYB[6][5] ), .S(\SUMB[6][5] ) );
  ADDFX2M S3_5_6 ( .A(\ab[5][6] ), .B(\CARRYB[4][6] ), .CI(\ab[4][7] ), .CO(
        \CARRYB[5][6] ), .S(\SUMB[5][6] ) );
  ADDFX2M S4_5 ( .A(\ab[7][5] ), .B(\CARRYB[6][5] ), .CI(\SUMB[6][6] ), .CO(
        \CARRYB[7][5] ), .S(\SUMB[7][5] ) );
  ADDFX2M S4_4 ( .A(\ab[7][4] ), .B(\CARRYB[6][4] ), .CI(\SUMB[6][5] ), .CO(
        \CARRYB[7][4] ), .S(\SUMB[7][4] ) );
  ADDFX2M S2_6_2 ( .A(\ab[6][2] ), .B(\CARRYB[5][2] ), .CI(\SUMB[5][3] ), .CO(
        \CARRYB[6][2] ), .S(\SUMB[6][2] ) );
  ADDFX2M S2_5_3 ( .A(\ab[5][3] ), .B(\CARRYB[4][3] ), .CI(\SUMB[4][4] ), .CO(
        \CARRYB[5][3] ), .S(\SUMB[5][3] ) );
  ADDFX2M S2_6_1 ( .A(\ab[6][1] ), .B(\CARRYB[5][1] ), .CI(\SUMB[5][2] ), .CO(
        \CARRYB[6][1] ), .S(\SUMB[6][1] ) );
  ADDFX2M S2_4_4 ( .A(\ab[4][4] ), .B(\CARRYB[3][4] ), .CI(\SUMB[3][5] ), .CO(
        \CARRYB[4][4] ), .S(\SUMB[4][4] ) );
  ADDFX2M S2_5_1 ( .A(\ab[5][1] ), .B(\CARRYB[4][1] ), .CI(\SUMB[4][2] ), .CO(
        \CARRYB[5][1] ), .S(\SUMB[5][1] ) );
  ADDFX2M S2_5_2 ( .A(\ab[5][2] ), .B(\CARRYB[4][2] ), .CI(\SUMB[4][3] ), .CO(
        \CARRYB[5][2] ), .S(\SUMB[5][2] ) );
  ADDFX2M S2_3_5 ( .A(\ab[3][5] ), .B(\CARRYB[2][5] ), .CI(\SUMB[2][6] ), .CO(
        \CARRYB[3][5] ), .S(\SUMB[3][5] ) );
  ADDFX2M S2_4_1 ( .A(\ab[4][1] ), .B(\CARRYB[3][1] ), .CI(\SUMB[3][2] ), .CO(
        \CARRYB[4][1] ), .S(\SUMB[4][1] ) );
  ADDFX2M S2_4_2 ( .A(\ab[4][2] ), .B(\CARRYB[3][2] ), .CI(\SUMB[3][3] ), .CO(
        \CARRYB[4][2] ), .S(\SUMB[4][2] ) );
  ADDFX2M S2_3_1 ( .A(\ab[3][1] ), .B(\CARRYB[2][1] ), .CI(\SUMB[2][2] ), .CO(
        \CARRYB[3][1] ), .S(\SUMB[3][1] ) );
  ADDFX2M S2_3_2 ( .A(\ab[3][2] ), .B(\CARRYB[2][2] ), .CI(\SUMB[2][3] ), .CO(
        \CARRYB[3][2] ), .S(\SUMB[3][2] ) );
  ADDFX2M S2_3_4 ( .A(\ab[3][4] ), .B(\CARRYB[2][4] ), .CI(\SUMB[2][5] ), .CO(
        \CARRYB[3][4] ), .S(\SUMB[3][4] ) );
  ADDFX2M S2_2_1 ( .A(\ab[2][1] ), .B(n8), .CI(\SUMB[1][2] ), .CO(
        \CARRYB[2][1] ), .S(\SUMB[2][1] ) );
  ADDFX2M S2_2_2 ( .A(\ab[2][2] ), .B(n4), .CI(\SUMB[1][3] ), .CO(
        \CARRYB[2][2] ), .S(\SUMB[2][2] ) );
  ADDFX2M S2_6_4 ( .A(\ab[6][4] ), .B(\CARRYB[5][4] ), .CI(\SUMB[5][5] ), .CO(
        \CARRYB[6][4] ), .S(\SUMB[6][4] ) );
  ADDFX2M S2_5_5 ( .A(\ab[5][5] ), .B(\CARRYB[4][5] ), .CI(\SUMB[4][6] ), .CO(
        \CARRYB[5][5] ), .S(\SUMB[5][5] ) );
  ADDFX2M S2_6_3 ( .A(\ab[6][3] ), .B(\CARRYB[5][3] ), .CI(\SUMB[5][4] ), .CO(
        \CARRYB[6][3] ), .S(\SUMB[6][3] ) );
  ADDFX2M S3_4_6 ( .A(\ab[4][6] ), .B(\CARRYB[3][6] ), .CI(\ab[3][7] ), .CO(
        \CARRYB[4][6] ), .S(\SUMB[4][6] ) );
  ADDFX2M S2_5_4 ( .A(\ab[5][4] ), .B(\CARRYB[4][4] ), .CI(\SUMB[4][5] ), .CO(
        \CARRYB[5][4] ), .S(\SUMB[5][4] ) );
  ADDFX2M S2_4_5 ( .A(\ab[4][5] ), .B(\CARRYB[3][5] ), .CI(\SUMB[3][6] ), .CO(
        \CARRYB[4][5] ), .S(\SUMB[4][5] ) );
  ADDFX2M S3_3_6 ( .A(\ab[3][6] ), .B(\CARRYB[2][6] ), .CI(\ab[2][7] ), .CO(
        \CARRYB[3][6] ), .S(\SUMB[3][6] ) );
  ADDFX2M S2_4_3 ( .A(\ab[4][3] ), .B(\CARRYB[3][3] ), .CI(\SUMB[3][4] ), .CO(
        \CARRYB[4][3] ), .S(\SUMB[4][3] ) );
  ADDFX2M S2_3_3 ( .A(\ab[3][3] ), .B(\CARRYB[2][3] ), .CI(\SUMB[2][4] ), .CO(
        \CARRYB[3][3] ), .S(\SUMB[3][3] ) );
  ADDFX2M S3_2_6 ( .A(\ab[2][6] ), .B(n7), .CI(\ab[1][7] ), .CO(\CARRYB[2][6] ), .S(\SUMB[2][6] ) );
  ADDFX2M S2_2_3 ( .A(\ab[2][3] ), .B(n3), .CI(\SUMB[1][4] ), .CO(
        \CARRYB[2][3] ), .S(\SUMB[2][3] ) );
  ADDFX2M S2_2_4 ( .A(\ab[2][4] ), .B(n6), .CI(\SUMB[1][5] ), .CO(
        \CARRYB[2][4] ), .S(\SUMB[2][4] ) );
  ADDFX2M S2_2_5 ( .A(\ab[2][5] ), .B(n5), .CI(\SUMB[1][6] ), .CO(
        \CARRYB[2][5] ), .S(\SUMB[2][5] ) );
  ADDFX2M S4_0 ( .A(\ab[7][0] ), .B(\CARRYB[6][0] ), .CI(\SUMB[6][1] ), .CO(
        \CARRYB[7][0] ), .S(\SUMB[7][0] ) );
  ADDFX2M S4_3 ( .A(\ab[7][3] ), .B(\CARRYB[6][3] ), .CI(\SUMB[6][4] ), .CO(
        \CARRYB[7][3] ), .S(\SUMB[7][3] ) );
  ADDFX2M S4_2 ( .A(\ab[7][2] ), .B(\CARRYB[6][2] ), .CI(\SUMB[6][3] ), .CO(
        \CARRYB[7][2] ), .S(\SUMB[7][2] ) );
  ADDFX2M S4_1 ( .A(\ab[7][1] ), .B(\CARRYB[6][1] ), .CI(\SUMB[6][2] ), .CO(
        \CARRYB[7][1] ), .S(\SUMB[7][1] ) );
  AND2X2M U2 ( .A(\ab[0][4] ), .B(\ab[1][3] ), .Y(n3) );
  AND2X2M U3 ( .A(\ab[0][3] ), .B(\ab[1][2] ), .Y(n4) );
  AND2X2M U4 ( .A(\ab[0][6] ), .B(\ab[1][5] ), .Y(n5) );
  AND2X2M U5 ( .A(\ab[0][5] ), .B(\ab[1][4] ), .Y(n6) );
  AND2X2M U6 ( .A(\ab[0][7] ), .B(\ab[1][6] ), .Y(n7) );
  AND2X2M U7 ( .A(\ab[0][2] ), .B(\ab[1][1] ), .Y(n8) );
  AND2X2M U8 ( .A(\ab[0][1] ), .B(\ab[1][0] ), .Y(n9) );
  AND2X2M U9 ( .A(\CARRYB[7][6] ), .B(\ab[7][7] ), .Y(n10) );
  INVXLM U10 ( .A(A[6]), .Y(n33) );
  CLKXOR2X2M U11 ( .A(\CARRYB[7][2] ), .B(\SUMB[7][3] ), .Y(\A1[8] ) );
  INVX2M U12 ( .A(\ab[0][7] ), .Y(n23) );
  INVX2M U13 ( .A(\ab[0][6] ), .Y(n22) );
  INVX2M U14 ( .A(\ab[0][5] ), .Y(n21) );
  INVX2M U15 ( .A(\ab[0][4] ), .Y(n20) );
  INVX2M U16 ( .A(\ab[0][3] ), .Y(n19) );
  AND2X2M U17 ( .A(\CARRYB[7][1] ), .B(\SUMB[7][2] ), .Y(n11) );
  AND2X2M U18 ( .A(\CARRYB[7][0] ), .B(\SUMB[7][1] ), .Y(n12) );
  CLKXOR2X2M U19 ( .A(\CARRYB[7][1] ), .B(\SUMB[7][2] ), .Y(\A1[7] ) );
  CLKXOR2X2M U20 ( .A(\CARRYB[7][3] ), .B(\SUMB[7][4] ), .Y(\A1[9] ) );
  CLKXOR2X2M U21 ( .A(\CARRYB[7][5] ), .B(\SUMB[7][6] ), .Y(\A1[11] ) );
  INVX2M U22 ( .A(\ab[0][2] ), .Y(n18) );
  AND2X2M U23 ( .A(\CARRYB[7][2] ), .B(\SUMB[7][3] ), .Y(n13) );
  AND2X2M U24 ( .A(\CARRYB[7][4] ), .B(\SUMB[7][5] ), .Y(n14) );
  CLKXOR2X2M U25 ( .A(\CARRYB[7][4] ), .B(\SUMB[7][5] ), .Y(\A1[10] ) );
  AND2X2M U26 ( .A(\CARRYB[7][3] ), .B(\SUMB[7][4] ), .Y(n15) );
  XNOR2X2M U27 ( .A(\CARRYB[7][0] ), .B(n17), .Y(\A1[6] ) );
  INVX2M U28 ( .A(\SUMB[7][1] ), .Y(n17) );
  CLKXOR2X2M U29 ( .A(\CARRYB[7][6] ), .B(\ab[7][7] ), .Y(\A1[12] ) );
  AND2X2M U30 ( .A(\CARRYB[7][5] ), .B(\SUMB[7][6] ), .Y(n16) );
  CLKXOR2X2M U31 ( .A(\ab[1][0] ), .B(\ab[0][1] ), .Y(PRODUCT[1]) );
  XNOR2X2M U32 ( .A(\ab[1][6] ), .B(n23), .Y(\SUMB[1][6] ) );
  XNOR2X2M U33 ( .A(\ab[1][5] ), .B(n22), .Y(\SUMB[1][5] ) );
  XNOR2X2M U34 ( .A(\ab[1][4] ), .B(n21), .Y(\SUMB[1][4] ) );
  XNOR2X2M U35 ( .A(\ab[1][3] ), .B(n20), .Y(\SUMB[1][3] ) );
  XNOR2X2M U36 ( .A(\ab[1][2] ), .B(n19), .Y(\SUMB[1][2] ) );
  INVX2M U37 ( .A(A[1]), .Y(n38) );
  XNOR2X2M U38 ( .A(\ab[1][1] ), .B(n18), .Y(\SUMB[1][1] ) );
  INVX2M U39 ( .A(A[3]), .Y(n36) );
  INVX2M U40 ( .A(A[2]), .Y(n37) );
  INVX2M U41 ( .A(A[4]), .Y(n35) );
  INVX2M U42 ( .A(A[5]), .Y(n34) );
  INVXLM U43 ( .A(B[3]), .Y(n28) );
  INVXLM U44 ( .A(B[4]), .Y(n27) );
  INVXLM U45 ( .A(B[5]), .Y(n26) );
  INVX2M U46 ( .A(A[0]), .Y(n39) );
  INVXLM U47 ( .A(B[2]), .Y(n29) );
  INVXLM U48 ( .A(B[1]), .Y(n30) );
  INVXLM U49 ( .A(A[7]), .Y(n32) );
  INVXLM U50 ( .A(B[6]), .Y(n25) );
  INVXLM U51 ( .A(B[0]), .Y(n31) );
  INVXLM U52 ( .A(B[7]), .Y(n24) );
  NOR2X1M U54 ( .A(n32), .B(n24), .Y(\ab[7][7] ) );
  NOR2X1M U55 ( .A(n32), .B(n25), .Y(\ab[7][6] ) );
  NOR2X1M U56 ( .A(n32), .B(n26), .Y(\ab[7][5] ) );
  NOR2X1M U57 ( .A(n32), .B(n27), .Y(\ab[7][4] ) );
  NOR2X1M U58 ( .A(n32), .B(n28), .Y(\ab[7][3] ) );
  NOR2X1M U59 ( .A(n32), .B(n29), .Y(\ab[7][2] ) );
  NOR2X1M U60 ( .A(n32), .B(n30), .Y(\ab[7][1] ) );
  NOR2X1M U61 ( .A(n32), .B(n31), .Y(\ab[7][0] ) );
  NOR2X1M U62 ( .A(n24), .B(n33), .Y(\ab[6][7] ) );
  NOR2X1M U63 ( .A(n25), .B(n33), .Y(\ab[6][6] ) );
  NOR2X1M U64 ( .A(n26), .B(n33), .Y(\ab[6][5] ) );
  NOR2X1M U65 ( .A(n27), .B(n33), .Y(\ab[6][4] ) );
  NOR2X1M U66 ( .A(n28), .B(n33), .Y(\ab[6][3] ) );
  NOR2X1M U67 ( .A(n29), .B(n33), .Y(\ab[6][2] ) );
  NOR2X1M U68 ( .A(n30), .B(n33), .Y(\ab[6][1] ) );
  NOR2X1M U69 ( .A(n31), .B(n33), .Y(\ab[6][0] ) );
  NOR2X1M U70 ( .A(n24), .B(n34), .Y(\ab[5][7] ) );
  NOR2X1M U71 ( .A(n25), .B(n34), .Y(\ab[5][6] ) );
  NOR2X1M U72 ( .A(n26), .B(n34), .Y(\ab[5][5] ) );
  NOR2X1M U73 ( .A(n27), .B(n34), .Y(\ab[5][4] ) );
  NOR2X1M U74 ( .A(n28), .B(n34), .Y(\ab[5][3] ) );
  NOR2X1M U75 ( .A(n29), .B(n34), .Y(\ab[5][2] ) );
  NOR2X1M U76 ( .A(n30), .B(n34), .Y(\ab[5][1] ) );
  NOR2X1M U77 ( .A(n31), .B(n34), .Y(\ab[5][0] ) );
  NOR2X1M U78 ( .A(n24), .B(n35), .Y(\ab[4][7] ) );
  NOR2X1M U79 ( .A(n25), .B(n35), .Y(\ab[4][6] ) );
  NOR2X1M U80 ( .A(n26), .B(n35), .Y(\ab[4][5] ) );
  NOR2X1M U81 ( .A(n27), .B(n35), .Y(\ab[4][4] ) );
  NOR2X1M U82 ( .A(n28), .B(n35), .Y(\ab[4][3] ) );
  NOR2X1M U83 ( .A(n29), .B(n35), .Y(\ab[4][2] ) );
  NOR2X1M U84 ( .A(n30), .B(n35), .Y(\ab[4][1] ) );
  NOR2X1M U85 ( .A(n31), .B(n35), .Y(\ab[4][0] ) );
  NOR2X1M U86 ( .A(n24), .B(n36), .Y(\ab[3][7] ) );
  NOR2X1M U87 ( .A(n25), .B(n36), .Y(\ab[3][6] ) );
  NOR2X1M U88 ( .A(n26), .B(n36), .Y(\ab[3][5] ) );
  NOR2X1M U89 ( .A(n27), .B(n36), .Y(\ab[3][4] ) );
  NOR2X1M U90 ( .A(n28), .B(n36), .Y(\ab[3][3] ) );
  NOR2X1M U91 ( .A(n29), .B(n36), .Y(\ab[3][2] ) );
  NOR2X1M U92 ( .A(n30), .B(n36), .Y(\ab[3][1] ) );
  NOR2X1M U93 ( .A(n31), .B(n36), .Y(\ab[3][0] ) );
  NOR2X1M U94 ( .A(n24), .B(n37), .Y(\ab[2][7] ) );
  NOR2X1M U95 ( .A(n25), .B(n37), .Y(\ab[2][6] ) );
  NOR2X1M U96 ( .A(n26), .B(n37), .Y(\ab[2][5] ) );
  NOR2X1M U97 ( .A(n27), .B(n37), .Y(\ab[2][4] ) );
  NOR2X1M U98 ( .A(n28), .B(n37), .Y(\ab[2][3] ) );
  NOR2X1M U99 ( .A(n29), .B(n37), .Y(\ab[2][2] ) );
  NOR2X1M U100 ( .A(n30), .B(n37), .Y(\ab[2][1] ) );
  NOR2X1M U101 ( .A(n31), .B(n37), .Y(\ab[2][0] ) );
  NOR2X1M U102 ( .A(n24), .B(n38), .Y(\ab[1][7] ) );
  NOR2X1M U103 ( .A(n25), .B(n38), .Y(\ab[1][6] ) );
  NOR2X1M U104 ( .A(n26), .B(n38), .Y(\ab[1][5] ) );
  NOR2X1M U105 ( .A(n27), .B(n38), .Y(\ab[1][4] ) );
  NOR2X1M U106 ( .A(n28), .B(n38), .Y(\ab[1][3] ) );
  NOR2X1M U107 ( .A(n29), .B(n38), .Y(\ab[1][2] ) );
  NOR2X1M U108 ( .A(n30), .B(n38), .Y(\ab[1][1] ) );
  NOR2X1M U109 ( .A(n31), .B(n38), .Y(\ab[1][0] ) );
  NOR2X1M U110 ( .A(n24), .B(n39), .Y(\ab[0][7] ) );
  NOR2X1M U111 ( .A(n25), .B(n39), .Y(\ab[0][6] ) );
  NOR2X1M U112 ( .A(n26), .B(n39), .Y(\ab[0][5] ) );
  NOR2X1M U113 ( .A(n27), .B(n39), .Y(\ab[0][4] ) );
  NOR2X1M U114 ( .A(n28), .B(n39), .Y(\ab[0][3] ) );
  NOR2X1M U115 ( .A(n29), .B(n39), .Y(\ab[0][2] ) );
  NOR2X1M U116 ( .A(n30), .B(n39), .Y(\ab[0][1] ) );
  NOR2X1M U117 ( .A(n31), .B(n39), .Y(PRODUCT[0]) );
endmodule


module ALU_IN_WIDTH8_OUT_WIDTH16_DW_div_uns_1 ( a, b, quotient, remainder, 
        divide_by_0 );
  input [7:0] a;
  input [7:0] b;
  output [7:0] quotient;
  output [7:0] remainder;
  output divide_by_0;
  wire   \u_div/SumTmp[1][0] , \u_div/SumTmp[1][1] , \u_div/SumTmp[1][2] ,
         \u_div/SumTmp[1][3] , \u_div/SumTmp[1][6] , \u_div/SumTmp[2][0] ,
         \u_div/SumTmp[2][1] , \u_div/SumTmp[2][2] , \u_div/SumTmp[2][3] ,
         \u_div/SumTmp[2][4] , \u_div/SumTmp[2][5] , \u_div/SumTmp[3][0] ,
         \u_div/SumTmp[3][1] , \u_div/SumTmp[3][2] , \u_div/SumTmp[3][3] ,
         \u_div/SumTmp[3][4] , \u_div/SumTmp[4][0] , \u_div/SumTmp[4][1] ,
         \u_div/SumTmp[4][2] , \u_div/SumTmp[4][3] , \u_div/SumTmp[5][0] ,
         \u_div/SumTmp[5][1] , \u_div/SumTmp[5][2] , \u_div/SumTmp[6][1] ,
         \u_div/CryTmp[0][1] , \u_div/CryTmp[0][2] , \u_div/CryTmp[0][3] ,
         \u_div/CryTmp[0][4] , \u_div/CryTmp[0][5] , \u_div/CryTmp[0][6] ,
         \u_div/CryTmp[0][7] , \u_div/CryTmp[1][1] , \u_div/CryTmp[1][2] ,
         \u_div/CryTmp[1][3] , \u_div/CryTmp[1][4] , \u_div/CryTmp[1][5] ,
         \u_div/CryTmp[1][6] , \u_div/CryTmp[1][7] , \u_div/CryTmp[2][1] ,
         \u_div/CryTmp[2][2] , \u_div/CryTmp[2][3] , \u_div/CryTmp[2][4] ,
         \u_div/CryTmp[2][5] , \u_div/CryTmp[2][6] , \u_div/CryTmp[3][1] ,
         \u_div/CryTmp[3][2] , \u_div/CryTmp[3][3] , \u_div/CryTmp[3][4] ,
         \u_div/CryTmp[3][5] , \u_div/CryTmp[4][1] , \u_div/CryTmp[4][2] ,
         \u_div/CryTmp[4][3] , \u_div/CryTmp[4][4] , \u_div/CryTmp[5][1] ,
         \u_div/CryTmp[5][2] , \u_div/CryTmp[5][3] , \u_div/CryTmp[6][1] ,
         \u_div/CryTmp[6][2] , \u_div/CryTmp[7][1] , \u_div/PartRem[1][1] ,
         \u_div/PartRem[1][2] , \u_div/PartRem[1][3] , \u_div/PartRem[1][4] ,
         \u_div/PartRem[1][5] , \u_div/PartRem[1][6] , \u_div/PartRem[1][7] ,
         \u_div/PartRem[2][1] , \u_div/PartRem[2][2] , \u_div/PartRem[2][3] ,
         \u_div/PartRem[2][4] , \u_div/PartRem[2][5] , \u_div/PartRem[2][6] ,
         \u_div/PartRem[3][1] , \u_div/PartRem[4][1] , \u_div/PartRem[5][1] ,
         \u_div/PartRem[6][1] , n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11,
         n12, n13, n14, n15, n16, n17, n18, n19, n20, n21, n22, n23, n24, n25,
         n26, n27, n28, n29, n30, n31, n32, n33, n34, n35, n36, n37, n38, n39,
         n40, n41, n42, n43, n44, n45, n48, n49, n50, n51, n52, n53, n55, n56,
         n57, n58, n59, n60, n61, n63, n64, n65, n66, n67, n68, n69, n70, n71,
         n72, n73, n74, n75, n76, n77, n78, n79, n80, n81, n82, n83, n84, n85,
         n86, n87, n88, n89, n90, n91, n92, n93, n94, n95, n96, n97, n98, n99,
         n100, n101;
  wire   [7:0] \u_div/BInv ;

  ADDFHX4M \u_div/u_fa_PartRem_0_0_6  ( .A(\u_div/PartRem[1][6] ), .B(
        \u_div/BInv [6]), .CI(\u_div/CryTmp[0][6] ), .CO(\u_div/CryTmp[0][7] )
         );
  ADDFHX4M \u_div/u_fa_PartRem_0_0_1  ( .A(\u_div/PartRem[1][1] ), .B(
        \u_div/BInv [1]), .CI(\u_div/CryTmp[0][1] ), .CO(\u_div/CryTmp[0][2] )
         );
  ADDFHX4M \u_div/u_fa_PartRem_0_1_6  ( .A(\u_div/PartRem[2][6] ), .B(
        \u_div/BInv [6]), .CI(\u_div/CryTmp[1][6] ), .CO(\u_div/CryTmp[1][7] ), 
        .S(\u_div/SumTmp[1][6] ) );
  ADDFHX4M \u_div/u_fa_PartRem_0_0_2  ( .A(n19), .B(n38), .CI(
        \u_div/CryTmp[0][2] ), .CO(\u_div/CryTmp[0][3] ) );
  ADDFHX4M \u_div/u_fa_PartRem_0_0_4  ( .A(\u_div/PartRem[1][4] ), .B(
        \u_div/BInv [4]), .CI(\u_div/CryTmp[0][4] ), .CO(\u_div/CryTmp[0][5] )
         );
  ADDFHX4M \u_div/u_fa_PartRem_0_0_5  ( .A(\u_div/PartRem[1][5] ), .B(
        \u_div/BInv [5]), .CI(\u_div/CryTmp[0][5] ), .CO(\u_div/CryTmp[0][6] )
         );
  ADDFHX4M \u_div/u_fa_PartRem_0_0_3  ( .A(\u_div/PartRem[1][3] ), .B(
        \u_div/BInv [3]), .CI(\u_div/CryTmp[0][3] ), .CO(\u_div/CryTmp[0][4] )
         );
  ADDFHX4M \u_div/u_fa_PartRem_0_0_7  ( .A(\u_div/PartRem[1][7] ), .B(
        \u_div/BInv [7]), .CI(\u_div/CryTmp[0][7] ), .CO(quotient[0]) );
  ADDFHX4M \u_div/u_fa_PartRem_0_5_2  ( .A(n49), .B(n38), .CI(
        \u_div/CryTmp[5][2] ), .CO(\u_div/CryTmp[5][3] ), .S(
        \u_div/SumTmp[5][2] ) );
  ADDFHX4M \u_div/u_fa_PartRem_0_1_1  ( .A(\u_div/PartRem[2][1] ), .B(
        \u_div/BInv [1]), .CI(\u_div/CryTmp[1][1] ), .CO(\u_div/CryTmp[1][2] ), 
        .S(\u_div/SumTmp[1][1] ) );
  ADDFHX4M \u_div/u_fa_PartRem_0_1_2  ( .A(\u_div/PartRem[2][2] ), .B(n38), 
        .CI(\u_div/CryTmp[1][2] ), .CO(\u_div/CryTmp[1][3] ), .S(
        \u_div/SumTmp[1][2] ) );
  ADDFHX4M \u_div/u_fa_PartRem_0_1_3  ( .A(\u_div/PartRem[2][3] ), .B(
        \u_div/BInv [3]), .CI(\u_div/CryTmp[1][3] ), .CO(\u_div/CryTmp[1][4] ), 
        .S(\u_div/SumTmp[1][3] ) );
  ADDFHX2M \u_div/u_fa_PartRem_0_3_4  ( .A(n55), .B(\u_div/BInv [4]), .CI(
        \u_div/CryTmp[3][4] ), .CO(\u_div/CryTmp[3][5] ), .S(
        \u_div/SumTmp[3][4] ) );
  ADDFHX2M \u_div/u_fa_PartRem_0_4_1  ( .A(\u_div/PartRem[5][1] ), .B(
        \u_div/BInv [1]), .CI(\u_div/CryTmp[4][1] ), .CO(\u_div/CryTmp[4][2] ), 
        .S(\u_div/SumTmp[4][1] ) );
  ADDFHX4M \u_div/u_fa_PartRem_0_5_1  ( .A(\u_div/CryTmp[5][1] ), .B(
        \u_div/BInv [1]), .CI(\u_div/PartRem[6][1] ), .CO(\u_div/CryTmp[5][2] ), .S(\u_div/SumTmp[5][1] ) );
  ADDFHX2M \u_div/u_fa_PartRem_0_2_5  ( .A(n45), .B(\u_div/BInv [5]), .CI(
        \u_div/CryTmp[2][5] ), .CO(\u_div/CryTmp[2][6] ), .S(
        \u_div/SumTmp[2][5] ) );
  ADDFHX2M \u_div/u_fa_PartRem_0_4_3  ( .A(n57), .B(\u_div/BInv [3]), .CI(
        \u_div/CryTmp[4][3] ), .CO(\u_div/CryTmp[4][4] ), .S(
        \u_div/SumTmp[4][3] ) );
  ADDFHX2M \u_div/u_fa_PartRem_0_4_2  ( .A(n56), .B(n38), .CI(
        \u_div/CryTmp[4][2] ), .CO(\u_div/CryTmp[4][3] ), .S(
        \u_div/SumTmp[4][2] ) );
  ADDFHX4M \u_div/u_fa_PartRem_0_3_3  ( .A(n53), .B(\u_div/BInv [3]), .CI(
        \u_div/CryTmp[3][3] ), .CO(\u_div/CryTmp[3][4] ), .S(
        \u_div/SumTmp[3][3] ) );
  ADDFHX4M \u_div/u_fa_PartRem_0_2_1  ( .A(\u_div/PartRem[3][1] ), .B(
        \u_div/BInv [1]), .CI(\u_div/CryTmp[2][1] ), .CO(\u_div/CryTmp[2][2] ), 
        .S(\u_div/SumTmp[2][1] ) );
  ADDFHX1M \u_div/u_fa_PartRem_0_2_3  ( .A(n51), .B(\u_div/BInv [3]), .CI(
        \u_div/CryTmp[2][3] ), .CO(\u_div/CryTmp[2][4] ), .S(
        \u_div/SumTmp[2][3] ) );
  ADDFHX4M \u_div/u_fa_PartRem_0_2_2  ( .A(n48), .B(n38), .CI(
        \u_div/CryTmp[2][2] ), .CO(\u_div/CryTmp[2][3] ), .S(
        \u_div/SumTmp[2][2] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_0_0  ( .A(a[0]), .B(\u_div/BInv [0]), .CI(1'b1), .CO(\u_div/CryTmp[0][1] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_3_0  ( .A(a[3]), .B(\u_div/BInv [0]), .CI(1'b1), .CO(\u_div/CryTmp[3][1] ), .S(\u_div/SumTmp[3][0] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_2_0  ( .A(a[2]), .B(\u_div/BInv [0]), .CI(1'b1), .CO(\u_div/CryTmp[2][1] ), .S(\u_div/SumTmp[2][0] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_1_0  ( .A(a[1]), .B(\u_div/BInv [0]), .CI(1'b1), .CO(\u_div/CryTmp[1][1] ), .S(\u_div/SumTmp[1][0] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_5_0  ( .A(a[5]), .B(\u_div/BInv [0]), .CI(1'b1), .CO(\u_div/CryTmp[5][1] ), .S(\u_div/SumTmp[5][0] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_4_0  ( .A(a[4]), .B(\u_div/BInv [0]), .CI(1'b1), .CO(\u_div/CryTmp[4][1] ), .S(\u_div/SumTmp[4][0] ) );
  CLKNAND2X4M U1 ( .A(n40), .B(n1), .Y(n2) );
  NAND2X2M U2 ( .A(n41), .B(quotient[3]), .Y(n3) );
  NAND2X4M U3 ( .A(n2), .B(n3), .Y(n4) );
  INVX3M U4 ( .A(quotient[3]), .Y(n1) );
  INVX4M U5 ( .A(n4), .Y(n48) );
  XOR3XLM U6 ( .A(\u_div/PartRem[4][1] ), .B(\u_div/BInv [1]), .C(
        \u_div/CryTmp[3][1] ), .Y(\u_div/SumTmp[3][1] ) );
  NAND2X2M U7 ( .A(\u_div/PartRem[4][1] ), .B(\u_div/BInv [1]), .Y(n5) );
  NAND2X2M U8 ( .A(\u_div/PartRem[4][1] ), .B(\u_div/CryTmp[3][1] ), .Y(n6) );
  NAND2X2M U9 ( .A(\u_div/BInv [1]), .B(\u_div/CryTmp[3][1] ), .Y(n7) );
  NAND3X2M U10 ( .A(n5), .B(n6), .C(n7), .Y(\u_div/CryTmp[3][2] ) );
  XOR2XLM U11 ( .A(n50), .B(n38), .Y(n8) );
  XOR2XLM U12 ( .A(n8), .B(\u_div/CryTmp[3][2] ), .Y(\u_div/SumTmp[3][2] ) );
  NAND2XLM U13 ( .A(n50), .B(n38), .Y(n9) );
  CLKNAND2X2M U14 ( .A(n50), .B(\u_div/CryTmp[3][2] ), .Y(n10) );
  NAND2XLM U15 ( .A(n38), .B(\u_div/CryTmp[3][2] ), .Y(n11) );
  NAND3X2M U16 ( .A(n9), .B(n10), .C(n11), .Y(\u_div/CryTmp[3][3] ) );
  XOR2XLM U17 ( .A(\u_div/BInv [4]), .B(n52), .Y(n12) );
  XOR2XLM U18 ( .A(n12), .B(\u_div/CryTmp[2][4] ), .Y(\u_div/SumTmp[2][4] ) );
  NAND2XLM U19 ( .A(\u_div/CryTmp[2][4] ), .B(n52), .Y(n13) );
  NAND2X1M U20 ( .A(\u_div/CryTmp[2][4] ), .B(\u_div/BInv [4]), .Y(n14) );
  NAND2XLM U21 ( .A(n52), .B(\u_div/BInv [4]), .Y(n15) );
  NAND3X1M U22 ( .A(n15), .B(n14), .C(n13), .Y(\u_div/CryTmp[2][5] ) );
  CLKINVX1M U23 ( .A(b[4]), .Y(\u_div/BInv [4]) );
  NAND2XLM U24 ( .A(\u_div/PartRem[5][1] ), .B(n16), .Y(n17) );
  NAND2XLM U25 ( .A(\u_div/SumTmp[4][1] ), .B(quotient[4]), .Y(n18) );
  NAND2X2M U26 ( .A(n17), .B(n18), .Y(n50) );
  INVXLM U27 ( .A(quotient[4]), .Y(n16) );
  NOR2X2M U28 ( .A(n80), .B(n79), .Y(quotient[4]) );
  CLKMX2X4M U29 ( .A(n50), .B(\u_div/SumTmp[3][2] ), .S0(quotient[3]), .Y(n51)
         );
  AND2X1M U30 ( .A(n95), .B(n38), .Y(n22) );
  INVX3M U31 ( .A(\u_div/CryTmp[5][3] ), .Y(n64) );
  INVX4M U32 ( .A(n82), .Y(\u_div/PartRem[3][1] ) );
  MXI2X2M U33 ( .A(n43), .B(n42), .S0(n44), .Y(\u_div/PartRem[4][1] ) );
  AND2X1M U34 ( .A(\u_div/CryTmp[5][3] ), .B(n95), .Y(quotient[5]) );
  NAND2X1M U35 ( .A(\u_div/CryTmp[1][4] ), .B(\u_div/PartRem[2][4] ), .Y(n24)
         );
  XNOR2XLM U36 ( .A(n23), .B(\u_div/CryTmp[1][4] ), .Y(n21) );
  NAND2X8M U37 ( .A(n97), .B(\u_div/BInv [3]), .Y(n77) );
  INVX8M U38 ( .A(b[3]), .Y(\u_div/BInv [3]) );
  INVX6M U39 ( .A(n96), .Y(quotient[6]) );
  NAND3X3M U40 ( .A(n30), .B(n29), .C(n28), .Y(\u_div/CryTmp[1][6] ) );
  NAND2X4M U41 ( .A(\u_div/CryTmp[6][2] ), .B(n22), .Y(n96) );
  NAND2X8M U42 ( .A(n98), .B(n99), .Y(n79) );
  INVX6M U43 ( .A(n88), .Y(n99) );
  MX2XLM U44 ( .A(n49), .B(\u_div/SumTmp[5][2] ), .S0(quotient[5]), .Y(n57) );
  INVX10M U45 ( .A(b[7]), .Y(\u_div/BInv [7]) );
  INVX2M U46 ( .A(\u_div/CryTmp[4][4] ), .Y(n80) );
  INVX4M U47 ( .A(n71), .Y(\u_div/PartRem[2][1] ) );
  CLKINVX4M U48 ( .A(\u_div/CryTmp[2][6] ), .Y(n89) );
  MXI2X4M U49 ( .A(n65), .B(\u_div/SumTmp[2][1] ), .S0(quotient[2]), .Y(n70)
         );
  INVX3M U50 ( .A(n100), .Y(quotient[2]) );
  MXI2X4M U51 ( .A(a[2]), .B(\u_div/SumTmp[2][0] ), .S0(n87), .Y(n71) );
  NOR2X4M U52 ( .A(b[5]), .B(b[4]), .Y(n98) );
  NOR2X2M U53 ( .A(n89), .B(n88), .Y(n87) );
  NAND2BX8M U54 ( .AN(b[6]), .B(\u_div/BInv [7]), .Y(n88) );
  CLKINVX8M U55 ( .A(n79), .Y(n97) );
  NOR2X2M U56 ( .A(n80), .B(n79), .Y(n44) );
  CLKNAND2X4M U57 ( .A(n59), .B(\u_div/BInv [1]), .Y(n35) );
  CLKINVX4M U58 ( .A(n70), .Y(\u_div/PartRem[2][2] ) );
  MXI2XLM U59 ( .A(n71), .B(n86), .S0(quotient[1]), .Y(\u_div/PartRem[1][2] )
         );
  MXI2X2M U60 ( .A(n69), .B(n78), .S0(quotient[1]), .Y(\u_div/PartRem[1][4] )
         );
  MXI2X2M U61 ( .A(n68), .B(n21), .S0(quotient[1]), .Y(\u_div/PartRem[1][5] )
         );
  MXI2X2M U62 ( .A(n67), .B(n20), .S0(quotient[1]), .Y(\u_div/PartRem[1][6] )
         );
  MXI2X2M U63 ( .A(n66), .B(n72), .S0(quotient[1]), .Y(\u_div/PartRem[1][7] )
         );
  INVX5M U64 ( .A(n101), .Y(quotient[1]) );
  MXI2X2M U65 ( .A(n74), .B(n75), .S0(n76), .Y(\u_div/PartRem[5][1] ) );
  INVX2M U66 ( .A(n68), .Y(\u_div/PartRem[2][4] ) );
  OR2X2M U67 ( .A(\u_div/BInv [0]), .B(a[6]), .Y(\u_div/CryTmp[6][1] ) );
  CLKNAND2X2M U68 ( .A(\u_div/CryTmp[1][5] ), .B(\u_div/PartRem[2][5] ), .Y(
        n28) );
  CLKNAND2X2M U69 ( .A(\u_div/CryTmp[1][5] ), .B(\u_div/BInv [5]), .Y(n29) );
  CLKNAND2X2M U70 ( .A(n59), .B(\u_div/CryTmp[6][1] ), .Y(n36) );
  NOR2X2M U71 ( .A(n77), .B(n64), .Y(n76) );
  MX2X2M U72 ( .A(\u_div/PartRem[6][1] ), .B(\u_div/SumTmp[5][1] ), .S0(
        quotient[5]), .Y(n56) );
  NOR2BX4M U73 ( .AN(\u_div/CryTmp[1][7] ), .B(b[7]), .Y(n92) );
  NAND3X2M U74 ( .A(n26), .B(n25), .C(n24), .Y(\u_div/CryTmp[1][5] ) );
  INVX2M U75 ( .A(b[1]), .Y(n39) );
  NAND2X2M U76 ( .A(b[0]), .B(n63), .Y(\u_div/CryTmp[7][1] ) );
  INVX2M U77 ( .A(a[7]), .Y(n63) );
  NOR2BX2M U78 ( .AN(\u_div/CryTmp[3][5] ), .B(n84), .Y(quotient[3]) );
  NAND3X2M U79 ( .A(n37), .B(n36), .C(n35), .Y(\u_div/CryTmp[6][2] ) );
  XOR2X2M U80 ( .A(\u_div/BInv [0]), .B(a[7]), .Y(n61) );
  MX2X4M U81 ( .A(n59), .B(\u_div/SumTmp[6][1] ), .S0(quotient[6]), .Y(n49) );
  CLKINVX12M U82 ( .A(n77), .Y(n95) );
  XNOR2XLM U83 ( .A(n27), .B(\u_div/CryTmp[1][5] ), .Y(n20) );
  NAND2BX2M U84 ( .AN(b[7]), .B(\u_div/CryTmp[1][7] ), .Y(n101) );
  INVXLM U85 ( .A(n82), .Y(n65) );
  BUFX4M U86 ( .A(\u_div/PartRem[1][2] ), .Y(n19) );
  INVX6M U87 ( .A(b[2]), .Y(n38) );
  INVX4M U88 ( .A(b[0]), .Y(\u_div/BInv [0]) );
  INVX4M U89 ( .A(b[1]), .Y(\u_div/BInv [1]) );
  XOR2XLM U90 ( .A(\u_div/BInv [4]), .B(\u_div/PartRem[2][4] ), .Y(n23) );
  CLKNAND2X2M U91 ( .A(\u_div/CryTmp[1][4] ), .B(\u_div/BInv [4]), .Y(n25) );
  CLKNAND2X2M U92 ( .A(\u_div/PartRem[2][4] ), .B(\u_div/BInv [4]), .Y(n26) );
  XOR2XLM U93 ( .A(\u_div/BInv [5]), .B(\u_div/PartRem[2][5] ), .Y(n27) );
  NAND2X2M U94 ( .A(\u_div/PartRem[2][5] ), .B(\u_div/BInv [5]), .Y(n30) );
  INVX2M U95 ( .A(b[5]), .Y(\u_div/BInv [5]) );
  MXI2X6M U96 ( .A(a[3]), .B(\u_div/SumTmp[3][0] ), .S0(n83), .Y(n82) );
  NOR2X4M U97 ( .A(n85), .B(n84), .Y(n83) );
  CLKINVX4M U98 ( .A(\u_div/CryTmp[3][5] ), .Y(n85) );
  MXI2X2M U99 ( .A(n73), .B(n58), .S0(quotient[6]), .Y(\u_div/PartRem[6][1] )
         );
  XOR2X1M U100 ( .A(n34), .B(n59), .Y(\u_div/SumTmp[6][1] ) );
  NAND2XLM U101 ( .A(\u_div/CryTmp[6][1] ), .B(b[1]), .Y(n32) );
  NAND2XLM U102 ( .A(n31), .B(\u_div/BInv [1]), .Y(n33) );
  NAND2X1M U103 ( .A(n32), .B(n33), .Y(n34) );
  INVXLM U104 ( .A(\u_div/CryTmp[6][1] ), .Y(n31) );
  NAND2X1M U105 ( .A(\u_div/BInv [1]), .B(\u_div/CryTmp[6][1] ), .Y(n37) );
  NAND2X8M U106 ( .A(n94), .B(n95), .Y(n93) );
  INVXLM U107 ( .A(\u_div/PartRem[4][1] ), .Y(n40) );
  CLKINVX2M U108 ( .A(\u_div/SumTmp[3][1] ), .Y(n41) );
  XOR2XLM U109 ( .A(\u_div/BInv [0]), .B(a[6]), .Y(n58) );
  INVXLM U110 ( .A(a[6]), .Y(n73) );
  INVXLM U111 ( .A(a[7]), .Y(n60) );
  AND3X6M U112 ( .A(\u_div/CryTmp[7][1] ), .B(n38), .C(n39), .Y(n94) );
  NAND2BX1M U113 ( .AN(n89), .B(n99), .Y(n100) );
  MXI2XLM U114 ( .A(n48), .B(\u_div/SumTmp[2][2] ), .S0(quotient[2]), .Y(n69)
         );
  MX2XLM U115 ( .A(n55), .B(\u_div/SumTmp[3][4] ), .S0(quotient[3]), .Y(n45)
         );
  MX2XLM U116 ( .A(n53), .B(\u_div/SumTmp[3][3] ), .S0(quotient[3]), .Y(n52)
         );
  INVX2M U117 ( .A(n69), .Y(\u_div/PartRem[2][3] ) );
  CLKINVX40M U118 ( .A(\u_div/SumTmp[4][0] ), .Y(n42) );
  CLKINVX40M U119 ( .A(a[4]), .Y(n43) );
  MXI2XLM U120 ( .A(n51), .B(\u_div/SumTmp[2][3] ), .S0(quotient[2]), .Y(n68)
         );
  MXI2XLM U121 ( .A(n52), .B(\u_div/SumTmp[2][4] ), .S0(quotient[2]), .Y(n67)
         );
  MXI2XLM U122 ( .A(n45), .B(\u_div/SumTmp[2][5] ), .S0(quotient[2]), .Y(n66)
         );
  INVX2M U123 ( .A(n66), .Y(\u_div/PartRem[2][6] ) );
  MX2XLM U124 ( .A(n56), .B(\u_div/SumTmp[4][2] ), .S0(quotient[4]), .Y(n53)
         );
  MX2XLM U125 ( .A(n57), .B(\u_div/SumTmp[4][3] ), .S0(quotient[4]), .Y(n55)
         );
  INVX2M U126 ( .A(a[5]), .Y(n74) );
  INVX2M U127 ( .A(\u_div/SumTmp[5][0] ), .Y(n75) );
  INVX2M U128 ( .A(\u_div/SumTmp[1][1] ), .Y(n86) );
  INVX2M U129 ( .A(\u_div/SumTmp[1][3] ), .Y(n78) );
  MXI2X6M U130 ( .A(n61), .B(n60), .S0(n93), .Y(n59) );
  INVX2M U131 ( .A(n67), .Y(\u_div/PartRem[2][5] ) );
  MXI2XLM U132 ( .A(n70), .B(n81), .S0(quotient[1]), .Y(\u_div/PartRem[1][3] )
         );
  INVX2M U133 ( .A(\u_div/SumTmp[1][2] ), .Y(n81) );
  INVX2M U134 ( .A(\u_div/SumTmp[1][6] ), .Y(n72) );
  NAND2XLM U135 ( .A(n99), .B(\u_div/BInv [5]), .Y(n84) );
  INVX2M U136 ( .A(\u_div/SumTmp[1][0] ), .Y(n91) );
  AND2X1M U137 ( .A(n94), .B(n95), .Y(quotient[7]) );
  INVX2M U138 ( .A(a[1]), .Y(n90) );
  INVXLM U139 ( .A(b[6]), .Y(\u_div/BInv [6]) );
  MXI2X6M U140 ( .A(n90), .B(n91), .S0(n92), .Y(\u_div/PartRem[1][1] ) );
endmodule


module ALU_IN_WIDTH8_OUT_WIDTH16 ( CLK, RST, A, B, EN, ALU_FUN, ALU_OUT, 
        OUT_VALID );
  input [7:0] A;
  input [7:0] B;
  input [3:0] ALU_FUN;
  output [15:0] ALU_OUT;
  input CLK, RST, EN;
  output OUT_VALID;
  wire   N90, N91, N92, N93, N94, N95, N96, N97, N98, N99, N100, N101, N102,
         N103, N104, N105, N106, N107, N108, N109, N110, N111, N112, N113,
         N114, N115, N116, N117, N118, N119, N120, N121, N122, N123, N124,
         N125, N126, N127, N128, N129, N130, N131, N156, N157, N158, n31, n32,
         n33, n34, n36, n43, n44, n45, n46, n47, n48, n54, n55, n56, n60, n61,
         n62, n66, n67, n68, n72, n73, n74, n78, n79, n80, n83, n84, n85, n86,
         n87, n88, n89, n90, n92, n101, n103, n104, n106, n107, n3, n4, n5, n6,
         n7, n8, n9, n10, n11, n12, n13, n14, n15, n16, n17, n18, n19, n20,
         n21, n22, n23, n24, n25, n26, n27, n28, n29, n30, n35, n37, n38, n39,
         n40, n41, n42, n49, n50, n51, n52, n53, n57, n58, n59, n63, n64, n65,
         n69, n70, n71, n75, n76, n77, n81, n82, n91, n93, n94, n95, n96, n97,
         n98, n99, n100, n102, n105, n108, n109, n110, n111, n112, n113, n114,
         n115, n116, n117, n118, n119, n120, n121, n122, n123, n124, n125,
         n126, n127, n128, n129, n130, n131, n132, n133, n134, n135, n136,
         n137, n138, n139, n140, n141, n142, n143, n144, n145, n146, n147,
         n148, n149, n150, n151, n152, n153, n154, n155, n156, n157, n158,
         n159, n160, n161, n162, n163, n164, n165, n166, n167, n168, n169,
         n170;
  wire   [15:0] ALU_OUT_Comb;

  ALU_IN_WIDTH8_OUT_WIDTH16_DW01_sub_0 sub_34 ( .A({1'b0, n4, n15, n14, n13, 
        n12, n11, n10, A[0]}), .B({1'b0, B[7], n9, B[5:0]}), .CI(1'b0), .DIFF(
        {N107, N106, N105, N104, N103, N102, N101, N100, N99}) );
  ALU_IN_WIDTH8_OUT_WIDTH16_DW01_add_0 add_30 ( .A({1'b0, n5, n15, n14, n13, 
        n12, n11, n10, A[0]}), .B({1'b0, B[7], n9, B[5:0]}), .CI(1'b0), .SUM({
        N98, N97, N96, N95, N94, N93, N92, N91, N90}) );
  ALU_IN_WIDTH8_OUT_WIDTH16_DW02_mult_0 mult_38 ( .A({n4, n15, n14, n13, n12, 
        n11, n10, A[0]}), .B({B[7], n9, B[5:0]}), .TC(1'b0), .PRODUCT({N123, 
        N122, N121, N120, N119, N118, N117, N116, N115, N114, N113, N112, N111, 
        N110, N109, N108}) );
  ALU_IN_WIDTH8_OUT_WIDTH16_DW_div_uns_1 div_42 ( .a({n3, n15, n14, n13, n12, 
        n11, n10, A[0]}), .b({B[7], n9, B[5:0]}), .quotient({N131, N130, N129, 
        N128, N127, N126, N125, N124}) );
  DFFRQX2M \ALU_OUT_reg[8]  ( .D(ALU_OUT_Comb[8]), .CK(CLK), .RN(RST), .Q(
        ALU_OUT[8]) );
  DFFRQX1M \ALU_OUT_reg[0]  ( .D(ALU_OUT_Comb[0]), .CK(CLK), .RN(RST), .Q(
        ALU_OUT[0]) );
  DFFRQX2M \ALU_OUT_reg[15]  ( .D(ALU_OUT_Comb[15]), .CK(CLK), .RN(RST), .Q(
        ALU_OUT[15]) );
  DFFRQX2M \ALU_OUT_reg[14]  ( .D(ALU_OUT_Comb[14]), .CK(CLK), .RN(RST), .Q(
        ALU_OUT[14]) );
  DFFRQX2M \ALU_OUT_reg[13]  ( .D(ALU_OUT_Comb[13]), .CK(CLK), .RN(RST), .Q(
        ALU_OUT[13]) );
  DFFRQX2M \ALU_OUT_reg[12]  ( .D(ALU_OUT_Comb[12]), .CK(CLK), .RN(RST), .Q(
        ALU_OUT[12]) );
  DFFRQX2M \ALU_OUT_reg[11]  ( .D(ALU_OUT_Comb[11]), .CK(CLK), .RN(RST), .Q(
        ALU_OUT[11]) );
  DFFRQX2M \ALU_OUT_reg[10]  ( .D(ALU_OUT_Comb[10]), .CK(CLK), .RN(RST), .Q(
        ALU_OUT[10]) );
  DFFRQX2M \ALU_OUT_reg[9]  ( .D(ALU_OUT_Comb[9]), .CK(CLK), .RN(RST), .Q(
        ALU_OUT[9]) );
  DFFRQX2M \ALU_OUT_reg[7]  ( .D(ALU_OUT_Comb[7]), .CK(CLK), .RN(RST), .Q(
        ALU_OUT[7]) );
  DFFRQX2M \ALU_OUT_reg[6]  ( .D(ALU_OUT_Comb[6]), .CK(CLK), .RN(RST), .Q(
        ALU_OUT[6]) );
  DFFRQX2M \ALU_OUT_reg[5]  ( .D(ALU_OUT_Comb[5]), .CK(CLK), .RN(RST), .Q(
        ALU_OUT[5]) );
  DFFRQX2M \ALU_OUT_reg[4]  ( .D(ALU_OUT_Comb[4]), .CK(CLK), .RN(RST), .Q(
        ALU_OUT[4]) );
  DFFRQX2M \ALU_OUT_reg[3]  ( .D(ALU_OUT_Comb[3]), .CK(CLK), .RN(RST), .Q(
        ALU_OUT[3]) );
  DFFRQX2M \ALU_OUT_reg[2]  ( .D(ALU_OUT_Comb[2]), .CK(CLK), .RN(RST), .Q(
        ALU_OUT[2]) );
  DFFRQX2M \ALU_OUT_reg[1]  ( .D(ALU_OUT_Comb[1]), .CK(CLK), .RN(RST), .Q(
        ALU_OUT[1]) );
  DFFRQX2M OUT_VALID_reg ( .D(EN), .CK(CLK), .RN(RST), .Q(OUT_VALID) );
  BUFX8M U3 ( .A(B[6]), .Y(n9) );
  BUFX8M U4 ( .A(n16), .Y(n3) );
  DLY1X1M U7 ( .A(n16), .Y(n4) );
  DLY1X1M U8 ( .A(n16), .Y(n5) );
  BUFX4M U9 ( .A(A[7]), .Y(n16) );
  NAND2BXLM U10 ( .AN(B[5]), .B(n14), .Y(n142) );
  BUFX2M U11 ( .A(A[5]), .Y(n14) );
  NOR2X2M U12 ( .A(N124), .B(n71), .Y(n115) );
  AND2X2M U13 ( .A(n103), .B(n97), .Y(n6) );
  BUFX2M U14 ( .A(A[6]), .Y(n15) );
  AOI21X1M U15 ( .A0(N100), .A1(n7), .B0(n22), .Y(n23) );
  AOI22XLM U16 ( .A0(N105), .A1(n7), .B0(n15), .B1(n117), .Y(n59) );
  INVXLM U17 ( .A(n15), .Y(n163) );
  AOI21XLM U18 ( .A0(n126), .A1(n123), .B0(B[1]), .Y(n127) );
  INVX2M U19 ( .A(n77), .Y(n119) );
  INVX2M U20 ( .A(n93), .Y(n117) );
  NOR2BX2M U21 ( .AN(n120), .B(n169), .Y(n31) );
  INVX2M U22 ( .A(n108), .Y(n64) );
  OAI2BB1X2M U23 ( .A0N(N123), .A1N(n31), .B0(n32), .Y(ALU_OUT_Comb[15]) );
  OAI2BB1X2M U24 ( .A0N(N122), .A1N(n31), .B0(n32), .Y(ALU_OUT_Comb[14]) );
  OAI2BB1X2M U25 ( .A0N(N119), .A1N(n31), .B0(n32), .Y(ALU_OUT_Comb[11]) );
  OAI2BB1X2M U26 ( .A0N(N120), .A1N(n31), .B0(n32), .Y(ALU_OUT_Comb[12]) );
  OAI2BB1X2M U27 ( .A0N(N121), .A1N(n31), .B0(n32), .Y(ALU_OUT_Comb[13]) );
  OAI2BB1X2M U28 ( .A0N(N117), .A1N(n31), .B0(n32), .Y(ALU_OUT_Comb[9]) );
  OAI2BB1X2M U29 ( .A0N(N118), .A1N(n31), .B0(n32), .Y(ALU_OUT_Comb[10]) );
  OAI2BB1X2M U30 ( .A0N(n170), .A1N(n122), .B0(n101), .Y(n47) );
  OAI2BB1X2M U31 ( .A0N(n121), .A1N(n118), .B0(n101), .Y(n48) );
  OR2X2M U32 ( .A(n20), .B(n26), .Y(n93) );
  OR2X2M U33 ( .A(n107), .B(n18), .Y(n77) );
  NOR2X2M U34 ( .A(n19), .B(n20), .Y(n7) );
  INVX2M U35 ( .A(n46), .Y(n91) );
  INVX2M U36 ( .A(n107), .Y(n170) );
  INVX2M U37 ( .A(n26), .Y(n118) );
  INVX2M U38 ( .A(n18), .Y(n121) );
  INVX2M U39 ( .A(n20), .Y(n122) );
  NAND3BX2M U40 ( .AN(n124), .B(n122), .C(n21), .Y(n108) );
  INVX2M U41 ( .A(n17), .Y(n120) );
  NAND3BX2M U42 ( .AN(n124), .B(n121), .C(n21), .Y(n17) );
  NOR2X2M U43 ( .A(n18), .B(n19), .Y(n8) );
  INVX2M U44 ( .A(n75), .Y(n116) );
  INVX2M U45 ( .A(n106), .Y(n19) );
  INVX2M U46 ( .A(EN), .Y(n169) );
  NOR2X2M U47 ( .A(n112), .B(n111), .Y(n113) );
  NOR2X2M U48 ( .A(n99), .B(n98), .Y(n114) );
  AOI31X2M U49 ( .A0(N157), .A1(ALU_FUN[3]), .A2(n89), .B0(n90), .Y(n88) );
  NOR3X2M U50 ( .A(n125), .B(ALU_FUN[2]), .C(n124), .Y(n89) );
  NOR2X2M U51 ( .A(ALU_FUN[2]), .B(ALU_FUN[1]), .Y(n106) );
  AND3X2M U52 ( .A(n106), .B(n125), .C(ALU_FUN[3]), .Y(n46) );
  INVX2M U53 ( .A(ALU_FUN[0]), .Y(n125) );
  OR2X2M U54 ( .A(ALU_FUN[0]), .B(ALU_FUN[3]), .Y(n18) );
  OR2X2M U55 ( .A(ALU_FUN[3]), .B(n125), .Y(n20) );
  NAND2X2M U56 ( .A(EN), .B(n158), .Y(n32) );
  NAND3X2M U57 ( .A(n106), .B(ALU_FUN[0]), .C(ALU_FUN[3]), .Y(n101) );
  OR2X2M U58 ( .A(ALU_FUN[1]), .B(n21), .Y(n26) );
  NAND2X2M U59 ( .A(ALU_FUN[2]), .B(ALU_FUN[1]), .Y(n107) );
  INVX2M U60 ( .A(ALU_FUN[2]), .Y(n21) );
  AND4X2M U61 ( .A(N158), .B(n118), .C(ALU_FUN[3]), .D(n125), .Y(n90) );
  AO22X1M U62 ( .A0(N96), .A1(n8), .B0(n163), .B1(n119), .Y(n57) );
  NOR3X2M U63 ( .A(n124), .B(ALU_FUN[2]), .C(ALU_FUN[0]), .Y(n104) );
  NAND3BX2M U64 ( .AN(n125), .B(ALU_FUN[3]), .C(n118), .Y(n75) );
  NAND3X2M U65 ( .A(n170), .B(n125), .C(ALU_FUN[3]), .Y(n36) );
  OR2X2M U66 ( .A(n123), .B(n75), .Y(n100) );
  INVX2M U67 ( .A(ALU_FUN[1]), .Y(n124) );
  INVX2M U68 ( .A(n110), .Y(n99) );
  AOI31X2M U69 ( .A0(n25), .A1(n24), .A2(n23), .B0(n169), .Y(ALU_OUT_Comb[1])
         );
  AOI22X1M U70 ( .A0(N91), .A1(n8), .B0(N109), .B1(n120), .Y(n25) );
  MX2X2M U71 ( .A(n77), .B(n93), .S0(n10), .Y(n24) );
  AOI31X2M U72 ( .A0(n30), .A1(n29), .A2(n28), .B0(n169), .Y(ALU_OUT_Comb[2])
         );
  AOI22X1M U73 ( .A0(N101), .A1(n7), .B0(n11), .B1(n117), .Y(n29) );
  AOI211X2M U74 ( .A0(N110), .A1(n120), .B0(n27), .C0(n78), .Y(n28) );
  AOI22XLM U75 ( .A0(n12), .A1(n116), .B0(N126), .B1(n64), .Y(n30) );
  AOI31X2M U76 ( .A0(n39), .A1(n38), .A2(n37), .B0(n169), .Y(ALU_OUT_Comb[3])
         );
  AOI22X1M U77 ( .A0(N102), .A1(n7), .B0(n12), .B1(n117), .Y(n38) );
  AOI211X2M U78 ( .A0(N111), .A1(n120), .B0(n35), .C0(n72), .Y(n37) );
  AOI31X2M U79 ( .A0(n49), .A1(n42), .A2(n41), .B0(n169), .Y(ALU_OUT_Comb[4])
         );
  AOI22X1M U80 ( .A0(N103), .A1(n7), .B0(n13), .B1(n117), .Y(n42) );
  AOI211X2M U81 ( .A0(N112), .A1(n120), .B0(n40), .C0(n66), .Y(n41) );
  AOI21X2M U82 ( .A0(n33), .A1(n34), .B0(n169), .Y(ALU_OUT_Comb[8]) );
  AOI21X2M U83 ( .A0(N98), .A1(n8), .B0(n158), .Y(n33) );
  AOI2BB2XLM U84 ( .B0(N116), .B1(n120), .A0N(n162), .A1N(n36), .Y(n34) );
  AOI31X2M U85 ( .A0(n70), .A1(n69), .A2(n65), .B0(n169), .Y(ALU_OUT_Comb[7])
         );
  OA22X2M U86 ( .A0(n93), .A1(n162), .B0(n77), .B1(n4), .Y(n69) );
  AOI221XLM U87 ( .A0(N97), .A1(n8), .B0(N115), .B1(n120), .C0(n43), .Y(n65)
         );
  AOI31X2M U88 ( .A0(n63), .A1(n59), .A2(n58), .B0(n169), .Y(ALU_OUT_Comb[6])
         );
  AOI211X2M U89 ( .A0(N114), .A1(n120), .B0(n57), .C0(n54), .Y(n58) );
  AOI221XLM U90 ( .A0(n46), .A1(n163), .B0(n15), .B1(n48), .C0(n117), .Y(n55)
         );
  AOI221XLM U91 ( .A0(n15), .A1(n46), .B0(n47), .B1(n163), .C0(n119), .Y(n56)
         );
  AOI221XLM U92 ( .A0(n46), .A1(n123), .B0(n10), .B1(n48), .C0(n117), .Y(n86)
         );
  AOI221XLM U93 ( .A0(n10), .A1(n46), .B0(n47), .B1(n123), .C0(n119), .Y(n87)
         );
  NAND4X2M U94 ( .A(n108), .B(n105), .C(n102), .D(n100), .Y(n112) );
  AOI31X2M U95 ( .A0(n53), .A1(n52), .A2(n51), .B0(n169), .Y(ALU_OUT_Comb[5])
         );
  AOI22X1M U96 ( .A0(N104), .A1(n7), .B0(n14), .B1(n117), .Y(n52) );
  AOI22XLM U97 ( .A0(n15), .A1(n116), .B0(N129), .B1(n64), .Y(n53) );
  AOI211X2M U98 ( .A0(N113), .A1(n120), .B0(n50), .C0(n60), .Y(n51) );
  NAND3X2M U99 ( .A(n102), .B(n109), .C(n105), .Y(n71) );
  INVX2M U100 ( .A(n92), .Y(n158) );
  AOI211X2M U101 ( .A0(N107), .A1(n7), .B0(n119), .C0(n47), .Y(n92) );
  NAND3X2M U102 ( .A(n110), .B(n6), .C(n109), .Y(n111) );
  NAND2X2M U103 ( .A(n100), .B(n6), .Y(n98) );
  INVX2M U104 ( .A(n10), .Y(n123) );
  NAND2X2M U105 ( .A(N108), .B(n120), .Y(n110) );
  NAND2X2M U106 ( .A(N90), .B(n8), .Y(n109) );
  AO22X1M U107 ( .A0(N92), .A1(n8), .B0(n167), .B1(n119), .Y(n27) );
  AO22X1M U108 ( .A0(N93), .A1(n8), .B0(n166), .B1(n119), .Y(n35) );
  AO22X1M U109 ( .A0(N94), .A1(n8), .B0(n165), .B1(n119), .Y(n40) );
  AO22X1M U110 ( .A0(N95), .A1(n8), .B0(n164), .B1(n119), .Y(n50) );
  INVX2M U111 ( .A(n12), .Y(n166) );
  INVX2M U112 ( .A(n11), .Y(n167) );
  INVX2M U113 ( .A(n13), .Y(n165) );
  INVX2M U114 ( .A(n14), .Y(n164) );
  BUFX2M U115 ( .A(A[4]), .Y(n13) );
  OAI2BB1XLM U116 ( .A0N(N125), .A1N(n64), .B0(n83), .Y(n22) );
  AOI211X2M U117 ( .A0(n11), .A1(n116), .B0(n84), .C0(n85), .Y(n83) );
  OAI2B2X1M U118 ( .A1N(B[1]), .A0(n86), .B0(n36), .B1(n168), .Y(n85) );
  OAI21XLM U119 ( .A0(B[1]), .A1(n87), .B0(n88), .Y(n84) );
  BUFX2M U120 ( .A(A[3]), .Y(n12) );
  BUFX2M U121 ( .A(A[2]), .Y(n11) );
  BUFX2M U122 ( .A(A[1]), .Y(n10) );
  OAI222XLM U123 ( .A0(n79), .A1(n154), .B0(B[2]), .B1(n80), .C0(n36), .C1(
        n123), .Y(n78) );
  AOI221XLM U124 ( .A0(n46), .A1(n167), .B0(n11), .B1(n48), .C0(n117), .Y(n79)
         );
  AOI221XLM U125 ( .A0(n11), .A1(n46), .B0(n47), .B1(n167), .C0(n119), .Y(n80)
         );
  OAI222XLM U126 ( .A0(n73), .A1(n156), .B0(B[3]), .B1(n74), .C0(n36), .C1(
        n167), .Y(n72) );
  AOI221XLM U127 ( .A0(n46), .A1(n166), .B0(n12), .B1(n48), .C0(n117), .Y(n73)
         );
  AOI221XLM U128 ( .A0(n12), .A1(n46), .B0(n47), .B1(n166), .C0(n119), .Y(n74)
         );
  OAI222XLM U129 ( .A0(n67), .A1(n161), .B0(B[4]), .B1(n68), .C0(n36), .C1(
        n166), .Y(n66) );
  INVXLM U130 ( .A(B[4]), .Y(n161) );
  AOI221XLM U131 ( .A0(n46), .A1(n165), .B0(n13), .B1(n48), .C0(n117), .Y(n67)
         );
  AOI221XLM U132 ( .A0(n13), .A1(n46), .B0(n47), .B1(n165), .C0(n119), .Y(n68)
         );
  OAI222XLM U133 ( .A0(n61), .A1(n160), .B0(B[5]), .B1(n62), .C0(n36), .C1(
        n165), .Y(n60) );
  INVXLM U134 ( .A(B[5]), .Y(n160) );
  AOI221XLM U135 ( .A0(n46), .A1(n164), .B0(n14), .B1(n48), .C0(n117), .Y(n61)
         );
  AOI221XLM U136 ( .A0(n14), .A1(n46), .B0(n47), .B1(n164), .C0(n119), .Y(n62)
         );
  INVX2M U137 ( .A(n126), .Y(n153) );
  AND2X2M U138 ( .A(n81), .B(n77), .Y(n96) );
  INVX2M U139 ( .A(n47), .Y(n76) );
  INVX2M U140 ( .A(n137), .Y(n155) );
  AOI31X2M U141 ( .A0(N156), .A1(ALU_FUN[3]), .A2(n104), .B0(n90), .Y(n103) );
  MX2X2M U142 ( .A(n96), .B(n95), .S0(A[0]), .Y(n97) );
  INVXLM U143 ( .A(B[2]), .Y(n154) );
  INVXLM U144 ( .A(B[3]), .Y(n156) );
  AND2X2M U145 ( .A(n94), .B(n93), .Y(n95) );
  INVX2M U146 ( .A(n48), .Y(n82) );
  NAND2X2M U147 ( .A(N99), .B(n7), .Y(n102) );
  INVX2M U148 ( .A(A[0]), .Y(n168) );
  INVXLM U149 ( .A(n4), .Y(n162) );
  INVXLM U150 ( .A(n9), .Y(n157) );
  MX2XLM U151 ( .A(n77), .B(n93), .S0(B[0]), .Y(n105) );
  MX2XLM U152 ( .A(n76), .B(n91), .S0(B[0]), .Y(n81) );
  MX2XLM U153 ( .A(n91), .B(n82), .S0(B[0]), .Y(n94) );
  INVXLM U154 ( .A(B[0]), .Y(n152) );
  INVXLM U155 ( .A(B[7]), .Y(n159) );
  AOI22XLM U156 ( .A0(n13), .A1(n116), .B0(N127), .B1(n64), .Y(n39) );
  OAI222XLM U157 ( .A0(n55), .A1(n157), .B0(n9), .B1(n56), .C0(n36), .C1(n164), 
        .Y(n54) );
  AOI32XLM U158 ( .A0(n132), .A1(n142), .A2(n145), .B0(n9), .B1(n163), .Y(n133) );
  XNOR2XLM U159 ( .A(n15), .B(n9), .Y(n145) );
  AOI22XLM U160 ( .A0(N131), .A1(n64), .B0(N106), .B1(n7), .Y(n70) );
  AOI22XLM U161 ( .A0(n5), .A1(n116), .B0(N130), .B1(n64), .Y(n63) );
  AOI221XLM U162 ( .A0(n46), .A1(n162), .B0(n5), .B1(n48), .C0(n117), .Y(n44)
         );
  AOI221XLM U163 ( .A0(n46), .A1(n5), .B0(n47), .B1(n162), .C0(n119), .Y(n45)
         );
  NAND2XLM U164 ( .A(B[7]), .B(n162), .Y(n149) );
  AOI22XLM U165 ( .A0(n14), .A1(n116), .B0(N128), .B1(n64), .Y(n49) );
  OAI222XLM U166 ( .A0(n44), .A1(n159), .B0(B[7]), .B1(n45), .C0(n36), .C1(
        n163), .Y(n43) );
  NOR2XLM U167 ( .A(n162), .B(B[7]), .Y(n148) );
  AOI211X2M U168 ( .A0(n115), .A1(n114), .B0(n113), .C0(n169), .Y(
        ALU_OUT_Comb[0]) );
  NAND2BX1M U169 ( .AN(B[4]), .B(n13), .Y(n141) );
  NAND2BX1M U170 ( .AN(n13), .B(B[4]), .Y(n130) );
  CLKNAND2X2M U171 ( .A(n141), .B(n130), .Y(n143) );
  NOR2X1M U172 ( .A(n156), .B(n12), .Y(n138) );
  NOR2X1M U173 ( .A(n154), .B(n11), .Y(n129) );
  NOR2X1M U174 ( .A(n152), .B(A[0]), .Y(n126) );
  CLKNAND2X2M U175 ( .A(n11), .B(n154), .Y(n140) );
  NAND2BX1M U176 ( .AN(n129), .B(n140), .Y(n135) );
  AOI211X1M U177 ( .A0(n10), .A1(n153), .B0(n135), .C0(n127), .Y(n128) );
  CLKNAND2X2M U178 ( .A(n12), .B(n156), .Y(n139) );
  OAI31X1M U179 ( .A0(n138), .A1(n129), .A2(n128), .B0(n139), .Y(n131) );
  NAND2BX1M U180 ( .AN(n14), .B(B[5]), .Y(n146) );
  OAI211X1M U181 ( .A0(n143), .A1(n131), .B0(n130), .C0(n146), .Y(n132) );
  OAI21X1M U182 ( .A0(n148), .A1(n133), .B0(n149), .Y(N158) );
  CLKNAND2X2M U183 ( .A(A[0]), .B(n152), .Y(n136) );
  OA21X1M U184 ( .A0(n136), .A1(n123), .B0(B[1]), .Y(n134) );
  AOI211X1M U185 ( .A0(n136), .A1(n123), .B0(n135), .C0(n134), .Y(n137) );
  AOI31X1M U186 ( .A0(n155), .A1(n140), .A2(n139), .B0(n138), .Y(n144) );
  OAI2B11X1M U187 ( .A1N(n144), .A0(n143), .B0(n142), .C0(n141), .Y(n147) );
  AOI32X1M U188 ( .A0(n147), .A1(n146), .A2(n145), .B0(n15), .B1(n157), .Y(
        n150) );
  AOI2B1X1M U189 ( .A1N(n150), .A0(n149), .B0(n148), .Y(n151) );
  CLKINVX1M U190 ( .A(n151), .Y(N157) );
  NOR2X1M U191 ( .A(N158), .B(N157), .Y(N156) );
endmodule


module CLK_GATE ( CLK_EN, CLK, GATED_CLK );
  input CLK_EN, CLK;
  output GATED_CLK;


  TLATNCAX12M U0_TLATNCAX12M ( .E(CLK_EN), .CK(CLK), .ECK(GATED_CLK) );
endmodule


module SYS_TOP ( UART_CLK, REF_CLK, RST, UART_RX_IN, UART_TX_O, PAR_ERR, 
        STP_ERR );
  input UART_CLK, REF_CLK, RST, UART_RX_IN;
  output UART_TX_O, PAR_ERR, STP_ERR;
  wire   RST_SYNC_UART, RST_SYNC_REF, RX_OUT_V_UNSY, RX_OUT_V_SYNC,
         UART_TX_VLD, BUSY_PULSE_GEN, FIFO_FULL, TX_VLD_SYNC, TX_BUSY_SIG,
         UART_TX_CLK, UART_RX_CLK, ALU_OUT_VLD, RDDATA_VLD, ALU_EN, CLK_EN,
         WR_EN, RD_EN, ALU_CLK, n1, n2, n3, n4, n5, n6, n7, n8;
  wire   [7:0] RX_OUT_UNSY;
  wire   [7:0] RX_OUT_SYNC;
  wire   [7:0] UART_IN_UNSYNC;
  wire   [7:0] UART_IN_SYNC;
  wire   [7:0] DIV_RATIO_SIG;
  wire   [7:0] UART_CONFIG;
  wire   [7:0] DIV_RATIO_RX_SIG;
  wire   [15:0] ALU_OUT;
  wire   [7:0] RDDATA;
  wire   [3:0] ALU_FUN;
  wire   [3:0] ADDRESS;
  wire   [7:0] WR_DATA;
  wire   [7:0] OP_A;
  wire   [7:0] OP_B;
  wire   SYNOPSYS_UNCONNECTED__0, SYNOPSYS_UNCONNECTED__1, 
        SYNOPSYS_UNCONNECTED__2, SYNOPSYS_UNCONNECTED__3;

  RST_SYNC_NUM_STAGES2_0 U0_RST_SYNC ( .CLK(UART_CLK), .RST(RST), .SYNC_RST(
        RST_SYNC_UART) );
  RST_SYNC_NUM_STAGES2_1 U1_RST_SYNC ( .CLK(REF_CLK), .RST(RST), .SYNC_RST(
        RST_SYNC_REF) );
  DATA_SYNC_NUM_STAGES2_BUS_WIDTH8 U0_DATA_SYNC ( .CLK(REF_CLK), .RST(n5), 
        .unsync_bus(RX_OUT_UNSY), .bus_enable(RX_OUT_V_UNSY), .sync_bus(
        RX_OUT_SYNC), .enable_pulse(RX_OUT_V_SYNC) );
  ASYNC_FIFO_FIFO_WIDTH8_FIFO_DEPTH8_ADDRSIZE3 U0_ASYNC_FIFO ( .W_CLK(REF_CLK), 
        .W_RST(n5), .W_INC(UART_TX_VLD), .R_CLK(UART_CLK), .R_RST(n7), .R_INC(
        BUSY_PULSE_GEN), .WR_DATA(UART_IN_UNSYNC), .FULL(FIFO_FULL), .RD_DATA(
        UART_IN_SYNC), .EMPTY(TX_VLD_SYNC) );
  PULSE_GEN U0_PULSE_GEN ( .clk(UART_CLK), .rst(n7), .lvl_sig(TX_BUSY_SIG), 
        .pulse_sig(BUSY_PULSE_GEN) );
  CLKDIV_RATIO_WIDTH8_0 U0_CLKDIV ( .CLK(UART_CLK), .RST(n7), .CLK_EN(1'b1), 
        .DIV_RATIO(DIV_RATIO_SIG), .DIV_CLK(UART_TX_CLK) );
  CLKDIV_MUX U0_CLKDIV_MUX ( .IN(UART_CONFIG[7:2]), .OUT({
        SYNOPSYS_UNCONNECTED__0, SYNOPSYS_UNCONNECTED__1, 
        SYNOPSYS_UNCONNECTED__2, SYNOPSYS_UNCONNECTED__3, 
        DIV_RATIO_RX_SIG[3:0]}) );
  CLKDIV_RATIO_WIDTH8_1 U1_CLKDIV ( .CLK(UART_CLK), .RST(n7), .CLK_EN(1'b1), 
        .DIV_RATIO({1'b0, 1'b0, 1'b0, 1'b0, DIV_RATIO_RX_SIG[3:0]}), .DIV_CLK(
        UART_RX_CLK) );
  UART_DATA_WIDTH8 U0_UART ( .RST(n7), .TX_CLK(UART_TX_CLK), .RX_CLK(
        UART_RX_CLK), .RX_IN_S(n2), .TX_IN_P(UART_IN_SYNC), .TX_IN_V(n1), 
        .PRESCALE(UART_CONFIG[7:2]), .PAR_EN(UART_CONFIG[0]), .PAR_TYP(
        UART_CONFIG[1]), .RX_OUT_P(RX_OUT_UNSY), .RX_OUT_V(RX_OUT_V_UNSY), 
        .TX_OUT_S(UART_TX_O), .TX_OUT_V(TX_BUSY_SIG), .PAR_ERR(PAR_ERR), 
        .STP_ERR(STP_ERR) );
  SYS_CNTRL U0_SYS_CNTRL ( .CLK(REF_CLK), .RST(n5), .ALU_OUT(ALU_OUT), 
        .ALU_OUT_VLD(ALU_OUT_VLD), .RDDATA(RDDATA), .RDDATA_VLD(RDDATA_VLD), 
        .RX_P_DATA(RX_OUT_SYNC), .RX_D_VLD(RX_OUT_V_SYNC), .FIFO_FULL(
        FIFO_FULL), .ALU_FUN(ALU_FUN), .ALU_EN(ALU_EN), .CLK_EN(CLK_EN), 
        .ADDRESS(ADDRESS), .WR_EN(WR_EN), .RD_EN(RD_EN), .WR_DATA(WR_DATA), 
        .TX_P_DATA(UART_IN_UNSYNC), .TX_D_VLD(UART_TX_VLD) );
  RegisterFile_WIDTH8_DEPTH16_ADDR4 U0_RF ( .CLK(REF_CLK), .RST(n5), .WrEn(
        WR_EN), .RdEn(RD_EN), .Address({ADDRESS[3:2], n4, n3}), .WrData(
        WR_DATA), .RdData(RDDATA), .RdData_VLD(RDDATA_VLD), .REG0(OP_A), 
        .REG1(OP_B), .REG2(UART_CONFIG), .REG3(DIV_RATIO_SIG) );
  ALU_IN_WIDTH8_OUT_WIDTH16 U0_ALU ( .CLK(ALU_CLK), .RST(n5), .A(OP_A), .B(
        OP_B), .EN(ALU_EN), .ALU_FUN(ALU_FUN), .ALU_OUT(ALU_OUT), .OUT_VALID(
        ALU_OUT_VLD) );
  CLK_GATE U0_CLK_GATE ( .CLK_EN(CLK_EN), .CLK(REF_CLK), .GATED_CLK(ALU_CLK)
         );
  BUFX2M U2 ( .A(ADDRESS[0]), .Y(n3) );
  BUFX2M U3 ( .A(ADDRESS[1]), .Y(n4) );
  INVX2M U4 ( .A(TX_VLD_SYNC), .Y(n1) );
  BUFX2M U5 ( .A(UART_RX_IN), .Y(n2) );
  INVX4M U6 ( .A(n6), .Y(n5) );
  INVX2M U7 ( .A(RST_SYNC_REF), .Y(n6) );
  INVX4M U8 ( .A(n8), .Y(n7) );
  INVX2M U9 ( .A(RST_SYNC_UART), .Y(n8) );
endmodule

