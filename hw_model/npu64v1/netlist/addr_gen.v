
module addr_gen ( ck, rst, sync_clr, en, inc_even, inc_odd, arv_tilev, 
        data_even_addr, data_odd_addr );
  input [1:0] arv_tilev;
  output [9:0] data_even_addr;
  output [9:0] data_odd_addr;
  input ck, rst, sync_clr, en, inc_even, inc_odd;
  wire   N20, N21, N22, N23, N24, N26, N37, N38, N39, N40, N41, N42, N43, N44,
         N45, N46, N57, N74, N75, N76, N77, N78, N80, N93, N94, N95, N96, N97,
         N98, N99, N100, N101, N102, net35, net41, net46, n50, n51, n52, n53,
         n54, n55, n56, n57, n58, n59, n60, n61, n62, n63, n64, n65, n66, n67,
         n68, n70, n71, n72, n73, n75, n76, n77, n78, n79, n80, n81, n82, n83,
         n84, n85, n86, n87, n88, n89, n90, n91, n92, n93, n94, n95, n96, n97,
         n98, n99, n100, n101, n102, n103, n104, n105, n106, n107, n108, n109,
         n110, n111, n112, n113;
  wire   [9:5] int_data_even_base_addr;
  wire   [9:5] int_data_odd_base_addr;
  wire   [9:7] add_78_carry;
  wire   [9:7] add_44_carry;
  wire   [9:2] add_97_carry;
  wire   [9:2] add_62_carry;

  DFFR_X1 int_data_even_addr_reg_0_ ( .D(n101), .CK(net41), .RN(n86), .Q(
        data_even_addr[0]) );
  DFFR_X1 int_data_even_addr_reg_1_ ( .D(n102), .CK(net41), .RN(n86), .Q(
        data_even_addr[1]) );
  DFFR_X1 int_data_even_addr_reg_2_ ( .D(n103), .CK(net41), .RN(n86), .Q(
        data_even_addr[2]) );
  DFFR_X1 int_data_even_addr_reg_3_ ( .D(n104), .CK(net41), .RN(n86), .Q(
        data_even_addr[3]) );
  DFFR_X1 int_data_even_addr_reg_4_ ( .D(n105), .CK(net41), .RN(n86), .Q(
        data_even_addr[4]) );
  DFFR_X1 int_data_even_addr_reg_5_ ( .D(n106), .CK(net41), .RN(n86), .Q(
        data_even_addr[5]) );
  DFFR_X1 int_data_even_addr_reg_6_ ( .D(n107), .CK(net41), .RN(n86), .Q(
        data_even_addr[6]) );
  DFFR_X1 int_data_even_addr_reg_7_ ( .D(n108), .CK(net41), .RN(n85), .Q(
        data_even_addr[7]) );
  DFFR_X1 int_data_even_addr_reg_8_ ( .D(n109), .CK(net41), .RN(n85), .Q(
        data_even_addr[8]) );
  DFFR_X1 int_data_even_addr_reg_9_ ( .D(n110), .CK(net41), .RN(n85), .Q(
        data_even_addr[9]) );
  DFFR_X1 int_data_odd_addr_reg_0_ ( .D(n92), .CK(net41), .RN(n85), .Q(
        data_odd_addr[0]) );
  DFFR_X1 int_data_odd_addr_reg_1_ ( .D(n93), .CK(net41), .RN(n85), .Q(
        data_odd_addr[1]) );
  DFFR_X1 int_data_odd_addr_reg_2_ ( .D(n94), .CK(net41), .RN(n85), .Q(
        data_odd_addr[2]) );
  DFFR_X1 int_data_odd_addr_reg_3_ ( .D(n95), .CK(net41), .RN(n85), .Q(
        data_odd_addr[3]) );
  DFFR_X1 int_data_odd_addr_reg_5_ ( .D(n96), .CK(net41), .RN(n85), .Q(
        data_odd_addr[5]) );
  DFFR_X1 int_data_odd_addr_reg_6_ ( .D(n97), .CK(net41), .RN(n85), .Q(
        data_odd_addr[6]) );
  DFFR_X1 int_data_odd_addr_reg_7_ ( .D(n98), .CK(net41), .RN(n85), .Q(
        data_odd_addr[7]) );
  DFFR_X1 int_data_odd_addr_reg_8_ ( .D(n99), .CK(net41), .RN(n85), .Q(
        data_odd_addr[8]) );
  DFFR_X1 int_data_odd_addr_reg_9_ ( .D(n100), .CK(net41), .RN(n86), .Q(
        data_odd_addr[9]) );
  DFFR_X1 int_data_odd_base_addr_reg_9_ ( .D(n84), .CK(net46), .RN(n90), .Q(
        int_data_odd_base_addr[9]) );
  DFFR_X1 int_data_odd_base_addr_reg_8_ ( .D(n83), .CK(net46), .RN(n90), .Q(
        int_data_odd_base_addr[8]) );
  DFFR_X1 int_data_odd_base_addr_reg_7_ ( .D(n82), .CK(net46), .RN(n90), .Q(
        int_data_odd_base_addr[7]) );
  DFFR_X1 int_data_odd_base_addr_reg_6_ ( .D(n81), .CK(net46), .RN(n90), .Q(
        int_data_odd_base_addr[6]) );
  DFFR_X1 int_data_odd_base_addr_reg_5_ ( .D(n80), .CK(net46), .RN(n87), .Q(
        int_data_odd_base_addr[5]), .QN(N74) );
  DFFR_X1 int_data_even_base_addr_reg_9_ ( .D(n79), .CK(net35), .RN(n90), .Q(
        int_data_even_base_addr[9]) );
  DFFR_X1 int_data_even_base_addr_reg_8_ ( .D(n78), .CK(net35), .RN(n90), .Q(
        int_data_even_base_addr[8]) );
  DFFR_X1 int_data_even_base_addr_reg_7_ ( .D(n77), .CK(net35), .RN(n90), .Q(
        int_data_even_base_addr[7]) );
  DFFR_X1 int_data_even_base_addr_reg_6_ ( .D(n76), .CK(net35), .RN(n90), .Q(
        int_data_even_base_addr[6]) );
  DFFR_X1 int_data_even_base_addr_reg_5_ ( .D(n75), .CK(net35), .RN(n87), .Q(
        int_data_even_base_addr[5]), .QN(N20) );
  SDFFR_X1 int_data_odd_addr_reg_4_ ( .D(1'b0), .SI(n63), .SE(N97), .CK(net41), 
        .RN(n90), .Q(data_odd_addr[4]) );
  AOI22_X1 U77 ( .A1(N96), .A2(n63), .B1(1'b0), .B2(n64), .ZN(n70) );
  NAND2_X2 U78 ( .A1(N95), .A2(n63), .ZN(n71) );
  NAND2_X2 U79 ( .A1(N94), .A2(n63), .ZN(n72) );
  NAND2_X2 U80 ( .A1(N93), .A2(n63), .ZN(n73) );
  AOI22_X1 U81 ( .A1(N41), .A2(n51), .B1(1'b0), .B2(n52), .ZN(n57) );
  AOI22_X1 U82 ( .A1(N40), .A2(n51), .B1(1'b0), .B2(n52), .ZN(n58) );
  AOI22_X1 U83 ( .A1(N39), .A2(n51), .B1(1'b0), .B2(n52), .ZN(n59) );
  NAND2_X2 U84 ( .A1(N38), .A2(n51), .ZN(n60) );
  NAND2_X2 U85 ( .A1(N37), .A2(n51), .ZN(n61) );
  AND2_X1 U87 ( .A1(N20), .A2(n91), .ZN(n75) );
  AND2_X1 U88 ( .A1(N21), .A2(n91), .ZN(n76) );
  AND2_X1 U89 ( .A1(N22), .A2(n91), .ZN(n77) );
  AND2_X1 U90 ( .A1(N23), .A2(n91), .ZN(n78) );
  AND2_X1 U91 ( .A1(N24), .A2(n91), .ZN(n79) );
  AND2_X1 U92 ( .A1(N74), .A2(n91), .ZN(n80) );
  AND2_X1 U93 ( .A1(N75), .A2(n91), .ZN(n81) );
  AND2_X1 U94 ( .A1(N76), .A2(n91), .ZN(n82) );
  AND2_X1 U95 ( .A1(N77), .A2(n91), .ZN(n83) );
  AND2_X1 U96 ( .A1(N78), .A2(n91), .ZN(n84) );
  BUF_X1 U97 ( .A(n89), .Z(n85) );
  BUF_X1 U98 ( .A(n89), .Z(n86) );
  OAI21_X1 U99 ( .B1(n111), .B2(n113), .A(n91), .ZN(N80) );
  OAI21_X1 U100 ( .B1(n111), .B2(n112), .A(n91), .ZN(N26) );
  NAND2_X1 U101 ( .A1(n91), .A2(n111), .ZN(N57) );
  BUF_X1 U102 ( .A(n88), .Z(n87) );
  BUF_X1 U103 ( .A(n90), .Z(n88) );
  BUF_X1 U104 ( .A(n90), .Z(n89) );
  NOR2_X1 U105 ( .A1(inc_even), .A2(sync_clr), .ZN(n63) );
  NOR2_X1 U106 ( .A1(inc_odd), .A2(sync_clr), .ZN(n51) );
  NOR2_X1 U107 ( .A1(n112), .A2(sync_clr), .ZN(n64) );
  NOR2_X1 U108 ( .A1(n113), .A2(sync_clr), .ZN(n52) );
  INV_X1 U109 ( .A(sync_clr), .ZN(n91) );
  INV_X1 U110 ( .A(inc_even), .ZN(n112) );
  INV_X1 U111 ( .A(inc_odd), .ZN(n113) );
  INV_X1 U112 ( .A(en), .ZN(n111) );
  INV_X1 U113 ( .A(n62), .ZN(n100) );
  AOI22_X1 U114 ( .A1(N102), .A2(n63), .B1(int_data_odd_base_addr[9]), .B2(n64), .ZN(n62) );
  INV_X1 U115 ( .A(n65), .ZN(n99) );
  AOI22_X1 U116 ( .A1(N101), .A2(n63), .B1(int_data_odd_base_addr[8]), .B2(n64), .ZN(n65) );
  INV_X1 U117 ( .A(n66), .ZN(n98) );
  AOI22_X1 U118 ( .A1(N100), .A2(n63), .B1(int_data_odd_base_addr[7]), .B2(n64), .ZN(n66) );
  INV_X1 U119 ( .A(n67), .ZN(n97) );
  AOI22_X1 U120 ( .A1(N99), .A2(n63), .B1(int_data_odd_base_addr[6]), .B2(n64), 
        .ZN(n67) );
  INV_X1 U121 ( .A(n68), .ZN(n96) );
  AOI22_X1 U122 ( .A1(N98), .A2(n63), .B1(int_data_odd_base_addr[5]), .B2(n64), 
        .ZN(n68) );
  INV_X1 U123 ( .A(n50), .ZN(n110) );
  AOI22_X1 U124 ( .A1(N46), .A2(n51), .B1(int_data_even_base_addr[9]), .B2(n52), .ZN(n50) );
  INV_X1 U125 ( .A(n53), .ZN(n109) );
  AOI22_X1 U126 ( .A1(N45), .A2(n51), .B1(int_data_even_base_addr[8]), .B2(n52), .ZN(n53) );
  INV_X1 U127 ( .A(n54), .ZN(n108) );
  AOI22_X1 U128 ( .A1(N44), .A2(n51), .B1(int_data_even_base_addr[7]), .B2(n52), .ZN(n54) );
  INV_X1 U129 ( .A(n55), .ZN(n107) );
  AOI22_X1 U130 ( .A1(N43), .A2(n51), .B1(int_data_even_base_addr[6]), .B2(n52), .ZN(n55) );
  INV_X1 U131 ( .A(n56), .ZN(n106) );
  AOI22_X1 U132 ( .A1(N42), .A2(n51), .B1(int_data_even_base_addr[5]), .B2(n52), .ZN(n56) );
  INV_X1 U133 ( .A(n70), .ZN(n95) );
  INV_X1 U134 ( .A(n71), .ZN(n94) );
  INV_X1 U135 ( .A(n72), .ZN(n93) );
  INV_X1 U136 ( .A(n73), .ZN(n92) );
  INV_X1 U137 ( .A(n57), .ZN(n105) );
  INV_X1 U138 ( .A(n58), .ZN(n104) );
  INV_X1 U139 ( .A(n59), .ZN(n103) );
  INV_X1 U140 ( .A(n60), .ZN(n102) );
  INV_X1 U141 ( .A(n61), .ZN(n101) );
  INV_X1 U142 ( .A(rst), .ZN(n90) );
  XOR2_X1 U147 ( .A(int_data_odd_base_addr[9]), .B(add_78_carry[9]), .Z(N78)
         );
  AND2_X1 U148 ( .A1(add_78_carry[8]), .A2(int_data_odd_base_addr[8]), .ZN(
        add_78_carry[9]) );
  XOR2_X1 U149 ( .A(int_data_odd_base_addr[8]), .B(add_78_carry[8]), .Z(N77)
         );
  AND2_X1 U150 ( .A1(add_78_carry[7]), .A2(int_data_odd_base_addr[7]), .ZN(
        add_78_carry[8]) );
  XOR2_X1 U151 ( .A(int_data_odd_base_addr[7]), .B(add_78_carry[7]), .Z(N76)
         );
  AND2_X1 U152 ( .A1(int_data_odd_base_addr[5]), .A2(int_data_odd_base_addr[6]), .ZN(add_78_carry[7]) );
  XOR2_X1 U153 ( .A(int_data_odd_base_addr[6]), .B(int_data_odd_base_addr[5]), 
        .Z(N75) );
  XOR2_X1 U154 ( .A(int_data_even_base_addr[9]), .B(add_44_carry[9]), .Z(N24)
         );
  AND2_X1 U155 ( .A1(add_44_carry[8]), .A2(int_data_even_base_addr[8]), .ZN(
        add_44_carry[9]) );
  XOR2_X1 U156 ( .A(int_data_even_base_addr[8]), .B(add_44_carry[8]), .Z(N23)
         );
  AND2_X1 U157 ( .A1(add_44_carry[7]), .A2(int_data_even_base_addr[7]), .ZN(
        add_44_carry[8]) );
  XOR2_X1 U158 ( .A(int_data_even_base_addr[7]), .B(add_44_carry[7]), .Z(N22)
         );
  AND2_X1 U159 ( .A1(int_data_even_base_addr[5]), .A2(
        int_data_even_base_addr[6]), .ZN(add_44_carry[7]) );
  XOR2_X1 U160 ( .A(int_data_even_base_addr[6]), .B(int_data_even_base_addr[5]), .Z(N21) );
  CLKGATETST_X1 clk_gate_int_data_even_base_addr_reg_latch ( .CK(ck), .E(N26), 
        .SE(1'b0), .GCK(net35) );
  CLKGATETST_X1 clk_gate_int_data_even_addr_reg_latch ( .CK(ck), .E(N57), .SE(
        1'b0), .GCK(net41) );
  CLKGATETST_X1 clk_gate_int_data_odd_base_addr_reg_latch ( .CK(ck), .E(N80), 
        .SE(1'b0), .GCK(net46) );
  XOR2_X1 add_97_U2 ( .A(add_97_carry[9]), .B(data_odd_addr[9]), .Z(N102) );
  INV_X1 add_97_U1 ( .A(data_odd_addr[0]), .ZN(N93) );
  HA_X1 add_97_U1_1_1 ( .A(data_odd_addr[1]), .B(data_odd_addr[0]), .CO(
        add_97_carry[2]), .S(N94) );
  HA_X1 add_97_U1_1_2 ( .A(data_odd_addr[2]), .B(add_97_carry[2]), .CO(
        add_97_carry[3]), .S(N95) );
  HA_X1 add_97_U1_1_3 ( .A(data_odd_addr[3]), .B(add_97_carry[3]), .CO(
        add_97_carry[4]), .S(N96) );
  HA_X1 add_97_U1_1_4 ( .A(data_odd_addr[4]), .B(add_97_carry[4]), .CO(
        add_97_carry[5]), .S(N97) );
  HA_X1 add_97_U1_1_5 ( .A(data_odd_addr[5]), .B(add_97_carry[5]), .CO(
        add_97_carry[6]), .S(N98) );
  HA_X1 add_97_U1_1_6 ( .A(data_odd_addr[6]), .B(add_97_carry[6]), .CO(
        add_97_carry[7]), .S(N99) );
  HA_X1 add_97_U1_1_7 ( .A(data_odd_addr[7]), .B(add_97_carry[7]), .CO(
        add_97_carry[8]), .S(N100) );
  HA_X1 add_97_U1_1_8 ( .A(data_odd_addr[8]), .B(add_97_carry[8]), .CO(
        add_97_carry[9]), .S(N101) );
  XOR2_X1 add_62_U2 ( .A(add_62_carry[9]), .B(data_even_addr[9]), .Z(N46) );
  INV_X1 add_62_U1 ( .A(data_even_addr[0]), .ZN(N37) );
  HA_X1 add_62_U1_1_1 ( .A(data_even_addr[1]), .B(data_even_addr[0]), .CO(
        add_62_carry[2]), .S(N38) );
  HA_X1 add_62_U1_1_2 ( .A(data_even_addr[2]), .B(add_62_carry[2]), .CO(
        add_62_carry[3]), .S(N39) );
  HA_X1 add_62_U1_1_3 ( .A(data_even_addr[3]), .B(add_62_carry[3]), .CO(
        add_62_carry[4]), .S(N40) );
  HA_X1 add_62_U1_1_4 ( .A(data_even_addr[4]), .B(add_62_carry[4]), .CO(
        add_62_carry[5]), .S(N41) );
  HA_X1 add_62_U1_1_5 ( .A(data_even_addr[5]), .B(add_62_carry[5]), .CO(
        add_62_carry[6]), .S(N42) );
  HA_X1 add_62_U1_1_6 ( .A(data_even_addr[6]), .B(add_62_carry[6]), .CO(
        add_62_carry[7]), .S(N43) );
  HA_X1 add_62_U1_1_7 ( .A(data_even_addr[7]), .B(add_62_carry[7]), .CO(
        add_62_carry[8]), .S(N44) );
  HA_X1 add_62_U1_1_8 ( .A(data_even_addr[8]), .B(add_62_carry[8]), .CO(
        add_62_carry[9]), .S(N45) );
endmodule

