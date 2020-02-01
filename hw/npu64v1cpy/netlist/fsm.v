
module fsm ( ck, rst, start, s_tc_npu_ptr, s_tc_hmode, s_tc_vmode, s_tc_res, 
        s_tc_tilev, s_tc_tileh, s_tc_ifmaps, s_tc_ofmaps, ctrl_en_npu, 
        ctrl_en_hmode, ctrl_en_vmode, ctrl_ldh_v_n, ctrl_wr_pipe, ctrl_en_p, 
        ctrl_wr_mem, done );
  input ck, rst, start, s_tc_npu_ptr, s_tc_hmode, s_tc_vmode, s_tc_res,
         s_tc_tilev, s_tc_tileh, s_tc_ifmaps, s_tc_ofmaps;
  output ctrl_en_npu, ctrl_en_hmode, ctrl_en_vmode, ctrl_ldh_v_n, ctrl_wr_pipe,
         ctrl_en_p, ctrl_wr_mem, done;
  wire   ctrl_en_p, ns_0_, n1, n2, n3, n4, n6, n8, n9, n10, n11, n12, n13, n14,
         n15, n16, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27;
  wire   [2:0] ps;
  assign ctrl_wr_pipe = ctrl_en_p;

  DFFR_X1 ps_reg_0_ ( .D(ns_0_), .CK(ck), .RN(n1), .Q(ps[0]), .QN(n9) );
  DFFR_X1 ps_reg_1_ ( .D(n2), .CK(ck), .RN(n1), .Q(ps[1]), .QN(n8) );
  DFFR_X1 ps_reg_2_ ( .D(n3), .CK(ck), .RN(n1), .Q(ps[2]), .QN(n6) );
  INV_X1 U3 ( .A(rst), .ZN(n1) );
  OAI33_X1 U28 ( .A1(n11), .A2(n12), .A3(n19), .B1(n20), .B2(ps[1]), .B3(ps[0]), .ZN(n18) );
  NAND3_X1 U29 ( .A1(s_tc_tileh), .A2(s_tc_ofmaps), .A3(s_tc_tilev), .ZN(n22)
         );
  NAND3_X1 U30 ( .A1(s_tc_res), .A2(n9), .A3(n4), .ZN(n21) );
  NAND3_X1 U31 ( .A1(ps[0]), .A2(n6), .A3(ps[1]), .ZN(n27) );
  NAND3_X1 U32 ( .A1(n8), .A2(n6), .A3(ps[0]), .ZN(n19) );
  NAND2_X1 U33 ( .A1(n19), .A2(n25), .ZN(ctrl_en_npu) );
  INV_X1 U34 ( .A(n19), .ZN(ctrl_en_hmode) );
  INV_X1 U35 ( .A(n25), .ZN(ctrl_ldh_v_n) );
  INV_X1 U36 ( .A(n26), .ZN(n4) );
  NOR2_X1 U37 ( .A1(n25), .A2(n6), .ZN(n15) );
  NOR2_X1 U38 ( .A1(n25), .A2(ps[2]), .ZN(ctrl_en_vmode) );
  OAI221_X1 U39 ( .B1(n21), .B2(n22), .C1(n23), .C2(n19), .A(n24), .ZN(ns_0_)
         );
  NOR3_X1 U40 ( .A1(n11), .A2(s_tc_vmode), .A3(n12), .ZN(n23) );
  NOR3_X1 U41 ( .A1(n6), .A2(n9), .A3(n8), .ZN(done) );
  AOI22_X1 U42 ( .A1(n10), .A2(n15), .B1(ctrl_en_vmode), .B2(s_tc_ifmaps), 
        .ZN(n24) );
  INV_X1 U43 ( .A(n14), .ZN(n10) );
  NAND2_X1 U44 ( .A1(ps[1]), .A2(n9), .ZN(n25) );
  NAND2_X1 U45 ( .A1(ps[2]), .A2(n8), .ZN(n26) );
  NAND2_X1 U46 ( .A1(n26), .A2(n27), .ZN(ctrl_en_p) );
  NOR2_X1 U47 ( .A1(n9), .A2(n26), .ZN(ctrl_wr_mem) );
  NAND2_X1 U48 ( .A1(s_tc_npu_ptr), .A2(s_tc_ifmaps), .ZN(n14) );
  INV_X1 U49 ( .A(s_tc_ifmaps), .ZN(n12) );
  INV_X1 U50 ( .A(s_tc_hmode), .ZN(n11) );
  INV_X1 U51 ( .A(n17), .ZN(n2) );
  AOI221_X1 U52 ( .B1(n15), .B2(n14), .C1(ctrl_en_vmode), .C2(n12), .A(n18), 
        .ZN(n17) );
  AOI22_X1 U53 ( .A1(start), .A2(n6), .B1(s_tc_res), .B2(ps[2]), .ZN(n20) );
  INV_X1 U54 ( .A(n13), .ZN(n3) );
  AOI211_X1 U55 ( .C1(n14), .C2(n15), .A(n16), .B(ctrl_en_p), .ZN(n13) );
  AND3_X1 U56 ( .A1(n9), .A2(n8), .A3(start), .ZN(n16) );
endmodule

