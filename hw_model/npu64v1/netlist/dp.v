
module dp ( ck, rst, i_acth, i_actv, i_weight, i_gamma, i_beta, arv_npu, 
        arv_ckg, arv_k, arv_tile, arv_ifmaps, arv_ofmaps, ctrl_en_npu, 
        ctrl_ldh_v_n, ctrl_en_hmode, ctrl_en_vmode, ctrl_wr_pipe, s_tc_hmode, 
        s_tc_vmode, s_tc_res, s_tc_npu_ptr, s_tc_tilev, s_tc_tileh, 
        s_tc_ifmaps, s_tc_ofmaps, i_data_even_addr, i_data_odd_addr, 
        i_data_ev_odd_n, o_data );
  input [15:0] i_acth;
  input [15:0] i_actv;
  input [1:0] i_weight;
  input [7:0] i_gamma;
  input [7:0] i_beta;
  input [2:0] arv_npu;
  input [2:0] arv_ckg;
  input [2:0] arv_k;
  input [1:0] arv_tile;
  input [2:0] arv_ifmaps;
  input [3:0] arv_ofmaps;
  output [9:0] i_data_even_addr;
  output [9:0] i_data_odd_addr;
  output [127:0] o_data;
  input ck, rst, ctrl_en_npu, ctrl_ldh_v_n, ctrl_en_hmode, ctrl_en_vmode,
         ctrl_wr_pipe;
  output s_tc_hmode, s_tc_vmode, s_tc_res, s_tc_npu_ptr, s_tc_tilev,
         s_tc_tileh, s_tc_ifmaps, s_tc_ofmaps, i_data_ev_odd_n;
  wire   ps_ctrl_en_npu, ps_ctrl_ldh_v_n, ps_ctrl_wr_pipe, ps_int_s_tc_tilev,
         ps_int_s_tc_tileh, int_en_hmode, int_en_npu_ptr, int_en_tilev_ptr,
         int_inc_even, int_inc_odd, int_rst_addr, net2787, net2793, n4, n5, n6,
         n7, n8, n9, n10, SYNOPSYS_UNCONNECTED_1, SYNOPSYS_UNCONNECTED_2,
         SYNOPSYS_UNCONNECTED_3, SYNOPSYS_UNCONNECTED_4,
         SYNOPSYS_UNCONNECTED_5, SYNOPSYS_UNCONNECTED_6,
         SYNOPSYS_UNCONNECTED_7, SYNOPSYS_UNCONNECTED_8,
         SYNOPSYS_UNCONNECTED_9, SYNOPSYS_UNCONNECTED_10,
         SYNOPSYS_UNCONNECTED_11, SYNOPSYS_UNCONNECTED_12,
         SYNOPSYS_UNCONNECTED_13, SYNOPSYS_UNCONNECTED_14,
         SYNOPSYS_UNCONNECTED_15, SYNOPSYS_UNCONNECTED_16;
  wire   [2:0] int_npu_ptr;
  wire   [2:0] ps_int_i_ifmap_ptr;
  wire   [7:0] int_i_data_if1;
  wire   [7:0] int_i_data_if2;
  wire   [7:0] int_i_data_if3;
  wire   [7:0] int_i_data_if4;
  wire   [7:0] int_i_data_if5;
  wire   [7:0] int_i_data_if6;
  wire   [7:0] int_i_data_if7;
  wire   [7:0] int_i_data_if8;
  wire   [1:0] ps_int_hmode_cnt;
  wire   [1:0] int_hmode_cnt;
  wire   [1:0] int_i_data_h_npu1;
  wire   [1:0] int_i_data_h_npu2;
  wire   [1:0] int_i_data_h_npu3;
  wire   [1:0] int_i_data_h_npu4;
  wire   [1:0] int_i_data_h_npu5;
  wire   [1:0] int_i_data_h_npu6;
  wire   [1:0] int_i_data_h_npu7;
  wire   [1:0] int_i_data_h_npu8;
  wire   [15:0] int_i_data_v_npu;
  wire   [0:7] int_ckg_rmask;
  wire   [0:7] int_ckg_cmask;
  wire   [63:0] int_o_data_npu;
  wire   [2:0] int_arv_res;
  wire   [2:0] int_d_tc;
  wire   [2:0] int_ifmaps_ptr;

  act_buffer act_buffer_inst ( .ck(ck), .rst(n6), .i_wr(ctrl_ldh_v_n), 
        .i_wr_ptr(int_npu_ptr), .i_wr_ifmap_ptr(int_ifmaps_ptr), 
        .i_rd_ifmap_ptr(ps_int_i_ifmap_ptr), .i_data(i_acth[15:8]), .o_data1(
        int_i_data_if1), .o_data2(int_i_data_if2), .o_data3(int_i_data_if3), 
        .o_data4(int_i_data_if4), .o_data5(int_i_data_if5), .o_data6(
        int_i_data_if6), .o_data7(int_i_data_if7), .o_data8(int_i_data_if8) );
  act_if act_if_inst ( .i_data1(int_i_data_if1), .i_data2(int_i_data_if2), 
        .i_data3(int_i_data_if3), .i_data4(int_i_data_if4), .i_data5(
        int_i_data_if5), .i_data6(int_i_data_if6), .i_data7(int_i_data_if7), 
        .i_data8(int_i_data_if8), .i_sel_rotate(int_npu_ptr), .i_sel_column({
        1'b0, ps_int_hmode_cnt}), .o_data1(int_i_data_h_npu1), .o_data2(
        int_i_data_h_npu2), .o_data3(int_i_data_h_npu3), .o_data4(
        int_i_data_h_npu4), .o_data5(int_i_data_h_npu5), .o_data6(
        int_i_data_h_npu6), .o_data7(int_i_data_h_npu7), .o_data8(
        int_i_data_h_npu8) );
  npu npu_inst ( .ck(ck), .rst(rst), .en(ps_ctrl_en_npu), .ldh_v_n(
        ps_ctrl_ldh_v_n), .wr_pipe(ps_ctrl_wr_pipe), .ckg_rmask({1'b0, 
        int_ckg_rmask[1:7]}), .ckg_cmask({1'b0, int_ckg_cmask[1:7]}), 
        .i_ifmap_ptr(ps_int_i_ifmap_ptr), .i_weight(i_weight), .i_data_conv_h(
        {int_i_data_h_npu1, int_i_data_h_npu2, int_i_data_h_npu3, 
        int_i_data_h_npu4, int_i_data_h_npu5, int_i_data_h_npu6, 
        int_i_data_h_npu7, int_i_data_h_npu8}), .i_data_conv_v(
        int_i_data_v_npu), .i_data_acc({1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0}), .o_data(
        int_o_data_npu) );
  ckg_ctrl8b ckg_ctrl8b_inst ( .arv_npu(arv_npu), .arv_ckg(arv_ckg), .en_ckgr(
        ps_int_s_tc_tilev), .en_ckgc(ps_int_s_tc_tileh), .arv_res(int_arv_res), 
        .ckg_rmask({SYNOPSYS_UNCONNECTED_1, int_ckg_rmask[1:7]}), .ckg_cmask({
        SYNOPSYS_UNCONNECTED_2, int_ckg_cmask[1:7]}) );
  countern_N3_4 hmode_cnt_inst ( .ck(ck), .rst(rst), .sync_clr(1'b0), .en(
        int_en_hmode), .arv(arv_k), .q({SYNOPSYS_UNCONNECTED_3, int_hmode_cnt}), .tc(s_tc_hmode) );
  countern_N3_3 vmode_cnt_inst ( .ck(ck), .rst(n6), .sync_clr(1'b0), .en(n10), 
        .arv(arv_k), .q({SYNOPSYS_UNCONNECTED_4, SYNOPSYS_UNCONNECTED_5, 
        SYNOPSYS_UNCONNECTED_6}), .tc(s_tc_vmode) );
  countern_N3_2 res_cnt_inst ( .ck(ck), .rst(rst), .sync_clr(1'b0), .en(
        ctrl_wr_pipe), .arv(int_arv_res), .q({SYNOPSYS_UNCONNECTED_7, 
        SYNOPSYS_UNCONNECTED_8, SYNOPSYS_UNCONNECTED_9}), .tc(s_tc_res) );
  countern_N3_1 ifmaps_cnt_inst ( .ck(ck), .rst(n6), .sync_clr(1'b0), .en(
        ctrl_en_npu), .arv(arv_ifmaps), .q(int_ifmaps_ptr), .tc(s_tc_ifmaps)
         );
  countern_N3_0 npu_cnt_inst ( .ck(ck), .rst(rst), .sync_clr(1'b0), .en(
        int_en_npu_ptr), .arv(arv_npu), .q(int_npu_ptr), .tc(s_tc_npu_ptr) );
  countern_N2_1 tilev_cnt_inst ( .ck(ck), .rst(n6), .sync_clr(1'b0), .en(
        int_en_tilev_ptr), .arv(arv_tile), .q({SYNOPSYS_UNCONNECTED_10, 
        SYNOPSYS_UNCONNECTED_11}), .tc(int_d_tc[2]) );
  countern_N2_0 tileh_cnt_inst ( .ck(ck), .rst(rst), .sync_clr(1'b0), .en(n9), 
        .arv(arv_tile), .q({SYNOPSYS_UNCONNECTED_12, i_data_ev_odd_n}), .tc(
        int_d_tc[1]) );
  countern_N4 ofmaps_cnt_inst ( .ck(ck), .rst(rst), .sync_clr(1'b0), .en(
        int_rst_addr), .arv(arv_ofmaps), .q({SYNOPSYS_UNCONNECTED_13, 
        SYNOPSYS_UNCONNECTED_14, SYNOPSYS_UNCONNECTED_15, 
        SYNOPSYS_UNCONNECTED_16}), .tc(int_d_tc[0]) );
  data_addr_gen i_data_addr_gen_inst ( .ck(ck), .rst(n6), .sync_clr(
        int_rst_addr), .en(ctrl_ldh_v_n), .inc_even(int_inc_even), .inc_odd(
        int_inc_odd), .data_even_addr(i_data_even_addr), .data_odd_addr(
        i_data_odd_addr) );
  prod_sum_7 prod_sum_i_0 ( .ck(ck), .rst(rst), .en(ps_ctrl_wr_pipe), 
        .i_gamma(i_gamma), .i_beta(i_beta), .i_data(int_o_data_npu[63:56]), 
        .o_data(o_data[127:112]) );
  prod_sum_6 prod_sum_i_1 ( .ck(ck), .rst(n6), .en(ps_ctrl_wr_pipe), .i_gamma(
        i_gamma), .i_beta(i_beta), .i_data(int_o_data_npu[55:48]), .o_data(
        o_data[111:96]) );
  prod_sum_5 prod_sum_i_2 ( .ck(ck), .rst(rst), .en(ps_ctrl_wr_pipe), 
        .i_gamma(i_gamma), .i_beta(i_beta), .i_data(int_o_data_npu[47:40]), 
        .o_data(o_data[95:80]) );
  prod_sum_4 prod_sum_i_3 ( .ck(ck), .rst(rst), .en(ps_ctrl_wr_pipe), 
        .i_gamma(i_gamma), .i_beta(i_beta), .i_data(int_o_data_npu[39:32]), 
        .o_data(o_data[79:64]) );
  prod_sum_3 prod_sum_i_4 ( .ck(ck), .rst(n6), .en(ps_ctrl_wr_pipe), .i_gamma(
        i_gamma), .i_beta(i_beta), .i_data(int_o_data_npu[31:24]), .o_data(
        o_data[63:48]) );
  prod_sum_2 prod_sum_i_5 ( .ck(ck), .rst(n6), .en(ps_ctrl_wr_pipe), .i_gamma(
        i_gamma), .i_beta(i_beta), .i_data(int_o_data_npu[23:16]), .o_data(
        o_data[47:32]) );
  prod_sum_1 prod_sum_i_6 ( .ck(ck), .rst(rst), .en(ps_ctrl_wr_pipe), 
        .i_gamma(i_gamma), .i_beta(i_beta), .i_data(int_o_data_npu[15:8]), 
        .o_data(o_data[31:16]) );
  prod_sum_0 prod_sum_i_7 ( .ck(ck), .rst(n6), .en(ps_ctrl_wr_pipe), .i_gamma(
        i_gamma), .i_beta(i_beta), .i_data(int_o_data_npu[7:0]), .o_data(
        o_data[15:0]) );
  SNPS_CLOCK_GATE_HIGH_dp_0 clk_gate_int_i_data_v_npu_reg ( .CLK(ck), .EN(
        ctrl_ldh_v_n), .ENCLK(net2787), .TE(1'b0) );
  SNPS_CLOCK_GATE_HIGH_dp_1 clk_gate_int_q_tc_reg ( .CLK(ck), .EN(s_tc_res), 
        .ENCLK(net2793), .TE(1'b0) );
  DFFR_X1 ps_int_hmode_cnt_reg_1_ ( .D(int_hmode_cnt[1]), .CK(ck), .RN(n8), 
        .Q(ps_int_hmode_cnt[1]) );
  DFFR_X1 ps_int_s_tc_tilev_reg ( .D(s_tc_tilev), .CK(ck), .RN(n7), .Q(
        ps_int_s_tc_tilev) );
  DFFR_X1 ps_int_s_tc_tileh_reg ( .D(s_tc_tileh), .CK(ck), .RN(n8), .Q(
        ps_int_s_tc_tileh) );
  DFFR_X1 ps_int_i_ifmap_ptr_reg_1_ ( .D(int_ifmaps_ptr[1]), .CK(ck), .RN(n7), 
        .Q(ps_int_i_ifmap_ptr[1]) );
  DFFR_X1 ps_int_hmode_cnt_reg_0_ ( .D(int_hmode_cnt[0]), .CK(ck), .RN(n8), 
        .Q(ps_int_hmode_cnt[0]) );
  DFFR_X1 ps_int_i_ifmap_ptr_reg_2_ ( .D(int_ifmaps_ptr[2]), .CK(ck), .RN(n7), 
        .Q(ps_int_i_ifmap_ptr[2]) );
  DFFR_X1 ps_int_i_ifmap_ptr_reg_0_ ( .D(int_ifmaps_ptr[0]), .CK(ck), .RN(n7), 
        .Q(ps_int_i_ifmap_ptr[0]) );
  DFFR_X1 int_i_data_v_npu_reg_15_ ( .D(i_actv[15]), .CK(net2787), .RN(n8), 
        .Q(int_i_data_v_npu[15]) );
  DFFR_X1 int_i_data_v_npu_reg_14_ ( .D(i_actv[14]), .CK(net2787), .RN(n8), 
        .Q(int_i_data_v_npu[14]) );
  DFFR_X1 int_i_data_v_npu_reg_13_ ( .D(i_actv[13]), .CK(net2787), .RN(n8), 
        .Q(int_i_data_v_npu[13]) );
  DFFR_X1 int_i_data_v_npu_reg_12_ ( .D(i_actv[12]), .CK(net2787), .RN(n8), 
        .Q(int_i_data_v_npu[12]) );
  DFFR_X1 int_i_data_v_npu_reg_11_ ( .D(i_actv[11]), .CK(net2787), .RN(n8), 
        .Q(int_i_data_v_npu[11]) );
  DFFR_X1 int_i_data_v_npu_reg_10_ ( .D(i_actv[10]), .CK(net2787), .RN(n8), 
        .Q(int_i_data_v_npu[10]) );
  DFFR_X1 int_i_data_v_npu_reg_9_ ( .D(i_actv[9]), .CK(net2787), .RN(n8), .Q(
        int_i_data_v_npu[9]) );
  DFFR_X1 int_i_data_v_npu_reg_8_ ( .D(i_actv[8]), .CK(net2787), .RN(n8), .Q(
        int_i_data_v_npu[8]) );
  DFFR_X1 int_i_data_v_npu_reg_7_ ( .D(i_actv[7]), .CK(net2787), .RN(n8), .Q(
        int_i_data_v_npu[7]) );
  DFFR_X1 int_i_data_v_npu_reg_6_ ( .D(i_actv[6]), .CK(net2787), .RN(n8), .Q(
        int_i_data_v_npu[6]) );
  DFFR_X1 int_i_data_v_npu_reg_5_ ( .D(i_actv[5]), .CK(net2787), .RN(n8), .Q(
        int_i_data_v_npu[5]) );
  DFFR_X1 int_i_data_v_npu_reg_4_ ( .D(i_actv[4]), .CK(net2787), .RN(n8), .Q(
        int_i_data_v_npu[4]) );
  DFFR_X1 int_i_data_v_npu_reg_3_ ( .D(i_actv[3]), .CK(net2787), .RN(n7), .Q(
        int_i_data_v_npu[3]) );
  DFFR_X1 int_i_data_v_npu_reg_2_ ( .D(i_actv[2]), .CK(net2787), .RN(n7), .Q(
        int_i_data_v_npu[2]) );
  DFFR_X1 int_i_data_v_npu_reg_1_ ( .D(i_actv[1]), .CK(net2787), .RN(n7), .Q(
        int_i_data_v_npu[1]) );
  DFFR_X1 int_i_data_v_npu_reg_0_ ( .D(i_actv[0]), .CK(net2787), .RN(n7), .Q(
        int_i_data_v_npu[0]) );
  DFFR_X1 ps_ctrl_wr_pipe_reg ( .D(ctrl_wr_pipe), .CK(ck), .RN(n7), .Q(
        ps_ctrl_wr_pipe) );
  DFFR_X1 ps_ctrl_en_npu_reg ( .D(ctrl_en_npu), .CK(ck), .RN(n7), .Q(
        ps_ctrl_en_npu) );
  DFFR_X1 ps_ctrl_ldh_v_n_reg ( .D(ctrl_ldh_v_n), .CK(ck), .RN(n7), .Q(
        ps_ctrl_ldh_v_n) );
  DFFR_X1 int_q_tc_reg_1_ ( .D(int_d_tc[1]), .CK(net2793), .RN(n7), .Q(
        s_tc_tileh) );
  DFFR_X1 int_q_tc_reg_2_ ( .D(int_d_tc[2]), .CK(net2793), .RN(n7), .Q(
        s_tc_tilev) );
  DFFR_X1 int_q_tc_reg_0_ ( .D(int_d_tc[0]), .CK(net2793), .RN(n7), .Q(
        s_tc_ofmaps) );
  INV_X1 U14 ( .A(n4), .ZN(n9) );
  AND2_X1 U15 ( .A1(int_d_tc[1]), .A2(n9), .ZN(int_rst_addr) );
  AND2_X1 U16 ( .A1(s_tc_npu_ptr), .A2(int_en_npu_ptr), .ZN(int_en_tilev_ptr)
         );
  NAND2_X1 U17 ( .A1(int_d_tc[2]), .A2(int_en_tilev_ptr), .ZN(n4) );
  INV_X1 U18 ( .A(n6), .ZN(n8) );
  INV_X1 U19 ( .A(n6), .ZN(n7) );
  NOR2_X1 U20 ( .A1(i_data_ev_odd_n), .A2(n4), .ZN(int_inc_even) );
  AND2_X1 U21 ( .A1(n9), .A2(i_data_ev_odd_n), .ZN(int_inc_odd) );
  AND2_X1 U22 ( .A1(s_tc_ifmaps), .A2(ctrl_ldh_v_n), .ZN(int_en_npu_ptr) );
  AND2_X1 U23 ( .A1(ctrl_en_hmode), .A2(s_tc_ifmaps), .ZN(int_en_hmode) );
  INV_X1 U24 ( .A(n5), .ZN(n10) );
  AOI21_X1 U25 ( .B1(ctrl_en_vmode), .B2(s_tc_ifmaps), .A(s_tc_res), .ZN(n5)
         );
  BUF_X1 U26 ( .A(rst), .Z(n6) );
endmodule

