
module SNPS_CLOCK_GATE_HIGH_countern_N9 ( CLK, EN, ENCLK, TE );
  input CLK, EN, TE;
  output ENCLK;


  CLKGATETST_X1 latch ( .CK(CLK), .E(EN), .SE(TE), .GCK(ENCLK) );
endmodule


module SNPS_CLOCK_GATE_HIGH_countern_N4 ( CLK, EN, ENCLK, TE );
  input CLK, EN, TE;
  output ENCLK;


  CLKGATETST_X1 latch ( .CK(CLK), .E(EN), .SE(TE), .GCK(ENCLK) );
endmodule


module fully_connected_all ( clk, rst_fsm, start, layer_fc, i_kernel1, 
        i_kernel2, i_kernel3, i_kernel4, i_data, o_data1, o_data2, o_data3, 
        o_data4, tc );
  input [1:0] layer_fc;
  input [7:0] i_kernel1;
  input [7:0] i_kernel2;
  input [7:0] i_kernel3;
  input [7:0] i_kernel4;
  input [3:0] i_data;
  output [43:0] o_data1;
  output [43:0] o_data2;
  output [43:0] o_data3;
  output [43:0] o_data4;
  input clk, rst_fsm, start;
  output tc;
  wire   tb_rst_cnt1, tb_en_cnt1, tb_rst_cnt2, tb_en_cnt2, tb_tc2, fc_s_en_pe,
         fc_cnt2_0_, fc_cnt2_1_, fc_cnt2_2_, fc_cnt2_3_, fc_cnt1_0_,
         fc_cnt1_1_, fc_cnt1_2_, fc_cnt1_3_, fc_cnt1_4_, fc_cnt1_5_,
         fc_cnt1_6_, fc_cnt1_7_, fc_cnt1_8_, fc_pe_b_n1, fc_pe_b_n5,
         fc_pe_b_n4, fc_pe_b_n3, fc_pe_b_n2, fc_pe_b_peij_0_0_n14,
         fc_pe_b_peij_0_0_n12, fc_pe_b_peij_0_0_n15, fc_pe_b_peij_0_0_N35,
         fc_pe_b_peij_0_0_N34, fc_pe_b_peij_0_0_N33, fc_pe_b_peij_0_0_N32,
         fc_pe_b_peij_0_0_q_k, fc_pe_b_peij_0_0_gck,
         fc_pe_b_peij_0_0_sgnext_10, fc_pe_b_peij_0_0_add_c_out,
         fc_pe_b_peij_0_0_add_fai_0_n3, fc_pe_b_peij_0_0_add_fai_0_n2,
         fc_pe_b_peij_0_0_add_fai_1_n5, fc_pe_b_peij_0_0_add_fai_1_n4,
         fc_pe_b_peij_0_0_add_fai_2_n5, fc_pe_b_peij_0_0_add_fai_2_n4,
         fc_pe_b_peij_0_0_add_fai_3_n5, fc_pe_b_peij_0_0_add_fai_3_n4,
         fc_pe_b_peij_0_0_add_fai_4_n5, fc_pe_b_peij_0_0_add_fai_4_n4,
         fc_pe_b_peij_0_0_add_fai_5_n5, fc_pe_b_peij_0_0_add_fai_5_n4,
         fc_pe_b_peij_0_0_add_fai_6_n5, fc_pe_b_peij_0_0_add_fai_6_n4,
         fc_pe_b_peij_0_0_add_fai_7_n5, fc_pe_b_peij_0_0_add_fai_7_n4,
         fc_pe_b_peij_0_0_add_fai_8_n5, fc_pe_b_peij_0_0_add_fai_8_n4,
         fc_pe_b_peij_0_0_add_fai_9_n5, fc_pe_b_peij_0_0_add_fai_9_n4,
         fc_pe_b_peij_0_0_add_fai_10_n5, fc_pe_b_peij_0_0_add_fai_10_n4,
         fc_pe_b_peij_0_1_n16, fc_pe_b_peij_0_1_n14, fc_pe_b_peij_0_1_n12,
         fc_pe_b_peij_0_1_N35, fc_pe_b_peij_0_1_N34, fc_pe_b_peij_0_1_N33,
         fc_pe_b_peij_0_1_N32, fc_pe_b_peij_0_1_q_k, fc_pe_b_peij_0_1_gck,
         fc_pe_b_peij_0_1_sgnext_10, fc_pe_b_peij_0_1_add_c_out,
         fc_pe_b_peij_0_1_add_fai_0_n5, fc_pe_b_peij_0_1_add_fai_0_n4,
         fc_pe_b_peij_0_1_add_fai_1_n5, fc_pe_b_peij_0_1_add_fai_1_n4,
         fc_pe_b_peij_0_1_add_fai_2_n5, fc_pe_b_peij_0_1_add_fai_2_n4,
         fc_pe_b_peij_0_1_add_fai_3_n5, fc_pe_b_peij_0_1_add_fai_3_n4,
         fc_pe_b_peij_0_1_add_fai_4_n5, fc_pe_b_peij_0_1_add_fai_4_n4,
         fc_pe_b_peij_0_1_add_fai_5_n5, fc_pe_b_peij_0_1_add_fai_5_n4,
         fc_pe_b_peij_0_1_add_fai_6_n5, fc_pe_b_peij_0_1_add_fai_6_n4,
         fc_pe_b_peij_0_1_add_fai_7_n5, fc_pe_b_peij_0_1_add_fai_7_n4,
         fc_pe_b_peij_0_1_add_fai_8_n5, fc_pe_b_peij_0_1_add_fai_8_n4,
         fc_pe_b_peij_0_1_add_fai_9_n5, fc_pe_b_peij_0_1_add_fai_9_n4,
         fc_pe_b_peij_0_1_add_fai_10_n5, fc_pe_b_peij_0_1_add_fai_10_n4,
         fc_pe_b_peij_0_2_n16, fc_pe_b_peij_0_2_n14, fc_pe_b_peij_0_2_n12,
         fc_pe_b_peij_0_2_N35, fc_pe_b_peij_0_2_N34, fc_pe_b_peij_0_2_N33,
         fc_pe_b_peij_0_2_N32, fc_pe_b_peij_0_2_q_k, fc_pe_b_peij_0_2_gck,
         fc_pe_b_peij_0_2_sgnext_10, fc_pe_b_peij_0_2_add_c_out,
         fc_pe_b_peij_0_2_add_fai_0_n5, fc_pe_b_peij_0_2_add_fai_0_n4,
         fc_pe_b_peij_0_2_add_fai_1_n5, fc_pe_b_peij_0_2_add_fai_1_n4,
         fc_pe_b_peij_0_2_add_fai_2_n5, fc_pe_b_peij_0_2_add_fai_2_n4,
         fc_pe_b_peij_0_2_add_fai_3_n5, fc_pe_b_peij_0_2_add_fai_3_n4,
         fc_pe_b_peij_0_2_add_fai_4_n5, fc_pe_b_peij_0_2_add_fai_4_n4,
         fc_pe_b_peij_0_2_add_fai_5_n5, fc_pe_b_peij_0_2_add_fai_5_n4,
         fc_pe_b_peij_0_2_add_fai_6_n5, fc_pe_b_peij_0_2_add_fai_6_n4,
         fc_pe_b_peij_0_2_add_fai_7_n5, fc_pe_b_peij_0_2_add_fai_7_n4,
         fc_pe_b_peij_0_2_add_fai_8_n5, fc_pe_b_peij_0_2_add_fai_8_n4,
         fc_pe_b_peij_0_2_add_fai_9_n5, fc_pe_b_peij_0_2_add_fai_9_n4,
         fc_pe_b_peij_0_2_add_fai_10_n5, fc_pe_b_peij_0_2_add_fai_10_n4,
         fc_pe_b_peij_0_3_n16, fc_pe_b_peij_0_3_n14, fc_pe_b_peij_0_3_n12,
         fc_pe_b_peij_0_3_N35, fc_pe_b_peij_0_3_N34, fc_pe_b_peij_0_3_N33,
         fc_pe_b_peij_0_3_N32, fc_pe_b_peij_0_3_q_k, fc_pe_b_peij_0_3_gck,
         fc_pe_b_peij_0_3_sgnext_10, fc_pe_b_peij_0_3_add_c_out,
         fc_pe_b_peij_0_3_add_fai_0_n5, fc_pe_b_peij_0_3_add_fai_0_n4,
         fc_pe_b_peij_0_3_add_fai_1_n5, fc_pe_b_peij_0_3_add_fai_1_n4,
         fc_pe_b_peij_0_3_add_fai_2_n5, fc_pe_b_peij_0_3_add_fai_2_n4,
         fc_pe_b_peij_0_3_add_fai_3_n5, fc_pe_b_peij_0_3_add_fai_3_n4,
         fc_pe_b_peij_0_3_add_fai_4_n5, fc_pe_b_peij_0_3_add_fai_4_n4,
         fc_pe_b_peij_0_3_add_fai_5_n5, fc_pe_b_peij_0_3_add_fai_5_n4,
         fc_pe_b_peij_0_3_add_fai_6_n5, fc_pe_b_peij_0_3_add_fai_6_n4,
         fc_pe_b_peij_0_3_add_fai_7_n5, fc_pe_b_peij_0_3_add_fai_7_n4,
         fc_pe_b_peij_0_3_add_fai_8_n5, fc_pe_b_peij_0_3_add_fai_8_n4,
         fc_pe_b_peij_0_3_add_fai_9_n5, fc_pe_b_peij_0_3_add_fai_9_n4,
         fc_pe_b_peij_0_3_add_fai_10_n5, fc_pe_b_peij_0_3_add_fai_10_n4,
         fc_pe_b_peij_1_0_n16, fc_pe_b_peij_1_0_n14, fc_pe_b_peij_1_0_n12,
         fc_pe_b_peij_1_0_N35, fc_pe_b_peij_1_0_N34, fc_pe_b_peij_1_0_N33,
         fc_pe_b_peij_1_0_N32, fc_pe_b_peij_1_0_q_k, fc_pe_b_peij_1_0_gck,
         fc_pe_b_peij_1_0_sgnext_10, fc_pe_b_peij_1_0_add_c_out,
         fc_pe_b_peij_1_0_add_fai_0_n5, fc_pe_b_peij_1_0_add_fai_0_n4,
         fc_pe_b_peij_1_0_add_fai_1_n5, fc_pe_b_peij_1_0_add_fai_1_n4,
         fc_pe_b_peij_1_0_add_fai_2_n5, fc_pe_b_peij_1_0_add_fai_2_n4,
         fc_pe_b_peij_1_0_add_fai_3_n5, fc_pe_b_peij_1_0_add_fai_3_n4,
         fc_pe_b_peij_1_0_add_fai_4_n5, fc_pe_b_peij_1_0_add_fai_4_n4,
         fc_pe_b_peij_1_0_add_fai_5_n5, fc_pe_b_peij_1_0_add_fai_5_n4,
         fc_pe_b_peij_1_0_add_fai_6_n5, fc_pe_b_peij_1_0_add_fai_6_n4,
         fc_pe_b_peij_1_0_add_fai_7_n5, fc_pe_b_peij_1_0_add_fai_7_n4,
         fc_pe_b_peij_1_0_add_fai_8_n5, fc_pe_b_peij_1_0_add_fai_8_n4,
         fc_pe_b_peij_1_0_add_fai_9_n5, fc_pe_b_peij_1_0_add_fai_9_n4,
         fc_pe_b_peij_1_0_add_fai_10_n5, fc_pe_b_peij_1_0_add_fai_10_n4,
         fc_pe_b_peij_1_1_n16, fc_pe_b_peij_1_1_n14, fc_pe_b_peij_1_1_n12,
         fc_pe_b_peij_1_1_N35, fc_pe_b_peij_1_1_N34, fc_pe_b_peij_1_1_N33,
         fc_pe_b_peij_1_1_N32, fc_pe_b_peij_1_1_q_k, fc_pe_b_peij_1_1_gck,
         fc_pe_b_peij_1_1_sgnext_10, fc_pe_b_peij_1_1_add_c_out,
         fc_pe_b_peij_1_1_add_fai_0_n5, fc_pe_b_peij_1_1_add_fai_0_n4,
         fc_pe_b_peij_1_1_add_fai_1_n5, fc_pe_b_peij_1_1_add_fai_1_n4,
         fc_pe_b_peij_1_1_add_fai_2_n5, fc_pe_b_peij_1_1_add_fai_2_n4,
         fc_pe_b_peij_1_1_add_fai_3_n5, fc_pe_b_peij_1_1_add_fai_3_n4,
         fc_pe_b_peij_1_1_add_fai_4_n5, fc_pe_b_peij_1_1_add_fai_4_n4,
         fc_pe_b_peij_1_1_add_fai_5_n5, fc_pe_b_peij_1_1_add_fai_5_n4,
         fc_pe_b_peij_1_1_add_fai_6_n5, fc_pe_b_peij_1_1_add_fai_6_n4,
         fc_pe_b_peij_1_1_add_fai_7_n5, fc_pe_b_peij_1_1_add_fai_7_n4,
         fc_pe_b_peij_1_1_add_fai_8_n5, fc_pe_b_peij_1_1_add_fai_8_n4,
         fc_pe_b_peij_1_1_add_fai_9_n5, fc_pe_b_peij_1_1_add_fai_9_n4,
         fc_pe_b_peij_1_1_add_fai_10_n5, fc_pe_b_peij_1_1_add_fai_10_n4,
         fc_pe_b_peij_1_2_n16, fc_pe_b_peij_1_2_n14, fc_pe_b_peij_1_2_n12,
         fc_pe_b_peij_1_2_N35, fc_pe_b_peij_1_2_N34, fc_pe_b_peij_1_2_N33,
         fc_pe_b_peij_1_2_N32, fc_pe_b_peij_1_2_q_k, fc_pe_b_peij_1_2_gck,
         fc_pe_b_peij_1_2_sgnext_10, fc_pe_b_peij_1_2_add_c_out,
         fc_pe_b_peij_1_2_add_fai_0_n5, fc_pe_b_peij_1_2_add_fai_0_n4,
         fc_pe_b_peij_1_2_add_fai_1_n5, fc_pe_b_peij_1_2_add_fai_1_n4,
         fc_pe_b_peij_1_2_add_fai_2_n5, fc_pe_b_peij_1_2_add_fai_2_n4,
         fc_pe_b_peij_1_2_add_fai_3_n5, fc_pe_b_peij_1_2_add_fai_3_n4,
         fc_pe_b_peij_1_2_add_fai_4_n5, fc_pe_b_peij_1_2_add_fai_4_n4,
         fc_pe_b_peij_1_2_add_fai_5_n5, fc_pe_b_peij_1_2_add_fai_5_n4,
         fc_pe_b_peij_1_2_add_fai_6_n5, fc_pe_b_peij_1_2_add_fai_6_n4,
         fc_pe_b_peij_1_2_add_fai_7_n5, fc_pe_b_peij_1_2_add_fai_7_n4,
         fc_pe_b_peij_1_2_add_fai_8_n5, fc_pe_b_peij_1_2_add_fai_8_n4,
         fc_pe_b_peij_1_2_add_fai_9_n5, fc_pe_b_peij_1_2_add_fai_9_n4,
         fc_pe_b_peij_1_2_add_fai_10_n5, fc_pe_b_peij_1_2_add_fai_10_n4,
         fc_pe_b_peij_1_3_n16, fc_pe_b_peij_1_3_n14, fc_pe_b_peij_1_3_n12,
         fc_pe_b_peij_1_3_N35, fc_pe_b_peij_1_3_N34, fc_pe_b_peij_1_3_N33,
         fc_pe_b_peij_1_3_N32, fc_pe_b_peij_1_3_q_k, fc_pe_b_peij_1_3_gck,
         fc_pe_b_peij_1_3_sgnext_10, fc_pe_b_peij_1_3_add_c_out,
         fc_pe_b_peij_1_3_add_fai_0_n5, fc_pe_b_peij_1_3_add_fai_0_n4,
         fc_pe_b_peij_1_3_add_fai_1_n5, fc_pe_b_peij_1_3_add_fai_1_n4,
         fc_pe_b_peij_1_3_add_fai_2_n5, fc_pe_b_peij_1_3_add_fai_2_n4,
         fc_pe_b_peij_1_3_add_fai_3_n5, fc_pe_b_peij_1_3_add_fai_3_n4,
         fc_pe_b_peij_1_3_add_fai_4_n5, fc_pe_b_peij_1_3_add_fai_4_n4,
         fc_pe_b_peij_1_3_add_fai_5_n5, fc_pe_b_peij_1_3_add_fai_5_n4,
         fc_pe_b_peij_1_3_add_fai_6_n5, fc_pe_b_peij_1_3_add_fai_6_n4,
         fc_pe_b_peij_1_3_add_fai_7_n5, fc_pe_b_peij_1_3_add_fai_7_n4,
         fc_pe_b_peij_1_3_add_fai_8_n5, fc_pe_b_peij_1_3_add_fai_8_n4,
         fc_pe_b_peij_1_3_add_fai_9_n5, fc_pe_b_peij_1_3_add_fai_9_n4,
         fc_pe_b_peij_1_3_add_fai_10_n5, fc_pe_b_peij_1_3_add_fai_10_n4,
         fc_pe_b_peij_2_0_n16, fc_pe_b_peij_2_0_n14, fc_pe_b_peij_2_0_n12,
         fc_pe_b_peij_2_0_N35, fc_pe_b_peij_2_0_N34, fc_pe_b_peij_2_0_N33,
         fc_pe_b_peij_2_0_N32, fc_pe_b_peij_2_0_q_k, fc_pe_b_peij_2_0_gck,
         fc_pe_b_peij_2_0_sgnext_10, fc_pe_b_peij_2_0_add_c_out,
         fc_pe_b_peij_2_0_add_fai_0_n5, fc_pe_b_peij_2_0_add_fai_0_n4,
         fc_pe_b_peij_2_0_add_fai_1_n5, fc_pe_b_peij_2_0_add_fai_1_n4,
         fc_pe_b_peij_2_0_add_fai_2_n5, fc_pe_b_peij_2_0_add_fai_2_n4,
         fc_pe_b_peij_2_0_add_fai_3_n5, fc_pe_b_peij_2_0_add_fai_3_n4,
         fc_pe_b_peij_2_0_add_fai_4_n5, fc_pe_b_peij_2_0_add_fai_4_n4,
         fc_pe_b_peij_2_0_add_fai_5_n5, fc_pe_b_peij_2_0_add_fai_5_n4,
         fc_pe_b_peij_2_0_add_fai_6_n5, fc_pe_b_peij_2_0_add_fai_6_n4,
         fc_pe_b_peij_2_0_add_fai_7_n5, fc_pe_b_peij_2_0_add_fai_7_n4,
         fc_pe_b_peij_2_0_add_fai_8_n5, fc_pe_b_peij_2_0_add_fai_8_n4,
         fc_pe_b_peij_2_0_add_fai_9_n5, fc_pe_b_peij_2_0_add_fai_9_n4,
         fc_pe_b_peij_2_0_add_fai_10_n5, fc_pe_b_peij_2_0_add_fai_10_n4,
         fc_pe_b_peij_2_1_n16, fc_pe_b_peij_2_1_n14, fc_pe_b_peij_2_1_n12,
         fc_pe_b_peij_2_1_N35, fc_pe_b_peij_2_1_N34, fc_pe_b_peij_2_1_N33,
         fc_pe_b_peij_2_1_N32, fc_pe_b_peij_2_1_q_k, fc_pe_b_peij_2_1_gck,
         fc_pe_b_peij_2_1_sgnext_10, fc_pe_b_peij_2_1_add_c_out,
         fc_pe_b_peij_2_1_add_fai_0_n5, fc_pe_b_peij_2_1_add_fai_0_n4,
         fc_pe_b_peij_2_1_add_fai_1_n5, fc_pe_b_peij_2_1_add_fai_1_n4,
         fc_pe_b_peij_2_1_add_fai_2_n5, fc_pe_b_peij_2_1_add_fai_2_n4,
         fc_pe_b_peij_2_1_add_fai_3_n5, fc_pe_b_peij_2_1_add_fai_3_n4,
         fc_pe_b_peij_2_1_add_fai_4_n5, fc_pe_b_peij_2_1_add_fai_4_n4,
         fc_pe_b_peij_2_1_add_fai_5_n5, fc_pe_b_peij_2_1_add_fai_5_n4,
         fc_pe_b_peij_2_1_add_fai_6_n5, fc_pe_b_peij_2_1_add_fai_6_n4,
         fc_pe_b_peij_2_1_add_fai_7_n5, fc_pe_b_peij_2_1_add_fai_7_n4,
         fc_pe_b_peij_2_1_add_fai_8_n5, fc_pe_b_peij_2_1_add_fai_8_n4,
         fc_pe_b_peij_2_1_add_fai_9_n5, fc_pe_b_peij_2_1_add_fai_9_n4,
         fc_pe_b_peij_2_1_add_fai_10_n5, fc_pe_b_peij_2_1_add_fai_10_n4,
         fc_pe_b_peij_2_2_n16, fc_pe_b_peij_2_2_n14, fc_pe_b_peij_2_2_n12,
         fc_pe_b_peij_2_2_N35, fc_pe_b_peij_2_2_N34, fc_pe_b_peij_2_2_N33,
         fc_pe_b_peij_2_2_N32, fc_pe_b_peij_2_2_q_k, fc_pe_b_peij_2_2_gck,
         fc_pe_b_peij_2_2_sgnext_10, fc_pe_b_peij_2_2_add_c_out,
         fc_pe_b_peij_2_2_add_fai_0_n5, fc_pe_b_peij_2_2_add_fai_0_n4,
         fc_pe_b_peij_2_2_add_fai_1_n5, fc_pe_b_peij_2_2_add_fai_1_n4,
         fc_pe_b_peij_2_2_add_fai_2_n5, fc_pe_b_peij_2_2_add_fai_2_n4,
         fc_pe_b_peij_2_2_add_fai_3_n5, fc_pe_b_peij_2_2_add_fai_3_n4,
         fc_pe_b_peij_2_2_add_fai_4_n5, fc_pe_b_peij_2_2_add_fai_4_n4,
         fc_pe_b_peij_2_2_add_fai_5_n5, fc_pe_b_peij_2_2_add_fai_5_n4,
         fc_pe_b_peij_2_2_add_fai_6_n5, fc_pe_b_peij_2_2_add_fai_6_n4,
         fc_pe_b_peij_2_2_add_fai_7_n5, fc_pe_b_peij_2_2_add_fai_7_n4,
         fc_pe_b_peij_2_2_add_fai_8_n5, fc_pe_b_peij_2_2_add_fai_8_n4,
         fc_pe_b_peij_2_2_add_fai_9_n5, fc_pe_b_peij_2_2_add_fai_9_n4,
         fc_pe_b_peij_2_2_add_fai_10_n5, fc_pe_b_peij_2_2_add_fai_10_n4,
         fc_pe_b_peij_2_3_n16, fc_pe_b_peij_2_3_n14, fc_pe_b_peij_2_3_n12,
         fc_pe_b_peij_2_3_N35, fc_pe_b_peij_2_3_N34, fc_pe_b_peij_2_3_N33,
         fc_pe_b_peij_2_3_N32, fc_pe_b_peij_2_3_q_k, fc_pe_b_peij_2_3_gck,
         fc_pe_b_peij_2_3_sgnext_10, fc_pe_b_peij_2_3_add_c_out,
         fc_pe_b_peij_2_3_add_fai_0_n5, fc_pe_b_peij_2_3_add_fai_0_n4,
         fc_pe_b_peij_2_3_add_fai_1_n5, fc_pe_b_peij_2_3_add_fai_1_n4,
         fc_pe_b_peij_2_3_add_fai_2_n5, fc_pe_b_peij_2_3_add_fai_2_n4,
         fc_pe_b_peij_2_3_add_fai_3_n5, fc_pe_b_peij_2_3_add_fai_3_n4,
         fc_pe_b_peij_2_3_add_fai_4_n5, fc_pe_b_peij_2_3_add_fai_4_n4,
         fc_pe_b_peij_2_3_add_fai_5_n5, fc_pe_b_peij_2_3_add_fai_5_n4,
         fc_pe_b_peij_2_3_add_fai_6_n5, fc_pe_b_peij_2_3_add_fai_6_n4,
         fc_pe_b_peij_2_3_add_fai_7_n5, fc_pe_b_peij_2_3_add_fai_7_n4,
         fc_pe_b_peij_2_3_add_fai_8_n5, fc_pe_b_peij_2_3_add_fai_8_n4,
         fc_pe_b_peij_2_3_add_fai_9_n5, fc_pe_b_peij_2_3_add_fai_9_n4,
         fc_pe_b_peij_2_3_add_fai_10_n5, fc_pe_b_peij_2_3_add_fai_10_n4,
         fc_pe_b_peij_3_0_n16, fc_pe_b_peij_3_0_n14, fc_pe_b_peij_3_0_n12,
         fc_pe_b_peij_3_0_N35, fc_pe_b_peij_3_0_N34, fc_pe_b_peij_3_0_N33,
         fc_pe_b_peij_3_0_N32, fc_pe_b_peij_3_0_q_k, fc_pe_b_peij_3_0_gck,
         fc_pe_b_peij_3_0_sgnext_10, fc_pe_b_peij_3_0_add_c_out,
         fc_pe_b_peij_3_0_add_fai_0_n5, fc_pe_b_peij_3_0_add_fai_0_n4,
         fc_pe_b_peij_3_0_add_fai_1_n5, fc_pe_b_peij_3_0_add_fai_1_n4,
         fc_pe_b_peij_3_0_add_fai_2_n5, fc_pe_b_peij_3_0_add_fai_2_n4,
         fc_pe_b_peij_3_0_add_fai_3_n5, fc_pe_b_peij_3_0_add_fai_3_n4,
         fc_pe_b_peij_3_0_add_fai_4_n5, fc_pe_b_peij_3_0_add_fai_4_n4,
         fc_pe_b_peij_3_0_add_fai_5_n5, fc_pe_b_peij_3_0_add_fai_5_n4,
         fc_pe_b_peij_3_0_add_fai_6_n5, fc_pe_b_peij_3_0_add_fai_6_n4,
         fc_pe_b_peij_3_0_add_fai_7_n5, fc_pe_b_peij_3_0_add_fai_7_n4,
         fc_pe_b_peij_3_0_add_fai_8_n5, fc_pe_b_peij_3_0_add_fai_8_n4,
         fc_pe_b_peij_3_0_add_fai_9_n5, fc_pe_b_peij_3_0_add_fai_9_n4,
         fc_pe_b_peij_3_0_add_fai_10_n5, fc_pe_b_peij_3_0_add_fai_10_n4,
         fc_pe_b_peij_3_1_n16, fc_pe_b_peij_3_1_n14, fc_pe_b_peij_3_1_n12,
         fc_pe_b_peij_3_1_N35, fc_pe_b_peij_3_1_N34, fc_pe_b_peij_3_1_N33,
         fc_pe_b_peij_3_1_N32, fc_pe_b_peij_3_1_q_k, fc_pe_b_peij_3_1_gck,
         fc_pe_b_peij_3_1_sgnext_10, fc_pe_b_peij_3_1_add_c_out,
         fc_pe_b_peij_3_1_add_fai_0_n5, fc_pe_b_peij_3_1_add_fai_0_n4,
         fc_pe_b_peij_3_1_add_fai_1_n5, fc_pe_b_peij_3_1_add_fai_1_n4,
         fc_pe_b_peij_3_1_add_fai_2_n5, fc_pe_b_peij_3_1_add_fai_2_n4,
         fc_pe_b_peij_3_1_add_fai_3_n5, fc_pe_b_peij_3_1_add_fai_3_n4,
         fc_pe_b_peij_3_1_add_fai_4_n5, fc_pe_b_peij_3_1_add_fai_4_n4,
         fc_pe_b_peij_3_1_add_fai_5_n5, fc_pe_b_peij_3_1_add_fai_5_n4,
         fc_pe_b_peij_3_1_add_fai_6_n5, fc_pe_b_peij_3_1_add_fai_6_n4,
         fc_pe_b_peij_3_1_add_fai_7_n5, fc_pe_b_peij_3_1_add_fai_7_n4,
         fc_pe_b_peij_3_1_add_fai_8_n5, fc_pe_b_peij_3_1_add_fai_8_n4,
         fc_pe_b_peij_3_1_add_fai_9_n5, fc_pe_b_peij_3_1_add_fai_9_n4,
         fc_pe_b_peij_3_1_add_fai_10_n5, fc_pe_b_peij_3_1_add_fai_10_n4,
         fc_pe_b_peij_3_2_n16, fc_pe_b_peij_3_2_n14, fc_pe_b_peij_3_2_n12,
         fc_pe_b_peij_3_2_N35, fc_pe_b_peij_3_2_N34, fc_pe_b_peij_3_2_N33,
         fc_pe_b_peij_3_2_N32, fc_pe_b_peij_3_2_q_k, fc_pe_b_peij_3_2_gck,
         fc_pe_b_peij_3_2_sgnext_10, fc_pe_b_peij_3_2_add_c_out,
         fc_pe_b_peij_3_2_add_fai_0_n5, fc_pe_b_peij_3_2_add_fai_0_n4,
         fc_pe_b_peij_3_2_add_fai_1_n5, fc_pe_b_peij_3_2_add_fai_1_n4,
         fc_pe_b_peij_3_2_add_fai_2_n5, fc_pe_b_peij_3_2_add_fai_2_n4,
         fc_pe_b_peij_3_2_add_fai_3_n5, fc_pe_b_peij_3_2_add_fai_3_n4,
         fc_pe_b_peij_3_2_add_fai_4_n5, fc_pe_b_peij_3_2_add_fai_4_n4,
         fc_pe_b_peij_3_2_add_fai_5_n5, fc_pe_b_peij_3_2_add_fai_5_n4,
         fc_pe_b_peij_3_2_add_fai_6_n5, fc_pe_b_peij_3_2_add_fai_6_n4,
         fc_pe_b_peij_3_2_add_fai_7_n5, fc_pe_b_peij_3_2_add_fai_7_n4,
         fc_pe_b_peij_3_2_add_fai_8_n5, fc_pe_b_peij_3_2_add_fai_8_n4,
         fc_pe_b_peij_3_2_add_fai_9_n5, fc_pe_b_peij_3_2_add_fai_9_n4,
         fc_pe_b_peij_3_2_add_fai_10_n5, fc_pe_b_peij_3_2_add_fai_10_n4,
         fc_pe_b_peij_3_3_n16, fc_pe_b_peij_3_3_n14, fc_pe_b_peij_3_3_n12,
         fc_pe_b_peij_3_3_N35, fc_pe_b_peij_3_3_N34, fc_pe_b_peij_3_3_N33,
         fc_pe_b_peij_3_3_N32, fc_pe_b_peij_3_3_q_k, fc_pe_b_peij_3_3_gck,
         fc_pe_b_peij_3_3_sgnext_10, fc_pe_b_peij_3_3_add_c_out,
         fc_pe_b_peij_3_3_add_fai_0_n5, fc_pe_b_peij_3_3_add_fai_0_n4,
         fc_pe_b_peij_3_3_add_fai_1_n5, fc_pe_b_peij_3_3_add_fai_1_n4,
         fc_pe_b_peij_3_3_add_fai_2_n5, fc_pe_b_peij_3_3_add_fai_2_n4,
         fc_pe_b_peij_3_3_add_fai_3_n5, fc_pe_b_peij_3_3_add_fai_3_n4,
         fc_pe_b_peij_3_3_add_fai_4_n5, fc_pe_b_peij_3_3_add_fai_4_n4,
         fc_pe_b_peij_3_3_add_fai_5_n5, fc_pe_b_peij_3_3_add_fai_5_n4,
         fc_pe_b_peij_3_3_add_fai_6_n5, fc_pe_b_peij_3_3_add_fai_6_n4,
         fc_pe_b_peij_3_3_add_fai_7_n5, fc_pe_b_peij_3_3_add_fai_7_n4,
         fc_pe_b_peij_3_3_add_fai_8_n5, fc_pe_b_peij_3_3_add_fai_8_n4,
         fc_pe_b_peij_3_3_add_fai_9_n5, fc_pe_b_peij_3_3_add_fai_9_n4,
         fc_pe_b_peij_3_3_add_fai_10_n5, fc_pe_b_peij_3_3_add_fai_10_n4,
         fc_clk_gating_unit_n4, fc_clk_gating_unit_n3, fc_clk_gating_unit_n2,
         fc_clk_gating_unit_n1, fc_clk_gating_unit_n8, fc_clk_gating_unit_n7,
         fc_clk_gating_unit_n6, fc_clk_gating_unit_n5, fc_count_n33,
         fc_count_n32, fc_count_n31, fc_count_n30, fc_count_n29, fc_count_n28,
         fc_count_n27, fc_count_n26, fc_count_n25, fc_count_n24, fc_count_n23,
         fc_count_n22, fc_count_n21, fc_count_n20, fc_count_n19, fc_count_n18,
         fc_count_n17, fc_count_n16, fc_count_n15, fc_count_n14, fc_count_n13,
         fc_count_n12, fc_count_n11, fc_count_n10, fc_count_n9, fc_count_n8,
         fc_count_n7, fc_count_n3, fc_count_n2, fc_count_n1, fc_count_n6,
         fc_count_n5, fc_count_net439, fc_count_N35, fc_count_N34,
         fc_count_N33, fc_count_N32, fc_count_N31, fc_count_N30, fc_count_N29,
         fc_count_N28, fc_count_N26, fc_count_N25, fc_count_N24, fc_count_N23,
         fc_count_N21, fc_count_N20, fc_count_N19, fc_count_N18, fc_count_N17,
         fc_count_N16, fc_count_N15, fc_count_N14, fc_count_N13, fc_count_N12,
         fc_count_N11, fc_count_N10, fc_count_N9, fc_count_N8, fc_count2_n3,
         fc_count2_n2, fc_count2_n1, fc_count2_n25, fc_count2_n24,
         fc_count2_n23, fc_count2_n22, fc_count2_n21, fc_count2_n20,
         fc_count2_n19, fc_count2_n18, fc_count2_n17, fc_count2_n16,
         fc_count2_n15, fc_count2_n14, fc_count2_n13, fc_count2_n12,
         fc_count2_n11, fc_count2_n10, fc_count2_n8, fc_count2_n7,
         fc_count2_n6, fc_count2_n5, fc_count2_net421, fc_count2_N20,
         fc_count2_N19, fc_count2_N18, fc_count2_N17, fc_mux_n1, fc_mux2_n1,
         fsm_n2, fsm_n9, fsm_n8, fsm_n7, fsm_n6, fsm_n5, fsm_n4, fsm_n3,
         fsm_current_state_0_, fsm_current_state_1_;
  wire   [3:0] fc_out_mux2;
  wire   [8:0] fc_out_mux;
  wire   [0:3] fc_s_ckg_rmask;
  wire   [15:0] fc_pe_b_int_pe_en;
  wire   [10:0] fc_pe_b_peij_0_0_d_acc;
  wire   [2:0] fc_pe_b_peij_0_0_sgnext;
  wire   [10:0] fc_pe_b_peij_0_0_add_notb;
  wire   [10:1] fc_pe_b_peij_0_0_add_cprop;
  wire   [10:0] fc_pe_b_peij_0_1_d_acc;
  wire   [2:0] fc_pe_b_peij_0_1_sgnext;
  wire   [10:0] fc_pe_b_peij_0_1_add_notb;
  wire   [10:1] fc_pe_b_peij_0_1_add_cprop;
  wire   [10:0] fc_pe_b_peij_0_2_d_acc;
  wire   [2:0] fc_pe_b_peij_0_2_sgnext;
  wire   [10:0] fc_pe_b_peij_0_2_add_notb;
  wire   [10:1] fc_pe_b_peij_0_2_add_cprop;
  wire   [10:0] fc_pe_b_peij_0_3_d_acc;
  wire   [2:0] fc_pe_b_peij_0_3_sgnext;
  wire   [10:0] fc_pe_b_peij_0_3_add_notb;
  wire   [10:1] fc_pe_b_peij_0_3_add_cprop;
  wire   [10:0] fc_pe_b_peij_1_0_d_acc;
  wire   [2:0] fc_pe_b_peij_1_0_sgnext;
  wire   [10:0] fc_pe_b_peij_1_0_add_notb;
  wire   [10:1] fc_pe_b_peij_1_0_add_cprop;
  wire   [10:0] fc_pe_b_peij_1_1_d_acc;
  wire   [2:0] fc_pe_b_peij_1_1_sgnext;
  wire   [10:0] fc_pe_b_peij_1_1_add_notb;
  wire   [10:1] fc_pe_b_peij_1_1_add_cprop;
  wire   [10:0] fc_pe_b_peij_1_2_d_acc;
  wire   [2:0] fc_pe_b_peij_1_2_sgnext;
  wire   [10:0] fc_pe_b_peij_1_2_add_notb;
  wire   [10:1] fc_pe_b_peij_1_2_add_cprop;
  wire   [10:0] fc_pe_b_peij_1_3_d_acc;
  wire   [2:0] fc_pe_b_peij_1_3_sgnext;
  wire   [10:0] fc_pe_b_peij_1_3_add_notb;
  wire   [10:1] fc_pe_b_peij_1_3_add_cprop;
  wire   [10:0] fc_pe_b_peij_2_0_d_acc;
  wire   [2:0] fc_pe_b_peij_2_0_sgnext;
  wire   [10:0] fc_pe_b_peij_2_0_add_notb;
  wire   [10:1] fc_pe_b_peij_2_0_add_cprop;
  wire   [10:0] fc_pe_b_peij_2_1_d_acc;
  wire   [2:0] fc_pe_b_peij_2_1_sgnext;
  wire   [10:0] fc_pe_b_peij_2_1_add_notb;
  wire   [10:1] fc_pe_b_peij_2_1_add_cprop;
  wire   [10:0] fc_pe_b_peij_2_2_d_acc;
  wire   [2:0] fc_pe_b_peij_2_2_sgnext;
  wire   [10:0] fc_pe_b_peij_2_2_add_notb;
  wire   [10:1] fc_pe_b_peij_2_2_add_cprop;
  wire   [10:0] fc_pe_b_peij_2_3_d_acc;
  wire   [2:0] fc_pe_b_peij_2_3_sgnext;
  wire   [10:0] fc_pe_b_peij_2_3_add_notb;
  wire   [10:1] fc_pe_b_peij_2_3_add_cprop;
  wire   [10:0] fc_pe_b_peij_3_0_d_acc;
  wire   [2:0] fc_pe_b_peij_3_0_sgnext;
  wire   [10:0] fc_pe_b_peij_3_0_add_notb;
  wire   [10:1] fc_pe_b_peij_3_0_add_cprop;
  wire   [10:0] fc_pe_b_peij_3_1_d_acc;
  wire   [2:0] fc_pe_b_peij_3_1_sgnext;
  wire   [10:0] fc_pe_b_peij_3_1_add_notb;
  wire   [10:1] fc_pe_b_peij_3_1_add_cprop;
  wire   [10:0] fc_pe_b_peij_3_2_d_acc;
  wire   [2:0] fc_pe_b_peij_3_2_sgnext;
  wire   [10:0] fc_pe_b_peij_3_2_add_notb;
  wire   [10:1] fc_pe_b_peij_3_2_add_cprop;
  wire   [10:0] fc_pe_b_peij_3_3_d_acc;
  wire   [2:0] fc_pe_b_peij_3_3_sgnext;
  wire   [10:0] fc_pe_b_peij_3_3_add_notb;
  wire   [10:1] fc_pe_b_peij_3_3_add_cprop;
  wire   [8:2] fc_count_add_35_carry;

  INV_X1 fc_pe_b_U21 ( .A(fc_s_en_pe), .ZN(fc_pe_b_n1) );
  OR2_X1 fc_pe_b_U20 ( .A1(fc_s_ckg_rmask[3]), .A2(fc_pe_b_n1), .ZN(fc_pe_b_n2) );
  OR2_X1 fc_pe_b_U19 ( .A1(fc_s_ckg_rmask[2]), .A2(fc_pe_b_n1), .ZN(fc_pe_b_n3) );
  OR2_X1 fc_pe_b_U18 ( .A1(fc_s_ckg_rmask[1]), .A2(fc_pe_b_n1), .ZN(fc_pe_b_n4) );
  OR2_X1 fc_pe_b_U17 ( .A1(fc_s_ckg_rmask[0]), .A2(fc_pe_b_n1), .ZN(fc_pe_b_n5) );
  NOR2_X1 fc_pe_b_U16 ( .A1(fc_s_ckg_rmask[0]), .A2(fc_pe_b_n5), .ZN(
        fc_pe_b_int_pe_en[15]) );
  NOR2_X1 fc_pe_b_U15 ( .A1(fc_s_ckg_rmask[0]), .A2(fc_pe_b_n2), .ZN(
        fc_pe_b_int_pe_en[0]) );
  NOR2_X1 fc_pe_b_U14 ( .A1(fc_s_ckg_rmask[0]), .A2(fc_pe_b_n2), .ZN(
        fc_pe_b_int_pe_en[1]) );
  NOR2_X1 fc_pe_b_U13 ( .A1(fc_s_ckg_rmask[0]), .A2(fc_pe_b_n2), .ZN(
        fc_pe_b_int_pe_en[2]) );
  NOR2_X1 fc_pe_b_U12 ( .A1(fc_s_ckg_rmask[0]), .A2(fc_pe_b_n2), .ZN(
        fc_pe_b_int_pe_en[3]) );
  NOR2_X1 fc_pe_b_U11 ( .A1(fc_s_ckg_rmask[0]), .A2(fc_pe_b_n3), .ZN(
        fc_pe_b_int_pe_en[4]) );
  NOR2_X1 fc_pe_b_U10 ( .A1(fc_s_ckg_rmask[0]), .A2(fc_pe_b_n3), .ZN(
        fc_pe_b_int_pe_en[5]) );
  NOR2_X1 fc_pe_b_U9 ( .A1(fc_s_ckg_rmask[0]), .A2(fc_pe_b_n3), .ZN(
        fc_pe_b_int_pe_en[6]) );
  NOR2_X1 fc_pe_b_U8 ( .A1(fc_s_ckg_rmask[0]), .A2(fc_pe_b_n3), .ZN(
        fc_pe_b_int_pe_en[7]) );
  NOR2_X1 fc_pe_b_U7 ( .A1(fc_s_ckg_rmask[0]), .A2(fc_pe_b_n4), .ZN(
        fc_pe_b_int_pe_en[8]) );
  NOR2_X1 fc_pe_b_U6 ( .A1(fc_s_ckg_rmask[0]), .A2(fc_pe_b_n4), .ZN(
        fc_pe_b_int_pe_en[9]) );
  NOR2_X1 fc_pe_b_U5 ( .A1(fc_s_ckg_rmask[0]), .A2(fc_pe_b_n4), .ZN(
        fc_pe_b_int_pe_en[10]) );
  NOR2_X1 fc_pe_b_U4 ( .A1(fc_s_ckg_rmask[0]), .A2(fc_pe_b_n4), .ZN(
        fc_pe_b_int_pe_en[11]) );
  NOR2_X1 fc_pe_b_U3 ( .A1(fc_s_ckg_rmask[0]), .A2(fc_pe_b_n5), .ZN(
        fc_pe_b_int_pe_en[12]) );
  NOR2_X1 fc_pe_b_U2 ( .A1(fc_s_ckg_rmask[0]), .A2(fc_pe_b_n5), .ZN(
        fc_pe_b_int_pe_en[13]) );
  NOR2_X1 fc_pe_b_U1 ( .A1(fc_s_ckg_rmask[0]), .A2(fc_pe_b_n5), .ZN(
        fc_pe_b_int_pe_en[14]) );
  AND3_X1 fc_pe_b_peij_0_0_U22 ( .A1(fc_pe_b_int_pe_en[15]), .A2(clk), .A3(
        i_kernel1[6]), .ZN(fc_pe_b_peij_0_0_gck) );
  AND2_X1 fc_pe_b_peij_0_0_U21 ( .A1(i_data[3]), .A2(fc_pe_b_peij_0_0_n15), 
        .ZN(fc_pe_b_peij_0_0_N35) );
  AND2_X1 fc_pe_b_peij_0_0_U20 ( .A1(i_data[2]), .A2(fc_pe_b_peij_0_0_n15), 
        .ZN(fc_pe_b_peij_0_0_N34) );
  AND2_X1 fc_pe_b_peij_0_0_U19 ( .A1(i_data[1]), .A2(fc_pe_b_peij_0_0_n15), 
        .ZN(fc_pe_b_peij_0_0_N33) );
  AND2_X1 fc_pe_b_peij_0_0_U18 ( .A1(i_data[0]), .A2(fc_pe_b_peij_0_0_n15), 
        .ZN(fc_pe_b_peij_0_0_N32) );
  AND3_X1 fc_pe_b_peij_0_0_U17 ( .A1(fc_pe_b_int_pe_en[15]), .A2(
        fc_pe_b_peij_0_0_n14), .A3(i_kernel1[6]), .ZN(fc_pe_b_peij_0_0_n15) );
  INV_X1 fc_pe_b_peij_0_0_U16 ( .A(tb_rst_cnt2), .ZN(fc_pe_b_peij_0_0_n12) );
  INV_X1 fc_pe_b_peij_0_0_U14 ( .A(tb_rst_cnt1), .ZN(fc_pe_b_peij_0_0_n14) );
  SDFFR_X1 fc_pe_b_peij_0_0_q_acc_reg_10_ ( .D(1'b0), .SI(fc_pe_b_peij_0_0_n14), .SE(fc_pe_b_peij_0_0_d_acc[10]), .CK(fc_pe_b_peij_0_0_gck), .RN(
        fc_pe_b_peij_0_0_n12), .Q(o_data1[43]) );
  SDFFR_X1 fc_pe_b_peij_0_0_q_acc_reg_9_ ( .D(1'b0), .SI(fc_pe_b_peij_0_0_n14), 
        .SE(fc_pe_b_peij_0_0_d_acc[9]), .CK(fc_pe_b_peij_0_0_gck), .RN(
        fc_pe_b_peij_0_0_n12), .Q(o_data1[42]) );
  SDFFR_X1 fc_pe_b_peij_0_0_q_acc_reg_8_ ( .D(1'b0), .SI(fc_pe_b_peij_0_0_n14), 
        .SE(fc_pe_b_peij_0_0_d_acc[8]), .CK(fc_pe_b_peij_0_0_gck), .RN(
        fc_pe_b_peij_0_0_n12), .Q(o_data1[41]) );
  SDFFR_X1 fc_pe_b_peij_0_0_q_acc_reg_7_ ( .D(1'b0), .SI(fc_pe_b_peij_0_0_n14), 
        .SE(fc_pe_b_peij_0_0_d_acc[7]), .CK(fc_pe_b_peij_0_0_gck), .RN(
        fc_pe_b_peij_0_0_n12), .Q(o_data1[40]) );
  SDFFR_X1 fc_pe_b_peij_0_0_q_acc_reg_6_ ( .D(1'b0), .SI(fc_pe_b_peij_0_0_n14), 
        .SE(fc_pe_b_peij_0_0_d_acc[6]), .CK(fc_pe_b_peij_0_0_gck), .RN(
        fc_pe_b_peij_0_0_n12), .Q(o_data1[39]) );
  SDFFR_X1 fc_pe_b_peij_0_0_q_acc_reg_5_ ( .D(1'b0), .SI(fc_pe_b_peij_0_0_n14), 
        .SE(fc_pe_b_peij_0_0_d_acc[5]), .CK(fc_pe_b_peij_0_0_gck), .RN(
        fc_pe_b_peij_0_0_n12), .Q(o_data1[38]) );
  SDFFR_X1 fc_pe_b_peij_0_0_q_acc_reg_4_ ( .D(1'b0), .SI(fc_pe_b_peij_0_0_n14), 
        .SE(fc_pe_b_peij_0_0_d_acc[4]), .CK(fc_pe_b_peij_0_0_gck), .RN(
        fc_pe_b_peij_0_0_n12), .Q(o_data1[37]) );
  SDFFR_X1 fc_pe_b_peij_0_0_q_acc_reg_3_ ( .D(1'b0), .SI(fc_pe_b_peij_0_0_n14), 
        .SE(fc_pe_b_peij_0_0_d_acc[3]), .CK(fc_pe_b_peij_0_0_gck), .RN(
        fc_pe_b_peij_0_0_n12), .Q(o_data1[36]) );
  SDFFR_X1 fc_pe_b_peij_0_0_q_acc_reg_2_ ( .D(1'b0), .SI(fc_pe_b_peij_0_0_n14), 
        .SE(fc_pe_b_peij_0_0_d_acc[2]), .CK(fc_pe_b_peij_0_0_gck), .RN(
        fc_pe_b_peij_0_0_n12), .Q(o_data1[35]) );
  SDFFR_X1 fc_pe_b_peij_0_0_q_acc_reg_1_ ( .D(1'b0), .SI(fc_pe_b_peij_0_0_n14), 
        .SE(fc_pe_b_peij_0_0_d_acc[1]), .CK(fc_pe_b_peij_0_0_gck), .RN(
        fc_pe_b_peij_0_0_n12), .Q(o_data1[34]) );
  SDFFR_X1 fc_pe_b_peij_0_0_q_acc_reg_0_ ( .D(1'b0), .SI(fc_pe_b_peij_0_0_n14), 
        .SE(fc_pe_b_peij_0_0_d_acc[0]), .CK(fc_pe_b_peij_0_0_gck), .RN(
        fc_pe_b_peij_0_0_n12), .Q(o_data1[33]) );
  DFFR_X1 fc_pe_b_peij_0_0_q_im_reg_0_ ( .D(fc_pe_b_peij_0_0_N32), .CK(
        fc_pe_b_peij_0_0_gck), .RN(fc_pe_b_peij_0_0_n12), .Q(
        fc_pe_b_peij_0_0_sgnext[0]) );
  DFFR_X1 fc_pe_b_peij_0_0_q_im_reg_1_ ( .D(fc_pe_b_peij_0_0_N33), .CK(
        fc_pe_b_peij_0_0_gck), .RN(fc_pe_b_peij_0_0_n12), .Q(
        fc_pe_b_peij_0_0_sgnext[1]) );
  DFFR_X1 fc_pe_b_peij_0_0_q_im_reg_2_ ( .D(fc_pe_b_peij_0_0_N34), .CK(
        fc_pe_b_peij_0_0_gck), .RN(fc_pe_b_peij_0_0_n12), .Q(
        fc_pe_b_peij_0_0_sgnext[2]) );
  DFFR_X1 fc_pe_b_peij_0_0_q_im_reg_3_ ( .D(fc_pe_b_peij_0_0_N35), .CK(
        fc_pe_b_peij_0_0_gck), .RN(fc_pe_b_peij_0_0_n12), .Q(
        fc_pe_b_peij_0_0_sgnext_10) );
  SDFFR_X1 fc_pe_b_peij_0_0_q_k_reg ( .D(1'b0), .SI(fc_pe_b_peij_0_0_n14), 
        .SE(i_kernel1[7]), .CK(fc_pe_b_peij_0_0_gck), .RN(fc_pe_b_peij_0_0_n12), .Q(fc_pe_b_peij_0_0_q_k) );
  XOR2_X1 fc_pe_b_peij_0_0_add_U11 ( .A(fc_pe_b_peij_0_0_sgnext[0]), .B(
        fc_pe_b_peij_0_0_q_k), .Z(fc_pe_b_peij_0_0_add_notb[0]) );
  XOR2_X1 fc_pe_b_peij_0_0_add_U10 ( .A(fc_pe_b_peij_0_0_sgnext_10), .B(
        fc_pe_b_peij_0_0_q_k), .Z(fc_pe_b_peij_0_0_add_notb[10]) );
  XOR2_X1 fc_pe_b_peij_0_0_add_U9 ( .A(fc_pe_b_peij_0_0_sgnext[1]), .B(
        fc_pe_b_peij_0_0_q_k), .Z(fc_pe_b_peij_0_0_add_notb[1]) );
  XOR2_X1 fc_pe_b_peij_0_0_add_U8 ( .A(fc_pe_b_peij_0_0_sgnext[2]), .B(
        fc_pe_b_peij_0_0_q_k), .Z(fc_pe_b_peij_0_0_add_notb[2]) );
  XOR2_X1 fc_pe_b_peij_0_0_add_U7 ( .A(fc_pe_b_peij_0_0_sgnext_10), .B(
        fc_pe_b_peij_0_0_q_k), .Z(fc_pe_b_peij_0_0_add_notb[3]) );
  XOR2_X1 fc_pe_b_peij_0_0_add_U6 ( .A(fc_pe_b_peij_0_0_sgnext_10), .B(
        fc_pe_b_peij_0_0_q_k), .Z(fc_pe_b_peij_0_0_add_notb[4]) );
  XOR2_X1 fc_pe_b_peij_0_0_add_U5 ( .A(fc_pe_b_peij_0_0_sgnext_10), .B(
        fc_pe_b_peij_0_0_q_k), .Z(fc_pe_b_peij_0_0_add_notb[5]) );
  XOR2_X1 fc_pe_b_peij_0_0_add_U4 ( .A(fc_pe_b_peij_0_0_sgnext_10), .B(
        fc_pe_b_peij_0_0_q_k), .Z(fc_pe_b_peij_0_0_add_notb[6]) );
  XOR2_X1 fc_pe_b_peij_0_0_add_U3 ( .A(fc_pe_b_peij_0_0_sgnext_10), .B(
        fc_pe_b_peij_0_0_q_k), .Z(fc_pe_b_peij_0_0_add_notb[7]) );
  XOR2_X1 fc_pe_b_peij_0_0_add_U2 ( .A(fc_pe_b_peij_0_0_sgnext_10), .B(
        fc_pe_b_peij_0_0_q_k), .Z(fc_pe_b_peij_0_0_add_notb[8]) );
  XOR2_X1 fc_pe_b_peij_0_0_add_U1 ( .A(fc_pe_b_peij_0_0_sgnext_10), .B(
        fc_pe_b_peij_0_0_q_k), .Z(fc_pe_b_peij_0_0_add_notb[9]) );
  AOI22_X1 fc_pe_b_peij_0_0_add_fai_0_U2 ( .A1(fc_pe_b_peij_0_0_add_notb[0]), 
        .A2(o_data1[33]), .B1(fc_pe_b_peij_0_0_add_fai_0_n2), .B2(
        fc_pe_b_peij_0_0_q_k), .ZN(fc_pe_b_peij_0_0_add_fai_0_n3) );
  INV_X1 fc_pe_b_peij_0_0_add_fai_0_U1 ( .A(fc_pe_b_peij_0_0_add_fai_0_n3), 
        .ZN(fc_pe_b_peij_0_0_add_cprop[1]) );
  XOR2_X1 fc_pe_b_peij_0_0_add_fai_0_U4 ( .A(o_data1[33]), .B(
        fc_pe_b_peij_0_0_add_notb[0]), .Z(fc_pe_b_peij_0_0_add_fai_0_n2) );
  XOR2_X1 fc_pe_b_peij_0_0_add_fai_0_U3 ( .A(fc_pe_b_peij_0_0_q_k), .B(
        fc_pe_b_peij_0_0_add_fai_0_n2), .Z(fc_pe_b_peij_0_0_d_acc[0]) );
  AOI22_X1 fc_pe_b_peij_0_0_add_fai_1_U2 ( .A1(fc_pe_b_peij_0_0_add_notb[1]), 
        .A2(o_data1[34]), .B1(fc_pe_b_peij_0_0_add_fai_1_n5), .B2(
        fc_pe_b_peij_0_0_add_cprop[1]), .ZN(fc_pe_b_peij_0_0_add_fai_1_n4) );
  INV_X1 fc_pe_b_peij_0_0_add_fai_1_U1 ( .A(fc_pe_b_peij_0_0_add_fai_1_n4), 
        .ZN(fc_pe_b_peij_0_0_add_cprop[2]) );
  XOR2_X1 fc_pe_b_peij_0_0_add_fai_1_U4 ( .A(o_data1[34]), .B(
        fc_pe_b_peij_0_0_add_notb[1]), .Z(fc_pe_b_peij_0_0_add_fai_1_n5) );
  XOR2_X1 fc_pe_b_peij_0_0_add_fai_1_U3 ( .A(fc_pe_b_peij_0_0_add_cprop[1]), 
        .B(fc_pe_b_peij_0_0_add_fai_1_n5), .Z(fc_pe_b_peij_0_0_d_acc[1]) );
  AOI22_X1 fc_pe_b_peij_0_0_add_fai_2_U2 ( .A1(fc_pe_b_peij_0_0_add_notb[2]), 
        .A2(o_data1[35]), .B1(fc_pe_b_peij_0_0_add_fai_2_n5), .B2(
        fc_pe_b_peij_0_0_add_cprop[2]), .ZN(fc_pe_b_peij_0_0_add_fai_2_n4) );
  INV_X1 fc_pe_b_peij_0_0_add_fai_2_U1 ( .A(fc_pe_b_peij_0_0_add_fai_2_n4), 
        .ZN(fc_pe_b_peij_0_0_add_cprop[3]) );
  XOR2_X1 fc_pe_b_peij_0_0_add_fai_2_U4 ( .A(o_data1[35]), .B(
        fc_pe_b_peij_0_0_add_notb[2]), .Z(fc_pe_b_peij_0_0_add_fai_2_n5) );
  XOR2_X1 fc_pe_b_peij_0_0_add_fai_2_U3 ( .A(fc_pe_b_peij_0_0_add_cprop[2]), 
        .B(fc_pe_b_peij_0_0_add_fai_2_n5), .Z(fc_pe_b_peij_0_0_d_acc[2]) );
  AOI22_X1 fc_pe_b_peij_0_0_add_fai_3_U2 ( .A1(fc_pe_b_peij_0_0_add_notb[3]), 
        .A2(o_data1[36]), .B1(fc_pe_b_peij_0_0_add_fai_3_n5), .B2(
        fc_pe_b_peij_0_0_add_cprop[3]), .ZN(fc_pe_b_peij_0_0_add_fai_3_n4) );
  INV_X1 fc_pe_b_peij_0_0_add_fai_3_U1 ( .A(fc_pe_b_peij_0_0_add_fai_3_n4), 
        .ZN(fc_pe_b_peij_0_0_add_cprop[4]) );
  XOR2_X1 fc_pe_b_peij_0_0_add_fai_3_U4 ( .A(o_data1[36]), .B(
        fc_pe_b_peij_0_0_add_notb[3]), .Z(fc_pe_b_peij_0_0_add_fai_3_n5) );
  XOR2_X1 fc_pe_b_peij_0_0_add_fai_3_U3 ( .A(fc_pe_b_peij_0_0_add_cprop[3]), 
        .B(fc_pe_b_peij_0_0_add_fai_3_n5), .Z(fc_pe_b_peij_0_0_d_acc[3]) );
  AOI22_X1 fc_pe_b_peij_0_0_add_fai_4_U2 ( .A1(fc_pe_b_peij_0_0_add_notb[4]), 
        .A2(o_data1[37]), .B1(fc_pe_b_peij_0_0_add_fai_4_n5), .B2(
        fc_pe_b_peij_0_0_add_cprop[4]), .ZN(fc_pe_b_peij_0_0_add_fai_4_n4) );
  INV_X1 fc_pe_b_peij_0_0_add_fai_4_U1 ( .A(fc_pe_b_peij_0_0_add_fai_4_n4), 
        .ZN(fc_pe_b_peij_0_0_add_cprop[5]) );
  XOR2_X1 fc_pe_b_peij_0_0_add_fai_4_U4 ( .A(o_data1[37]), .B(
        fc_pe_b_peij_0_0_add_notb[4]), .Z(fc_pe_b_peij_0_0_add_fai_4_n5) );
  XOR2_X1 fc_pe_b_peij_0_0_add_fai_4_U3 ( .A(fc_pe_b_peij_0_0_add_cprop[4]), 
        .B(fc_pe_b_peij_0_0_add_fai_4_n5), .Z(fc_pe_b_peij_0_0_d_acc[4]) );
  AOI22_X1 fc_pe_b_peij_0_0_add_fai_5_U2 ( .A1(fc_pe_b_peij_0_0_add_notb[5]), 
        .A2(o_data1[38]), .B1(fc_pe_b_peij_0_0_add_fai_5_n5), .B2(
        fc_pe_b_peij_0_0_add_cprop[5]), .ZN(fc_pe_b_peij_0_0_add_fai_5_n4) );
  INV_X1 fc_pe_b_peij_0_0_add_fai_5_U1 ( .A(fc_pe_b_peij_0_0_add_fai_5_n4), 
        .ZN(fc_pe_b_peij_0_0_add_cprop[6]) );
  XOR2_X1 fc_pe_b_peij_0_0_add_fai_5_U4 ( .A(o_data1[38]), .B(
        fc_pe_b_peij_0_0_add_notb[5]), .Z(fc_pe_b_peij_0_0_add_fai_5_n5) );
  XOR2_X1 fc_pe_b_peij_0_0_add_fai_5_U3 ( .A(fc_pe_b_peij_0_0_add_cprop[5]), 
        .B(fc_pe_b_peij_0_0_add_fai_5_n5), .Z(fc_pe_b_peij_0_0_d_acc[5]) );
  AOI22_X1 fc_pe_b_peij_0_0_add_fai_6_U2 ( .A1(fc_pe_b_peij_0_0_add_notb[6]), 
        .A2(o_data1[39]), .B1(fc_pe_b_peij_0_0_add_fai_6_n5), .B2(
        fc_pe_b_peij_0_0_add_cprop[6]), .ZN(fc_pe_b_peij_0_0_add_fai_6_n4) );
  INV_X1 fc_pe_b_peij_0_0_add_fai_6_U1 ( .A(fc_pe_b_peij_0_0_add_fai_6_n4), 
        .ZN(fc_pe_b_peij_0_0_add_cprop[7]) );
  XOR2_X1 fc_pe_b_peij_0_0_add_fai_6_U4 ( .A(o_data1[39]), .B(
        fc_pe_b_peij_0_0_add_notb[6]), .Z(fc_pe_b_peij_0_0_add_fai_6_n5) );
  XOR2_X1 fc_pe_b_peij_0_0_add_fai_6_U3 ( .A(fc_pe_b_peij_0_0_add_cprop[6]), 
        .B(fc_pe_b_peij_0_0_add_fai_6_n5), .Z(fc_pe_b_peij_0_0_d_acc[6]) );
  AOI22_X1 fc_pe_b_peij_0_0_add_fai_7_U2 ( .A1(fc_pe_b_peij_0_0_add_notb[7]), 
        .A2(o_data1[40]), .B1(fc_pe_b_peij_0_0_add_fai_7_n5), .B2(
        fc_pe_b_peij_0_0_add_cprop[7]), .ZN(fc_pe_b_peij_0_0_add_fai_7_n4) );
  INV_X1 fc_pe_b_peij_0_0_add_fai_7_U1 ( .A(fc_pe_b_peij_0_0_add_fai_7_n4), 
        .ZN(fc_pe_b_peij_0_0_add_cprop[8]) );
  XOR2_X1 fc_pe_b_peij_0_0_add_fai_7_U4 ( .A(o_data1[40]), .B(
        fc_pe_b_peij_0_0_add_notb[7]), .Z(fc_pe_b_peij_0_0_add_fai_7_n5) );
  XOR2_X1 fc_pe_b_peij_0_0_add_fai_7_U3 ( .A(fc_pe_b_peij_0_0_add_cprop[7]), 
        .B(fc_pe_b_peij_0_0_add_fai_7_n5), .Z(fc_pe_b_peij_0_0_d_acc[7]) );
  AOI22_X1 fc_pe_b_peij_0_0_add_fai_8_U2 ( .A1(fc_pe_b_peij_0_0_add_notb[8]), 
        .A2(o_data1[41]), .B1(fc_pe_b_peij_0_0_add_fai_8_n5), .B2(
        fc_pe_b_peij_0_0_add_cprop[8]), .ZN(fc_pe_b_peij_0_0_add_fai_8_n4) );
  INV_X1 fc_pe_b_peij_0_0_add_fai_8_U1 ( .A(fc_pe_b_peij_0_0_add_fai_8_n4), 
        .ZN(fc_pe_b_peij_0_0_add_cprop[9]) );
  XOR2_X1 fc_pe_b_peij_0_0_add_fai_8_U4 ( .A(o_data1[41]), .B(
        fc_pe_b_peij_0_0_add_notb[8]), .Z(fc_pe_b_peij_0_0_add_fai_8_n5) );
  XOR2_X1 fc_pe_b_peij_0_0_add_fai_8_U3 ( .A(fc_pe_b_peij_0_0_add_cprop[8]), 
        .B(fc_pe_b_peij_0_0_add_fai_8_n5), .Z(fc_pe_b_peij_0_0_d_acc[8]) );
  AOI22_X1 fc_pe_b_peij_0_0_add_fai_9_U2 ( .A1(fc_pe_b_peij_0_0_add_notb[9]), 
        .A2(o_data1[42]), .B1(fc_pe_b_peij_0_0_add_fai_9_n5), .B2(
        fc_pe_b_peij_0_0_add_cprop[9]), .ZN(fc_pe_b_peij_0_0_add_fai_9_n4) );
  INV_X1 fc_pe_b_peij_0_0_add_fai_9_U1 ( .A(fc_pe_b_peij_0_0_add_fai_9_n4), 
        .ZN(fc_pe_b_peij_0_0_add_cprop[10]) );
  XOR2_X1 fc_pe_b_peij_0_0_add_fai_9_U4 ( .A(o_data1[42]), .B(
        fc_pe_b_peij_0_0_add_notb[9]), .Z(fc_pe_b_peij_0_0_add_fai_9_n5) );
  XOR2_X1 fc_pe_b_peij_0_0_add_fai_9_U3 ( .A(fc_pe_b_peij_0_0_add_cprop[9]), 
        .B(fc_pe_b_peij_0_0_add_fai_9_n5), .Z(fc_pe_b_peij_0_0_d_acc[9]) );
  AOI22_X1 fc_pe_b_peij_0_0_add_fai_10_U2 ( .A1(fc_pe_b_peij_0_0_add_notb[10]), 
        .A2(o_data1[43]), .B1(fc_pe_b_peij_0_0_add_fai_10_n5), .B2(
        fc_pe_b_peij_0_0_add_cprop[10]), .ZN(fc_pe_b_peij_0_0_add_fai_10_n4)
         );
  INV_X1 fc_pe_b_peij_0_0_add_fai_10_U1 ( .A(fc_pe_b_peij_0_0_add_fai_10_n4), 
        .ZN(fc_pe_b_peij_0_0_add_c_out) );
  XOR2_X1 fc_pe_b_peij_0_0_add_fai_10_U4 ( .A(o_data1[43]), .B(
        fc_pe_b_peij_0_0_add_notb[10]), .Z(fc_pe_b_peij_0_0_add_fai_10_n5) );
  XOR2_X1 fc_pe_b_peij_0_0_add_fai_10_U3 ( .A(fc_pe_b_peij_0_0_add_cprop[10]), 
        .B(fc_pe_b_peij_0_0_add_fai_10_n5), .Z(fc_pe_b_peij_0_0_d_acc[10]) );
  AND3_X1 fc_pe_b_peij_0_1_U22 ( .A1(fc_pe_b_int_pe_en[14]), .A2(clk), .A3(
        i_kernel1[4]), .ZN(fc_pe_b_peij_0_1_gck) );
  AND2_X1 fc_pe_b_peij_0_1_U21 ( .A1(i_data[3]), .A2(fc_pe_b_peij_0_1_n16), 
        .ZN(fc_pe_b_peij_0_1_N35) );
  AND2_X1 fc_pe_b_peij_0_1_U20 ( .A1(i_data[2]), .A2(fc_pe_b_peij_0_1_n16), 
        .ZN(fc_pe_b_peij_0_1_N34) );
  AND2_X1 fc_pe_b_peij_0_1_U19 ( .A1(i_data[1]), .A2(fc_pe_b_peij_0_1_n16), 
        .ZN(fc_pe_b_peij_0_1_N33) );
  AND2_X1 fc_pe_b_peij_0_1_U18 ( .A1(i_data[0]), .A2(fc_pe_b_peij_0_1_n16), 
        .ZN(fc_pe_b_peij_0_1_N32) );
  AND3_X1 fc_pe_b_peij_0_1_U17 ( .A1(fc_pe_b_int_pe_en[14]), .A2(
        fc_pe_b_peij_0_1_n14), .A3(i_kernel1[4]), .ZN(fc_pe_b_peij_0_1_n16) );
  INV_X1 fc_pe_b_peij_0_1_U16 ( .A(tb_rst_cnt2), .ZN(fc_pe_b_peij_0_1_n12) );
  INV_X1 fc_pe_b_peij_0_1_U14 ( .A(tb_rst_cnt1), .ZN(fc_pe_b_peij_0_1_n14) );
  SDFFR_X1 fc_pe_b_peij_0_1_q_acc_reg_10_ ( .D(1'b0), .SI(fc_pe_b_peij_0_1_n14), .SE(fc_pe_b_peij_0_1_d_acc[10]), .CK(fc_pe_b_peij_0_1_gck), .RN(
        fc_pe_b_peij_0_1_n12), .Q(o_data1[32]) );
  SDFFR_X1 fc_pe_b_peij_0_1_q_acc_reg_9_ ( .D(1'b0), .SI(fc_pe_b_peij_0_1_n14), 
        .SE(fc_pe_b_peij_0_1_d_acc[9]), .CK(fc_pe_b_peij_0_1_gck), .RN(
        fc_pe_b_peij_0_1_n12), .Q(o_data1[31]) );
  SDFFR_X1 fc_pe_b_peij_0_1_q_acc_reg_8_ ( .D(1'b0), .SI(fc_pe_b_peij_0_1_n14), 
        .SE(fc_pe_b_peij_0_1_d_acc[8]), .CK(fc_pe_b_peij_0_1_gck), .RN(
        fc_pe_b_peij_0_1_n12), .Q(o_data1[30]) );
  SDFFR_X1 fc_pe_b_peij_0_1_q_acc_reg_7_ ( .D(1'b0), .SI(fc_pe_b_peij_0_1_n14), 
        .SE(fc_pe_b_peij_0_1_d_acc[7]), .CK(fc_pe_b_peij_0_1_gck), .RN(
        fc_pe_b_peij_0_1_n12), .Q(o_data1[29]) );
  SDFFR_X1 fc_pe_b_peij_0_1_q_acc_reg_6_ ( .D(1'b0), .SI(fc_pe_b_peij_0_1_n14), 
        .SE(fc_pe_b_peij_0_1_d_acc[6]), .CK(fc_pe_b_peij_0_1_gck), .RN(
        fc_pe_b_peij_0_1_n12), .Q(o_data1[28]) );
  SDFFR_X1 fc_pe_b_peij_0_1_q_acc_reg_5_ ( .D(1'b0), .SI(fc_pe_b_peij_0_1_n14), 
        .SE(fc_pe_b_peij_0_1_d_acc[5]), .CK(fc_pe_b_peij_0_1_gck), .RN(
        fc_pe_b_peij_0_1_n12), .Q(o_data1[27]) );
  SDFFR_X1 fc_pe_b_peij_0_1_q_acc_reg_4_ ( .D(1'b0), .SI(fc_pe_b_peij_0_1_n14), 
        .SE(fc_pe_b_peij_0_1_d_acc[4]), .CK(fc_pe_b_peij_0_1_gck), .RN(
        fc_pe_b_peij_0_1_n12), .Q(o_data1[26]) );
  SDFFR_X1 fc_pe_b_peij_0_1_q_acc_reg_3_ ( .D(1'b0), .SI(fc_pe_b_peij_0_1_n14), 
        .SE(fc_pe_b_peij_0_1_d_acc[3]), .CK(fc_pe_b_peij_0_1_gck), .RN(
        fc_pe_b_peij_0_1_n12), .Q(o_data1[25]) );
  SDFFR_X1 fc_pe_b_peij_0_1_q_acc_reg_2_ ( .D(1'b0), .SI(fc_pe_b_peij_0_1_n14), 
        .SE(fc_pe_b_peij_0_1_d_acc[2]), .CK(fc_pe_b_peij_0_1_gck), .RN(
        fc_pe_b_peij_0_1_n12), .Q(o_data1[24]) );
  SDFFR_X1 fc_pe_b_peij_0_1_q_acc_reg_1_ ( .D(1'b0), .SI(fc_pe_b_peij_0_1_n14), 
        .SE(fc_pe_b_peij_0_1_d_acc[1]), .CK(fc_pe_b_peij_0_1_gck), .RN(
        fc_pe_b_peij_0_1_n12), .Q(o_data1[23]) );
  SDFFR_X1 fc_pe_b_peij_0_1_q_acc_reg_0_ ( .D(1'b0), .SI(fc_pe_b_peij_0_1_n14), 
        .SE(fc_pe_b_peij_0_1_d_acc[0]), .CK(fc_pe_b_peij_0_1_gck), .RN(
        fc_pe_b_peij_0_1_n12), .Q(o_data1[22]) );
  DFFR_X1 fc_pe_b_peij_0_1_q_im_reg_0_ ( .D(fc_pe_b_peij_0_1_N32), .CK(
        fc_pe_b_peij_0_1_gck), .RN(fc_pe_b_peij_0_1_n12), .Q(
        fc_pe_b_peij_0_1_sgnext[0]) );
  DFFR_X1 fc_pe_b_peij_0_1_q_im_reg_1_ ( .D(fc_pe_b_peij_0_1_N33), .CK(
        fc_pe_b_peij_0_1_gck), .RN(fc_pe_b_peij_0_1_n12), .Q(
        fc_pe_b_peij_0_1_sgnext[1]) );
  DFFR_X1 fc_pe_b_peij_0_1_q_im_reg_2_ ( .D(fc_pe_b_peij_0_1_N34), .CK(
        fc_pe_b_peij_0_1_gck), .RN(fc_pe_b_peij_0_1_n12), .Q(
        fc_pe_b_peij_0_1_sgnext[2]) );
  DFFR_X1 fc_pe_b_peij_0_1_q_im_reg_3_ ( .D(fc_pe_b_peij_0_1_N35), .CK(
        fc_pe_b_peij_0_1_gck), .RN(fc_pe_b_peij_0_1_n12), .Q(
        fc_pe_b_peij_0_1_sgnext_10) );
  SDFFR_X1 fc_pe_b_peij_0_1_q_k_reg ( .D(1'b0), .SI(fc_pe_b_peij_0_1_n14), 
        .SE(i_kernel1[5]), .CK(fc_pe_b_peij_0_1_gck), .RN(fc_pe_b_peij_0_1_n12), .Q(fc_pe_b_peij_0_1_q_k) );
  XOR2_X1 fc_pe_b_peij_0_1_add_U11 ( .A(fc_pe_b_peij_0_1_sgnext[0]), .B(
        fc_pe_b_peij_0_1_q_k), .Z(fc_pe_b_peij_0_1_add_notb[0]) );
  XOR2_X1 fc_pe_b_peij_0_1_add_U10 ( .A(fc_pe_b_peij_0_1_sgnext_10), .B(
        fc_pe_b_peij_0_1_q_k), .Z(fc_pe_b_peij_0_1_add_notb[10]) );
  XOR2_X1 fc_pe_b_peij_0_1_add_U9 ( .A(fc_pe_b_peij_0_1_sgnext[1]), .B(
        fc_pe_b_peij_0_1_q_k), .Z(fc_pe_b_peij_0_1_add_notb[1]) );
  XOR2_X1 fc_pe_b_peij_0_1_add_U8 ( .A(fc_pe_b_peij_0_1_sgnext[2]), .B(
        fc_pe_b_peij_0_1_q_k), .Z(fc_pe_b_peij_0_1_add_notb[2]) );
  XOR2_X1 fc_pe_b_peij_0_1_add_U7 ( .A(fc_pe_b_peij_0_1_sgnext_10), .B(
        fc_pe_b_peij_0_1_q_k), .Z(fc_pe_b_peij_0_1_add_notb[3]) );
  XOR2_X1 fc_pe_b_peij_0_1_add_U6 ( .A(fc_pe_b_peij_0_1_sgnext_10), .B(
        fc_pe_b_peij_0_1_q_k), .Z(fc_pe_b_peij_0_1_add_notb[4]) );
  XOR2_X1 fc_pe_b_peij_0_1_add_U5 ( .A(fc_pe_b_peij_0_1_sgnext_10), .B(
        fc_pe_b_peij_0_1_q_k), .Z(fc_pe_b_peij_0_1_add_notb[5]) );
  XOR2_X1 fc_pe_b_peij_0_1_add_U4 ( .A(fc_pe_b_peij_0_1_sgnext_10), .B(
        fc_pe_b_peij_0_1_q_k), .Z(fc_pe_b_peij_0_1_add_notb[6]) );
  XOR2_X1 fc_pe_b_peij_0_1_add_U3 ( .A(fc_pe_b_peij_0_1_sgnext_10), .B(
        fc_pe_b_peij_0_1_q_k), .Z(fc_pe_b_peij_0_1_add_notb[7]) );
  XOR2_X1 fc_pe_b_peij_0_1_add_U2 ( .A(fc_pe_b_peij_0_1_sgnext_10), .B(
        fc_pe_b_peij_0_1_q_k), .Z(fc_pe_b_peij_0_1_add_notb[8]) );
  XOR2_X1 fc_pe_b_peij_0_1_add_U1 ( .A(fc_pe_b_peij_0_1_sgnext_10), .B(
        fc_pe_b_peij_0_1_q_k), .Z(fc_pe_b_peij_0_1_add_notb[9]) );
  AOI22_X1 fc_pe_b_peij_0_1_add_fai_0_U2 ( .A1(fc_pe_b_peij_0_1_add_notb[0]), 
        .A2(o_data1[22]), .B1(fc_pe_b_peij_0_1_add_fai_0_n5), .B2(
        fc_pe_b_peij_0_1_q_k), .ZN(fc_pe_b_peij_0_1_add_fai_0_n4) );
  INV_X1 fc_pe_b_peij_0_1_add_fai_0_U1 ( .A(fc_pe_b_peij_0_1_add_fai_0_n4), 
        .ZN(fc_pe_b_peij_0_1_add_cprop[1]) );
  XOR2_X1 fc_pe_b_peij_0_1_add_fai_0_U4 ( .A(o_data1[22]), .B(
        fc_pe_b_peij_0_1_add_notb[0]), .Z(fc_pe_b_peij_0_1_add_fai_0_n5) );
  XOR2_X1 fc_pe_b_peij_0_1_add_fai_0_U3 ( .A(fc_pe_b_peij_0_1_q_k), .B(
        fc_pe_b_peij_0_1_add_fai_0_n5), .Z(fc_pe_b_peij_0_1_d_acc[0]) );
  AOI22_X1 fc_pe_b_peij_0_1_add_fai_1_U2 ( .A1(fc_pe_b_peij_0_1_add_notb[1]), 
        .A2(o_data1[23]), .B1(fc_pe_b_peij_0_1_add_fai_1_n5), .B2(
        fc_pe_b_peij_0_1_add_cprop[1]), .ZN(fc_pe_b_peij_0_1_add_fai_1_n4) );
  INV_X1 fc_pe_b_peij_0_1_add_fai_1_U1 ( .A(fc_pe_b_peij_0_1_add_fai_1_n4), 
        .ZN(fc_pe_b_peij_0_1_add_cprop[2]) );
  XOR2_X1 fc_pe_b_peij_0_1_add_fai_1_U4 ( .A(o_data1[23]), .B(
        fc_pe_b_peij_0_1_add_notb[1]), .Z(fc_pe_b_peij_0_1_add_fai_1_n5) );
  XOR2_X1 fc_pe_b_peij_0_1_add_fai_1_U3 ( .A(fc_pe_b_peij_0_1_add_cprop[1]), 
        .B(fc_pe_b_peij_0_1_add_fai_1_n5), .Z(fc_pe_b_peij_0_1_d_acc[1]) );
  AOI22_X1 fc_pe_b_peij_0_1_add_fai_2_U2 ( .A1(fc_pe_b_peij_0_1_add_notb[2]), 
        .A2(o_data1[24]), .B1(fc_pe_b_peij_0_1_add_fai_2_n5), .B2(
        fc_pe_b_peij_0_1_add_cprop[2]), .ZN(fc_pe_b_peij_0_1_add_fai_2_n4) );
  INV_X1 fc_pe_b_peij_0_1_add_fai_2_U1 ( .A(fc_pe_b_peij_0_1_add_fai_2_n4), 
        .ZN(fc_pe_b_peij_0_1_add_cprop[3]) );
  XOR2_X1 fc_pe_b_peij_0_1_add_fai_2_U4 ( .A(o_data1[24]), .B(
        fc_pe_b_peij_0_1_add_notb[2]), .Z(fc_pe_b_peij_0_1_add_fai_2_n5) );
  XOR2_X1 fc_pe_b_peij_0_1_add_fai_2_U3 ( .A(fc_pe_b_peij_0_1_add_cprop[2]), 
        .B(fc_pe_b_peij_0_1_add_fai_2_n5), .Z(fc_pe_b_peij_0_1_d_acc[2]) );
  AOI22_X1 fc_pe_b_peij_0_1_add_fai_3_U2 ( .A1(fc_pe_b_peij_0_1_add_notb[3]), 
        .A2(o_data1[25]), .B1(fc_pe_b_peij_0_1_add_fai_3_n5), .B2(
        fc_pe_b_peij_0_1_add_cprop[3]), .ZN(fc_pe_b_peij_0_1_add_fai_3_n4) );
  INV_X1 fc_pe_b_peij_0_1_add_fai_3_U1 ( .A(fc_pe_b_peij_0_1_add_fai_3_n4), 
        .ZN(fc_pe_b_peij_0_1_add_cprop[4]) );
  XOR2_X1 fc_pe_b_peij_0_1_add_fai_3_U4 ( .A(o_data1[25]), .B(
        fc_pe_b_peij_0_1_add_notb[3]), .Z(fc_pe_b_peij_0_1_add_fai_3_n5) );
  XOR2_X1 fc_pe_b_peij_0_1_add_fai_3_U3 ( .A(fc_pe_b_peij_0_1_add_cprop[3]), 
        .B(fc_pe_b_peij_0_1_add_fai_3_n5), .Z(fc_pe_b_peij_0_1_d_acc[3]) );
  AOI22_X1 fc_pe_b_peij_0_1_add_fai_4_U2 ( .A1(fc_pe_b_peij_0_1_add_notb[4]), 
        .A2(o_data1[26]), .B1(fc_pe_b_peij_0_1_add_fai_4_n5), .B2(
        fc_pe_b_peij_0_1_add_cprop[4]), .ZN(fc_pe_b_peij_0_1_add_fai_4_n4) );
  INV_X1 fc_pe_b_peij_0_1_add_fai_4_U1 ( .A(fc_pe_b_peij_0_1_add_fai_4_n4), 
        .ZN(fc_pe_b_peij_0_1_add_cprop[5]) );
  XOR2_X1 fc_pe_b_peij_0_1_add_fai_4_U4 ( .A(o_data1[26]), .B(
        fc_pe_b_peij_0_1_add_notb[4]), .Z(fc_pe_b_peij_0_1_add_fai_4_n5) );
  XOR2_X1 fc_pe_b_peij_0_1_add_fai_4_U3 ( .A(fc_pe_b_peij_0_1_add_cprop[4]), 
        .B(fc_pe_b_peij_0_1_add_fai_4_n5), .Z(fc_pe_b_peij_0_1_d_acc[4]) );
  AOI22_X1 fc_pe_b_peij_0_1_add_fai_5_U2 ( .A1(fc_pe_b_peij_0_1_add_notb[5]), 
        .A2(o_data1[27]), .B1(fc_pe_b_peij_0_1_add_fai_5_n5), .B2(
        fc_pe_b_peij_0_1_add_cprop[5]), .ZN(fc_pe_b_peij_0_1_add_fai_5_n4) );
  INV_X1 fc_pe_b_peij_0_1_add_fai_5_U1 ( .A(fc_pe_b_peij_0_1_add_fai_5_n4), 
        .ZN(fc_pe_b_peij_0_1_add_cprop[6]) );
  XOR2_X1 fc_pe_b_peij_0_1_add_fai_5_U4 ( .A(o_data1[27]), .B(
        fc_pe_b_peij_0_1_add_notb[5]), .Z(fc_pe_b_peij_0_1_add_fai_5_n5) );
  XOR2_X1 fc_pe_b_peij_0_1_add_fai_5_U3 ( .A(fc_pe_b_peij_0_1_add_cprop[5]), 
        .B(fc_pe_b_peij_0_1_add_fai_5_n5), .Z(fc_pe_b_peij_0_1_d_acc[5]) );
  AOI22_X1 fc_pe_b_peij_0_1_add_fai_6_U2 ( .A1(fc_pe_b_peij_0_1_add_notb[6]), 
        .A2(o_data1[28]), .B1(fc_pe_b_peij_0_1_add_fai_6_n5), .B2(
        fc_pe_b_peij_0_1_add_cprop[6]), .ZN(fc_pe_b_peij_0_1_add_fai_6_n4) );
  INV_X1 fc_pe_b_peij_0_1_add_fai_6_U1 ( .A(fc_pe_b_peij_0_1_add_fai_6_n4), 
        .ZN(fc_pe_b_peij_0_1_add_cprop[7]) );
  XOR2_X1 fc_pe_b_peij_0_1_add_fai_6_U4 ( .A(o_data1[28]), .B(
        fc_pe_b_peij_0_1_add_notb[6]), .Z(fc_pe_b_peij_0_1_add_fai_6_n5) );
  XOR2_X1 fc_pe_b_peij_0_1_add_fai_6_U3 ( .A(fc_pe_b_peij_0_1_add_cprop[6]), 
        .B(fc_pe_b_peij_0_1_add_fai_6_n5), .Z(fc_pe_b_peij_0_1_d_acc[6]) );
  AOI22_X1 fc_pe_b_peij_0_1_add_fai_7_U2 ( .A1(fc_pe_b_peij_0_1_add_notb[7]), 
        .A2(o_data1[29]), .B1(fc_pe_b_peij_0_1_add_fai_7_n5), .B2(
        fc_pe_b_peij_0_1_add_cprop[7]), .ZN(fc_pe_b_peij_0_1_add_fai_7_n4) );
  INV_X1 fc_pe_b_peij_0_1_add_fai_7_U1 ( .A(fc_pe_b_peij_0_1_add_fai_7_n4), 
        .ZN(fc_pe_b_peij_0_1_add_cprop[8]) );
  XOR2_X1 fc_pe_b_peij_0_1_add_fai_7_U4 ( .A(o_data1[29]), .B(
        fc_pe_b_peij_0_1_add_notb[7]), .Z(fc_pe_b_peij_0_1_add_fai_7_n5) );
  XOR2_X1 fc_pe_b_peij_0_1_add_fai_7_U3 ( .A(fc_pe_b_peij_0_1_add_cprop[7]), 
        .B(fc_pe_b_peij_0_1_add_fai_7_n5), .Z(fc_pe_b_peij_0_1_d_acc[7]) );
  AOI22_X1 fc_pe_b_peij_0_1_add_fai_8_U2 ( .A1(fc_pe_b_peij_0_1_add_notb[8]), 
        .A2(o_data1[30]), .B1(fc_pe_b_peij_0_1_add_fai_8_n5), .B2(
        fc_pe_b_peij_0_1_add_cprop[8]), .ZN(fc_pe_b_peij_0_1_add_fai_8_n4) );
  INV_X1 fc_pe_b_peij_0_1_add_fai_8_U1 ( .A(fc_pe_b_peij_0_1_add_fai_8_n4), 
        .ZN(fc_pe_b_peij_0_1_add_cprop[9]) );
  XOR2_X1 fc_pe_b_peij_0_1_add_fai_8_U4 ( .A(o_data1[30]), .B(
        fc_pe_b_peij_0_1_add_notb[8]), .Z(fc_pe_b_peij_0_1_add_fai_8_n5) );
  XOR2_X1 fc_pe_b_peij_0_1_add_fai_8_U3 ( .A(fc_pe_b_peij_0_1_add_cprop[8]), 
        .B(fc_pe_b_peij_0_1_add_fai_8_n5), .Z(fc_pe_b_peij_0_1_d_acc[8]) );
  AOI22_X1 fc_pe_b_peij_0_1_add_fai_9_U2 ( .A1(fc_pe_b_peij_0_1_add_notb[9]), 
        .A2(o_data1[31]), .B1(fc_pe_b_peij_0_1_add_fai_9_n5), .B2(
        fc_pe_b_peij_0_1_add_cprop[9]), .ZN(fc_pe_b_peij_0_1_add_fai_9_n4) );
  INV_X1 fc_pe_b_peij_0_1_add_fai_9_U1 ( .A(fc_pe_b_peij_0_1_add_fai_9_n4), 
        .ZN(fc_pe_b_peij_0_1_add_cprop[10]) );
  XOR2_X1 fc_pe_b_peij_0_1_add_fai_9_U4 ( .A(o_data1[31]), .B(
        fc_pe_b_peij_0_1_add_notb[9]), .Z(fc_pe_b_peij_0_1_add_fai_9_n5) );
  XOR2_X1 fc_pe_b_peij_0_1_add_fai_9_U3 ( .A(fc_pe_b_peij_0_1_add_cprop[9]), 
        .B(fc_pe_b_peij_0_1_add_fai_9_n5), .Z(fc_pe_b_peij_0_1_d_acc[9]) );
  AOI22_X1 fc_pe_b_peij_0_1_add_fai_10_U2 ( .A1(fc_pe_b_peij_0_1_add_notb[10]), 
        .A2(o_data1[32]), .B1(fc_pe_b_peij_0_1_add_fai_10_n5), .B2(
        fc_pe_b_peij_0_1_add_cprop[10]), .ZN(fc_pe_b_peij_0_1_add_fai_10_n4)
         );
  INV_X1 fc_pe_b_peij_0_1_add_fai_10_U1 ( .A(fc_pe_b_peij_0_1_add_fai_10_n4), 
        .ZN(fc_pe_b_peij_0_1_add_c_out) );
  XOR2_X1 fc_pe_b_peij_0_1_add_fai_10_U4 ( .A(o_data1[32]), .B(
        fc_pe_b_peij_0_1_add_notb[10]), .Z(fc_pe_b_peij_0_1_add_fai_10_n5) );
  XOR2_X1 fc_pe_b_peij_0_1_add_fai_10_U3 ( .A(fc_pe_b_peij_0_1_add_cprop[10]), 
        .B(fc_pe_b_peij_0_1_add_fai_10_n5), .Z(fc_pe_b_peij_0_1_d_acc[10]) );
  AND3_X1 fc_pe_b_peij_0_2_U22 ( .A1(fc_pe_b_int_pe_en[13]), .A2(clk), .A3(
        i_kernel1[2]), .ZN(fc_pe_b_peij_0_2_gck) );
  AND2_X1 fc_pe_b_peij_0_2_U21 ( .A1(i_data[3]), .A2(fc_pe_b_peij_0_2_n16), 
        .ZN(fc_pe_b_peij_0_2_N35) );
  AND2_X1 fc_pe_b_peij_0_2_U20 ( .A1(i_data[2]), .A2(fc_pe_b_peij_0_2_n16), 
        .ZN(fc_pe_b_peij_0_2_N34) );
  AND2_X1 fc_pe_b_peij_0_2_U19 ( .A1(i_data[1]), .A2(fc_pe_b_peij_0_2_n16), 
        .ZN(fc_pe_b_peij_0_2_N33) );
  AND2_X1 fc_pe_b_peij_0_2_U18 ( .A1(i_data[0]), .A2(fc_pe_b_peij_0_2_n16), 
        .ZN(fc_pe_b_peij_0_2_N32) );
  AND3_X1 fc_pe_b_peij_0_2_U17 ( .A1(fc_pe_b_int_pe_en[13]), .A2(
        fc_pe_b_peij_0_2_n14), .A3(i_kernel1[2]), .ZN(fc_pe_b_peij_0_2_n16) );
  INV_X1 fc_pe_b_peij_0_2_U16 ( .A(tb_rst_cnt2), .ZN(fc_pe_b_peij_0_2_n12) );
  INV_X1 fc_pe_b_peij_0_2_U14 ( .A(tb_rst_cnt1), .ZN(fc_pe_b_peij_0_2_n14) );
  SDFFR_X1 fc_pe_b_peij_0_2_q_acc_reg_10_ ( .D(1'b0), .SI(fc_pe_b_peij_0_2_n14), .SE(fc_pe_b_peij_0_2_d_acc[10]), .CK(fc_pe_b_peij_0_2_gck), .RN(
        fc_pe_b_peij_0_2_n12), .Q(o_data1[21]) );
  SDFFR_X1 fc_pe_b_peij_0_2_q_acc_reg_9_ ( .D(1'b0), .SI(fc_pe_b_peij_0_2_n14), 
        .SE(fc_pe_b_peij_0_2_d_acc[9]), .CK(fc_pe_b_peij_0_2_gck), .RN(
        fc_pe_b_peij_0_2_n12), .Q(o_data1[20]) );
  SDFFR_X1 fc_pe_b_peij_0_2_q_acc_reg_8_ ( .D(1'b0), .SI(fc_pe_b_peij_0_2_n14), 
        .SE(fc_pe_b_peij_0_2_d_acc[8]), .CK(fc_pe_b_peij_0_2_gck), .RN(
        fc_pe_b_peij_0_2_n12), .Q(o_data1[19]) );
  SDFFR_X1 fc_pe_b_peij_0_2_q_acc_reg_7_ ( .D(1'b0), .SI(fc_pe_b_peij_0_2_n14), 
        .SE(fc_pe_b_peij_0_2_d_acc[7]), .CK(fc_pe_b_peij_0_2_gck), .RN(
        fc_pe_b_peij_0_2_n12), .Q(o_data1[18]) );
  SDFFR_X1 fc_pe_b_peij_0_2_q_acc_reg_6_ ( .D(1'b0), .SI(fc_pe_b_peij_0_2_n14), 
        .SE(fc_pe_b_peij_0_2_d_acc[6]), .CK(fc_pe_b_peij_0_2_gck), .RN(
        fc_pe_b_peij_0_2_n12), .Q(o_data1[17]) );
  SDFFR_X1 fc_pe_b_peij_0_2_q_acc_reg_5_ ( .D(1'b0), .SI(fc_pe_b_peij_0_2_n14), 
        .SE(fc_pe_b_peij_0_2_d_acc[5]), .CK(fc_pe_b_peij_0_2_gck), .RN(
        fc_pe_b_peij_0_2_n12), .Q(o_data1[16]) );
  SDFFR_X1 fc_pe_b_peij_0_2_q_acc_reg_4_ ( .D(1'b0), .SI(fc_pe_b_peij_0_2_n14), 
        .SE(fc_pe_b_peij_0_2_d_acc[4]), .CK(fc_pe_b_peij_0_2_gck), .RN(
        fc_pe_b_peij_0_2_n12), .Q(o_data1[15]) );
  SDFFR_X1 fc_pe_b_peij_0_2_q_acc_reg_3_ ( .D(1'b0), .SI(fc_pe_b_peij_0_2_n14), 
        .SE(fc_pe_b_peij_0_2_d_acc[3]), .CK(fc_pe_b_peij_0_2_gck), .RN(
        fc_pe_b_peij_0_2_n12), .Q(o_data1[14]) );
  SDFFR_X1 fc_pe_b_peij_0_2_q_acc_reg_2_ ( .D(1'b0), .SI(fc_pe_b_peij_0_2_n14), 
        .SE(fc_pe_b_peij_0_2_d_acc[2]), .CK(fc_pe_b_peij_0_2_gck), .RN(
        fc_pe_b_peij_0_2_n12), .Q(o_data1[13]) );
  SDFFR_X1 fc_pe_b_peij_0_2_q_acc_reg_1_ ( .D(1'b0), .SI(fc_pe_b_peij_0_2_n14), 
        .SE(fc_pe_b_peij_0_2_d_acc[1]), .CK(fc_pe_b_peij_0_2_gck), .RN(
        fc_pe_b_peij_0_2_n12), .Q(o_data1[12]) );
  SDFFR_X1 fc_pe_b_peij_0_2_q_acc_reg_0_ ( .D(1'b0), .SI(fc_pe_b_peij_0_2_n14), 
        .SE(fc_pe_b_peij_0_2_d_acc[0]), .CK(fc_pe_b_peij_0_2_gck), .RN(
        fc_pe_b_peij_0_2_n12), .Q(o_data1[11]) );
  DFFR_X1 fc_pe_b_peij_0_2_q_im_reg_0_ ( .D(fc_pe_b_peij_0_2_N32), .CK(
        fc_pe_b_peij_0_2_gck), .RN(fc_pe_b_peij_0_2_n12), .Q(
        fc_pe_b_peij_0_2_sgnext[0]) );
  DFFR_X1 fc_pe_b_peij_0_2_q_im_reg_1_ ( .D(fc_pe_b_peij_0_2_N33), .CK(
        fc_pe_b_peij_0_2_gck), .RN(fc_pe_b_peij_0_2_n12), .Q(
        fc_pe_b_peij_0_2_sgnext[1]) );
  DFFR_X1 fc_pe_b_peij_0_2_q_im_reg_2_ ( .D(fc_pe_b_peij_0_2_N34), .CK(
        fc_pe_b_peij_0_2_gck), .RN(fc_pe_b_peij_0_2_n12), .Q(
        fc_pe_b_peij_0_2_sgnext[2]) );
  DFFR_X1 fc_pe_b_peij_0_2_q_im_reg_3_ ( .D(fc_pe_b_peij_0_2_N35), .CK(
        fc_pe_b_peij_0_2_gck), .RN(fc_pe_b_peij_0_2_n12), .Q(
        fc_pe_b_peij_0_2_sgnext_10) );
  SDFFR_X1 fc_pe_b_peij_0_2_q_k_reg ( .D(1'b0), .SI(fc_pe_b_peij_0_2_n14), 
        .SE(i_kernel1[3]), .CK(fc_pe_b_peij_0_2_gck), .RN(fc_pe_b_peij_0_2_n12), .Q(fc_pe_b_peij_0_2_q_k) );
  XOR2_X1 fc_pe_b_peij_0_2_add_U11 ( .A(fc_pe_b_peij_0_2_sgnext[0]), .B(
        fc_pe_b_peij_0_2_q_k), .Z(fc_pe_b_peij_0_2_add_notb[0]) );
  XOR2_X1 fc_pe_b_peij_0_2_add_U10 ( .A(fc_pe_b_peij_0_2_sgnext_10), .B(
        fc_pe_b_peij_0_2_q_k), .Z(fc_pe_b_peij_0_2_add_notb[10]) );
  XOR2_X1 fc_pe_b_peij_0_2_add_U9 ( .A(fc_pe_b_peij_0_2_sgnext[1]), .B(
        fc_pe_b_peij_0_2_q_k), .Z(fc_pe_b_peij_0_2_add_notb[1]) );
  XOR2_X1 fc_pe_b_peij_0_2_add_U8 ( .A(fc_pe_b_peij_0_2_sgnext[2]), .B(
        fc_pe_b_peij_0_2_q_k), .Z(fc_pe_b_peij_0_2_add_notb[2]) );
  XOR2_X1 fc_pe_b_peij_0_2_add_U7 ( .A(fc_pe_b_peij_0_2_sgnext_10), .B(
        fc_pe_b_peij_0_2_q_k), .Z(fc_pe_b_peij_0_2_add_notb[3]) );
  XOR2_X1 fc_pe_b_peij_0_2_add_U6 ( .A(fc_pe_b_peij_0_2_sgnext_10), .B(
        fc_pe_b_peij_0_2_q_k), .Z(fc_pe_b_peij_0_2_add_notb[4]) );
  XOR2_X1 fc_pe_b_peij_0_2_add_U5 ( .A(fc_pe_b_peij_0_2_sgnext_10), .B(
        fc_pe_b_peij_0_2_q_k), .Z(fc_pe_b_peij_0_2_add_notb[5]) );
  XOR2_X1 fc_pe_b_peij_0_2_add_U4 ( .A(fc_pe_b_peij_0_2_sgnext_10), .B(
        fc_pe_b_peij_0_2_q_k), .Z(fc_pe_b_peij_0_2_add_notb[6]) );
  XOR2_X1 fc_pe_b_peij_0_2_add_U3 ( .A(fc_pe_b_peij_0_2_sgnext_10), .B(
        fc_pe_b_peij_0_2_q_k), .Z(fc_pe_b_peij_0_2_add_notb[7]) );
  XOR2_X1 fc_pe_b_peij_0_2_add_U2 ( .A(fc_pe_b_peij_0_2_sgnext_10), .B(
        fc_pe_b_peij_0_2_q_k), .Z(fc_pe_b_peij_0_2_add_notb[8]) );
  XOR2_X1 fc_pe_b_peij_0_2_add_U1 ( .A(fc_pe_b_peij_0_2_sgnext_10), .B(
        fc_pe_b_peij_0_2_q_k), .Z(fc_pe_b_peij_0_2_add_notb[9]) );
  AOI22_X1 fc_pe_b_peij_0_2_add_fai_0_U2 ( .A1(fc_pe_b_peij_0_2_add_notb[0]), 
        .A2(o_data1[11]), .B1(fc_pe_b_peij_0_2_add_fai_0_n5), .B2(
        fc_pe_b_peij_0_2_q_k), .ZN(fc_pe_b_peij_0_2_add_fai_0_n4) );
  INV_X1 fc_pe_b_peij_0_2_add_fai_0_U1 ( .A(fc_pe_b_peij_0_2_add_fai_0_n4), 
        .ZN(fc_pe_b_peij_0_2_add_cprop[1]) );
  XOR2_X1 fc_pe_b_peij_0_2_add_fai_0_U4 ( .A(o_data1[11]), .B(
        fc_pe_b_peij_0_2_add_notb[0]), .Z(fc_pe_b_peij_0_2_add_fai_0_n5) );
  XOR2_X1 fc_pe_b_peij_0_2_add_fai_0_U3 ( .A(fc_pe_b_peij_0_2_q_k), .B(
        fc_pe_b_peij_0_2_add_fai_0_n5), .Z(fc_pe_b_peij_0_2_d_acc[0]) );
  AOI22_X1 fc_pe_b_peij_0_2_add_fai_1_U2 ( .A1(fc_pe_b_peij_0_2_add_notb[1]), 
        .A2(o_data1[12]), .B1(fc_pe_b_peij_0_2_add_fai_1_n5), .B2(
        fc_pe_b_peij_0_2_add_cprop[1]), .ZN(fc_pe_b_peij_0_2_add_fai_1_n4) );
  INV_X1 fc_pe_b_peij_0_2_add_fai_1_U1 ( .A(fc_pe_b_peij_0_2_add_fai_1_n4), 
        .ZN(fc_pe_b_peij_0_2_add_cprop[2]) );
  XOR2_X1 fc_pe_b_peij_0_2_add_fai_1_U4 ( .A(o_data1[12]), .B(
        fc_pe_b_peij_0_2_add_notb[1]), .Z(fc_pe_b_peij_0_2_add_fai_1_n5) );
  XOR2_X1 fc_pe_b_peij_0_2_add_fai_1_U3 ( .A(fc_pe_b_peij_0_2_add_cprop[1]), 
        .B(fc_pe_b_peij_0_2_add_fai_1_n5), .Z(fc_pe_b_peij_0_2_d_acc[1]) );
  AOI22_X1 fc_pe_b_peij_0_2_add_fai_2_U2 ( .A1(fc_pe_b_peij_0_2_add_notb[2]), 
        .A2(o_data1[13]), .B1(fc_pe_b_peij_0_2_add_fai_2_n5), .B2(
        fc_pe_b_peij_0_2_add_cprop[2]), .ZN(fc_pe_b_peij_0_2_add_fai_2_n4) );
  INV_X1 fc_pe_b_peij_0_2_add_fai_2_U1 ( .A(fc_pe_b_peij_0_2_add_fai_2_n4), 
        .ZN(fc_pe_b_peij_0_2_add_cprop[3]) );
  XOR2_X1 fc_pe_b_peij_0_2_add_fai_2_U4 ( .A(o_data1[13]), .B(
        fc_pe_b_peij_0_2_add_notb[2]), .Z(fc_pe_b_peij_0_2_add_fai_2_n5) );
  XOR2_X1 fc_pe_b_peij_0_2_add_fai_2_U3 ( .A(fc_pe_b_peij_0_2_add_cprop[2]), 
        .B(fc_pe_b_peij_0_2_add_fai_2_n5), .Z(fc_pe_b_peij_0_2_d_acc[2]) );
  AOI22_X1 fc_pe_b_peij_0_2_add_fai_3_U2 ( .A1(fc_pe_b_peij_0_2_add_notb[3]), 
        .A2(o_data1[14]), .B1(fc_pe_b_peij_0_2_add_fai_3_n5), .B2(
        fc_pe_b_peij_0_2_add_cprop[3]), .ZN(fc_pe_b_peij_0_2_add_fai_3_n4) );
  INV_X1 fc_pe_b_peij_0_2_add_fai_3_U1 ( .A(fc_pe_b_peij_0_2_add_fai_3_n4), 
        .ZN(fc_pe_b_peij_0_2_add_cprop[4]) );
  XOR2_X1 fc_pe_b_peij_0_2_add_fai_3_U4 ( .A(o_data1[14]), .B(
        fc_pe_b_peij_0_2_add_notb[3]), .Z(fc_pe_b_peij_0_2_add_fai_3_n5) );
  XOR2_X1 fc_pe_b_peij_0_2_add_fai_3_U3 ( .A(fc_pe_b_peij_0_2_add_cprop[3]), 
        .B(fc_pe_b_peij_0_2_add_fai_3_n5), .Z(fc_pe_b_peij_0_2_d_acc[3]) );
  AOI22_X1 fc_pe_b_peij_0_2_add_fai_4_U2 ( .A1(fc_pe_b_peij_0_2_add_notb[4]), 
        .A2(o_data1[15]), .B1(fc_pe_b_peij_0_2_add_fai_4_n5), .B2(
        fc_pe_b_peij_0_2_add_cprop[4]), .ZN(fc_pe_b_peij_0_2_add_fai_4_n4) );
  INV_X1 fc_pe_b_peij_0_2_add_fai_4_U1 ( .A(fc_pe_b_peij_0_2_add_fai_4_n4), 
        .ZN(fc_pe_b_peij_0_2_add_cprop[5]) );
  XOR2_X1 fc_pe_b_peij_0_2_add_fai_4_U4 ( .A(o_data1[15]), .B(
        fc_pe_b_peij_0_2_add_notb[4]), .Z(fc_pe_b_peij_0_2_add_fai_4_n5) );
  XOR2_X1 fc_pe_b_peij_0_2_add_fai_4_U3 ( .A(fc_pe_b_peij_0_2_add_cprop[4]), 
        .B(fc_pe_b_peij_0_2_add_fai_4_n5), .Z(fc_pe_b_peij_0_2_d_acc[4]) );
  AOI22_X1 fc_pe_b_peij_0_2_add_fai_5_U2 ( .A1(fc_pe_b_peij_0_2_add_notb[5]), 
        .A2(o_data1[16]), .B1(fc_pe_b_peij_0_2_add_fai_5_n5), .B2(
        fc_pe_b_peij_0_2_add_cprop[5]), .ZN(fc_pe_b_peij_0_2_add_fai_5_n4) );
  INV_X1 fc_pe_b_peij_0_2_add_fai_5_U1 ( .A(fc_pe_b_peij_0_2_add_fai_5_n4), 
        .ZN(fc_pe_b_peij_0_2_add_cprop[6]) );
  XOR2_X1 fc_pe_b_peij_0_2_add_fai_5_U4 ( .A(o_data1[16]), .B(
        fc_pe_b_peij_0_2_add_notb[5]), .Z(fc_pe_b_peij_0_2_add_fai_5_n5) );
  XOR2_X1 fc_pe_b_peij_0_2_add_fai_5_U3 ( .A(fc_pe_b_peij_0_2_add_cprop[5]), 
        .B(fc_pe_b_peij_0_2_add_fai_5_n5), .Z(fc_pe_b_peij_0_2_d_acc[5]) );
  AOI22_X1 fc_pe_b_peij_0_2_add_fai_6_U2 ( .A1(fc_pe_b_peij_0_2_add_notb[6]), 
        .A2(o_data1[17]), .B1(fc_pe_b_peij_0_2_add_fai_6_n5), .B2(
        fc_pe_b_peij_0_2_add_cprop[6]), .ZN(fc_pe_b_peij_0_2_add_fai_6_n4) );
  INV_X1 fc_pe_b_peij_0_2_add_fai_6_U1 ( .A(fc_pe_b_peij_0_2_add_fai_6_n4), 
        .ZN(fc_pe_b_peij_0_2_add_cprop[7]) );
  XOR2_X1 fc_pe_b_peij_0_2_add_fai_6_U4 ( .A(o_data1[17]), .B(
        fc_pe_b_peij_0_2_add_notb[6]), .Z(fc_pe_b_peij_0_2_add_fai_6_n5) );
  XOR2_X1 fc_pe_b_peij_0_2_add_fai_6_U3 ( .A(fc_pe_b_peij_0_2_add_cprop[6]), 
        .B(fc_pe_b_peij_0_2_add_fai_6_n5), .Z(fc_pe_b_peij_0_2_d_acc[6]) );
  AOI22_X1 fc_pe_b_peij_0_2_add_fai_7_U2 ( .A1(fc_pe_b_peij_0_2_add_notb[7]), 
        .A2(o_data1[18]), .B1(fc_pe_b_peij_0_2_add_fai_7_n5), .B2(
        fc_pe_b_peij_0_2_add_cprop[7]), .ZN(fc_pe_b_peij_0_2_add_fai_7_n4) );
  INV_X1 fc_pe_b_peij_0_2_add_fai_7_U1 ( .A(fc_pe_b_peij_0_2_add_fai_7_n4), 
        .ZN(fc_pe_b_peij_0_2_add_cprop[8]) );
  XOR2_X1 fc_pe_b_peij_0_2_add_fai_7_U4 ( .A(o_data1[18]), .B(
        fc_pe_b_peij_0_2_add_notb[7]), .Z(fc_pe_b_peij_0_2_add_fai_7_n5) );
  XOR2_X1 fc_pe_b_peij_0_2_add_fai_7_U3 ( .A(fc_pe_b_peij_0_2_add_cprop[7]), 
        .B(fc_pe_b_peij_0_2_add_fai_7_n5), .Z(fc_pe_b_peij_0_2_d_acc[7]) );
  AOI22_X1 fc_pe_b_peij_0_2_add_fai_8_U2 ( .A1(fc_pe_b_peij_0_2_add_notb[8]), 
        .A2(o_data1[19]), .B1(fc_pe_b_peij_0_2_add_fai_8_n5), .B2(
        fc_pe_b_peij_0_2_add_cprop[8]), .ZN(fc_pe_b_peij_0_2_add_fai_8_n4) );
  INV_X1 fc_pe_b_peij_0_2_add_fai_8_U1 ( .A(fc_pe_b_peij_0_2_add_fai_8_n4), 
        .ZN(fc_pe_b_peij_0_2_add_cprop[9]) );
  XOR2_X1 fc_pe_b_peij_0_2_add_fai_8_U4 ( .A(o_data1[19]), .B(
        fc_pe_b_peij_0_2_add_notb[8]), .Z(fc_pe_b_peij_0_2_add_fai_8_n5) );
  XOR2_X1 fc_pe_b_peij_0_2_add_fai_8_U3 ( .A(fc_pe_b_peij_0_2_add_cprop[8]), 
        .B(fc_pe_b_peij_0_2_add_fai_8_n5), .Z(fc_pe_b_peij_0_2_d_acc[8]) );
  AOI22_X1 fc_pe_b_peij_0_2_add_fai_9_U2 ( .A1(fc_pe_b_peij_0_2_add_notb[9]), 
        .A2(o_data1[20]), .B1(fc_pe_b_peij_0_2_add_fai_9_n5), .B2(
        fc_pe_b_peij_0_2_add_cprop[9]), .ZN(fc_pe_b_peij_0_2_add_fai_9_n4) );
  INV_X1 fc_pe_b_peij_0_2_add_fai_9_U1 ( .A(fc_pe_b_peij_0_2_add_fai_9_n4), 
        .ZN(fc_pe_b_peij_0_2_add_cprop[10]) );
  XOR2_X1 fc_pe_b_peij_0_2_add_fai_9_U4 ( .A(o_data1[20]), .B(
        fc_pe_b_peij_0_2_add_notb[9]), .Z(fc_pe_b_peij_0_2_add_fai_9_n5) );
  XOR2_X1 fc_pe_b_peij_0_2_add_fai_9_U3 ( .A(fc_pe_b_peij_0_2_add_cprop[9]), 
        .B(fc_pe_b_peij_0_2_add_fai_9_n5), .Z(fc_pe_b_peij_0_2_d_acc[9]) );
  AOI22_X1 fc_pe_b_peij_0_2_add_fai_10_U2 ( .A1(fc_pe_b_peij_0_2_add_notb[10]), 
        .A2(o_data1[21]), .B1(fc_pe_b_peij_0_2_add_fai_10_n5), .B2(
        fc_pe_b_peij_0_2_add_cprop[10]), .ZN(fc_pe_b_peij_0_2_add_fai_10_n4)
         );
  INV_X1 fc_pe_b_peij_0_2_add_fai_10_U1 ( .A(fc_pe_b_peij_0_2_add_fai_10_n4), 
        .ZN(fc_pe_b_peij_0_2_add_c_out) );
  XOR2_X1 fc_pe_b_peij_0_2_add_fai_10_U4 ( .A(o_data1[21]), .B(
        fc_pe_b_peij_0_2_add_notb[10]), .Z(fc_pe_b_peij_0_2_add_fai_10_n5) );
  XOR2_X1 fc_pe_b_peij_0_2_add_fai_10_U3 ( .A(fc_pe_b_peij_0_2_add_cprop[10]), 
        .B(fc_pe_b_peij_0_2_add_fai_10_n5), .Z(fc_pe_b_peij_0_2_d_acc[10]) );
  AND3_X1 fc_pe_b_peij_0_3_U22 ( .A1(fc_pe_b_int_pe_en[12]), .A2(clk), .A3(
        i_kernel1[0]), .ZN(fc_pe_b_peij_0_3_gck) );
  AND2_X1 fc_pe_b_peij_0_3_U21 ( .A1(i_data[3]), .A2(fc_pe_b_peij_0_3_n16), 
        .ZN(fc_pe_b_peij_0_3_N35) );
  AND2_X1 fc_pe_b_peij_0_3_U20 ( .A1(i_data[2]), .A2(fc_pe_b_peij_0_3_n16), 
        .ZN(fc_pe_b_peij_0_3_N34) );
  AND2_X1 fc_pe_b_peij_0_3_U19 ( .A1(i_data[1]), .A2(fc_pe_b_peij_0_3_n16), 
        .ZN(fc_pe_b_peij_0_3_N33) );
  AND2_X1 fc_pe_b_peij_0_3_U18 ( .A1(i_data[0]), .A2(fc_pe_b_peij_0_3_n16), 
        .ZN(fc_pe_b_peij_0_3_N32) );
  AND3_X1 fc_pe_b_peij_0_3_U17 ( .A1(fc_pe_b_int_pe_en[12]), .A2(
        fc_pe_b_peij_0_3_n14), .A3(i_kernel1[0]), .ZN(fc_pe_b_peij_0_3_n16) );
  INV_X1 fc_pe_b_peij_0_3_U16 ( .A(tb_rst_cnt2), .ZN(fc_pe_b_peij_0_3_n12) );
  INV_X1 fc_pe_b_peij_0_3_U14 ( .A(tb_rst_cnt1), .ZN(fc_pe_b_peij_0_3_n14) );
  SDFFR_X1 fc_pe_b_peij_0_3_q_acc_reg_10_ ( .D(1'b0), .SI(fc_pe_b_peij_0_3_n14), .SE(fc_pe_b_peij_0_3_d_acc[10]), .CK(fc_pe_b_peij_0_3_gck), .RN(
        fc_pe_b_peij_0_3_n12), .Q(o_data1[10]) );
  SDFFR_X1 fc_pe_b_peij_0_3_q_acc_reg_9_ ( .D(1'b0), .SI(fc_pe_b_peij_0_3_n14), 
        .SE(fc_pe_b_peij_0_3_d_acc[9]), .CK(fc_pe_b_peij_0_3_gck), .RN(
        fc_pe_b_peij_0_3_n12), .Q(o_data1[9]) );
  SDFFR_X1 fc_pe_b_peij_0_3_q_acc_reg_8_ ( .D(1'b0), .SI(fc_pe_b_peij_0_3_n14), 
        .SE(fc_pe_b_peij_0_3_d_acc[8]), .CK(fc_pe_b_peij_0_3_gck), .RN(
        fc_pe_b_peij_0_3_n12), .Q(o_data1[8]) );
  SDFFR_X1 fc_pe_b_peij_0_3_q_acc_reg_7_ ( .D(1'b0), .SI(fc_pe_b_peij_0_3_n14), 
        .SE(fc_pe_b_peij_0_3_d_acc[7]), .CK(fc_pe_b_peij_0_3_gck), .RN(
        fc_pe_b_peij_0_3_n12), .Q(o_data1[7]) );
  SDFFR_X1 fc_pe_b_peij_0_3_q_acc_reg_6_ ( .D(1'b0), .SI(fc_pe_b_peij_0_3_n14), 
        .SE(fc_pe_b_peij_0_3_d_acc[6]), .CK(fc_pe_b_peij_0_3_gck), .RN(
        fc_pe_b_peij_0_3_n12), .Q(o_data1[6]) );
  SDFFR_X1 fc_pe_b_peij_0_3_q_acc_reg_5_ ( .D(1'b0), .SI(fc_pe_b_peij_0_3_n14), 
        .SE(fc_pe_b_peij_0_3_d_acc[5]), .CK(fc_pe_b_peij_0_3_gck), .RN(
        fc_pe_b_peij_0_3_n12), .Q(o_data1[5]) );
  SDFFR_X1 fc_pe_b_peij_0_3_q_acc_reg_4_ ( .D(1'b0), .SI(fc_pe_b_peij_0_3_n14), 
        .SE(fc_pe_b_peij_0_3_d_acc[4]), .CK(fc_pe_b_peij_0_3_gck), .RN(
        fc_pe_b_peij_0_3_n12), .Q(o_data1[4]) );
  SDFFR_X1 fc_pe_b_peij_0_3_q_acc_reg_3_ ( .D(1'b0), .SI(fc_pe_b_peij_0_3_n14), 
        .SE(fc_pe_b_peij_0_3_d_acc[3]), .CK(fc_pe_b_peij_0_3_gck), .RN(
        fc_pe_b_peij_0_3_n12), .Q(o_data1[3]) );
  SDFFR_X1 fc_pe_b_peij_0_3_q_acc_reg_2_ ( .D(1'b0), .SI(fc_pe_b_peij_0_3_n14), 
        .SE(fc_pe_b_peij_0_3_d_acc[2]), .CK(fc_pe_b_peij_0_3_gck), .RN(
        fc_pe_b_peij_0_3_n12), .Q(o_data1[2]) );
  SDFFR_X1 fc_pe_b_peij_0_3_q_acc_reg_1_ ( .D(1'b0), .SI(fc_pe_b_peij_0_3_n14), 
        .SE(fc_pe_b_peij_0_3_d_acc[1]), .CK(fc_pe_b_peij_0_3_gck), .RN(
        fc_pe_b_peij_0_3_n12), .Q(o_data1[1]) );
  SDFFR_X1 fc_pe_b_peij_0_3_q_acc_reg_0_ ( .D(1'b0), .SI(fc_pe_b_peij_0_3_n14), 
        .SE(fc_pe_b_peij_0_3_d_acc[0]), .CK(fc_pe_b_peij_0_3_gck), .RN(
        fc_pe_b_peij_0_3_n12), .Q(o_data1[0]) );
  DFFR_X1 fc_pe_b_peij_0_3_q_im_reg_0_ ( .D(fc_pe_b_peij_0_3_N32), .CK(
        fc_pe_b_peij_0_3_gck), .RN(fc_pe_b_peij_0_3_n12), .Q(
        fc_pe_b_peij_0_3_sgnext[0]) );
  DFFR_X1 fc_pe_b_peij_0_3_q_im_reg_1_ ( .D(fc_pe_b_peij_0_3_N33), .CK(
        fc_pe_b_peij_0_3_gck), .RN(fc_pe_b_peij_0_3_n12), .Q(
        fc_pe_b_peij_0_3_sgnext[1]) );
  DFFR_X1 fc_pe_b_peij_0_3_q_im_reg_2_ ( .D(fc_pe_b_peij_0_3_N34), .CK(
        fc_pe_b_peij_0_3_gck), .RN(fc_pe_b_peij_0_3_n12), .Q(
        fc_pe_b_peij_0_3_sgnext[2]) );
  DFFR_X1 fc_pe_b_peij_0_3_q_im_reg_3_ ( .D(fc_pe_b_peij_0_3_N35), .CK(
        fc_pe_b_peij_0_3_gck), .RN(fc_pe_b_peij_0_3_n12), .Q(
        fc_pe_b_peij_0_3_sgnext_10) );
  SDFFR_X1 fc_pe_b_peij_0_3_q_k_reg ( .D(1'b0), .SI(fc_pe_b_peij_0_3_n14), 
        .SE(i_kernel1[1]), .CK(fc_pe_b_peij_0_3_gck), .RN(fc_pe_b_peij_0_3_n12), .Q(fc_pe_b_peij_0_3_q_k) );
  XOR2_X1 fc_pe_b_peij_0_3_add_U11 ( .A(fc_pe_b_peij_0_3_sgnext[0]), .B(
        fc_pe_b_peij_0_3_q_k), .Z(fc_pe_b_peij_0_3_add_notb[0]) );
  XOR2_X1 fc_pe_b_peij_0_3_add_U10 ( .A(fc_pe_b_peij_0_3_sgnext_10), .B(
        fc_pe_b_peij_0_3_q_k), .Z(fc_pe_b_peij_0_3_add_notb[10]) );
  XOR2_X1 fc_pe_b_peij_0_3_add_U9 ( .A(fc_pe_b_peij_0_3_sgnext[1]), .B(
        fc_pe_b_peij_0_3_q_k), .Z(fc_pe_b_peij_0_3_add_notb[1]) );
  XOR2_X1 fc_pe_b_peij_0_3_add_U8 ( .A(fc_pe_b_peij_0_3_sgnext[2]), .B(
        fc_pe_b_peij_0_3_q_k), .Z(fc_pe_b_peij_0_3_add_notb[2]) );
  XOR2_X1 fc_pe_b_peij_0_3_add_U7 ( .A(fc_pe_b_peij_0_3_sgnext_10), .B(
        fc_pe_b_peij_0_3_q_k), .Z(fc_pe_b_peij_0_3_add_notb[3]) );
  XOR2_X1 fc_pe_b_peij_0_3_add_U6 ( .A(fc_pe_b_peij_0_3_sgnext_10), .B(
        fc_pe_b_peij_0_3_q_k), .Z(fc_pe_b_peij_0_3_add_notb[4]) );
  XOR2_X1 fc_pe_b_peij_0_3_add_U5 ( .A(fc_pe_b_peij_0_3_sgnext_10), .B(
        fc_pe_b_peij_0_3_q_k), .Z(fc_pe_b_peij_0_3_add_notb[5]) );
  XOR2_X1 fc_pe_b_peij_0_3_add_U4 ( .A(fc_pe_b_peij_0_3_sgnext_10), .B(
        fc_pe_b_peij_0_3_q_k), .Z(fc_pe_b_peij_0_3_add_notb[6]) );
  XOR2_X1 fc_pe_b_peij_0_3_add_U3 ( .A(fc_pe_b_peij_0_3_sgnext_10), .B(
        fc_pe_b_peij_0_3_q_k), .Z(fc_pe_b_peij_0_3_add_notb[7]) );
  XOR2_X1 fc_pe_b_peij_0_3_add_U2 ( .A(fc_pe_b_peij_0_3_sgnext_10), .B(
        fc_pe_b_peij_0_3_q_k), .Z(fc_pe_b_peij_0_3_add_notb[8]) );
  XOR2_X1 fc_pe_b_peij_0_3_add_U1 ( .A(fc_pe_b_peij_0_3_sgnext_10), .B(
        fc_pe_b_peij_0_3_q_k), .Z(fc_pe_b_peij_0_3_add_notb[9]) );
  AOI22_X1 fc_pe_b_peij_0_3_add_fai_0_U2 ( .A1(fc_pe_b_peij_0_3_add_notb[0]), 
        .A2(o_data1[0]), .B1(fc_pe_b_peij_0_3_add_fai_0_n5), .B2(
        fc_pe_b_peij_0_3_q_k), .ZN(fc_pe_b_peij_0_3_add_fai_0_n4) );
  INV_X1 fc_pe_b_peij_0_3_add_fai_0_U1 ( .A(fc_pe_b_peij_0_3_add_fai_0_n4), 
        .ZN(fc_pe_b_peij_0_3_add_cprop[1]) );
  XOR2_X1 fc_pe_b_peij_0_3_add_fai_0_U4 ( .A(o_data1[0]), .B(
        fc_pe_b_peij_0_3_add_notb[0]), .Z(fc_pe_b_peij_0_3_add_fai_0_n5) );
  XOR2_X1 fc_pe_b_peij_0_3_add_fai_0_U3 ( .A(fc_pe_b_peij_0_3_q_k), .B(
        fc_pe_b_peij_0_3_add_fai_0_n5), .Z(fc_pe_b_peij_0_3_d_acc[0]) );
  AOI22_X1 fc_pe_b_peij_0_3_add_fai_1_U2 ( .A1(fc_pe_b_peij_0_3_add_notb[1]), 
        .A2(o_data1[1]), .B1(fc_pe_b_peij_0_3_add_fai_1_n5), .B2(
        fc_pe_b_peij_0_3_add_cprop[1]), .ZN(fc_pe_b_peij_0_3_add_fai_1_n4) );
  INV_X1 fc_pe_b_peij_0_3_add_fai_1_U1 ( .A(fc_pe_b_peij_0_3_add_fai_1_n4), 
        .ZN(fc_pe_b_peij_0_3_add_cprop[2]) );
  XOR2_X1 fc_pe_b_peij_0_3_add_fai_1_U4 ( .A(o_data1[1]), .B(
        fc_pe_b_peij_0_3_add_notb[1]), .Z(fc_pe_b_peij_0_3_add_fai_1_n5) );
  XOR2_X1 fc_pe_b_peij_0_3_add_fai_1_U3 ( .A(fc_pe_b_peij_0_3_add_cprop[1]), 
        .B(fc_pe_b_peij_0_3_add_fai_1_n5), .Z(fc_pe_b_peij_0_3_d_acc[1]) );
  AOI22_X1 fc_pe_b_peij_0_3_add_fai_2_U2 ( .A1(fc_pe_b_peij_0_3_add_notb[2]), 
        .A2(o_data1[2]), .B1(fc_pe_b_peij_0_3_add_fai_2_n5), .B2(
        fc_pe_b_peij_0_3_add_cprop[2]), .ZN(fc_pe_b_peij_0_3_add_fai_2_n4) );
  INV_X1 fc_pe_b_peij_0_3_add_fai_2_U1 ( .A(fc_pe_b_peij_0_3_add_fai_2_n4), 
        .ZN(fc_pe_b_peij_0_3_add_cprop[3]) );
  XOR2_X1 fc_pe_b_peij_0_3_add_fai_2_U4 ( .A(o_data1[2]), .B(
        fc_pe_b_peij_0_3_add_notb[2]), .Z(fc_pe_b_peij_0_3_add_fai_2_n5) );
  XOR2_X1 fc_pe_b_peij_0_3_add_fai_2_U3 ( .A(fc_pe_b_peij_0_3_add_cprop[2]), 
        .B(fc_pe_b_peij_0_3_add_fai_2_n5), .Z(fc_pe_b_peij_0_3_d_acc[2]) );
  AOI22_X1 fc_pe_b_peij_0_3_add_fai_3_U2 ( .A1(fc_pe_b_peij_0_3_add_notb[3]), 
        .A2(o_data1[3]), .B1(fc_pe_b_peij_0_3_add_fai_3_n5), .B2(
        fc_pe_b_peij_0_3_add_cprop[3]), .ZN(fc_pe_b_peij_0_3_add_fai_3_n4) );
  INV_X1 fc_pe_b_peij_0_3_add_fai_3_U1 ( .A(fc_pe_b_peij_0_3_add_fai_3_n4), 
        .ZN(fc_pe_b_peij_0_3_add_cprop[4]) );
  XOR2_X1 fc_pe_b_peij_0_3_add_fai_3_U4 ( .A(o_data1[3]), .B(
        fc_pe_b_peij_0_3_add_notb[3]), .Z(fc_pe_b_peij_0_3_add_fai_3_n5) );
  XOR2_X1 fc_pe_b_peij_0_3_add_fai_3_U3 ( .A(fc_pe_b_peij_0_3_add_cprop[3]), 
        .B(fc_pe_b_peij_0_3_add_fai_3_n5), .Z(fc_pe_b_peij_0_3_d_acc[3]) );
  AOI22_X1 fc_pe_b_peij_0_3_add_fai_4_U2 ( .A1(fc_pe_b_peij_0_3_add_notb[4]), 
        .A2(o_data1[4]), .B1(fc_pe_b_peij_0_3_add_fai_4_n5), .B2(
        fc_pe_b_peij_0_3_add_cprop[4]), .ZN(fc_pe_b_peij_0_3_add_fai_4_n4) );
  INV_X1 fc_pe_b_peij_0_3_add_fai_4_U1 ( .A(fc_pe_b_peij_0_3_add_fai_4_n4), 
        .ZN(fc_pe_b_peij_0_3_add_cprop[5]) );
  XOR2_X1 fc_pe_b_peij_0_3_add_fai_4_U4 ( .A(o_data1[4]), .B(
        fc_pe_b_peij_0_3_add_notb[4]), .Z(fc_pe_b_peij_0_3_add_fai_4_n5) );
  XOR2_X1 fc_pe_b_peij_0_3_add_fai_4_U3 ( .A(fc_pe_b_peij_0_3_add_cprop[4]), 
        .B(fc_pe_b_peij_0_3_add_fai_4_n5), .Z(fc_pe_b_peij_0_3_d_acc[4]) );
  AOI22_X1 fc_pe_b_peij_0_3_add_fai_5_U2 ( .A1(fc_pe_b_peij_0_3_add_notb[5]), 
        .A2(o_data1[5]), .B1(fc_pe_b_peij_0_3_add_fai_5_n5), .B2(
        fc_pe_b_peij_0_3_add_cprop[5]), .ZN(fc_pe_b_peij_0_3_add_fai_5_n4) );
  INV_X1 fc_pe_b_peij_0_3_add_fai_5_U1 ( .A(fc_pe_b_peij_0_3_add_fai_5_n4), 
        .ZN(fc_pe_b_peij_0_3_add_cprop[6]) );
  XOR2_X1 fc_pe_b_peij_0_3_add_fai_5_U4 ( .A(o_data1[5]), .B(
        fc_pe_b_peij_0_3_add_notb[5]), .Z(fc_pe_b_peij_0_3_add_fai_5_n5) );
  XOR2_X1 fc_pe_b_peij_0_3_add_fai_5_U3 ( .A(fc_pe_b_peij_0_3_add_cprop[5]), 
        .B(fc_pe_b_peij_0_3_add_fai_5_n5), .Z(fc_pe_b_peij_0_3_d_acc[5]) );
  AOI22_X1 fc_pe_b_peij_0_3_add_fai_6_U2 ( .A1(fc_pe_b_peij_0_3_add_notb[6]), 
        .A2(o_data1[6]), .B1(fc_pe_b_peij_0_3_add_fai_6_n5), .B2(
        fc_pe_b_peij_0_3_add_cprop[6]), .ZN(fc_pe_b_peij_0_3_add_fai_6_n4) );
  INV_X1 fc_pe_b_peij_0_3_add_fai_6_U1 ( .A(fc_pe_b_peij_0_3_add_fai_6_n4), 
        .ZN(fc_pe_b_peij_0_3_add_cprop[7]) );
  XOR2_X1 fc_pe_b_peij_0_3_add_fai_6_U4 ( .A(o_data1[6]), .B(
        fc_pe_b_peij_0_3_add_notb[6]), .Z(fc_pe_b_peij_0_3_add_fai_6_n5) );
  XOR2_X1 fc_pe_b_peij_0_3_add_fai_6_U3 ( .A(fc_pe_b_peij_0_3_add_cprop[6]), 
        .B(fc_pe_b_peij_0_3_add_fai_6_n5), .Z(fc_pe_b_peij_0_3_d_acc[6]) );
  AOI22_X1 fc_pe_b_peij_0_3_add_fai_7_U2 ( .A1(fc_pe_b_peij_0_3_add_notb[7]), 
        .A2(o_data1[7]), .B1(fc_pe_b_peij_0_3_add_fai_7_n5), .B2(
        fc_pe_b_peij_0_3_add_cprop[7]), .ZN(fc_pe_b_peij_0_3_add_fai_7_n4) );
  INV_X1 fc_pe_b_peij_0_3_add_fai_7_U1 ( .A(fc_pe_b_peij_0_3_add_fai_7_n4), 
        .ZN(fc_pe_b_peij_0_3_add_cprop[8]) );
  XOR2_X1 fc_pe_b_peij_0_3_add_fai_7_U4 ( .A(o_data1[7]), .B(
        fc_pe_b_peij_0_3_add_notb[7]), .Z(fc_pe_b_peij_0_3_add_fai_7_n5) );
  XOR2_X1 fc_pe_b_peij_0_3_add_fai_7_U3 ( .A(fc_pe_b_peij_0_3_add_cprop[7]), 
        .B(fc_pe_b_peij_0_3_add_fai_7_n5), .Z(fc_pe_b_peij_0_3_d_acc[7]) );
  AOI22_X1 fc_pe_b_peij_0_3_add_fai_8_U2 ( .A1(fc_pe_b_peij_0_3_add_notb[8]), 
        .A2(o_data1[8]), .B1(fc_pe_b_peij_0_3_add_fai_8_n5), .B2(
        fc_pe_b_peij_0_3_add_cprop[8]), .ZN(fc_pe_b_peij_0_3_add_fai_8_n4) );
  INV_X1 fc_pe_b_peij_0_3_add_fai_8_U1 ( .A(fc_pe_b_peij_0_3_add_fai_8_n4), 
        .ZN(fc_pe_b_peij_0_3_add_cprop[9]) );
  XOR2_X1 fc_pe_b_peij_0_3_add_fai_8_U4 ( .A(o_data1[8]), .B(
        fc_pe_b_peij_0_3_add_notb[8]), .Z(fc_pe_b_peij_0_3_add_fai_8_n5) );
  XOR2_X1 fc_pe_b_peij_0_3_add_fai_8_U3 ( .A(fc_pe_b_peij_0_3_add_cprop[8]), 
        .B(fc_pe_b_peij_0_3_add_fai_8_n5), .Z(fc_pe_b_peij_0_3_d_acc[8]) );
  AOI22_X1 fc_pe_b_peij_0_3_add_fai_9_U2 ( .A1(fc_pe_b_peij_0_3_add_notb[9]), 
        .A2(o_data1[9]), .B1(fc_pe_b_peij_0_3_add_fai_9_n5), .B2(
        fc_pe_b_peij_0_3_add_cprop[9]), .ZN(fc_pe_b_peij_0_3_add_fai_9_n4) );
  INV_X1 fc_pe_b_peij_0_3_add_fai_9_U1 ( .A(fc_pe_b_peij_0_3_add_fai_9_n4), 
        .ZN(fc_pe_b_peij_0_3_add_cprop[10]) );
  XOR2_X1 fc_pe_b_peij_0_3_add_fai_9_U4 ( .A(o_data1[9]), .B(
        fc_pe_b_peij_0_3_add_notb[9]), .Z(fc_pe_b_peij_0_3_add_fai_9_n5) );
  XOR2_X1 fc_pe_b_peij_0_3_add_fai_9_U3 ( .A(fc_pe_b_peij_0_3_add_cprop[9]), 
        .B(fc_pe_b_peij_0_3_add_fai_9_n5), .Z(fc_pe_b_peij_0_3_d_acc[9]) );
  AOI22_X1 fc_pe_b_peij_0_3_add_fai_10_U2 ( .A1(fc_pe_b_peij_0_3_add_notb[10]), 
        .A2(o_data1[10]), .B1(fc_pe_b_peij_0_3_add_fai_10_n5), .B2(
        fc_pe_b_peij_0_3_add_cprop[10]), .ZN(fc_pe_b_peij_0_3_add_fai_10_n4)
         );
  INV_X1 fc_pe_b_peij_0_3_add_fai_10_U1 ( .A(fc_pe_b_peij_0_3_add_fai_10_n4), 
        .ZN(fc_pe_b_peij_0_3_add_c_out) );
  XOR2_X1 fc_pe_b_peij_0_3_add_fai_10_U4 ( .A(o_data1[10]), .B(
        fc_pe_b_peij_0_3_add_notb[10]), .Z(fc_pe_b_peij_0_3_add_fai_10_n5) );
  XOR2_X1 fc_pe_b_peij_0_3_add_fai_10_U3 ( .A(fc_pe_b_peij_0_3_add_cprop[10]), 
        .B(fc_pe_b_peij_0_3_add_fai_10_n5), .Z(fc_pe_b_peij_0_3_d_acc[10]) );
  AND3_X1 fc_pe_b_peij_1_0_U22 ( .A1(fc_pe_b_int_pe_en[11]), .A2(clk), .A3(
        i_kernel2[6]), .ZN(fc_pe_b_peij_1_0_gck) );
  AND2_X1 fc_pe_b_peij_1_0_U21 ( .A1(i_data[3]), .A2(fc_pe_b_peij_1_0_n16), 
        .ZN(fc_pe_b_peij_1_0_N35) );
  AND2_X1 fc_pe_b_peij_1_0_U20 ( .A1(i_data[2]), .A2(fc_pe_b_peij_1_0_n16), 
        .ZN(fc_pe_b_peij_1_0_N34) );
  AND2_X1 fc_pe_b_peij_1_0_U19 ( .A1(i_data[1]), .A2(fc_pe_b_peij_1_0_n16), 
        .ZN(fc_pe_b_peij_1_0_N33) );
  AND2_X1 fc_pe_b_peij_1_0_U18 ( .A1(i_data[0]), .A2(fc_pe_b_peij_1_0_n16), 
        .ZN(fc_pe_b_peij_1_0_N32) );
  AND3_X1 fc_pe_b_peij_1_0_U17 ( .A1(fc_pe_b_int_pe_en[11]), .A2(
        fc_pe_b_peij_1_0_n14), .A3(i_kernel2[6]), .ZN(fc_pe_b_peij_1_0_n16) );
  INV_X1 fc_pe_b_peij_1_0_U16 ( .A(tb_rst_cnt2), .ZN(fc_pe_b_peij_1_0_n12) );
  INV_X1 fc_pe_b_peij_1_0_U14 ( .A(tb_rst_cnt1), .ZN(fc_pe_b_peij_1_0_n14) );
  SDFFR_X1 fc_pe_b_peij_1_0_q_acc_reg_10_ ( .D(1'b0), .SI(fc_pe_b_peij_1_0_n14), .SE(fc_pe_b_peij_1_0_d_acc[10]), .CK(fc_pe_b_peij_1_0_gck), .RN(
        fc_pe_b_peij_1_0_n12), .Q(o_data2[43]) );
  SDFFR_X1 fc_pe_b_peij_1_0_q_acc_reg_9_ ( .D(1'b0), .SI(fc_pe_b_peij_1_0_n14), 
        .SE(fc_pe_b_peij_1_0_d_acc[9]), .CK(fc_pe_b_peij_1_0_gck), .RN(
        fc_pe_b_peij_1_0_n12), .Q(o_data2[42]) );
  SDFFR_X1 fc_pe_b_peij_1_0_q_acc_reg_8_ ( .D(1'b0), .SI(fc_pe_b_peij_1_0_n14), 
        .SE(fc_pe_b_peij_1_0_d_acc[8]), .CK(fc_pe_b_peij_1_0_gck), .RN(
        fc_pe_b_peij_1_0_n12), .Q(o_data2[41]) );
  SDFFR_X1 fc_pe_b_peij_1_0_q_acc_reg_7_ ( .D(1'b0), .SI(fc_pe_b_peij_1_0_n14), 
        .SE(fc_pe_b_peij_1_0_d_acc[7]), .CK(fc_pe_b_peij_1_0_gck), .RN(
        fc_pe_b_peij_1_0_n12), .Q(o_data2[40]) );
  SDFFR_X1 fc_pe_b_peij_1_0_q_acc_reg_6_ ( .D(1'b0), .SI(fc_pe_b_peij_1_0_n14), 
        .SE(fc_pe_b_peij_1_0_d_acc[6]), .CK(fc_pe_b_peij_1_0_gck), .RN(
        fc_pe_b_peij_1_0_n12), .Q(o_data2[39]) );
  SDFFR_X1 fc_pe_b_peij_1_0_q_acc_reg_5_ ( .D(1'b0), .SI(fc_pe_b_peij_1_0_n14), 
        .SE(fc_pe_b_peij_1_0_d_acc[5]), .CK(fc_pe_b_peij_1_0_gck), .RN(
        fc_pe_b_peij_1_0_n12), .Q(o_data2[38]) );
  SDFFR_X1 fc_pe_b_peij_1_0_q_acc_reg_4_ ( .D(1'b0), .SI(fc_pe_b_peij_1_0_n14), 
        .SE(fc_pe_b_peij_1_0_d_acc[4]), .CK(fc_pe_b_peij_1_0_gck), .RN(
        fc_pe_b_peij_1_0_n12), .Q(o_data2[37]) );
  SDFFR_X1 fc_pe_b_peij_1_0_q_acc_reg_3_ ( .D(1'b0), .SI(fc_pe_b_peij_1_0_n14), 
        .SE(fc_pe_b_peij_1_0_d_acc[3]), .CK(fc_pe_b_peij_1_0_gck), .RN(
        fc_pe_b_peij_1_0_n12), .Q(o_data2[36]) );
  SDFFR_X1 fc_pe_b_peij_1_0_q_acc_reg_2_ ( .D(1'b0), .SI(fc_pe_b_peij_1_0_n14), 
        .SE(fc_pe_b_peij_1_0_d_acc[2]), .CK(fc_pe_b_peij_1_0_gck), .RN(
        fc_pe_b_peij_1_0_n12), .Q(o_data2[35]) );
  SDFFR_X1 fc_pe_b_peij_1_0_q_acc_reg_1_ ( .D(1'b0), .SI(fc_pe_b_peij_1_0_n14), 
        .SE(fc_pe_b_peij_1_0_d_acc[1]), .CK(fc_pe_b_peij_1_0_gck), .RN(
        fc_pe_b_peij_1_0_n12), .Q(o_data2[34]) );
  SDFFR_X1 fc_pe_b_peij_1_0_q_acc_reg_0_ ( .D(1'b0), .SI(fc_pe_b_peij_1_0_n14), 
        .SE(fc_pe_b_peij_1_0_d_acc[0]), .CK(fc_pe_b_peij_1_0_gck), .RN(
        fc_pe_b_peij_1_0_n12), .Q(o_data2[33]) );
  DFFR_X1 fc_pe_b_peij_1_0_q_im_reg_0_ ( .D(fc_pe_b_peij_1_0_N32), .CK(
        fc_pe_b_peij_1_0_gck), .RN(fc_pe_b_peij_1_0_n12), .Q(
        fc_pe_b_peij_1_0_sgnext[0]) );
  DFFR_X1 fc_pe_b_peij_1_0_q_im_reg_1_ ( .D(fc_pe_b_peij_1_0_N33), .CK(
        fc_pe_b_peij_1_0_gck), .RN(fc_pe_b_peij_1_0_n12), .Q(
        fc_pe_b_peij_1_0_sgnext[1]) );
  DFFR_X1 fc_pe_b_peij_1_0_q_im_reg_2_ ( .D(fc_pe_b_peij_1_0_N34), .CK(
        fc_pe_b_peij_1_0_gck), .RN(fc_pe_b_peij_1_0_n12), .Q(
        fc_pe_b_peij_1_0_sgnext[2]) );
  DFFR_X1 fc_pe_b_peij_1_0_q_im_reg_3_ ( .D(fc_pe_b_peij_1_0_N35), .CK(
        fc_pe_b_peij_1_0_gck), .RN(fc_pe_b_peij_1_0_n12), .Q(
        fc_pe_b_peij_1_0_sgnext_10) );
  SDFFR_X1 fc_pe_b_peij_1_0_q_k_reg ( .D(1'b0), .SI(fc_pe_b_peij_1_0_n14), 
        .SE(i_kernel2[7]), .CK(fc_pe_b_peij_1_0_gck), .RN(fc_pe_b_peij_1_0_n12), .Q(fc_pe_b_peij_1_0_q_k) );
  XOR2_X1 fc_pe_b_peij_1_0_add_U11 ( .A(fc_pe_b_peij_1_0_sgnext[0]), .B(
        fc_pe_b_peij_1_0_q_k), .Z(fc_pe_b_peij_1_0_add_notb[0]) );
  XOR2_X1 fc_pe_b_peij_1_0_add_U10 ( .A(fc_pe_b_peij_1_0_sgnext_10), .B(
        fc_pe_b_peij_1_0_q_k), .Z(fc_pe_b_peij_1_0_add_notb[10]) );
  XOR2_X1 fc_pe_b_peij_1_0_add_U9 ( .A(fc_pe_b_peij_1_0_sgnext[1]), .B(
        fc_pe_b_peij_1_0_q_k), .Z(fc_pe_b_peij_1_0_add_notb[1]) );
  XOR2_X1 fc_pe_b_peij_1_0_add_U8 ( .A(fc_pe_b_peij_1_0_sgnext[2]), .B(
        fc_pe_b_peij_1_0_q_k), .Z(fc_pe_b_peij_1_0_add_notb[2]) );
  XOR2_X1 fc_pe_b_peij_1_0_add_U7 ( .A(fc_pe_b_peij_1_0_sgnext_10), .B(
        fc_pe_b_peij_1_0_q_k), .Z(fc_pe_b_peij_1_0_add_notb[3]) );
  XOR2_X1 fc_pe_b_peij_1_0_add_U6 ( .A(fc_pe_b_peij_1_0_sgnext_10), .B(
        fc_pe_b_peij_1_0_q_k), .Z(fc_pe_b_peij_1_0_add_notb[4]) );
  XOR2_X1 fc_pe_b_peij_1_0_add_U5 ( .A(fc_pe_b_peij_1_0_sgnext_10), .B(
        fc_pe_b_peij_1_0_q_k), .Z(fc_pe_b_peij_1_0_add_notb[5]) );
  XOR2_X1 fc_pe_b_peij_1_0_add_U4 ( .A(fc_pe_b_peij_1_0_sgnext_10), .B(
        fc_pe_b_peij_1_0_q_k), .Z(fc_pe_b_peij_1_0_add_notb[6]) );
  XOR2_X1 fc_pe_b_peij_1_0_add_U3 ( .A(fc_pe_b_peij_1_0_sgnext_10), .B(
        fc_pe_b_peij_1_0_q_k), .Z(fc_pe_b_peij_1_0_add_notb[7]) );
  XOR2_X1 fc_pe_b_peij_1_0_add_U2 ( .A(fc_pe_b_peij_1_0_sgnext_10), .B(
        fc_pe_b_peij_1_0_q_k), .Z(fc_pe_b_peij_1_0_add_notb[8]) );
  XOR2_X1 fc_pe_b_peij_1_0_add_U1 ( .A(fc_pe_b_peij_1_0_sgnext_10), .B(
        fc_pe_b_peij_1_0_q_k), .Z(fc_pe_b_peij_1_0_add_notb[9]) );
  AOI22_X1 fc_pe_b_peij_1_0_add_fai_0_U2 ( .A1(fc_pe_b_peij_1_0_add_notb[0]), 
        .A2(o_data2[33]), .B1(fc_pe_b_peij_1_0_add_fai_0_n5), .B2(
        fc_pe_b_peij_1_0_q_k), .ZN(fc_pe_b_peij_1_0_add_fai_0_n4) );
  INV_X1 fc_pe_b_peij_1_0_add_fai_0_U1 ( .A(fc_pe_b_peij_1_0_add_fai_0_n4), 
        .ZN(fc_pe_b_peij_1_0_add_cprop[1]) );
  XOR2_X1 fc_pe_b_peij_1_0_add_fai_0_U4 ( .A(o_data2[33]), .B(
        fc_pe_b_peij_1_0_add_notb[0]), .Z(fc_pe_b_peij_1_0_add_fai_0_n5) );
  XOR2_X1 fc_pe_b_peij_1_0_add_fai_0_U3 ( .A(fc_pe_b_peij_1_0_q_k), .B(
        fc_pe_b_peij_1_0_add_fai_0_n5), .Z(fc_pe_b_peij_1_0_d_acc[0]) );
  AOI22_X1 fc_pe_b_peij_1_0_add_fai_1_U2 ( .A1(fc_pe_b_peij_1_0_add_notb[1]), 
        .A2(o_data2[34]), .B1(fc_pe_b_peij_1_0_add_fai_1_n5), .B2(
        fc_pe_b_peij_1_0_add_cprop[1]), .ZN(fc_pe_b_peij_1_0_add_fai_1_n4) );
  INV_X1 fc_pe_b_peij_1_0_add_fai_1_U1 ( .A(fc_pe_b_peij_1_0_add_fai_1_n4), 
        .ZN(fc_pe_b_peij_1_0_add_cprop[2]) );
  XOR2_X1 fc_pe_b_peij_1_0_add_fai_1_U4 ( .A(o_data2[34]), .B(
        fc_pe_b_peij_1_0_add_notb[1]), .Z(fc_pe_b_peij_1_0_add_fai_1_n5) );
  XOR2_X1 fc_pe_b_peij_1_0_add_fai_1_U3 ( .A(fc_pe_b_peij_1_0_add_cprop[1]), 
        .B(fc_pe_b_peij_1_0_add_fai_1_n5), .Z(fc_pe_b_peij_1_0_d_acc[1]) );
  AOI22_X1 fc_pe_b_peij_1_0_add_fai_2_U2 ( .A1(fc_pe_b_peij_1_0_add_notb[2]), 
        .A2(o_data2[35]), .B1(fc_pe_b_peij_1_0_add_fai_2_n5), .B2(
        fc_pe_b_peij_1_0_add_cprop[2]), .ZN(fc_pe_b_peij_1_0_add_fai_2_n4) );
  INV_X1 fc_pe_b_peij_1_0_add_fai_2_U1 ( .A(fc_pe_b_peij_1_0_add_fai_2_n4), 
        .ZN(fc_pe_b_peij_1_0_add_cprop[3]) );
  XOR2_X1 fc_pe_b_peij_1_0_add_fai_2_U4 ( .A(o_data2[35]), .B(
        fc_pe_b_peij_1_0_add_notb[2]), .Z(fc_pe_b_peij_1_0_add_fai_2_n5) );
  XOR2_X1 fc_pe_b_peij_1_0_add_fai_2_U3 ( .A(fc_pe_b_peij_1_0_add_cprop[2]), 
        .B(fc_pe_b_peij_1_0_add_fai_2_n5), .Z(fc_pe_b_peij_1_0_d_acc[2]) );
  AOI22_X1 fc_pe_b_peij_1_0_add_fai_3_U2 ( .A1(fc_pe_b_peij_1_0_add_notb[3]), 
        .A2(o_data2[36]), .B1(fc_pe_b_peij_1_0_add_fai_3_n5), .B2(
        fc_pe_b_peij_1_0_add_cprop[3]), .ZN(fc_pe_b_peij_1_0_add_fai_3_n4) );
  INV_X1 fc_pe_b_peij_1_0_add_fai_3_U1 ( .A(fc_pe_b_peij_1_0_add_fai_3_n4), 
        .ZN(fc_pe_b_peij_1_0_add_cprop[4]) );
  XOR2_X1 fc_pe_b_peij_1_0_add_fai_3_U4 ( .A(o_data2[36]), .B(
        fc_pe_b_peij_1_0_add_notb[3]), .Z(fc_pe_b_peij_1_0_add_fai_3_n5) );
  XOR2_X1 fc_pe_b_peij_1_0_add_fai_3_U3 ( .A(fc_pe_b_peij_1_0_add_cprop[3]), 
        .B(fc_pe_b_peij_1_0_add_fai_3_n5), .Z(fc_pe_b_peij_1_0_d_acc[3]) );
  AOI22_X1 fc_pe_b_peij_1_0_add_fai_4_U2 ( .A1(fc_pe_b_peij_1_0_add_notb[4]), 
        .A2(o_data2[37]), .B1(fc_pe_b_peij_1_0_add_fai_4_n5), .B2(
        fc_pe_b_peij_1_0_add_cprop[4]), .ZN(fc_pe_b_peij_1_0_add_fai_4_n4) );
  INV_X1 fc_pe_b_peij_1_0_add_fai_4_U1 ( .A(fc_pe_b_peij_1_0_add_fai_4_n4), 
        .ZN(fc_pe_b_peij_1_0_add_cprop[5]) );
  XOR2_X1 fc_pe_b_peij_1_0_add_fai_4_U4 ( .A(o_data2[37]), .B(
        fc_pe_b_peij_1_0_add_notb[4]), .Z(fc_pe_b_peij_1_0_add_fai_4_n5) );
  XOR2_X1 fc_pe_b_peij_1_0_add_fai_4_U3 ( .A(fc_pe_b_peij_1_0_add_cprop[4]), 
        .B(fc_pe_b_peij_1_0_add_fai_4_n5), .Z(fc_pe_b_peij_1_0_d_acc[4]) );
  AOI22_X1 fc_pe_b_peij_1_0_add_fai_5_U2 ( .A1(fc_pe_b_peij_1_0_add_notb[5]), 
        .A2(o_data2[38]), .B1(fc_pe_b_peij_1_0_add_fai_5_n5), .B2(
        fc_pe_b_peij_1_0_add_cprop[5]), .ZN(fc_pe_b_peij_1_0_add_fai_5_n4) );
  INV_X1 fc_pe_b_peij_1_0_add_fai_5_U1 ( .A(fc_pe_b_peij_1_0_add_fai_5_n4), 
        .ZN(fc_pe_b_peij_1_0_add_cprop[6]) );
  XOR2_X1 fc_pe_b_peij_1_0_add_fai_5_U4 ( .A(o_data2[38]), .B(
        fc_pe_b_peij_1_0_add_notb[5]), .Z(fc_pe_b_peij_1_0_add_fai_5_n5) );
  XOR2_X1 fc_pe_b_peij_1_0_add_fai_5_U3 ( .A(fc_pe_b_peij_1_0_add_cprop[5]), 
        .B(fc_pe_b_peij_1_0_add_fai_5_n5), .Z(fc_pe_b_peij_1_0_d_acc[5]) );
  AOI22_X1 fc_pe_b_peij_1_0_add_fai_6_U2 ( .A1(fc_pe_b_peij_1_0_add_notb[6]), 
        .A2(o_data2[39]), .B1(fc_pe_b_peij_1_0_add_fai_6_n5), .B2(
        fc_pe_b_peij_1_0_add_cprop[6]), .ZN(fc_pe_b_peij_1_0_add_fai_6_n4) );
  INV_X1 fc_pe_b_peij_1_0_add_fai_6_U1 ( .A(fc_pe_b_peij_1_0_add_fai_6_n4), 
        .ZN(fc_pe_b_peij_1_0_add_cprop[7]) );
  XOR2_X1 fc_pe_b_peij_1_0_add_fai_6_U4 ( .A(o_data2[39]), .B(
        fc_pe_b_peij_1_0_add_notb[6]), .Z(fc_pe_b_peij_1_0_add_fai_6_n5) );
  XOR2_X1 fc_pe_b_peij_1_0_add_fai_6_U3 ( .A(fc_pe_b_peij_1_0_add_cprop[6]), 
        .B(fc_pe_b_peij_1_0_add_fai_6_n5), .Z(fc_pe_b_peij_1_0_d_acc[6]) );
  AOI22_X1 fc_pe_b_peij_1_0_add_fai_7_U2 ( .A1(fc_pe_b_peij_1_0_add_notb[7]), 
        .A2(o_data2[40]), .B1(fc_pe_b_peij_1_0_add_fai_7_n5), .B2(
        fc_pe_b_peij_1_0_add_cprop[7]), .ZN(fc_pe_b_peij_1_0_add_fai_7_n4) );
  INV_X1 fc_pe_b_peij_1_0_add_fai_7_U1 ( .A(fc_pe_b_peij_1_0_add_fai_7_n4), 
        .ZN(fc_pe_b_peij_1_0_add_cprop[8]) );
  XOR2_X1 fc_pe_b_peij_1_0_add_fai_7_U4 ( .A(o_data2[40]), .B(
        fc_pe_b_peij_1_0_add_notb[7]), .Z(fc_pe_b_peij_1_0_add_fai_7_n5) );
  XOR2_X1 fc_pe_b_peij_1_0_add_fai_7_U3 ( .A(fc_pe_b_peij_1_0_add_cprop[7]), 
        .B(fc_pe_b_peij_1_0_add_fai_7_n5), .Z(fc_pe_b_peij_1_0_d_acc[7]) );
  AOI22_X1 fc_pe_b_peij_1_0_add_fai_8_U2 ( .A1(fc_pe_b_peij_1_0_add_notb[8]), 
        .A2(o_data2[41]), .B1(fc_pe_b_peij_1_0_add_fai_8_n5), .B2(
        fc_pe_b_peij_1_0_add_cprop[8]), .ZN(fc_pe_b_peij_1_0_add_fai_8_n4) );
  INV_X1 fc_pe_b_peij_1_0_add_fai_8_U1 ( .A(fc_pe_b_peij_1_0_add_fai_8_n4), 
        .ZN(fc_pe_b_peij_1_0_add_cprop[9]) );
  XOR2_X1 fc_pe_b_peij_1_0_add_fai_8_U4 ( .A(o_data2[41]), .B(
        fc_pe_b_peij_1_0_add_notb[8]), .Z(fc_pe_b_peij_1_0_add_fai_8_n5) );
  XOR2_X1 fc_pe_b_peij_1_0_add_fai_8_U3 ( .A(fc_pe_b_peij_1_0_add_cprop[8]), 
        .B(fc_pe_b_peij_1_0_add_fai_8_n5), .Z(fc_pe_b_peij_1_0_d_acc[8]) );
  AOI22_X1 fc_pe_b_peij_1_0_add_fai_9_U2 ( .A1(fc_pe_b_peij_1_0_add_notb[9]), 
        .A2(o_data2[42]), .B1(fc_pe_b_peij_1_0_add_fai_9_n5), .B2(
        fc_pe_b_peij_1_0_add_cprop[9]), .ZN(fc_pe_b_peij_1_0_add_fai_9_n4) );
  INV_X1 fc_pe_b_peij_1_0_add_fai_9_U1 ( .A(fc_pe_b_peij_1_0_add_fai_9_n4), 
        .ZN(fc_pe_b_peij_1_0_add_cprop[10]) );
  XOR2_X1 fc_pe_b_peij_1_0_add_fai_9_U4 ( .A(o_data2[42]), .B(
        fc_pe_b_peij_1_0_add_notb[9]), .Z(fc_pe_b_peij_1_0_add_fai_9_n5) );
  XOR2_X1 fc_pe_b_peij_1_0_add_fai_9_U3 ( .A(fc_pe_b_peij_1_0_add_cprop[9]), 
        .B(fc_pe_b_peij_1_0_add_fai_9_n5), .Z(fc_pe_b_peij_1_0_d_acc[9]) );
  AOI22_X1 fc_pe_b_peij_1_0_add_fai_10_U2 ( .A1(fc_pe_b_peij_1_0_add_notb[10]), 
        .A2(o_data2[43]), .B1(fc_pe_b_peij_1_0_add_fai_10_n5), .B2(
        fc_pe_b_peij_1_0_add_cprop[10]), .ZN(fc_pe_b_peij_1_0_add_fai_10_n4)
         );
  INV_X1 fc_pe_b_peij_1_0_add_fai_10_U1 ( .A(fc_pe_b_peij_1_0_add_fai_10_n4), 
        .ZN(fc_pe_b_peij_1_0_add_c_out) );
  XOR2_X1 fc_pe_b_peij_1_0_add_fai_10_U4 ( .A(o_data2[43]), .B(
        fc_pe_b_peij_1_0_add_notb[10]), .Z(fc_pe_b_peij_1_0_add_fai_10_n5) );
  XOR2_X1 fc_pe_b_peij_1_0_add_fai_10_U3 ( .A(fc_pe_b_peij_1_0_add_cprop[10]), 
        .B(fc_pe_b_peij_1_0_add_fai_10_n5), .Z(fc_pe_b_peij_1_0_d_acc[10]) );
  AND3_X1 fc_pe_b_peij_1_1_U22 ( .A1(fc_pe_b_int_pe_en[10]), .A2(clk), .A3(
        i_kernel2[4]), .ZN(fc_pe_b_peij_1_1_gck) );
  AND2_X1 fc_pe_b_peij_1_1_U21 ( .A1(i_data[3]), .A2(fc_pe_b_peij_1_1_n16), 
        .ZN(fc_pe_b_peij_1_1_N35) );
  AND2_X1 fc_pe_b_peij_1_1_U20 ( .A1(i_data[2]), .A2(fc_pe_b_peij_1_1_n16), 
        .ZN(fc_pe_b_peij_1_1_N34) );
  AND2_X1 fc_pe_b_peij_1_1_U19 ( .A1(i_data[1]), .A2(fc_pe_b_peij_1_1_n16), 
        .ZN(fc_pe_b_peij_1_1_N33) );
  AND2_X1 fc_pe_b_peij_1_1_U18 ( .A1(i_data[0]), .A2(fc_pe_b_peij_1_1_n16), 
        .ZN(fc_pe_b_peij_1_1_N32) );
  AND3_X1 fc_pe_b_peij_1_1_U17 ( .A1(fc_pe_b_int_pe_en[10]), .A2(
        fc_pe_b_peij_1_1_n14), .A3(i_kernel2[4]), .ZN(fc_pe_b_peij_1_1_n16) );
  INV_X1 fc_pe_b_peij_1_1_U16 ( .A(tb_rst_cnt2), .ZN(fc_pe_b_peij_1_1_n12) );
  INV_X1 fc_pe_b_peij_1_1_U14 ( .A(tb_rst_cnt1), .ZN(fc_pe_b_peij_1_1_n14) );
  SDFFR_X1 fc_pe_b_peij_1_1_q_acc_reg_10_ ( .D(1'b0), .SI(fc_pe_b_peij_1_1_n14), .SE(fc_pe_b_peij_1_1_d_acc[10]), .CK(fc_pe_b_peij_1_1_gck), .RN(
        fc_pe_b_peij_1_1_n12), .Q(o_data2[32]) );
  SDFFR_X1 fc_pe_b_peij_1_1_q_acc_reg_9_ ( .D(1'b0), .SI(fc_pe_b_peij_1_1_n14), 
        .SE(fc_pe_b_peij_1_1_d_acc[9]), .CK(fc_pe_b_peij_1_1_gck), .RN(
        fc_pe_b_peij_1_1_n12), .Q(o_data2[31]) );
  SDFFR_X1 fc_pe_b_peij_1_1_q_acc_reg_8_ ( .D(1'b0), .SI(fc_pe_b_peij_1_1_n14), 
        .SE(fc_pe_b_peij_1_1_d_acc[8]), .CK(fc_pe_b_peij_1_1_gck), .RN(
        fc_pe_b_peij_1_1_n12), .Q(o_data2[30]) );
  SDFFR_X1 fc_pe_b_peij_1_1_q_acc_reg_7_ ( .D(1'b0), .SI(fc_pe_b_peij_1_1_n14), 
        .SE(fc_pe_b_peij_1_1_d_acc[7]), .CK(fc_pe_b_peij_1_1_gck), .RN(
        fc_pe_b_peij_1_1_n12), .Q(o_data2[29]) );
  SDFFR_X1 fc_pe_b_peij_1_1_q_acc_reg_6_ ( .D(1'b0), .SI(fc_pe_b_peij_1_1_n14), 
        .SE(fc_pe_b_peij_1_1_d_acc[6]), .CK(fc_pe_b_peij_1_1_gck), .RN(
        fc_pe_b_peij_1_1_n12), .Q(o_data2[28]) );
  SDFFR_X1 fc_pe_b_peij_1_1_q_acc_reg_5_ ( .D(1'b0), .SI(fc_pe_b_peij_1_1_n14), 
        .SE(fc_pe_b_peij_1_1_d_acc[5]), .CK(fc_pe_b_peij_1_1_gck), .RN(
        fc_pe_b_peij_1_1_n12), .Q(o_data2[27]) );
  SDFFR_X1 fc_pe_b_peij_1_1_q_acc_reg_4_ ( .D(1'b0), .SI(fc_pe_b_peij_1_1_n14), 
        .SE(fc_pe_b_peij_1_1_d_acc[4]), .CK(fc_pe_b_peij_1_1_gck), .RN(
        fc_pe_b_peij_1_1_n12), .Q(o_data2[26]) );
  SDFFR_X1 fc_pe_b_peij_1_1_q_acc_reg_3_ ( .D(1'b0), .SI(fc_pe_b_peij_1_1_n14), 
        .SE(fc_pe_b_peij_1_1_d_acc[3]), .CK(fc_pe_b_peij_1_1_gck), .RN(
        fc_pe_b_peij_1_1_n12), .Q(o_data2[25]) );
  SDFFR_X1 fc_pe_b_peij_1_1_q_acc_reg_2_ ( .D(1'b0), .SI(fc_pe_b_peij_1_1_n14), 
        .SE(fc_pe_b_peij_1_1_d_acc[2]), .CK(fc_pe_b_peij_1_1_gck), .RN(
        fc_pe_b_peij_1_1_n12), .Q(o_data2[24]) );
  SDFFR_X1 fc_pe_b_peij_1_1_q_acc_reg_1_ ( .D(1'b0), .SI(fc_pe_b_peij_1_1_n14), 
        .SE(fc_pe_b_peij_1_1_d_acc[1]), .CK(fc_pe_b_peij_1_1_gck), .RN(
        fc_pe_b_peij_1_1_n12), .Q(o_data2[23]) );
  SDFFR_X1 fc_pe_b_peij_1_1_q_acc_reg_0_ ( .D(1'b0), .SI(fc_pe_b_peij_1_1_n14), 
        .SE(fc_pe_b_peij_1_1_d_acc[0]), .CK(fc_pe_b_peij_1_1_gck), .RN(
        fc_pe_b_peij_1_1_n12), .Q(o_data2[22]) );
  DFFR_X1 fc_pe_b_peij_1_1_q_im_reg_0_ ( .D(fc_pe_b_peij_1_1_N32), .CK(
        fc_pe_b_peij_1_1_gck), .RN(fc_pe_b_peij_1_1_n12), .Q(
        fc_pe_b_peij_1_1_sgnext[0]) );
  DFFR_X1 fc_pe_b_peij_1_1_q_im_reg_1_ ( .D(fc_pe_b_peij_1_1_N33), .CK(
        fc_pe_b_peij_1_1_gck), .RN(fc_pe_b_peij_1_1_n12), .Q(
        fc_pe_b_peij_1_1_sgnext[1]) );
  DFFR_X1 fc_pe_b_peij_1_1_q_im_reg_2_ ( .D(fc_pe_b_peij_1_1_N34), .CK(
        fc_pe_b_peij_1_1_gck), .RN(fc_pe_b_peij_1_1_n12), .Q(
        fc_pe_b_peij_1_1_sgnext[2]) );
  DFFR_X1 fc_pe_b_peij_1_1_q_im_reg_3_ ( .D(fc_pe_b_peij_1_1_N35), .CK(
        fc_pe_b_peij_1_1_gck), .RN(fc_pe_b_peij_1_1_n12), .Q(
        fc_pe_b_peij_1_1_sgnext_10) );
  SDFFR_X1 fc_pe_b_peij_1_1_q_k_reg ( .D(1'b0), .SI(fc_pe_b_peij_1_1_n14), 
        .SE(i_kernel2[5]), .CK(fc_pe_b_peij_1_1_gck), .RN(fc_pe_b_peij_1_1_n12), .Q(fc_pe_b_peij_1_1_q_k) );
  XOR2_X1 fc_pe_b_peij_1_1_add_U11 ( .A(fc_pe_b_peij_1_1_sgnext[0]), .B(
        fc_pe_b_peij_1_1_q_k), .Z(fc_pe_b_peij_1_1_add_notb[0]) );
  XOR2_X1 fc_pe_b_peij_1_1_add_U10 ( .A(fc_pe_b_peij_1_1_sgnext_10), .B(
        fc_pe_b_peij_1_1_q_k), .Z(fc_pe_b_peij_1_1_add_notb[10]) );
  XOR2_X1 fc_pe_b_peij_1_1_add_U9 ( .A(fc_pe_b_peij_1_1_sgnext[1]), .B(
        fc_pe_b_peij_1_1_q_k), .Z(fc_pe_b_peij_1_1_add_notb[1]) );
  XOR2_X1 fc_pe_b_peij_1_1_add_U8 ( .A(fc_pe_b_peij_1_1_sgnext[2]), .B(
        fc_pe_b_peij_1_1_q_k), .Z(fc_pe_b_peij_1_1_add_notb[2]) );
  XOR2_X1 fc_pe_b_peij_1_1_add_U7 ( .A(fc_pe_b_peij_1_1_sgnext_10), .B(
        fc_pe_b_peij_1_1_q_k), .Z(fc_pe_b_peij_1_1_add_notb[3]) );
  XOR2_X1 fc_pe_b_peij_1_1_add_U6 ( .A(fc_pe_b_peij_1_1_sgnext_10), .B(
        fc_pe_b_peij_1_1_q_k), .Z(fc_pe_b_peij_1_1_add_notb[4]) );
  XOR2_X1 fc_pe_b_peij_1_1_add_U5 ( .A(fc_pe_b_peij_1_1_sgnext_10), .B(
        fc_pe_b_peij_1_1_q_k), .Z(fc_pe_b_peij_1_1_add_notb[5]) );
  XOR2_X1 fc_pe_b_peij_1_1_add_U4 ( .A(fc_pe_b_peij_1_1_sgnext_10), .B(
        fc_pe_b_peij_1_1_q_k), .Z(fc_pe_b_peij_1_1_add_notb[6]) );
  XOR2_X1 fc_pe_b_peij_1_1_add_U3 ( .A(fc_pe_b_peij_1_1_sgnext_10), .B(
        fc_pe_b_peij_1_1_q_k), .Z(fc_pe_b_peij_1_1_add_notb[7]) );
  XOR2_X1 fc_pe_b_peij_1_1_add_U2 ( .A(fc_pe_b_peij_1_1_sgnext_10), .B(
        fc_pe_b_peij_1_1_q_k), .Z(fc_pe_b_peij_1_1_add_notb[8]) );
  XOR2_X1 fc_pe_b_peij_1_1_add_U1 ( .A(fc_pe_b_peij_1_1_sgnext_10), .B(
        fc_pe_b_peij_1_1_q_k), .Z(fc_pe_b_peij_1_1_add_notb[9]) );
  AOI22_X1 fc_pe_b_peij_1_1_add_fai_0_U2 ( .A1(fc_pe_b_peij_1_1_add_notb[0]), 
        .A2(o_data2[22]), .B1(fc_pe_b_peij_1_1_add_fai_0_n5), .B2(
        fc_pe_b_peij_1_1_q_k), .ZN(fc_pe_b_peij_1_1_add_fai_0_n4) );
  INV_X1 fc_pe_b_peij_1_1_add_fai_0_U1 ( .A(fc_pe_b_peij_1_1_add_fai_0_n4), 
        .ZN(fc_pe_b_peij_1_1_add_cprop[1]) );
  XOR2_X1 fc_pe_b_peij_1_1_add_fai_0_U4 ( .A(o_data2[22]), .B(
        fc_pe_b_peij_1_1_add_notb[0]), .Z(fc_pe_b_peij_1_1_add_fai_0_n5) );
  XOR2_X1 fc_pe_b_peij_1_1_add_fai_0_U3 ( .A(fc_pe_b_peij_1_1_q_k), .B(
        fc_pe_b_peij_1_1_add_fai_0_n5), .Z(fc_pe_b_peij_1_1_d_acc[0]) );
  AOI22_X1 fc_pe_b_peij_1_1_add_fai_1_U2 ( .A1(fc_pe_b_peij_1_1_add_notb[1]), 
        .A2(o_data2[23]), .B1(fc_pe_b_peij_1_1_add_fai_1_n5), .B2(
        fc_pe_b_peij_1_1_add_cprop[1]), .ZN(fc_pe_b_peij_1_1_add_fai_1_n4) );
  INV_X1 fc_pe_b_peij_1_1_add_fai_1_U1 ( .A(fc_pe_b_peij_1_1_add_fai_1_n4), 
        .ZN(fc_pe_b_peij_1_1_add_cprop[2]) );
  XOR2_X1 fc_pe_b_peij_1_1_add_fai_1_U4 ( .A(o_data2[23]), .B(
        fc_pe_b_peij_1_1_add_notb[1]), .Z(fc_pe_b_peij_1_1_add_fai_1_n5) );
  XOR2_X1 fc_pe_b_peij_1_1_add_fai_1_U3 ( .A(fc_pe_b_peij_1_1_add_cprop[1]), 
        .B(fc_pe_b_peij_1_1_add_fai_1_n5), .Z(fc_pe_b_peij_1_1_d_acc[1]) );
  AOI22_X1 fc_pe_b_peij_1_1_add_fai_2_U2 ( .A1(fc_pe_b_peij_1_1_add_notb[2]), 
        .A2(o_data2[24]), .B1(fc_pe_b_peij_1_1_add_fai_2_n5), .B2(
        fc_pe_b_peij_1_1_add_cprop[2]), .ZN(fc_pe_b_peij_1_1_add_fai_2_n4) );
  INV_X1 fc_pe_b_peij_1_1_add_fai_2_U1 ( .A(fc_pe_b_peij_1_1_add_fai_2_n4), 
        .ZN(fc_pe_b_peij_1_1_add_cprop[3]) );
  XOR2_X1 fc_pe_b_peij_1_1_add_fai_2_U4 ( .A(o_data2[24]), .B(
        fc_pe_b_peij_1_1_add_notb[2]), .Z(fc_pe_b_peij_1_1_add_fai_2_n5) );
  XOR2_X1 fc_pe_b_peij_1_1_add_fai_2_U3 ( .A(fc_pe_b_peij_1_1_add_cprop[2]), 
        .B(fc_pe_b_peij_1_1_add_fai_2_n5), .Z(fc_pe_b_peij_1_1_d_acc[2]) );
  AOI22_X1 fc_pe_b_peij_1_1_add_fai_3_U2 ( .A1(fc_pe_b_peij_1_1_add_notb[3]), 
        .A2(o_data2[25]), .B1(fc_pe_b_peij_1_1_add_fai_3_n5), .B2(
        fc_pe_b_peij_1_1_add_cprop[3]), .ZN(fc_pe_b_peij_1_1_add_fai_3_n4) );
  INV_X1 fc_pe_b_peij_1_1_add_fai_3_U1 ( .A(fc_pe_b_peij_1_1_add_fai_3_n4), 
        .ZN(fc_pe_b_peij_1_1_add_cprop[4]) );
  XOR2_X1 fc_pe_b_peij_1_1_add_fai_3_U4 ( .A(o_data2[25]), .B(
        fc_pe_b_peij_1_1_add_notb[3]), .Z(fc_pe_b_peij_1_1_add_fai_3_n5) );
  XOR2_X1 fc_pe_b_peij_1_1_add_fai_3_U3 ( .A(fc_pe_b_peij_1_1_add_cprop[3]), 
        .B(fc_pe_b_peij_1_1_add_fai_3_n5), .Z(fc_pe_b_peij_1_1_d_acc[3]) );
  AOI22_X1 fc_pe_b_peij_1_1_add_fai_4_U2 ( .A1(fc_pe_b_peij_1_1_add_notb[4]), 
        .A2(o_data2[26]), .B1(fc_pe_b_peij_1_1_add_fai_4_n5), .B2(
        fc_pe_b_peij_1_1_add_cprop[4]), .ZN(fc_pe_b_peij_1_1_add_fai_4_n4) );
  INV_X1 fc_pe_b_peij_1_1_add_fai_4_U1 ( .A(fc_pe_b_peij_1_1_add_fai_4_n4), 
        .ZN(fc_pe_b_peij_1_1_add_cprop[5]) );
  XOR2_X1 fc_pe_b_peij_1_1_add_fai_4_U4 ( .A(o_data2[26]), .B(
        fc_pe_b_peij_1_1_add_notb[4]), .Z(fc_pe_b_peij_1_1_add_fai_4_n5) );
  XOR2_X1 fc_pe_b_peij_1_1_add_fai_4_U3 ( .A(fc_pe_b_peij_1_1_add_cprop[4]), 
        .B(fc_pe_b_peij_1_1_add_fai_4_n5), .Z(fc_pe_b_peij_1_1_d_acc[4]) );
  AOI22_X1 fc_pe_b_peij_1_1_add_fai_5_U2 ( .A1(fc_pe_b_peij_1_1_add_notb[5]), 
        .A2(o_data2[27]), .B1(fc_pe_b_peij_1_1_add_fai_5_n5), .B2(
        fc_pe_b_peij_1_1_add_cprop[5]), .ZN(fc_pe_b_peij_1_1_add_fai_5_n4) );
  INV_X1 fc_pe_b_peij_1_1_add_fai_5_U1 ( .A(fc_pe_b_peij_1_1_add_fai_5_n4), 
        .ZN(fc_pe_b_peij_1_1_add_cprop[6]) );
  XOR2_X1 fc_pe_b_peij_1_1_add_fai_5_U4 ( .A(o_data2[27]), .B(
        fc_pe_b_peij_1_1_add_notb[5]), .Z(fc_pe_b_peij_1_1_add_fai_5_n5) );
  XOR2_X1 fc_pe_b_peij_1_1_add_fai_5_U3 ( .A(fc_pe_b_peij_1_1_add_cprop[5]), 
        .B(fc_pe_b_peij_1_1_add_fai_5_n5), .Z(fc_pe_b_peij_1_1_d_acc[5]) );
  AOI22_X1 fc_pe_b_peij_1_1_add_fai_6_U2 ( .A1(fc_pe_b_peij_1_1_add_notb[6]), 
        .A2(o_data2[28]), .B1(fc_pe_b_peij_1_1_add_fai_6_n5), .B2(
        fc_pe_b_peij_1_1_add_cprop[6]), .ZN(fc_pe_b_peij_1_1_add_fai_6_n4) );
  INV_X1 fc_pe_b_peij_1_1_add_fai_6_U1 ( .A(fc_pe_b_peij_1_1_add_fai_6_n4), 
        .ZN(fc_pe_b_peij_1_1_add_cprop[7]) );
  XOR2_X1 fc_pe_b_peij_1_1_add_fai_6_U4 ( .A(o_data2[28]), .B(
        fc_pe_b_peij_1_1_add_notb[6]), .Z(fc_pe_b_peij_1_1_add_fai_6_n5) );
  XOR2_X1 fc_pe_b_peij_1_1_add_fai_6_U3 ( .A(fc_pe_b_peij_1_1_add_cprop[6]), 
        .B(fc_pe_b_peij_1_1_add_fai_6_n5), .Z(fc_pe_b_peij_1_1_d_acc[6]) );
  AOI22_X1 fc_pe_b_peij_1_1_add_fai_7_U2 ( .A1(fc_pe_b_peij_1_1_add_notb[7]), 
        .A2(o_data2[29]), .B1(fc_pe_b_peij_1_1_add_fai_7_n5), .B2(
        fc_pe_b_peij_1_1_add_cprop[7]), .ZN(fc_pe_b_peij_1_1_add_fai_7_n4) );
  INV_X1 fc_pe_b_peij_1_1_add_fai_7_U1 ( .A(fc_pe_b_peij_1_1_add_fai_7_n4), 
        .ZN(fc_pe_b_peij_1_1_add_cprop[8]) );
  XOR2_X1 fc_pe_b_peij_1_1_add_fai_7_U4 ( .A(o_data2[29]), .B(
        fc_pe_b_peij_1_1_add_notb[7]), .Z(fc_pe_b_peij_1_1_add_fai_7_n5) );
  XOR2_X1 fc_pe_b_peij_1_1_add_fai_7_U3 ( .A(fc_pe_b_peij_1_1_add_cprop[7]), 
        .B(fc_pe_b_peij_1_1_add_fai_7_n5), .Z(fc_pe_b_peij_1_1_d_acc[7]) );
  AOI22_X1 fc_pe_b_peij_1_1_add_fai_8_U2 ( .A1(fc_pe_b_peij_1_1_add_notb[8]), 
        .A2(o_data2[30]), .B1(fc_pe_b_peij_1_1_add_fai_8_n5), .B2(
        fc_pe_b_peij_1_1_add_cprop[8]), .ZN(fc_pe_b_peij_1_1_add_fai_8_n4) );
  INV_X1 fc_pe_b_peij_1_1_add_fai_8_U1 ( .A(fc_pe_b_peij_1_1_add_fai_8_n4), 
        .ZN(fc_pe_b_peij_1_1_add_cprop[9]) );
  XOR2_X1 fc_pe_b_peij_1_1_add_fai_8_U4 ( .A(o_data2[30]), .B(
        fc_pe_b_peij_1_1_add_notb[8]), .Z(fc_pe_b_peij_1_1_add_fai_8_n5) );
  XOR2_X1 fc_pe_b_peij_1_1_add_fai_8_U3 ( .A(fc_pe_b_peij_1_1_add_cprop[8]), 
        .B(fc_pe_b_peij_1_1_add_fai_8_n5), .Z(fc_pe_b_peij_1_1_d_acc[8]) );
  AOI22_X1 fc_pe_b_peij_1_1_add_fai_9_U2 ( .A1(fc_pe_b_peij_1_1_add_notb[9]), 
        .A2(o_data2[31]), .B1(fc_pe_b_peij_1_1_add_fai_9_n5), .B2(
        fc_pe_b_peij_1_1_add_cprop[9]), .ZN(fc_pe_b_peij_1_1_add_fai_9_n4) );
  INV_X1 fc_pe_b_peij_1_1_add_fai_9_U1 ( .A(fc_pe_b_peij_1_1_add_fai_9_n4), 
        .ZN(fc_pe_b_peij_1_1_add_cprop[10]) );
  XOR2_X1 fc_pe_b_peij_1_1_add_fai_9_U4 ( .A(o_data2[31]), .B(
        fc_pe_b_peij_1_1_add_notb[9]), .Z(fc_pe_b_peij_1_1_add_fai_9_n5) );
  XOR2_X1 fc_pe_b_peij_1_1_add_fai_9_U3 ( .A(fc_pe_b_peij_1_1_add_cprop[9]), 
        .B(fc_pe_b_peij_1_1_add_fai_9_n5), .Z(fc_pe_b_peij_1_1_d_acc[9]) );
  AOI22_X1 fc_pe_b_peij_1_1_add_fai_10_U2 ( .A1(fc_pe_b_peij_1_1_add_notb[10]), 
        .A2(o_data2[32]), .B1(fc_pe_b_peij_1_1_add_fai_10_n5), .B2(
        fc_pe_b_peij_1_1_add_cprop[10]), .ZN(fc_pe_b_peij_1_1_add_fai_10_n4)
         );
  INV_X1 fc_pe_b_peij_1_1_add_fai_10_U1 ( .A(fc_pe_b_peij_1_1_add_fai_10_n4), 
        .ZN(fc_pe_b_peij_1_1_add_c_out) );
  XOR2_X1 fc_pe_b_peij_1_1_add_fai_10_U4 ( .A(o_data2[32]), .B(
        fc_pe_b_peij_1_1_add_notb[10]), .Z(fc_pe_b_peij_1_1_add_fai_10_n5) );
  XOR2_X1 fc_pe_b_peij_1_1_add_fai_10_U3 ( .A(fc_pe_b_peij_1_1_add_cprop[10]), 
        .B(fc_pe_b_peij_1_1_add_fai_10_n5), .Z(fc_pe_b_peij_1_1_d_acc[10]) );
  AND3_X1 fc_pe_b_peij_1_2_U22 ( .A1(fc_pe_b_int_pe_en[9]), .A2(clk), .A3(
        i_kernel2[2]), .ZN(fc_pe_b_peij_1_2_gck) );
  AND2_X1 fc_pe_b_peij_1_2_U21 ( .A1(i_data[3]), .A2(fc_pe_b_peij_1_2_n16), 
        .ZN(fc_pe_b_peij_1_2_N35) );
  AND2_X1 fc_pe_b_peij_1_2_U20 ( .A1(i_data[2]), .A2(fc_pe_b_peij_1_2_n16), 
        .ZN(fc_pe_b_peij_1_2_N34) );
  AND2_X1 fc_pe_b_peij_1_2_U19 ( .A1(i_data[1]), .A2(fc_pe_b_peij_1_2_n16), 
        .ZN(fc_pe_b_peij_1_2_N33) );
  AND2_X1 fc_pe_b_peij_1_2_U18 ( .A1(i_data[0]), .A2(fc_pe_b_peij_1_2_n16), 
        .ZN(fc_pe_b_peij_1_2_N32) );
  AND3_X1 fc_pe_b_peij_1_2_U17 ( .A1(fc_pe_b_int_pe_en[9]), .A2(
        fc_pe_b_peij_1_2_n14), .A3(i_kernel2[2]), .ZN(fc_pe_b_peij_1_2_n16) );
  INV_X1 fc_pe_b_peij_1_2_U16 ( .A(tb_rst_cnt2), .ZN(fc_pe_b_peij_1_2_n12) );
  INV_X1 fc_pe_b_peij_1_2_U14 ( .A(tb_rst_cnt1), .ZN(fc_pe_b_peij_1_2_n14) );
  SDFFR_X1 fc_pe_b_peij_1_2_q_acc_reg_10_ ( .D(1'b0), .SI(fc_pe_b_peij_1_2_n14), .SE(fc_pe_b_peij_1_2_d_acc[10]), .CK(fc_pe_b_peij_1_2_gck), .RN(
        fc_pe_b_peij_1_2_n12), .Q(o_data2[21]) );
  SDFFR_X1 fc_pe_b_peij_1_2_q_acc_reg_9_ ( .D(1'b0), .SI(fc_pe_b_peij_1_2_n14), 
        .SE(fc_pe_b_peij_1_2_d_acc[9]), .CK(fc_pe_b_peij_1_2_gck), .RN(
        fc_pe_b_peij_1_2_n12), .Q(o_data2[20]) );
  SDFFR_X1 fc_pe_b_peij_1_2_q_acc_reg_8_ ( .D(1'b0), .SI(fc_pe_b_peij_1_2_n14), 
        .SE(fc_pe_b_peij_1_2_d_acc[8]), .CK(fc_pe_b_peij_1_2_gck), .RN(
        fc_pe_b_peij_1_2_n12), .Q(o_data2[19]) );
  SDFFR_X1 fc_pe_b_peij_1_2_q_acc_reg_7_ ( .D(1'b0), .SI(fc_pe_b_peij_1_2_n14), 
        .SE(fc_pe_b_peij_1_2_d_acc[7]), .CK(fc_pe_b_peij_1_2_gck), .RN(
        fc_pe_b_peij_1_2_n12), .Q(o_data2[18]) );
  SDFFR_X1 fc_pe_b_peij_1_2_q_acc_reg_6_ ( .D(1'b0), .SI(fc_pe_b_peij_1_2_n14), 
        .SE(fc_pe_b_peij_1_2_d_acc[6]), .CK(fc_pe_b_peij_1_2_gck), .RN(
        fc_pe_b_peij_1_2_n12), .Q(o_data2[17]) );
  SDFFR_X1 fc_pe_b_peij_1_2_q_acc_reg_5_ ( .D(1'b0), .SI(fc_pe_b_peij_1_2_n14), 
        .SE(fc_pe_b_peij_1_2_d_acc[5]), .CK(fc_pe_b_peij_1_2_gck), .RN(
        fc_pe_b_peij_1_2_n12), .Q(o_data2[16]) );
  SDFFR_X1 fc_pe_b_peij_1_2_q_acc_reg_4_ ( .D(1'b0), .SI(fc_pe_b_peij_1_2_n14), 
        .SE(fc_pe_b_peij_1_2_d_acc[4]), .CK(fc_pe_b_peij_1_2_gck), .RN(
        fc_pe_b_peij_1_2_n12), .Q(o_data2[15]) );
  SDFFR_X1 fc_pe_b_peij_1_2_q_acc_reg_3_ ( .D(1'b0), .SI(fc_pe_b_peij_1_2_n14), 
        .SE(fc_pe_b_peij_1_2_d_acc[3]), .CK(fc_pe_b_peij_1_2_gck), .RN(
        fc_pe_b_peij_1_2_n12), .Q(o_data2[14]) );
  SDFFR_X1 fc_pe_b_peij_1_2_q_acc_reg_2_ ( .D(1'b0), .SI(fc_pe_b_peij_1_2_n14), 
        .SE(fc_pe_b_peij_1_2_d_acc[2]), .CK(fc_pe_b_peij_1_2_gck), .RN(
        fc_pe_b_peij_1_2_n12), .Q(o_data2[13]) );
  SDFFR_X1 fc_pe_b_peij_1_2_q_acc_reg_1_ ( .D(1'b0), .SI(fc_pe_b_peij_1_2_n14), 
        .SE(fc_pe_b_peij_1_2_d_acc[1]), .CK(fc_pe_b_peij_1_2_gck), .RN(
        fc_pe_b_peij_1_2_n12), .Q(o_data2[12]) );
  SDFFR_X1 fc_pe_b_peij_1_2_q_acc_reg_0_ ( .D(1'b0), .SI(fc_pe_b_peij_1_2_n14), 
        .SE(fc_pe_b_peij_1_2_d_acc[0]), .CK(fc_pe_b_peij_1_2_gck), .RN(
        fc_pe_b_peij_1_2_n12), .Q(o_data2[11]) );
  DFFR_X1 fc_pe_b_peij_1_2_q_im_reg_0_ ( .D(fc_pe_b_peij_1_2_N32), .CK(
        fc_pe_b_peij_1_2_gck), .RN(fc_pe_b_peij_1_2_n12), .Q(
        fc_pe_b_peij_1_2_sgnext[0]) );
  DFFR_X1 fc_pe_b_peij_1_2_q_im_reg_1_ ( .D(fc_pe_b_peij_1_2_N33), .CK(
        fc_pe_b_peij_1_2_gck), .RN(fc_pe_b_peij_1_2_n12), .Q(
        fc_pe_b_peij_1_2_sgnext[1]) );
  DFFR_X1 fc_pe_b_peij_1_2_q_im_reg_2_ ( .D(fc_pe_b_peij_1_2_N34), .CK(
        fc_pe_b_peij_1_2_gck), .RN(fc_pe_b_peij_1_2_n12), .Q(
        fc_pe_b_peij_1_2_sgnext[2]) );
  DFFR_X1 fc_pe_b_peij_1_2_q_im_reg_3_ ( .D(fc_pe_b_peij_1_2_N35), .CK(
        fc_pe_b_peij_1_2_gck), .RN(fc_pe_b_peij_1_2_n12), .Q(
        fc_pe_b_peij_1_2_sgnext_10) );
  SDFFR_X1 fc_pe_b_peij_1_2_q_k_reg ( .D(1'b0), .SI(fc_pe_b_peij_1_2_n14), 
        .SE(i_kernel2[3]), .CK(fc_pe_b_peij_1_2_gck), .RN(fc_pe_b_peij_1_2_n12), .Q(fc_pe_b_peij_1_2_q_k) );
  XOR2_X1 fc_pe_b_peij_1_2_add_U11 ( .A(fc_pe_b_peij_1_2_sgnext[0]), .B(
        fc_pe_b_peij_1_2_q_k), .Z(fc_pe_b_peij_1_2_add_notb[0]) );
  XOR2_X1 fc_pe_b_peij_1_2_add_U10 ( .A(fc_pe_b_peij_1_2_sgnext_10), .B(
        fc_pe_b_peij_1_2_q_k), .Z(fc_pe_b_peij_1_2_add_notb[10]) );
  XOR2_X1 fc_pe_b_peij_1_2_add_U9 ( .A(fc_pe_b_peij_1_2_sgnext[1]), .B(
        fc_pe_b_peij_1_2_q_k), .Z(fc_pe_b_peij_1_2_add_notb[1]) );
  XOR2_X1 fc_pe_b_peij_1_2_add_U8 ( .A(fc_pe_b_peij_1_2_sgnext[2]), .B(
        fc_pe_b_peij_1_2_q_k), .Z(fc_pe_b_peij_1_2_add_notb[2]) );
  XOR2_X1 fc_pe_b_peij_1_2_add_U7 ( .A(fc_pe_b_peij_1_2_sgnext_10), .B(
        fc_pe_b_peij_1_2_q_k), .Z(fc_pe_b_peij_1_2_add_notb[3]) );
  XOR2_X1 fc_pe_b_peij_1_2_add_U6 ( .A(fc_pe_b_peij_1_2_sgnext_10), .B(
        fc_pe_b_peij_1_2_q_k), .Z(fc_pe_b_peij_1_2_add_notb[4]) );
  XOR2_X1 fc_pe_b_peij_1_2_add_U5 ( .A(fc_pe_b_peij_1_2_sgnext_10), .B(
        fc_pe_b_peij_1_2_q_k), .Z(fc_pe_b_peij_1_2_add_notb[5]) );
  XOR2_X1 fc_pe_b_peij_1_2_add_U4 ( .A(fc_pe_b_peij_1_2_sgnext_10), .B(
        fc_pe_b_peij_1_2_q_k), .Z(fc_pe_b_peij_1_2_add_notb[6]) );
  XOR2_X1 fc_pe_b_peij_1_2_add_U3 ( .A(fc_pe_b_peij_1_2_sgnext_10), .B(
        fc_pe_b_peij_1_2_q_k), .Z(fc_pe_b_peij_1_2_add_notb[7]) );
  XOR2_X1 fc_pe_b_peij_1_2_add_U2 ( .A(fc_pe_b_peij_1_2_sgnext_10), .B(
        fc_pe_b_peij_1_2_q_k), .Z(fc_pe_b_peij_1_2_add_notb[8]) );
  XOR2_X1 fc_pe_b_peij_1_2_add_U1 ( .A(fc_pe_b_peij_1_2_sgnext_10), .B(
        fc_pe_b_peij_1_2_q_k), .Z(fc_pe_b_peij_1_2_add_notb[9]) );
  AOI22_X1 fc_pe_b_peij_1_2_add_fai_0_U2 ( .A1(fc_pe_b_peij_1_2_add_notb[0]), 
        .A2(o_data2[11]), .B1(fc_pe_b_peij_1_2_add_fai_0_n5), .B2(
        fc_pe_b_peij_1_2_q_k), .ZN(fc_pe_b_peij_1_2_add_fai_0_n4) );
  INV_X1 fc_pe_b_peij_1_2_add_fai_0_U1 ( .A(fc_pe_b_peij_1_2_add_fai_0_n4), 
        .ZN(fc_pe_b_peij_1_2_add_cprop[1]) );
  XOR2_X1 fc_pe_b_peij_1_2_add_fai_0_U4 ( .A(o_data2[11]), .B(
        fc_pe_b_peij_1_2_add_notb[0]), .Z(fc_pe_b_peij_1_2_add_fai_0_n5) );
  XOR2_X1 fc_pe_b_peij_1_2_add_fai_0_U3 ( .A(fc_pe_b_peij_1_2_q_k), .B(
        fc_pe_b_peij_1_2_add_fai_0_n5), .Z(fc_pe_b_peij_1_2_d_acc[0]) );
  AOI22_X1 fc_pe_b_peij_1_2_add_fai_1_U2 ( .A1(fc_pe_b_peij_1_2_add_notb[1]), 
        .A2(o_data2[12]), .B1(fc_pe_b_peij_1_2_add_fai_1_n5), .B2(
        fc_pe_b_peij_1_2_add_cprop[1]), .ZN(fc_pe_b_peij_1_2_add_fai_1_n4) );
  INV_X1 fc_pe_b_peij_1_2_add_fai_1_U1 ( .A(fc_pe_b_peij_1_2_add_fai_1_n4), 
        .ZN(fc_pe_b_peij_1_2_add_cprop[2]) );
  XOR2_X1 fc_pe_b_peij_1_2_add_fai_1_U4 ( .A(o_data2[12]), .B(
        fc_pe_b_peij_1_2_add_notb[1]), .Z(fc_pe_b_peij_1_2_add_fai_1_n5) );
  XOR2_X1 fc_pe_b_peij_1_2_add_fai_1_U3 ( .A(fc_pe_b_peij_1_2_add_cprop[1]), 
        .B(fc_pe_b_peij_1_2_add_fai_1_n5), .Z(fc_pe_b_peij_1_2_d_acc[1]) );
  AOI22_X1 fc_pe_b_peij_1_2_add_fai_2_U2 ( .A1(fc_pe_b_peij_1_2_add_notb[2]), 
        .A2(o_data2[13]), .B1(fc_pe_b_peij_1_2_add_fai_2_n5), .B2(
        fc_pe_b_peij_1_2_add_cprop[2]), .ZN(fc_pe_b_peij_1_2_add_fai_2_n4) );
  INV_X1 fc_pe_b_peij_1_2_add_fai_2_U1 ( .A(fc_pe_b_peij_1_2_add_fai_2_n4), 
        .ZN(fc_pe_b_peij_1_2_add_cprop[3]) );
  XOR2_X1 fc_pe_b_peij_1_2_add_fai_2_U4 ( .A(o_data2[13]), .B(
        fc_pe_b_peij_1_2_add_notb[2]), .Z(fc_pe_b_peij_1_2_add_fai_2_n5) );
  XOR2_X1 fc_pe_b_peij_1_2_add_fai_2_U3 ( .A(fc_pe_b_peij_1_2_add_cprop[2]), 
        .B(fc_pe_b_peij_1_2_add_fai_2_n5), .Z(fc_pe_b_peij_1_2_d_acc[2]) );
  AOI22_X1 fc_pe_b_peij_1_2_add_fai_3_U2 ( .A1(fc_pe_b_peij_1_2_add_notb[3]), 
        .A2(o_data2[14]), .B1(fc_pe_b_peij_1_2_add_fai_3_n5), .B2(
        fc_pe_b_peij_1_2_add_cprop[3]), .ZN(fc_pe_b_peij_1_2_add_fai_3_n4) );
  INV_X1 fc_pe_b_peij_1_2_add_fai_3_U1 ( .A(fc_pe_b_peij_1_2_add_fai_3_n4), 
        .ZN(fc_pe_b_peij_1_2_add_cprop[4]) );
  XOR2_X1 fc_pe_b_peij_1_2_add_fai_3_U4 ( .A(o_data2[14]), .B(
        fc_pe_b_peij_1_2_add_notb[3]), .Z(fc_pe_b_peij_1_2_add_fai_3_n5) );
  XOR2_X1 fc_pe_b_peij_1_2_add_fai_3_U3 ( .A(fc_pe_b_peij_1_2_add_cprop[3]), 
        .B(fc_pe_b_peij_1_2_add_fai_3_n5), .Z(fc_pe_b_peij_1_2_d_acc[3]) );
  AOI22_X1 fc_pe_b_peij_1_2_add_fai_4_U2 ( .A1(fc_pe_b_peij_1_2_add_notb[4]), 
        .A2(o_data2[15]), .B1(fc_pe_b_peij_1_2_add_fai_4_n5), .B2(
        fc_pe_b_peij_1_2_add_cprop[4]), .ZN(fc_pe_b_peij_1_2_add_fai_4_n4) );
  INV_X1 fc_pe_b_peij_1_2_add_fai_4_U1 ( .A(fc_pe_b_peij_1_2_add_fai_4_n4), 
        .ZN(fc_pe_b_peij_1_2_add_cprop[5]) );
  XOR2_X1 fc_pe_b_peij_1_2_add_fai_4_U4 ( .A(o_data2[15]), .B(
        fc_pe_b_peij_1_2_add_notb[4]), .Z(fc_pe_b_peij_1_2_add_fai_4_n5) );
  XOR2_X1 fc_pe_b_peij_1_2_add_fai_4_U3 ( .A(fc_pe_b_peij_1_2_add_cprop[4]), 
        .B(fc_pe_b_peij_1_2_add_fai_4_n5), .Z(fc_pe_b_peij_1_2_d_acc[4]) );
  AOI22_X1 fc_pe_b_peij_1_2_add_fai_5_U2 ( .A1(fc_pe_b_peij_1_2_add_notb[5]), 
        .A2(o_data2[16]), .B1(fc_pe_b_peij_1_2_add_fai_5_n5), .B2(
        fc_pe_b_peij_1_2_add_cprop[5]), .ZN(fc_pe_b_peij_1_2_add_fai_5_n4) );
  INV_X1 fc_pe_b_peij_1_2_add_fai_5_U1 ( .A(fc_pe_b_peij_1_2_add_fai_5_n4), 
        .ZN(fc_pe_b_peij_1_2_add_cprop[6]) );
  XOR2_X1 fc_pe_b_peij_1_2_add_fai_5_U4 ( .A(o_data2[16]), .B(
        fc_pe_b_peij_1_2_add_notb[5]), .Z(fc_pe_b_peij_1_2_add_fai_5_n5) );
  XOR2_X1 fc_pe_b_peij_1_2_add_fai_5_U3 ( .A(fc_pe_b_peij_1_2_add_cprop[5]), 
        .B(fc_pe_b_peij_1_2_add_fai_5_n5), .Z(fc_pe_b_peij_1_2_d_acc[5]) );
  AOI22_X1 fc_pe_b_peij_1_2_add_fai_6_U2 ( .A1(fc_pe_b_peij_1_2_add_notb[6]), 
        .A2(o_data2[17]), .B1(fc_pe_b_peij_1_2_add_fai_6_n5), .B2(
        fc_pe_b_peij_1_2_add_cprop[6]), .ZN(fc_pe_b_peij_1_2_add_fai_6_n4) );
  INV_X1 fc_pe_b_peij_1_2_add_fai_6_U1 ( .A(fc_pe_b_peij_1_2_add_fai_6_n4), 
        .ZN(fc_pe_b_peij_1_2_add_cprop[7]) );
  XOR2_X1 fc_pe_b_peij_1_2_add_fai_6_U4 ( .A(o_data2[17]), .B(
        fc_pe_b_peij_1_2_add_notb[6]), .Z(fc_pe_b_peij_1_2_add_fai_6_n5) );
  XOR2_X1 fc_pe_b_peij_1_2_add_fai_6_U3 ( .A(fc_pe_b_peij_1_2_add_cprop[6]), 
        .B(fc_pe_b_peij_1_2_add_fai_6_n5), .Z(fc_pe_b_peij_1_2_d_acc[6]) );
  AOI22_X1 fc_pe_b_peij_1_2_add_fai_7_U2 ( .A1(fc_pe_b_peij_1_2_add_notb[7]), 
        .A2(o_data2[18]), .B1(fc_pe_b_peij_1_2_add_fai_7_n5), .B2(
        fc_pe_b_peij_1_2_add_cprop[7]), .ZN(fc_pe_b_peij_1_2_add_fai_7_n4) );
  INV_X1 fc_pe_b_peij_1_2_add_fai_7_U1 ( .A(fc_pe_b_peij_1_2_add_fai_7_n4), 
        .ZN(fc_pe_b_peij_1_2_add_cprop[8]) );
  XOR2_X1 fc_pe_b_peij_1_2_add_fai_7_U4 ( .A(o_data2[18]), .B(
        fc_pe_b_peij_1_2_add_notb[7]), .Z(fc_pe_b_peij_1_2_add_fai_7_n5) );
  XOR2_X1 fc_pe_b_peij_1_2_add_fai_7_U3 ( .A(fc_pe_b_peij_1_2_add_cprop[7]), 
        .B(fc_pe_b_peij_1_2_add_fai_7_n5), .Z(fc_pe_b_peij_1_2_d_acc[7]) );
  AOI22_X1 fc_pe_b_peij_1_2_add_fai_8_U2 ( .A1(fc_pe_b_peij_1_2_add_notb[8]), 
        .A2(o_data2[19]), .B1(fc_pe_b_peij_1_2_add_fai_8_n5), .B2(
        fc_pe_b_peij_1_2_add_cprop[8]), .ZN(fc_pe_b_peij_1_2_add_fai_8_n4) );
  INV_X1 fc_pe_b_peij_1_2_add_fai_8_U1 ( .A(fc_pe_b_peij_1_2_add_fai_8_n4), 
        .ZN(fc_pe_b_peij_1_2_add_cprop[9]) );
  XOR2_X1 fc_pe_b_peij_1_2_add_fai_8_U4 ( .A(o_data2[19]), .B(
        fc_pe_b_peij_1_2_add_notb[8]), .Z(fc_pe_b_peij_1_2_add_fai_8_n5) );
  XOR2_X1 fc_pe_b_peij_1_2_add_fai_8_U3 ( .A(fc_pe_b_peij_1_2_add_cprop[8]), 
        .B(fc_pe_b_peij_1_2_add_fai_8_n5), .Z(fc_pe_b_peij_1_2_d_acc[8]) );
  AOI22_X1 fc_pe_b_peij_1_2_add_fai_9_U2 ( .A1(fc_pe_b_peij_1_2_add_notb[9]), 
        .A2(o_data2[20]), .B1(fc_pe_b_peij_1_2_add_fai_9_n5), .B2(
        fc_pe_b_peij_1_2_add_cprop[9]), .ZN(fc_pe_b_peij_1_2_add_fai_9_n4) );
  INV_X1 fc_pe_b_peij_1_2_add_fai_9_U1 ( .A(fc_pe_b_peij_1_2_add_fai_9_n4), 
        .ZN(fc_pe_b_peij_1_2_add_cprop[10]) );
  XOR2_X1 fc_pe_b_peij_1_2_add_fai_9_U4 ( .A(o_data2[20]), .B(
        fc_pe_b_peij_1_2_add_notb[9]), .Z(fc_pe_b_peij_1_2_add_fai_9_n5) );
  XOR2_X1 fc_pe_b_peij_1_2_add_fai_9_U3 ( .A(fc_pe_b_peij_1_2_add_cprop[9]), 
        .B(fc_pe_b_peij_1_2_add_fai_9_n5), .Z(fc_pe_b_peij_1_2_d_acc[9]) );
  AOI22_X1 fc_pe_b_peij_1_2_add_fai_10_U2 ( .A1(fc_pe_b_peij_1_2_add_notb[10]), 
        .A2(o_data2[21]), .B1(fc_pe_b_peij_1_2_add_fai_10_n5), .B2(
        fc_pe_b_peij_1_2_add_cprop[10]), .ZN(fc_pe_b_peij_1_2_add_fai_10_n4)
         );
  INV_X1 fc_pe_b_peij_1_2_add_fai_10_U1 ( .A(fc_pe_b_peij_1_2_add_fai_10_n4), 
        .ZN(fc_pe_b_peij_1_2_add_c_out) );
  XOR2_X1 fc_pe_b_peij_1_2_add_fai_10_U4 ( .A(o_data2[21]), .B(
        fc_pe_b_peij_1_2_add_notb[10]), .Z(fc_pe_b_peij_1_2_add_fai_10_n5) );
  XOR2_X1 fc_pe_b_peij_1_2_add_fai_10_U3 ( .A(fc_pe_b_peij_1_2_add_cprop[10]), 
        .B(fc_pe_b_peij_1_2_add_fai_10_n5), .Z(fc_pe_b_peij_1_2_d_acc[10]) );
  AND3_X1 fc_pe_b_peij_1_3_U22 ( .A1(fc_pe_b_int_pe_en[8]), .A2(clk), .A3(
        i_kernel2[0]), .ZN(fc_pe_b_peij_1_3_gck) );
  AND2_X1 fc_pe_b_peij_1_3_U21 ( .A1(i_data[3]), .A2(fc_pe_b_peij_1_3_n16), 
        .ZN(fc_pe_b_peij_1_3_N35) );
  AND2_X1 fc_pe_b_peij_1_3_U20 ( .A1(i_data[2]), .A2(fc_pe_b_peij_1_3_n16), 
        .ZN(fc_pe_b_peij_1_3_N34) );
  AND2_X1 fc_pe_b_peij_1_3_U19 ( .A1(i_data[1]), .A2(fc_pe_b_peij_1_3_n16), 
        .ZN(fc_pe_b_peij_1_3_N33) );
  AND2_X1 fc_pe_b_peij_1_3_U18 ( .A1(i_data[0]), .A2(fc_pe_b_peij_1_3_n16), 
        .ZN(fc_pe_b_peij_1_3_N32) );
  AND3_X1 fc_pe_b_peij_1_3_U17 ( .A1(fc_pe_b_int_pe_en[8]), .A2(
        fc_pe_b_peij_1_3_n14), .A3(i_kernel2[0]), .ZN(fc_pe_b_peij_1_3_n16) );
  INV_X1 fc_pe_b_peij_1_3_U16 ( .A(tb_rst_cnt2), .ZN(fc_pe_b_peij_1_3_n12) );
  INV_X1 fc_pe_b_peij_1_3_U14 ( .A(tb_rst_cnt1), .ZN(fc_pe_b_peij_1_3_n14) );
  SDFFR_X1 fc_pe_b_peij_1_3_q_acc_reg_10_ ( .D(1'b0), .SI(fc_pe_b_peij_1_3_n14), .SE(fc_pe_b_peij_1_3_d_acc[10]), .CK(fc_pe_b_peij_1_3_gck), .RN(
        fc_pe_b_peij_1_3_n12), .Q(o_data2[10]) );
  SDFFR_X1 fc_pe_b_peij_1_3_q_acc_reg_9_ ( .D(1'b0), .SI(fc_pe_b_peij_1_3_n14), 
        .SE(fc_pe_b_peij_1_3_d_acc[9]), .CK(fc_pe_b_peij_1_3_gck), .RN(
        fc_pe_b_peij_1_3_n12), .Q(o_data2[9]) );
  SDFFR_X1 fc_pe_b_peij_1_3_q_acc_reg_8_ ( .D(1'b0), .SI(fc_pe_b_peij_1_3_n14), 
        .SE(fc_pe_b_peij_1_3_d_acc[8]), .CK(fc_pe_b_peij_1_3_gck), .RN(
        fc_pe_b_peij_1_3_n12), .Q(o_data2[8]) );
  SDFFR_X1 fc_pe_b_peij_1_3_q_acc_reg_7_ ( .D(1'b0), .SI(fc_pe_b_peij_1_3_n14), 
        .SE(fc_pe_b_peij_1_3_d_acc[7]), .CK(fc_pe_b_peij_1_3_gck), .RN(
        fc_pe_b_peij_1_3_n12), .Q(o_data2[7]) );
  SDFFR_X1 fc_pe_b_peij_1_3_q_acc_reg_6_ ( .D(1'b0), .SI(fc_pe_b_peij_1_3_n14), 
        .SE(fc_pe_b_peij_1_3_d_acc[6]), .CK(fc_pe_b_peij_1_3_gck), .RN(
        fc_pe_b_peij_1_3_n12), .Q(o_data2[6]) );
  SDFFR_X1 fc_pe_b_peij_1_3_q_acc_reg_5_ ( .D(1'b0), .SI(fc_pe_b_peij_1_3_n14), 
        .SE(fc_pe_b_peij_1_3_d_acc[5]), .CK(fc_pe_b_peij_1_3_gck), .RN(
        fc_pe_b_peij_1_3_n12), .Q(o_data2[5]) );
  SDFFR_X1 fc_pe_b_peij_1_3_q_acc_reg_4_ ( .D(1'b0), .SI(fc_pe_b_peij_1_3_n14), 
        .SE(fc_pe_b_peij_1_3_d_acc[4]), .CK(fc_pe_b_peij_1_3_gck), .RN(
        fc_pe_b_peij_1_3_n12), .Q(o_data2[4]) );
  SDFFR_X1 fc_pe_b_peij_1_3_q_acc_reg_3_ ( .D(1'b0), .SI(fc_pe_b_peij_1_3_n14), 
        .SE(fc_pe_b_peij_1_3_d_acc[3]), .CK(fc_pe_b_peij_1_3_gck), .RN(
        fc_pe_b_peij_1_3_n12), .Q(o_data2[3]) );
  SDFFR_X1 fc_pe_b_peij_1_3_q_acc_reg_2_ ( .D(1'b0), .SI(fc_pe_b_peij_1_3_n14), 
        .SE(fc_pe_b_peij_1_3_d_acc[2]), .CK(fc_pe_b_peij_1_3_gck), .RN(
        fc_pe_b_peij_1_3_n12), .Q(o_data2[2]) );
  SDFFR_X1 fc_pe_b_peij_1_3_q_acc_reg_1_ ( .D(1'b0), .SI(fc_pe_b_peij_1_3_n14), 
        .SE(fc_pe_b_peij_1_3_d_acc[1]), .CK(fc_pe_b_peij_1_3_gck), .RN(
        fc_pe_b_peij_1_3_n12), .Q(o_data2[1]) );
  SDFFR_X1 fc_pe_b_peij_1_3_q_acc_reg_0_ ( .D(1'b0), .SI(fc_pe_b_peij_1_3_n14), 
        .SE(fc_pe_b_peij_1_3_d_acc[0]), .CK(fc_pe_b_peij_1_3_gck), .RN(
        fc_pe_b_peij_1_3_n12), .Q(o_data2[0]) );
  DFFR_X1 fc_pe_b_peij_1_3_q_im_reg_0_ ( .D(fc_pe_b_peij_1_3_N32), .CK(
        fc_pe_b_peij_1_3_gck), .RN(fc_pe_b_peij_1_3_n12), .Q(
        fc_pe_b_peij_1_3_sgnext[0]) );
  DFFR_X1 fc_pe_b_peij_1_3_q_im_reg_1_ ( .D(fc_pe_b_peij_1_3_N33), .CK(
        fc_pe_b_peij_1_3_gck), .RN(fc_pe_b_peij_1_3_n12), .Q(
        fc_pe_b_peij_1_3_sgnext[1]) );
  DFFR_X1 fc_pe_b_peij_1_3_q_im_reg_2_ ( .D(fc_pe_b_peij_1_3_N34), .CK(
        fc_pe_b_peij_1_3_gck), .RN(fc_pe_b_peij_1_3_n12), .Q(
        fc_pe_b_peij_1_3_sgnext[2]) );
  DFFR_X1 fc_pe_b_peij_1_3_q_im_reg_3_ ( .D(fc_pe_b_peij_1_3_N35), .CK(
        fc_pe_b_peij_1_3_gck), .RN(fc_pe_b_peij_1_3_n12), .Q(
        fc_pe_b_peij_1_3_sgnext_10) );
  SDFFR_X1 fc_pe_b_peij_1_3_q_k_reg ( .D(1'b0), .SI(fc_pe_b_peij_1_3_n14), 
        .SE(i_kernel2[1]), .CK(fc_pe_b_peij_1_3_gck), .RN(fc_pe_b_peij_1_3_n12), .Q(fc_pe_b_peij_1_3_q_k) );
  XOR2_X1 fc_pe_b_peij_1_3_add_U11 ( .A(fc_pe_b_peij_1_3_sgnext[0]), .B(
        fc_pe_b_peij_1_3_q_k), .Z(fc_pe_b_peij_1_3_add_notb[0]) );
  XOR2_X1 fc_pe_b_peij_1_3_add_U10 ( .A(fc_pe_b_peij_1_3_sgnext_10), .B(
        fc_pe_b_peij_1_3_q_k), .Z(fc_pe_b_peij_1_3_add_notb[10]) );
  XOR2_X1 fc_pe_b_peij_1_3_add_U9 ( .A(fc_pe_b_peij_1_3_sgnext[1]), .B(
        fc_pe_b_peij_1_3_q_k), .Z(fc_pe_b_peij_1_3_add_notb[1]) );
  XOR2_X1 fc_pe_b_peij_1_3_add_U8 ( .A(fc_pe_b_peij_1_3_sgnext[2]), .B(
        fc_pe_b_peij_1_3_q_k), .Z(fc_pe_b_peij_1_3_add_notb[2]) );
  XOR2_X1 fc_pe_b_peij_1_3_add_U7 ( .A(fc_pe_b_peij_1_3_sgnext_10), .B(
        fc_pe_b_peij_1_3_q_k), .Z(fc_pe_b_peij_1_3_add_notb[3]) );
  XOR2_X1 fc_pe_b_peij_1_3_add_U6 ( .A(fc_pe_b_peij_1_3_sgnext_10), .B(
        fc_pe_b_peij_1_3_q_k), .Z(fc_pe_b_peij_1_3_add_notb[4]) );
  XOR2_X1 fc_pe_b_peij_1_3_add_U5 ( .A(fc_pe_b_peij_1_3_sgnext_10), .B(
        fc_pe_b_peij_1_3_q_k), .Z(fc_pe_b_peij_1_3_add_notb[5]) );
  XOR2_X1 fc_pe_b_peij_1_3_add_U4 ( .A(fc_pe_b_peij_1_3_sgnext_10), .B(
        fc_pe_b_peij_1_3_q_k), .Z(fc_pe_b_peij_1_3_add_notb[6]) );
  XOR2_X1 fc_pe_b_peij_1_3_add_U3 ( .A(fc_pe_b_peij_1_3_sgnext_10), .B(
        fc_pe_b_peij_1_3_q_k), .Z(fc_pe_b_peij_1_3_add_notb[7]) );
  XOR2_X1 fc_pe_b_peij_1_3_add_U2 ( .A(fc_pe_b_peij_1_3_sgnext_10), .B(
        fc_pe_b_peij_1_3_q_k), .Z(fc_pe_b_peij_1_3_add_notb[8]) );
  XOR2_X1 fc_pe_b_peij_1_3_add_U1 ( .A(fc_pe_b_peij_1_3_sgnext_10), .B(
        fc_pe_b_peij_1_3_q_k), .Z(fc_pe_b_peij_1_3_add_notb[9]) );
  AOI22_X1 fc_pe_b_peij_1_3_add_fai_0_U2 ( .A1(fc_pe_b_peij_1_3_add_notb[0]), 
        .A2(o_data2[0]), .B1(fc_pe_b_peij_1_3_add_fai_0_n5), .B2(
        fc_pe_b_peij_1_3_q_k), .ZN(fc_pe_b_peij_1_3_add_fai_0_n4) );
  INV_X1 fc_pe_b_peij_1_3_add_fai_0_U1 ( .A(fc_pe_b_peij_1_3_add_fai_0_n4), 
        .ZN(fc_pe_b_peij_1_3_add_cprop[1]) );
  XOR2_X1 fc_pe_b_peij_1_3_add_fai_0_U4 ( .A(o_data2[0]), .B(
        fc_pe_b_peij_1_3_add_notb[0]), .Z(fc_pe_b_peij_1_3_add_fai_0_n5) );
  XOR2_X1 fc_pe_b_peij_1_3_add_fai_0_U3 ( .A(fc_pe_b_peij_1_3_q_k), .B(
        fc_pe_b_peij_1_3_add_fai_0_n5), .Z(fc_pe_b_peij_1_3_d_acc[0]) );
  AOI22_X1 fc_pe_b_peij_1_3_add_fai_1_U2 ( .A1(fc_pe_b_peij_1_3_add_notb[1]), 
        .A2(o_data2[1]), .B1(fc_pe_b_peij_1_3_add_fai_1_n5), .B2(
        fc_pe_b_peij_1_3_add_cprop[1]), .ZN(fc_pe_b_peij_1_3_add_fai_1_n4) );
  INV_X1 fc_pe_b_peij_1_3_add_fai_1_U1 ( .A(fc_pe_b_peij_1_3_add_fai_1_n4), 
        .ZN(fc_pe_b_peij_1_3_add_cprop[2]) );
  XOR2_X1 fc_pe_b_peij_1_3_add_fai_1_U4 ( .A(o_data2[1]), .B(
        fc_pe_b_peij_1_3_add_notb[1]), .Z(fc_pe_b_peij_1_3_add_fai_1_n5) );
  XOR2_X1 fc_pe_b_peij_1_3_add_fai_1_U3 ( .A(fc_pe_b_peij_1_3_add_cprop[1]), 
        .B(fc_pe_b_peij_1_3_add_fai_1_n5), .Z(fc_pe_b_peij_1_3_d_acc[1]) );
  AOI22_X1 fc_pe_b_peij_1_3_add_fai_2_U2 ( .A1(fc_pe_b_peij_1_3_add_notb[2]), 
        .A2(o_data2[2]), .B1(fc_pe_b_peij_1_3_add_fai_2_n5), .B2(
        fc_pe_b_peij_1_3_add_cprop[2]), .ZN(fc_pe_b_peij_1_3_add_fai_2_n4) );
  INV_X1 fc_pe_b_peij_1_3_add_fai_2_U1 ( .A(fc_pe_b_peij_1_3_add_fai_2_n4), 
        .ZN(fc_pe_b_peij_1_3_add_cprop[3]) );
  XOR2_X1 fc_pe_b_peij_1_3_add_fai_2_U4 ( .A(o_data2[2]), .B(
        fc_pe_b_peij_1_3_add_notb[2]), .Z(fc_pe_b_peij_1_3_add_fai_2_n5) );
  XOR2_X1 fc_pe_b_peij_1_3_add_fai_2_U3 ( .A(fc_pe_b_peij_1_3_add_cprop[2]), 
        .B(fc_pe_b_peij_1_3_add_fai_2_n5), .Z(fc_pe_b_peij_1_3_d_acc[2]) );
  AOI22_X1 fc_pe_b_peij_1_3_add_fai_3_U2 ( .A1(fc_pe_b_peij_1_3_add_notb[3]), 
        .A2(o_data2[3]), .B1(fc_pe_b_peij_1_3_add_fai_3_n5), .B2(
        fc_pe_b_peij_1_3_add_cprop[3]), .ZN(fc_pe_b_peij_1_3_add_fai_3_n4) );
  INV_X1 fc_pe_b_peij_1_3_add_fai_3_U1 ( .A(fc_pe_b_peij_1_3_add_fai_3_n4), 
        .ZN(fc_pe_b_peij_1_3_add_cprop[4]) );
  XOR2_X1 fc_pe_b_peij_1_3_add_fai_3_U4 ( .A(o_data2[3]), .B(
        fc_pe_b_peij_1_3_add_notb[3]), .Z(fc_pe_b_peij_1_3_add_fai_3_n5) );
  XOR2_X1 fc_pe_b_peij_1_3_add_fai_3_U3 ( .A(fc_pe_b_peij_1_3_add_cprop[3]), 
        .B(fc_pe_b_peij_1_3_add_fai_3_n5), .Z(fc_pe_b_peij_1_3_d_acc[3]) );
  AOI22_X1 fc_pe_b_peij_1_3_add_fai_4_U2 ( .A1(fc_pe_b_peij_1_3_add_notb[4]), 
        .A2(o_data2[4]), .B1(fc_pe_b_peij_1_3_add_fai_4_n5), .B2(
        fc_pe_b_peij_1_3_add_cprop[4]), .ZN(fc_pe_b_peij_1_3_add_fai_4_n4) );
  INV_X1 fc_pe_b_peij_1_3_add_fai_4_U1 ( .A(fc_pe_b_peij_1_3_add_fai_4_n4), 
        .ZN(fc_pe_b_peij_1_3_add_cprop[5]) );
  XOR2_X1 fc_pe_b_peij_1_3_add_fai_4_U4 ( .A(o_data2[4]), .B(
        fc_pe_b_peij_1_3_add_notb[4]), .Z(fc_pe_b_peij_1_3_add_fai_4_n5) );
  XOR2_X1 fc_pe_b_peij_1_3_add_fai_4_U3 ( .A(fc_pe_b_peij_1_3_add_cprop[4]), 
        .B(fc_pe_b_peij_1_3_add_fai_4_n5), .Z(fc_pe_b_peij_1_3_d_acc[4]) );
  AOI22_X1 fc_pe_b_peij_1_3_add_fai_5_U2 ( .A1(fc_pe_b_peij_1_3_add_notb[5]), 
        .A2(o_data2[5]), .B1(fc_pe_b_peij_1_3_add_fai_5_n5), .B2(
        fc_pe_b_peij_1_3_add_cprop[5]), .ZN(fc_pe_b_peij_1_3_add_fai_5_n4) );
  INV_X1 fc_pe_b_peij_1_3_add_fai_5_U1 ( .A(fc_pe_b_peij_1_3_add_fai_5_n4), 
        .ZN(fc_pe_b_peij_1_3_add_cprop[6]) );
  XOR2_X1 fc_pe_b_peij_1_3_add_fai_5_U4 ( .A(o_data2[5]), .B(
        fc_pe_b_peij_1_3_add_notb[5]), .Z(fc_pe_b_peij_1_3_add_fai_5_n5) );
  XOR2_X1 fc_pe_b_peij_1_3_add_fai_5_U3 ( .A(fc_pe_b_peij_1_3_add_cprop[5]), 
        .B(fc_pe_b_peij_1_3_add_fai_5_n5), .Z(fc_pe_b_peij_1_3_d_acc[5]) );
  AOI22_X1 fc_pe_b_peij_1_3_add_fai_6_U2 ( .A1(fc_pe_b_peij_1_3_add_notb[6]), 
        .A2(o_data2[6]), .B1(fc_pe_b_peij_1_3_add_fai_6_n5), .B2(
        fc_pe_b_peij_1_3_add_cprop[6]), .ZN(fc_pe_b_peij_1_3_add_fai_6_n4) );
  INV_X1 fc_pe_b_peij_1_3_add_fai_6_U1 ( .A(fc_pe_b_peij_1_3_add_fai_6_n4), 
        .ZN(fc_pe_b_peij_1_3_add_cprop[7]) );
  XOR2_X1 fc_pe_b_peij_1_3_add_fai_6_U4 ( .A(o_data2[6]), .B(
        fc_pe_b_peij_1_3_add_notb[6]), .Z(fc_pe_b_peij_1_3_add_fai_6_n5) );
  XOR2_X1 fc_pe_b_peij_1_3_add_fai_6_U3 ( .A(fc_pe_b_peij_1_3_add_cprop[6]), 
        .B(fc_pe_b_peij_1_3_add_fai_6_n5), .Z(fc_pe_b_peij_1_3_d_acc[6]) );
  AOI22_X1 fc_pe_b_peij_1_3_add_fai_7_U2 ( .A1(fc_pe_b_peij_1_3_add_notb[7]), 
        .A2(o_data2[7]), .B1(fc_pe_b_peij_1_3_add_fai_7_n5), .B2(
        fc_pe_b_peij_1_3_add_cprop[7]), .ZN(fc_pe_b_peij_1_3_add_fai_7_n4) );
  INV_X1 fc_pe_b_peij_1_3_add_fai_7_U1 ( .A(fc_pe_b_peij_1_3_add_fai_7_n4), 
        .ZN(fc_pe_b_peij_1_3_add_cprop[8]) );
  XOR2_X1 fc_pe_b_peij_1_3_add_fai_7_U4 ( .A(o_data2[7]), .B(
        fc_pe_b_peij_1_3_add_notb[7]), .Z(fc_pe_b_peij_1_3_add_fai_7_n5) );
  XOR2_X1 fc_pe_b_peij_1_3_add_fai_7_U3 ( .A(fc_pe_b_peij_1_3_add_cprop[7]), 
        .B(fc_pe_b_peij_1_3_add_fai_7_n5), .Z(fc_pe_b_peij_1_3_d_acc[7]) );
  AOI22_X1 fc_pe_b_peij_1_3_add_fai_8_U2 ( .A1(fc_pe_b_peij_1_3_add_notb[8]), 
        .A2(o_data2[8]), .B1(fc_pe_b_peij_1_3_add_fai_8_n5), .B2(
        fc_pe_b_peij_1_3_add_cprop[8]), .ZN(fc_pe_b_peij_1_3_add_fai_8_n4) );
  INV_X1 fc_pe_b_peij_1_3_add_fai_8_U1 ( .A(fc_pe_b_peij_1_3_add_fai_8_n4), 
        .ZN(fc_pe_b_peij_1_3_add_cprop[9]) );
  XOR2_X1 fc_pe_b_peij_1_3_add_fai_8_U4 ( .A(o_data2[8]), .B(
        fc_pe_b_peij_1_3_add_notb[8]), .Z(fc_pe_b_peij_1_3_add_fai_8_n5) );
  XOR2_X1 fc_pe_b_peij_1_3_add_fai_8_U3 ( .A(fc_pe_b_peij_1_3_add_cprop[8]), 
        .B(fc_pe_b_peij_1_3_add_fai_8_n5), .Z(fc_pe_b_peij_1_3_d_acc[8]) );
  AOI22_X1 fc_pe_b_peij_1_3_add_fai_9_U2 ( .A1(fc_pe_b_peij_1_3_add_notb[9]), 
        .A2(o_data2[9]), .B1(fc_pe_b_peij_1_3_add_fai_9_n5), .B2(
        fc_pe_b_peij_1_3_add_cprop[9]), .ZN(fc_pe_b_peij_1_3_add_fai_9_n4) );
  INV_X1 fc_pe_b_peij_1_3_add_fai_9_U1 ( .A(fc_pe_b_peij_1_3_add_fai_9_n4), 
        .ZN(fc_pe_b_peij_1_3_add_cprop[10]) );
  XOR2_X1 fc_pe_b_peij_1_3_add_fai_9_U4 ( .A(o_data2[9]), .B(
        fc_pe_b_peij_1_3_add_notb[9]), .Z(fc_pe_b_peij_1_3_add_fai_9_n5) );
  XOR2_X1 fc_pe_b_peij_1_3_add_fai_9_U3 ( .A(fc_pe_b_peij_1_3_add_cprop[9]), 
        .B(fc_pe_b_peij_1_3_add_fai_9_n5), .Z(fc_pe_b_peij_1_3_d_acc[9]) );
  AOI22_X1 fc_pe_b_peij_1_3_add_fai_10_U2 ( .A1(fc_pe_b_peij_1_3_add_notb[10]), 
        .A2(o_data2[10]), .B1(fc_pe_b_peij_1_3_add_fai_10_n5), .B2(
        fc_pe_b_peij_1_3_add_cprop[10]), .ZN(fc_pe_b_peij_1_3_add_fai_10_n4)
         );
  INV_X1 fc_pe_b_peij_1_3_add_fai_10_U1 ( .A(fc_pe_b_peij_1_3_add_fai_10_n4), 
        .ZN(fc_pe_b_peij_1_3_add_c_out) );
  XOR2_X1 fc_pe_b_peij_1_3_add_fai_10_U4 ( .A(o_data2[10]), .B(
        fc_pe_b_peij_1_3_add_notb[10]), .Z(fc_pe_b_peij_1_3_add_fai_10_n5) );
  XOR2_X1 fc_pe_b_peij_1_3_add_fai_10_U3 ( .A(fc_pe_b_peij_1_3_add_cprop[10]), 
        .B(fc_pe_b_peij_1_3_add_fai_10_n5), .Z(fc_pe_b_peij_1_3_d_acc[10]) );
  AND3_X1 fc_pe_b_peij_2_0_U22 ( .A1(fc_pe_b_int_pe_en[7]), .A2(clk), .A3(
        i_kernel3[6]), .ZN(fc_pe_b_peij_2_0_gck) );
  AND2_X1 fc_pe_b_peij_2_0_U21 ( .A1(i_data[3]), .A2(fc_pe_b_peij_2_0_n16), 
        .ZN(fc_pe_b_peij_2_0_N35) );
  AND2_X1 fc_pe_b_peij_2_0_U20 ( .A1(i_data[2]), .A2(fc_pe_b_peij_2_0_n16), 
        .ZN(fc_pe_b_peij_2_0_N34) );
  AND2_X1 fc_pe_b_peij_2_0_U19 ( .A1(i_data[1]), .A2(fc_pe_b_peij_2_0_n16), 
        .ZN(fc_pe_b_peij_2_0_N33) );
  AND2_X1 fc_pe_b_peij_2_0_U18 ( .A1(i_data[0]), .A2(fc_pe_b_peij_2_0_n16), 
        .ZN(fc_pe_b_peij_2_0_N32) );
  AND3_X1 fc_pe_b_peij_2_0_U17 ( .A1(fc_pe_b_int_pe_en[7]), .A2(
        fc_pe_b_peij_2_0_n14), .A3(i_kernel3[6]), .ZN(fc_pe_b_peij_2_0_n16) );
  INV_X1 fc_pe_b_peij_2_0_U16 ( .A(tb_rst_cnt2), .ZN(fc_pe_b_peij_2_0_n12) );
  INV_X1 fc_pe_b_peij_2_0_U14 ( .A(tb_rst_cnt1), .ZN(fc_pe_b_peij_2_0_n14) );
  SDFFR_X1 fc_pe_b_peij_2_0_q_acc_reg_10_ ( .D(1'b0), .SI(fc_pe_b_peij_2_0_n14), .SE(fc_pe_b_peij_2_0_d_acc[10]), .CK(fc_pe_b_peij_2_0_gck), .RN(
        fc_pe_b_peij_2_0_n12), .Q(o_data3[43]) );
  SDFFR_X1 fc_pe_b_peij_2_0_q_acc_reg_9_ ( .D(1'b0), .SI(fc_pe_b_peij_2_0_n14), 
        .SE(fc_pe_b_peij_2_0_d_acc[9]), .CK(fc_pe_b_peij_2_0_gck), .RN(
        fc_pe_b_peij_2_0_n12), .Q(o_data3[42]) );
  SDFFR_X1 fc_pe_b_peij_2_0_q_acc_reg_8_ ( .D(1'b0), .SI(fc_pe_b_peij_2_0_n14), 
        .SE(fc_pe_b_peij_2_0_d_acc[8]), .CK(fc_pe_b_peij_2_0_gck), .RN(
        fc_pe_b_peij_2_0_n12), .Q(o_data3[41]) );
  SDFFR_X1 fc_pe_b_peij_2_0_q_acc_reg_7_ ( .D(1'b0), .SI(fc_pe_b_peij_2_0_n14), 
        .SE(fc_pe_b_peij_2_0_d_acc[7]), .CK(fc_pe_b_peij_2_0_gck), .RN(
        fc_pe_b_peij_2_0_n12), .Q(o_data3[40]) );
  SDFFR_X1 fc_pe_b_peij_2_0_q_acc_reg_6_ ( .D(1'b0), .SI(fc_pe_b_peij_2_0_n14), 
        .SE(fc_pe_b_peij_2_0_d_acc[6]), .CK(fc_pe_b_peij_2_0_gck), .RN(
        fc_pe_b_peij_2_0_n12), .Q(o_data3[39]) );
  SDFFR_X1 fc_pe_b_peij_2_0_q_acc_reg_5_ ( .D(1'b0), .SI(fc_pe_b_peij_2_0_n14), 
        .SE(fc_pe_b_peij_2_0_d_acc[5]), .CK(fc_pe_b_peij_2_0_gck), .RN(
        fc_pe_b_peij_2_0_n12), .Q(o_data3[38]) );
  SDFFR_X1 fc_pe_b_peij_2_0_q_acc_reg_4_ ( .D(1'b0), .SI(fc_pe_b_peij_2_0_n14), 
        .SE(fc_pe_b_peij_2_0_d_acc[4]), .CK(fc_pe_b_peij_2_0_gck), .RN(
        fc_pe_b_peij_2_0_n12), .Q(o_data3[37]) );
  SDFFR_X1 fc_pe_b_peij_2_0_q_acc_reg_3_ ( .D(1'b0), .SI(fc_pe_b_peij_2_0_n14), 
        .SE(fc_pe_b_peij_2_0_d_acc[3]), .CK(fc_pe_b_peij_2_0_gck), .RN(
        fc_pe_b_peij_2_0_n12), .Q(o_data3[36]) );
  SDFFR_X1 fc_pe_b_peij_2_0_q_acc_reg_2_ ( .D(1'b0), .SI(fc_pe_b_peij_2_0_n14), 
        .SE(fc_pe_b_peij_2_0_d_acc[2]), .CK(fc_pe_b_peij_2_0_gck), .RN(
        fc_pe_b_peij_2_0_n12), .Q(o_data3[35]) );
  SDFFR_X1 fc_pe_b_peij_2_0_q_acc_reg_1_ ( .D(1'b0), .SI(fc_pe_b_peij_2_0_n14), 
        .SE(fc_pe_b_peij_2_0_d_acc[1]), .CK(fc_pe_b_peij_2_0_gck), .RN(
        fc_pe_b_peij_2_0_n12), .Q(o_data3[34]) );
  SDFFR_X1 fc_pe_b_peij_2_0_q_acc_reg_0_ ( .D(1'b0), .SI(fc_pe_b_peij_2_0_n14), 
        .SE(fc_pe_b_peij_2_0_d_acc[0]), .CK(fc_pe_b_peij_2_0_gck), .RN(
        fc_pe_b_peij_2_0_n12), .Q(o_data3[33]) );
  DFFR_X1 fc_pe_b_peij_2_0_q_im_reg_0_ ( .D(fc_pe_b_peij_2_0_N32), .CK(
        fc_pe_b_peij_2_0_gck), .RN(fc_pe_b_peij_2_0_n12), .Q(
        fc_pe_b_peij_2_0_sgnext[0]) );
  DFFR_X1 fc_pe_b_peij_2_0_q_im_reg_1_ ( .D(fc_pe_b_peij_2_0_N33), .CK(
        fc_pe_b_peij_2_0_gck), .RN(fc_pe_b_peij_2_0_n12), .Q(
        fc_pe_b_peij_2_0_sgnext[1]) );
  DFFR_X1 fc_pe_b_peij_2_0_q_im_reg_2_ ( .D(fc_pe_b_peij_2_0_N34), .CK(
        fc_pe_b_peij_2_0_gck), .RN(fc_pe_b_peij_2_0_n12), .Q(
        fc_pe_b_peij_2_0_sgnext[2]) );
  DFFR_X1 fc_pe_b_peij_2_0_q_im_reg_3_ ( .D(fc_pe_b_peij_2_0_N35), .CK(
        fc_pe_b_peij_2_0_gck), .RN(fc_pe_b_peij_2_0_n12), .Q(
        fc_pe_b_peij_2_0_sgnext_10) );
  SDFFR_X1 fc_pe_b_peij_2_0_q_k_reg ( .D(1'b0), .SI(fc_pe_b_peij_2_0_n14), 
        .SE(i_kernel3[7]), .CK(fc_pe_b_peij_2_0_gck), .RN(fc_pe_b_peij_2_0_n12), .Q(fc_pe_b_peij_2_0_q_k) );
  XOR2_X1 fc_pe_b_peij_2_0_add_U11 ( .A(fc_pe_b_peij_2_0_sgnext[0]), .B(
        fc_pe_b_peij_2_0_q_k), .Z(fc_pe_b_peij_2_0_add_notb[0]) );
  XOR2_X1 fc_pe_b_peij_2_0_add_U10 ( .A(fc_pe_b_peij_2_0_sgnext_10), .B(
        fc_pe_b_peij_2_0_q_k), .Z(fc_pe_b_peij_2_0_add_notb[10]) );
  XOR2_X1 fc_pe_b_peij_2_0_add_U9 ( .A(fc_pe_b_peij_2_0_sgnext[1]), .B(
        fc_pe_b_peij_2_0_q_k), .Z(fc_pe_b_peij_2_0_add_notb[1]) );
  XOR2_X1 fc_pe_b_peij_2_0_add_U8 ( .A(fc_pe_b_peij_2_0_sgnext[2]), .B(
        fc_pe_b_peij_2_0_q_k), .Z(fc_pe_b_peij_2_0_add_notb[2]) );
  XOR2_X1 fc_pe_b_peij_2_0_add_U7 ( .A(fc_pe_b_peij_2_0_sgnext_10), .B(
        fc_pe_b_peij_2_0_q_k), .Z(fc_pe_b_peij_2_0_add_notb[3]) );
  XOR2_X1 fc_pe_b_peij_2_0_add_U6 ( .A(fc_pe_b_peij_2_0_sgnext_10), .B(
        fc_pe_b_peij_2_0_q_k), .Z(fc_pe_b_peij_2_0_add_notb[4]) );
  XOR2_X1 fc_pe_b_peij_2_0_add_U5 ( .A(fc_pe_b_peij_2_0_sgnext_10), .B(
        fc_pe_b_peij_2_0_q_k), .Z(fc_pe_b_peij_2_0_add_notb[5]) );
  XOR2_X1 fc_pe_b_peij_2_0_add_U4 ( .A(fc_pe_b_peij_2_0_sgnext_10), .B(
        fc_pe_b_peij_2_0_q_k), .Z(fc_pe_b_peij_2_0_add_notb[6]) );
  XOR2_X1 fc_pe_b_peij_2_0_add_U3 ( .A(fc_pe_b_peij_2_0_sgnext_10), .B(
        fc_pe_b_peij_2_0_q_k), .Z(fc_pe_b_peij_2_0_add_notb[7]) );
  XOR2_X1 fc_pe_b_peij_2_0_add_U2 ( .A(fc_pe_b_peij_2_0_sgnext_10), .B(
        fc_pe_b_peij_2_0_q_k), .Z(fc_pe_b_peij_2_0_add_notb[8]) );
  XOR2_X1 fc_pe_b_peij_2_0_add_U1 ( .A(fc_pe_b_peij_2_0_sgnext_10), .B(
        fc_pe_b_peij_2_0_q_k), .Z(fc_pe_b_peij_2_0_add_notb[9]) );
  AOI22_X1 fc_pe_b_peij_2_0_add_fai_0_U2 ( .A1(fc_pe_b_peij_2_0_add_notb[0]), 
        .A2(o_data3[33]), .B1(fc_pe_b_peij_2_0_add_fai_0_n5), .B2(
        fc_pe_b_peij_2_0_q_k), .ZN(fc_pe_b_peij_2_0_add_fai_0_n4) );
  INV_X1 fc_pe_b_peij_2_0_add_fai_0_U1 ( .A(fc_pe_b_peij_2_0_add_fai_0_n4), 
        .ZN(fc_pe_b_peij_2_0_add_cprop[1]) );
  XOR2_X1 fc_pe_b_peij_2_0_add_fai_0_U4 ( .A(o_data3[33]), .B(
        fc_pe_b_peij_2_0_add_notb[0]), .Z(fc_pe_b_peij_2_0_add_fai_0_n5) );
  XOR2_X1 fc_pe_b_peij_2_0_add_fai_0_U3 ( .A(fc_pe_b_peij_2_0_q_k), .B(
        fc_pe_b_peij_2_0_add_fai_0_n5), .Z(fc_pe_b_peij_2_0_d_acc[0]) );
  AOI22_X1 fc_pe_b_peij_2_0_add_fai_1_U2 ( .A1(fc_pe_b_peij_2_0_add_notb[1]), 
        .A2(o_data3[34]), .B1(fc_pe_b_peij_2_0_add_fai_1_n5), .B2(
        fc_pe_b_peij_2_0_add_cprop[1]), .ZN(fc_pe_b_peij_2_0_add_fai_1_n4) );
  INV_X1 fc_pe_b_peij_2_0_add_fai_1_U1 ( .A(fc_pe_b_peij_2_0_add_fai_1_n4), 
        .ZN(fc_pe_b_peij_2_0_add_cprop[2]) );
  XOR2_X1 fc_pe_b_peij_2_0_add_fai_1_U4 ( .A(o_data3[34]), .B(
        fc_pe_b_peij_2_0_add_notb[1]), .Z(fc_pe_b_peij_2_0_add_fai_1_n5) );
  XOR2_X1 fc_pe_b_peij_2_0_add_fai_1_U3 ( .A(fc_pe_b_peij_2_0_add_cprop[1]), 
        .B(fc_pe_b_peij_2_0_add_fai_1_n5), .Z(fc_pe_b_peij_2_0_d_acc[1]) );
  AOI22_X1 fc_pe_b_peij_2_0_add_fai_2_U2 ( .A1(fc_pe_b_peij_2_0_add_notb[2]), 
        .A2(o_data3[35]), .B1(fc_pe_b_peij_2_0_add_fai_2_n5), .B2(
        fc_pe_b_peij_2_0_add_cprop[2]), .ZN(fc_pe_b_peij_2_0_add_fai_2_n4) );
  INV_X1 fc_pe_b_peij_2_0_add_fai_2_U1 ( .A(fc_pe_b_peij_2_0_add_fai_2_n4), 
        .ZN(fc_pe_b_peij_2_0_add_cprop[3]) );
  XOR2_X1 fc_pe_b_peij_2_0_add_fai_2_U4 ( .A(o_data3[35]), .B(
        fc_pe_b_peij_2_0_add_notb[2]), .Z(fc_pe_b_peij_2_0_add_fai_2_n5) );
  XOR2_X1 fc_pe_b_peij_2_0_add_fai_2_U3 ( .A(fc_pe_b_peij_2_0_add_cprop[2]), 
        .B(fc_pe_b_peij_2_0_add_fai_2_n5), .Z(fc_pe_b_peij_2_0_d_acc[2]) );
  AOI22_X1 fc_pe_b_peij_2_0_add_fai_3_U2 ( .A1(fc_pe_b_peij_2_0_add_notb[3]), 
        .A2(o_data3[36]), .B1(fc_pe_b_peij_2_0_add_fai_3_n5), .B2(
        fc_pe_b_peij_2_0_add_cprop[3]), .ZN(fc_pe_b_peij_2_0_add_fai_3_n4) );
  INV_X1 fc_pe_b_peij_2_0_add_fai_3_U1 ( .A(fc_pe_b_peij_2_0_add_fai_3_n4), 
        .ZN(fc_pe_b_peij_2_0_add_cprop[4]) );
  XOR2_X1 fc_pe_b_peij_2_0_add_fai_3_U4 ( .A(o_data3[36]), .B(
        fc_pe_b_peij_2_0_add_notb[3]), .Z(fc_pe_b_peij_2_0_add_fai_3_n5) );
  XOR2_X1 fc_pe_b_peij_2_0_add_fai_3_U3 ( .A(fc_pe_b_peij_2_0_add_cprop[3]), 
        .B(fc_pe_b_peij_2_0_add_fai_3_n5), .Z(fc_pe_b_peij_2_0_d_acc[3]) );
  AOI22_X1 fc_pe_b_peij_2_0_add_fai_4_U2 ( .A1(fc_pe_b_peij_2_0_add_notb[4]), 
        .A2(o_data3[37]), .B1(fc_pe_b_peij_2_0_add_fai_4_n5), .B2(
        fc_pe_b_peij_2_0_add_cprop[4]), .ZN(fc_pe_b_peij_2_0_add_fai_4_n4) );
  INV_X1 fc_pe_b_peij_2_0_add_fai_4_U1 ( .A(fc_pe_b_peij_2_0_add_fai_4_n4), 
        .ZN(fc_pe_b_peij_2_0_add_cprop[5]) );
  XOR2_X1 fc_pe_b_peij_2_0_add_fai_4_U4 ( .A(o_data3[37]), .B(
        fc_pe_b_peij_2_0_add_notb[4]), .Z(fc_pe_b_peij_2_0_add_fai_4_n5) );
  XOR2_X1 fc_pe_b_peij_2_0_add_fai_4_U3 ( .A(fc_pe_b_peij_2_0_add_cprop[4]), 
        .B(fc_pe_b_peij_2_0_add_fai_4_n5), .Z(fc_pe_b_peij_2_0_d_acc[4]) );
  AOI22_X1 fc_pe_b_peij_2_0_add_fai_5_U2 ( .A1(fc_pe_b_peij_2_0_add_notb[5]), 
        .A2(o_data3[38]), .B1(fc_pe_b_peij_2_0_add_fai_5_n5), .B2(
        fc_pe_b_peij_2_0_add_cprop[5]), .ZN(fc_pe_b_peij_2_0_add_fai_5_n4) );
  INV_X1 fc_pe_b_peij_2_0_add_fai_5_U1 ( .A(fc_pe_b_peij_2_0_add_fai_5_n4), 
        .ZN(fc_pe_b_peij_2_0_add_cprop[6]) );
  XOR2_X1 fc_pe_b_peij_2_0_add_fai_5_U4 ( .A(o_data3[38]), .B(
        fc_pe_b_peij_2_0_add_notb[5]), .Z(fc_pe_b_peij_2_0_add_fai_5_n5) );
  XOR2_X1 fc_pe_b_peij_2_0_add_fai_5_U3 ( .A(fc_pe_b_peij_2_0_add_cprop[5]), 
        .B(fc_pe_b_peij_2_0_add_fai_5_n5), .Z(fc_pe_b_peij_2_0_d_acc[5]) );
  AOI22_X1 fc_pe_b_peij_2_0_add_fai_6_U2 ( .A1(fc_pe_b_peij_2_0_add_notb[6]), 
        .A2(o_data3[39]), .B1(fc_pe_b_peij_2_0_add_fai_6_n5), .B2(
        fc_pe_b_peij_2_0_add_cprop[6]), .ZN(fc_pe_b_peij_2_0_add_fai_6_n4) );
  INV_X1 fc_pe_b_peij_2_0_add_fai_6_U1 ( .A(fc_pe_b_peij_2_0_add_fai_6_n4), 
        .ZN(fc_pe_b_peij_2_0_add_cprop[7]) );
  XOR2_X1 fc_pe_b_peij_2_0_add_fai_6_U4 ( .A(o_data3[39]), .B(
        fc_pe_b_peij_2_0_add_notb[6]), .Z(fc_pe_b_peij_2_0_add_fai_6_n5) );
  XOR2_X1 fc_pe_b_peij_2_0_add_fai_6_U3 ( .A(fc_pe_b_peij_2_0_add_cprop[6]), 
        .B(fc_pe_b_peij_2_0_add_fai_6_n5), .Z(fc_pe_b_peij_2_0_d_acc[6]) );
  AOI22_X1 fc_pe_b_peij_2_0_add_fai_7_U2 ( .A1(fc_pe_b_peij_2_0_add_notb[7]), 
        .A2(o_data3[40]), .B1(fc_pe_b_peij_2_0_add_fai_7_n5), .B2(
        fc_pe_b_peij_2_0_add_cprop[7]), .ZN(fc_pe_b_peij_2_0_add_fai_7_n4) );
  INV_X1 fc_pe_b_peij_2_0_add_fai_7_U1 ( .A(fc_pe_b_peij_2_0_add_fai_7_n4), 
        .ZN(fc_pe_b_peij_2_0_add_cprop[8]) );
  XOR2_X1 fc_pe_b_peij_2_0_add_fai_7_U4 ( .A(o_data3[40]), .B(
        fc_pe_b_peij_2_0_add_notb[7]), .Z(fc_pe_b_peij_2_0_add_fai_7_n5) );
  XOR2_X1 fc_pe_b_peij_2_0_add_fai_7_U3 ( .A(fc_pe_b_peij_2_0_add_cprop[7]), 
        .B(fc_pe_b_peij_2_0_add_fai_7_n5), .Z(fc_pe_b_peij_2_0_d_acc[7]) );
  AOI22_X1 fc_pe_b_peij_2_0_add_fai_8_U2 ( .A1(fc_pe_b_peij_2_0_add_notb[8]), 
        .A2(o_data3[41]), .B1(fc_pe_b_peij_2_0_add_fai_8_n5), .B2(
        fc_pe_b_peij_2_0_add_cprop[8]), .ZN(fc_pe_b_peij_2_0_add_fai_8_n4) );
  INV_X1 fc_pe_b_peij_2_0_add_fai_8_U1 ( .A(fc_pe_b_peij_2_0_add_fai_8_n4), 
        .ZN(fc_pe_b_peij_2_0_add_cprop[9]) );
  XOR2_X1 fc_pe_b_peij_2_0_add_fai_8_U4 ( .A(o_data3[41]), .B(
        fc_pe_b_peij_2_0_add_notb[8]), .Z(fc_pe_b_peij_2_0_add_fai_8_n5) );
  XOR2_X1 fc_pe_b_peij_2_0_add_fai_8_U3 ( .A(fc_pe_b_peij_2_0_add_cprop[8]), 
        .B(fc_pe_b_peij_2_0_add_fai_8_n5), .Z(fc_pe_b_peij_2_0_d_acc[8]) );
  AOI22_X1 fc_pe_b_peij_2_0_add_fai_9_U2 ( .A1(fc_pe_b_peij_2_0_add_notb[9]), 
        .A2(o_data3[42]), .B1(fc_pe_b_peij_2_0_add_fai_9_n5), .B2(
        fc_pe_b_peij_2_0_add_cprop[9]), .ZN(fc_pe_b_peij_2_0_add_fai_9_n4) );
  INV_X1 fc_pe_b_peij_2_0_add_fai_9_U1 ( .A(fc_pe_b_peij_2_0_add_fai_9_n4), 
        .ZN(fc_pe_b_peij_2_0_add_cprop[10]) );
  XOR2_X1 fc_pe_b_peij_2_0_add_fai_9_U4 ( .A(o_data3[42]), .B(
        fc_pe_b_peij_2_0_add_notb[9]), .Z(fc_pe_b_peij_2_0_add_fai_9_n5) );
  XOR2_X1 fc_pe_b_peij_2_0_add_fai_9_U3 ( .A(fc_pe_b_peij_2_0_add_cprop[9]), 
        .B(fc_pe_b_peij_2_0_add_fai_9_n5), .Z(fc_pe_b_peij_2_0_d_acc[9]) );
  AOI22_X1 fc_pe_b_peij_2_0_add_fai_10_U2 ( .A1(fc_pe_b_peij_2_0_add_notb[10]), 
        .A2(o_data3[43]), .B1(fc_pe_b_peij_2_0_add_fai_10_n5), .B2(
        fc_pe_b_peij_2_0_add_cprop[10]), .ZN(fc_pe_b_peij_2_0_add_fai_10_n4)
         );
  INV_X1 fc_pe_b_peij_2_0_add_fai_10_U1 ( .A(fc_pe_b_peij_2_0_add_fai_10_n4), 
        .ZN(fc_pe_b_peij_2_0_add_c_out) );
  XOR2_X1 fc_pe_b_peij_2_0_add_fai_10_U4 ( .A(o_data3[43]), .B(
        fc_pe_b_peij_2_0_add_notb[10]), .Z(fc_pe_b_peij_2_0_add_fai_10_n5) );
  XOR2_X1 fc_pe_b_peij_2_0_add_fai_10_U3 ( .A(fc_pe_b_peij_2_0_add_cprop[10]), 
        .B(fc_pe_b_peij_2_0_add_fai_10_n5), .Z(fc_pe_b_peij_2_0_d_acc[10]) );
  AND3_X1 fc_pe_b_peij_2_1_U22 ( .A1(fc_pe_b_int_pe_en[6]), .A2(clk), .A3(
        i_kernel3[4]), .ZN(fc_pe_b_peij_2_1_gck) );
  AND2_X1 fc_pe_b_peij_2_1_U21 ( .A1(i_data[3]), .A2(fc_pe_b_peij_2_1_n16), 
        .ZN(fc_pe_b_peij_2_1_N35) );
  AND2_X1 fc_pe_b_peij_2_1_U20 ( .A1(i_data[2]), .A2(fc_pe_b_peij_2_1_n16), 
        .ZN(fc_pe_b_peij_2_1_N34) );
  AND2_X1 fc_pe_b_peij_2_1_U19 ( .A1(i_data[1]), .A2(fc_pe_b_peij_2_1_n16), 
        .ZN(fc_pe_b_peij_2_1_N33) );
  AND2_X1 fc_pe_b_peij_2_1_U18 ( .A1(i_data[0]), .A2(fc_pe_b_peij_2_1_n16), 
        .ZN(fc_pe_b_peij_2_1_N32) );
  AND3_X1 fc_pe_b_peij_2_1_U17 ( .A1(fc_pe_b_int_pe_en[6]), .A2(
        fc_pe_b_peij_2_1_n14), .A3(i_kernel3[4]), .ZN(fc_pe_b_peij_2_1_n16) );
  INV_X1 fc_pe_b_peij_2_1_U16 ( .A(tb_rst_cnt2), .ZN(fc_pe_b_peij_2_1_n12) );
  INV_X1 fc_pe_b_peij_2_1_U14 ( .A(tb_rst_cnt1), .ZN(fc_pe_b_peij_2_1_n14) );
  SDFFR_X1 fc_pe_b_peij_2_1_q_acc_reg_10_ ( .D(1'b0), .SI(fc_pe_b_peij_2_1_n14), .SE(fc_pe_b_peij_2_1_d_acc[10]), .CK(fc_pe_b_peij_2_1_gck), .RN(
        fc_pe_b_peij_2_1_n12), .Q(o_data3[32]) );
  SDFFR_X1 fc_pe_b_peij_2_1_q_acc_reg_9_ ( .D(1'b0), .SI(fc_pe_b_peij_2_1_n14), 
        .SE(fc_pe_b_peij_2_1_d_acc[9]), .CK(fc_pe_b_peij_2_1_gck), .RN(
        fc_pe_b_peij_2_1_n12), .Q(o_data3[31]) );
  SDFFR_X1 fc_pe_b_peij_2_1_q_acc_reg_8_ ( .D(1'b0), .SI(fc_pe_b_peij_2_1_n14), 
        .SE(fc_pe_b_peij_2_1_d_acc[8]), .CK(fc_pe_b_peij_2_1_gck), .RN(
        fc_pe_b_peij_2_1_n12), .Q(o_data3[30]) );
  SDFFR_X1 fc_pe_b_peij_2_1_q_acc_reg_7_ ( .D(1'b0), .SI(fc_pe_b_peij_2_1_n14), 
        .SE(fc_pe_b_peij_2_1_d_acc[7]), .CK(fc_pe_b_peij_2_1_gck), .RN(
        fc_pe_b_peij_2_1_n12), .Q(o_data3[29]) );
  SDFFR_X1 fc_pe_b_peij_2_1_q_acc_reg_6_ ( .D(1'b0), .SI(fc_pe_b_peij_2_1_n14), 
        .SE(fc_pe_b_peij_2_1_d_acc[6]), .CK(fc_pe_b_peij_2_1_gck), .RN(
        fc_pe_b_peij_2_1_n12), .Q(o_data3[28]) );
  SDFFR_X1 fc_pe_b_peij_2_1_q_acc_reg_5_ ( .D(1'b0), .SI(fc_pe_b_peij_2_1_n14), 
        .SE(fc_pe_b_peij_2_1_d_acc[5]), .CK(fc_pe_b_peij_2_1_gck), .RN(
        fc_pe_b_peij_2_1_n12), .Q(o_data3[27]) );
  SDFFR_X1 fc_pe_b_peij_2_1_q_acc_reg_4_ ( .D(1'b0), .SI(fc_pe_b_peij_2_1_n14), 
        .SE(fc_pe_b_peij_2_1_d_acc[4]), .CK(fc_pe_b_peij_2_1_gck), .RN(
        fc_pe_b_peij_2_1_n12), .Q(o_data3[26]) );
  SDFFR_X1 fc_pe_b_peij_2_1_q_acc_reg_3_ ( .D(1'b0), .SI(fc_pe_b_peij_2_1_n14), 
        .SE(fc_pe_b_peij_2_1_d_acc[3]), .CK(fc_pe_b_peij_2_1_gck), .RN(
        fc_pe_b_peij_2_1_n12), .Q(o_data3[25]) );
  SDFFR_X1 fc_pe_b_peij_2_1_q_acc_reg_2_ ( .D(1'b0), .SI(fc_pe_b_peij_2_1_n14), 
        .SE(fc_pe_b_peij_2_1_d_acc[2]), .CK(fc_pe_b_peij_2_1_gck), .RN(
        fc_pe_b_peij_2_1_n12), .Q(o_data3[24]) );
  SDFFR_X1 fc_pe_b_peij_2_1_q_acc_reg_1_ ( .D(1'b0), .SI(fc_pe_b_peij_2_1_n14), 
        .SE(fc_pe_b_peij_2_1_d_acc[1]), .CK(fc_pe_b_peij_2_1_gck), .RN(
        fc_pe_b_peij_2_1_n12), .Q(o_data3[23]) );
  SDFFR_X1 fc_pe_b_peij_2_1_q_acc_reg_0_ ( .D(1'b0), .SI(fc_pe_b_peij_2_1_n14), 
        .SE(fc_pe_b_peij_2_1_d_acc[0]), .CK(fc_pe_b_peij_2_1_gck), .RN(
        fc_pe_b_peij_2_1_n12), .Q(o_data3[22]) );
  DFFR_X1 fc_pe_b_peij_2_1_q_im_reg_0_ ( .D(fc_pe_b_peij_2_1_N32), .CK(
        fc_pe_b_peij_2_1_gck), .RN(fc_pe_b_peij_2_1_n12), .Q(
        fc_pe_b_peij_2_1_sgnext[0]) );
  DFFR_X1 fc_pe_b_peij_2_1_q_im_reg_1_ ( .D(fc_pe_b_peij_2_1_N33), .CK(
        fc_pe_b_peij_2_1_gck), .RN(fc_pe_b_peij_2_1_n12), .Q(
        fc_pe_b_peij_2_1_sgnext[1]) );
  DFFR_X1 fc_pe_b_peij_2_1_q_im_reg_2_ ( .D(fc_pe_b_peij_2_1_N34), .CK(
        fc_pe_b_peij_2_1_gck), .RN(fc_pe_b_peij_2_1_n12), .Q(
        fc_pe_b_peij_2_1_sgnext[2]) );
  DFFR_X1 fc_pe_b_peij_2_1_q_im_reg_3_ ( .D(fc_pe_b_peij_2_1_N35), .CK(
        fc_pe_b_peij_2_1_gck), .RN(fc_pe_b_peij_2_1_n12), .Q(
        fc_pe_b_peij_2_1_sgnext_10) );
  SDFFR_X1 fc_pe_b_peij_2_1_q_k_reg ( .D(1'b0), .SI(fc_pe_b_peij_2_1_n14), 
        .SE(i_kernel3[5]), .CK(fc_pe_b_peij_2_1_gck), .RN(fc_pe_b_peij_2_1_n12), .Q(fc_pe_b_peij_2_1_q_k) );
  XOR2_X1 fc_pe_b_peij_2_1_add_U11 ( .A(fc_pe_b_peij_2_1_sgnext[0]), .B(
        fc_pe_b_peij_2_1_q_k), .Z(fc_pe_b_peij_2_1_add_notb[0]) );
  XOR2_X1 fc_pe_b_peij_2_1_add_U10 ( .A(fc_pe_b_peij_2_1_sgnext_10), .B(
        fc_pe_b_peij_2_1_q_k), .Z(fc_pe_b_peij_2_1_add_notb[10]) );
  XOR2_X1 fc_pe_b_peij_2_1_add_U9 ( .A(fc_pe_b_peij_2_1_sgnext[1]), .B(
        fc_pe_b_peij_2_1_q_k), .Z(fc_pe_b_peij_2_1_add_notb[1]) );
  XOR2_X1 fc_pe_b_peij_2_1_add_U8 ( .A(fc_pe_b_peij_2_1_sgnext[2]), .B(
        fc_pe_b_peij_2_1_q_k), .Z(fc_pe_b_peij_2_1_add_notb[2]) );
  XOR2_X1 fc_pe_b_peij_2_1_add_U7 ( .A(fc_pe_b_peij_2_1_sgnext_10), .B(
        fc_pe_b_peij_2_1_q_k), .Z(fc_pe_b_peij_2_1_add_notb[3]) );
  XOR2_X1 fc_pe_b_peij_2_1_add_U6 ( .A(fc_pe_b_peij_2_1_sgnext_10), .B(
        fc_pe_b_peij_2_1_q_k), .Z(fc_pe_b_peij_2_1_add_notb[4]) );
  XOR2_X1 fc_pe_b_peij_2_1_add_U5 ( .A(fc_pe_b_peij_2_1_sgnext_10), .B(
        fc_pe_b_peij_2_1_q_k), .Z(fc_pe_b_peij_2_1_add_notb[5]) );
  XOR2_X1 fc_pe_b_peij_2_1_add_U4 ( .A(fc_pe_b_peij_2_1_sgnext_10), .B(
        fc_pe_b_peij_2_1_q_k), .Z(fc_pe_b_peij_2_1_add_notb[6]) );
  XOR2_X1 fc_pe_b_peij_2_1_add_U3 ( .A(fc_pe_b_peij_2_1_sgnext_10), .B(
        fc_pe_b_peij_2_1_q_k), .Z(fc_pe_b_peij_2_1_add_notb[7]) );
  XOR2_X1 fc_pe_b_peij_2_1_add_U2 ( .A(fc_pe_b_peij_2_1_sgnext_10), .B(
        fc_pe_b_peij_2_1_q_k), .Z(fc_pe_b_peij_2_1_add_notb[8]) );
  XOR2_X1 fc_pe_b_peij_2_1_add_U1 ( .A(fc_pe_b_peij_2_1_sgnext_10), .B(
        fc_pe_b_peij_2_1_q_k), .Z(fc_pe_b_peij_2_1_add_notb[9]) );
  AOI22_X1 fc_pe_b_peij_2_1_add_fai_0_U2 ( .A1(fc_pe_b_peij_2_1_add_notb[0]), 
        .A2(o_data3[22]), .B1(fc_pe_b_peij_2_1_add_fai_0_n5), .B2(
        fc_pe_b_peij_2_1_q_k), .ZN(fc_pe_b_peij_2_1_add_fai_0_n4) );
  INV_X1 fc_pe_b_peij_2_1_add_fai_0_U1 ( .A(fc_pe_b_peij_2_1_add_fai_0_n4), 
        .ZN(fc_pe_b_peij_2_1_add_cprop[1]) );
  XOR2_X1 fc_pe_b_peij_2_1_add_fai_0_U4 ( .A(o_data3[22]), .B(
        fc_pe_b_peij_2_1_add_notb[0]), .Z(fc_pe_b_peij_2_1_add_fai_0_n5) );
  XOR2_X1 fc_pe_b_peij_2_1_add_fai_0_U3 ( .A(fc_pe_b_peij_2_1_q_k), .B(
        fc_pe_b_peij_2_1_add_fai_0_n5), .Z(fc_pe_b_peij_2_1_d_acc[0]) );
  AOI22_X1 fc_pe_b_peij_2_1_add_fai_1_U2 ( .A1(fc_pe_b_peij_2_1_add_notb[1]), 
        .A2(o_data3[23]), .B1(fc_pe_b_peij_2_1_add_fai_1_n5), .B2(
        fc_pe_b_peij_2_1_add_cprop[1]), .ZN(fc_pe_b_peij_2_1_add_fai_1_n4) );
  INV_X1 fc_pe_b_peij_2_1_add_fai_1_U1 ( .A(fc_pe_b_peij_2_1_add_fai_1_n4), 
        .ZN(fc_pe_b_peij_2_1_add_cprop[2]) );
  XOR2_X1 fc_pe_b_peij_2_1_add_fai_1_U4 ( .A(o_data3[23]), .B(
        fc_pe_b_peij_2_1_add_notb[1]), .Z(fc_pe_b_peij_2_1_add_fai_1_n5) );
  XOR2_X1 fc_pe_b_peij_2_1_add_fai_1_U3 ( .A(fc_pe_b_peij_2_1_add_cprop[1]), 
        .B(fc_pe_b_peij_2_1_add_fai_1_n5), .Z(fc_pe_b_peij_2_1_d_acc[1]) );
  AOI22_X1 fc_pe_b_peij_2_1_add_fai_2_U2 ( .A1(fc_pe_b_peij_2_1_add_notb[2]), 
        .A2(o_data3[24]), .B1(fc_pe_b_peij_2_1_add_fai_2_n5), .B2(
        fc_pe_b_peij_2_1_add_cprop[2]), .ZN(fc_pe_b_peij_2_1_add_fai_2_n4) );
  INV_X1 fc_pe_b_peij_2_1_add_fai_2_U1 ( .A(fc_pe_b_peij_2_1_add_fai_2_n4), 
        .ZN(fc_pe_b_peij_2_1_add_cprop[3]) );
  XOR2_X1 fc_pe_b_peij_2_1_add_fai_2_U4 ( .A(o_data3[24]), .B(
        fc_pe_b_peij_2_1_add_notb[2]), .Z(fc_pe_b_peij_2_1_add_fai_2_n5) );
  XOR2_X1 fc_pe_b_peij_2_1_add_fai_2_U3 ( .A(fc_pe_b_peij_2_1_add_cprop[2]), 
        .B(fc_pe_b_peij_2_1_add_fai_2_n5), .Z(fc_pe_b_peij_2_1_d_acc[2]) );
  AOI22_X1 fc_pe_b_peij_2_1_add_fai_3_U2 ( .A1(fc_pe_b_peij_2_1_add_notb[3]), 
        .A2(o_data3[25]), .B1(fc_pe_b_peij_2_1_add_fai_3_n5), .B2(
        fc_pe_b_peij_2_1_add_cprop[3]), .ZN(fc_pe_b_peij_2_1_add_fai_3_n4) );
  INV_X1 fc_pe_b_peij_2_1_add_fai_3_U1 ( .A(fc_pe_b_peij_2_1_add_fai_3_n4), 
        .ZN(fc_pe_b_peij_2_1_add_cprop[4]) );
  XOR2_X1 fc_pe_b_peij_2_1_add_fai_3_U4 ( .A(o_data3[25]), .B(
        fc_pe_b_peij_2_1_add_notb[3]), .Z(fc_pe_b_peij_2_1_add_fai_3_n5) );
  XOR2_X1 fc_pe_b_peij_2_1_add_fai_3_U3 ( .A(fc_pe_b_peij_2_1_add_cprop[3]), 
        .B(fc_pe_b_peij_2_1_add_fai_3_n5), .Z(fc_pe_b_peij_2_1_d_acc[3]) );
  AOI22_X1 fc_pe_b_peij_2_1_add_fai_4_U2 ( .A1(fc_pe_b_peij_2_1_add_notb[4]), 
        .A2(o_data3[26]), .B1(fc_pe_b_peij_2_1_add_fai_4_n5), .B2(
        fc_pe_b_peij_2_1_add_cprop[4]), .ZN(fc_pe_b_peij_2_1_add_fai_4_n4) );
  INV_X1 fc_pe_b_peij_2_1_add_fai_4_U1 ( .A(fc_pe_b_peij_2_1_add_fai_4_n4), 
        .ZN(fc_pe_b_peij_2_1_add_cprop[5]) );
  XOR2_X1 fc_pe_b_peij_2_1_add_fai_4_U4 ( .A(o_data3[26]), .B(
        fc_pe_b_peij_2_1_add_notb[4]), .Z(fc_pe_b_peij_2_1_add_fai_4_n5) );
  XOR2_X1 fc_pe_b_peij_2_1_add_fai_4_U3 ( .A(fc_pe_b_peij_2_1_add_cprop[4]), 
        .B(fc_pe_b_peij_2_1_add_fai_4_n5), .Z(fc_pe_b_peij_2_1_d_acc[4]) );
  AOI22_X1 fc_pe_b_peij_2_1_add_fai_5_U2 ( .A1(fc_pe_b_peij_2_1_add_notb[5]), 
        .A2(o_data3[27]), .B1(fc_pe_b_peij_2_1_add_fai_5_n5), .B2(
        fc_pe_b_peij_2_1_add_cprop[5]), .ZN(fc_pe_b_peij_2_1_add_fai_5_n4) );
  INV_X1 fc_pe_b_peij_2_1_add_fai_5_U1 ( .A(fc_pe_b_peij_2_1_add_fai_5_n4), 
        .ZN(fc_pe_b_peij_2_1_add_cprop[6]) );
  XOR2_X1 fc_pe_b_peij_2_1_add_fai_5_U4 ( .A(o_data3[27]), .B(
        fc_pe_b_peij_2_1_add_notb[5]), .Z(fc_pe_b_peij_2_1_add_fai_5_n5) );
  XOR2_X1 fc_pe_b_peij_2_1_add_fai_5_U3 ( .A(fc_pe_b_peij_2_1_add_cprop[5]), 
        .B(fc_pe_b_peij_2_1_add_fai_5_n5), .Z(fc_pe_b_peij_2_1_d_acc[5]) );
  AOI22_X1 fc_pe_b_peij_2_1_add_fai_6_U2 ( .A1(fc_pe_b_peij_2_1_add_notb[6]), 
        .A2(o_data3[28]), .B1(fc_pe_b_peij_2_1_add_fai_6_n5), .B2(
        fc_pe_b_peij_2_1_add_cprop[6]), .ZN(fc_pe_b_peij_2_1_add_fai_6_n4) );
  INV_X1 fc_pe_b_peij_2_1_add_fai_6_U1 ( .A(fc_pe_b_peij_2_1_add_fai_6_n4), 
        .ZN(fc_pe_b_peij_2_1_add_cprop[7]) );
  XOR2_X1 fc_pe_b_peij_2_1_add_fai_6_U4 ( .A(o_data3[28]), .B(
        fc_pe_b_peij_2_1_add_notb[6]), .Z(fc_pe_b_peij_2_1_add_fai_6_n5) );
  XOR2_X1 fc_pe_b_peij_2_1_add_fai_6_U3 ( .A(fc_pe_b_peij_2_1_add_cprop[6]), 
        .B(fc_pe_b_peij_2_1_add_fai_6_n5), .Z(fc_pe_b_peij_2_1_d_acc[6]) );
  AOI22_X1 fc_pe_b_peij_2_1_add_fai_7_U2 ( .A1(fc_pe_b_peij_2_1_add_notb[7]), 
        .A2(o_data3[29]), .B1(fc_pe_b_peij_2_1_add_fai_7_n5), .B2(
        fc_pe_b_peij_2_1_add_cprop[7]), .ZN(fc_pe_b_peij_2_1_add_fai_7_n4) );
  INV_X1 fc_pe_b_peij_2_1_add_fai_7_U1 ( .A(fc_pe_b_peij_2_1_add_fai_7_n4), 
        .ZN(fc_pe_b_peij_2_1_add_cprop[8]) );
  XOR2_X1 fc_pe_b_peij_2_1_add_fai_7_U4 ( .A(o_data3[29]), .B(
        fc_pe_b_peij_2_1_add_notb[7]), .Z(fc_pe_b_peij_2_1_add_fai_7_n5) );
  XOR2_X1 fc_pe_b_peij_2_1_add_fai_7_U3 ( .A(fc_pe_b_peij_2_1_add_cprop[7]), 
        .B(fc_pe_b_peij_2_1_add_fai_7_n5), .Z(fc_pe_b_peij_2_1_d_acc[7]) );
  AOI22_X1 fc_pe_b_peij_2_1_add_fai_8_U2 ( .A1(fc_pe_b_peij_2_1_add_notb[8]), 
        .A2(o_data3[30]), .B1(fc_pe_b_peij_2_1_add_fai_8_n5), .B2(
        fc_pe_b_peij_2_1_add_cprop[8]), .ZN(fc_pe_b_peij_2_1_add_fai_8_n4) );
  INV_X1 fc_pe_b_peij_2_1_add_fai_8_U1 ( .A(fc_pe_b_peij_2_1_add_fai_8_n4), 
        .ZN(fc_pe_b_peij_2_1_add_cprop[9]) );
  XOR2_X1 fc_pe_b_peij_2_1_add_fai_8_U4 ( .A(o_data3[30]), .B(
        fc_pe_b_peij_2_1_add_notb[8]), .Z(fc_pe_b_peij_2_1_add_fai_8_n5) );
  XOR2_X1 fc_pe_b_peij_2_1_add_fai_8_U3 ( .A(fc_pe_b_peij_2_1_add_cprop[8]), 
        .B(fc_pe_b_peij_2_1_add_fai_8_n5), .Z(fc_pe_b_peij_2_1_d_acc[8]) );
  AOI22_X1 fc_pe_b_peij_2_1_add_fai_9_U2 ( .A1(fc_pe_b_peij_2_1_add_notb[9]), 
        .A2(o_data3[31]), .B1(fc_pe_b_peij_2_1_add_fai_9_n5), .B2(
        fc_pe_b_peij_2_1_add_cprop[9]), .ZN(fc_pe_b_peij_2_1_add_fai_9_n4) );
  INV_X1 fc_pe_b_peij_2_1_add_fai_9_U1 ( .A(fc_pe_b_peij_2_1_add_fai_9_n4), 
        .ZN(fc_pe_b_peij_2_1_add_cprop[10]) );
  XOR2_X1 fc_pe_b_peij_2_1_add_fai_9_U4 ( .A(o_data3[31]), .B(
        fc_pe_b_peij_2_1_add_notb[9]), .Z(fc_pe_b_peij_2_1_add_fai_9_n5) );
  XOR2_X1 fc_pe_b_peij_2_1_add_fai_9_U3 ( .A(fc_pe_b_peij_2_1_add_cprop[9]), 
        .B(fc_pe_b_peij_2_1_add_fai_9_n5), .Z(fc_pe_b_peij_2_1_d_acc[9]) );
  AOI22_X1 fc_pe_b_peij_2_1_add_fai_10_U2 ( .A1(fc_pe_b_peij_2_1_add_notb[10]), 
        .A2(o_data3[32]), .B1(fc_pe_b_peij_2_1_add_fai_10_n5), .B2(
        fc_pe_b_peij_2_1_add_cprop[10]), .ZN(fc_pe_b_peij_2_1_add_fai_10_n4)
         );
  INV_X1 fc_pe_b_peij_2_1_add_fai_10_U1 ( .A(fc_pe_b_peij_2_1_add_fai_10_n4), 
        .ZN(fc_pe_b_peij_2_1_add_c_out) );
  XOR2_X1 fc_pe_b_peij_2_1_add_fai_10_U4 ( .A(o_data3[32]), .B(
        fc_pe_b_peij_2_1_add_notb[10]), .Z(fc_pe_b_peij_2_1_add_fai_10_n5) );
  XOR2_X1 fc_pe_b_peij_2_1_add_fai_10_U3 ( .A(fc_pe_b_peij_2_1_add_cprop[10]), 
        .B(fc_pe_b_peij_2_1_add_fai_10_n5), .Z(fc_pe_b_peij_2_1_d_acc[10]) );
  AND3_X1 fc_pe_b_peij_2_2_U22 ( .A1(fc_pe_b_int_pe_en[5]), .A2(clk), .A3(
        i_kernel3[2]), .ZN(fc_pe_b_peij_2_2_gck) );
  AND2_X1 fc_pe_b_peij_2_2_U21 ( .A1(i_data[3]), .A2(fc_pe_b_peij_2_2_n16), 
        .ZN(fc_pe_b_peij_2_2_N35) );
  AND2_X1 fc_pe_b_peij_2_2_U20 ( .A1(i_data[2]), .A2(fc_pe_b_peij_2_2_n16), 
        .ZN(fc_pe_b_peij_2_2_N34) );
  AND2_X1 fc_pe_b_peij_2_2_U19 ( .A1(i_data[1]), .A2(fc_pe_b_peij_2_2_n16), 
        .ZN(fc_pe_b_peij_2_2_N33) );
  AND2_X1 fc_pe_b_peij_2_2_U18 ( .A1(i_data[0]), .A2(fc_pe_b_peij_2_2_n16), 
        .ZN(fc_pe_b_peij_2_2_N32) );
  AND3_X1 fc_pe_b_peij_2_2_U17 ( .A1(fc_pe_b_int_pe_en[5]), .A2(
        fc_pe_b_peij_2_2_n14), .A3(i_kernel3[2]), .ZN(fc_pe_b_peij_2_2_n16) );
  INV_X1 fc_pe_b_peij_2_2_U16 ( .A(tb_rst_cnt2), .ZN(fc_pe_b_peij_2_2_n12) );
  INV_X1 fc_pe_b_peij_2_2_U14 ( .A(tb_rst_cnt1), .ZN(fc_pe_b_peij_2_2_n14) );
  SDFFR_X1 fc_pe_b_peij_2_2_q_acc_reg_10_ ( .D(1'b0), .SI(fc_pe_b_peij_2_2_n14), .SE(fc_pe_b_peij_2_2_d_acc[10]), .CK(fc_pe_b_peij_2_2_gck), .RN(
        fc_pe_b_peij_2_2_n12), .Q(o_data3[21]) );
  SDFFR_X1 fc_pe_b_peij_2_2_q_acc_reg_9_ ( .D(1'b0), .SI(fc_pe_b_peij_2_2_n14), 
        .SE(fc_pe_b_peij_2_2_d_acc[9]), .CK(fc_pe_b_peij_2_2_gck), .RN(
        fc_pe_b_peij_2_2_n12), .Q(o_data3[20]) );
  SDFFR_X1 fc_pe_b_peij_2_2_q_acc_reg_8_ ( .D(1'b0), .SI(fc_pe_b_peij_2_2_n14), 
        .SE(fc_pe_b_peij_2_2_d_acc[8]), .CK(fc_pe_b_peij_2_2_gck), .RN(
        fc_pe_b_peij_2_2_n12), .Q(o_data3[19]) );
  SDFFR_X1 fc_pe_b_peij_2_2_q_acc_reg_7_ ( .D(1'b0), .SI(fc_pe_b_peij_2_2_n14), 
        .SE(fc_pe_b_peij_2_2_d_acc[7]), .CK(fc_pe_b_peij_2_2_gck), .RN(
        fc_pe_b_peij_2_2_n12), .Q(o_data3[18]) );
  SDFFR_X1 fc_pe_b_peij_2_2_q_acc_reg_6_ ( .D(1'b0), .SI(fc_pe_b_peij_2_2_n14), 
        .SE(fc_pe_b_peij_2_2_d_acc[6]), .CK(fc_pe_b_peij_2_2_gck), .RN(
        fc_pe_b_peij_2_2_n12), .Q(o_data3[17]) );
  SDFFR_X1 fc_pe_b_peij_2_2_q_acc_reg_5_ ( .D(1'b0), .SI(fc_pe_b_peij_2_2_n14), 
        .SE(fc_pe_b_peij_2_2_d_acc[5]), .CK(fc_pe_b_peij_2_2_gck), .RN(
        fc_pe_b_peij_2_2_n12), .Q(o_data3[16]) );
  SDFFR_X1 fc_pe_b_peij_2_2_q_acc_reg_4_ ( .D(1'b0), .SI(fc_pe_b_peij_2_2_n14), 
        .SE(fc_pe_b_peij_2_2_d_acc[4]), .CK(fc_pe_b_peij_2_2_gck), .RN(
        fc_pe_b_peij_2_2_n12), .Q(o_data3[15]) );
  SDFFR_X1 fc_pe_b_peij_2_2_q_acc_reg_3_ ( .D(1'b0), .SI(fc_pe_b_peij_2_2_n14), 
        .SE(fc_pe_b_peij_2_2_d_acc[3]), .CK(fc_pe_b_peij_2_2_gck), .RN(
        fc_pe_b_peij_2_2_n12), .Q(o_data3[14]) );
  SDFFR_X1 fc_pe_b_peij_2_2_q_acc_reg_2_ ( .D(1'b0), .SI(fc_pe_b_peij_2_2_n14), 
        .SE(fc_pe_b_peij_2_2_d_acc[2]), .CK(fc_pe_b_peij_2_2_gck), .RN(
        fc_pe_b_peij_2_2_n12), .Q(o_data3[13]) );
  SDFFR_X1 fc_pe_b_peij_2_2_q_acc_reg_1_ ( .D(1'b0), .SI(fc_pe_b_peij_2_2_n14), 
        .SE(fc_pe_b_peij_2_2_d_acc[1]), .CK(fc_pe_b_peij_2_2_gck), .RN(
        fc_pe_b_peij_2_2_n12), .Q(o_data3[12]) );
  SDFFR_X1 fc_pe_b_peij_2_2_q_acc_reg_0_ ( .D(1'b0), .SI(fc_pe_b_peij_2_2_n14), 
        .SE(fc_pe_b_peij_2_2_d_acc[0]), .CK(fc_pe_b_peij_2_2_gck), .RN(
        fc_pe_b_peij_2_2_n12), .Q(o_data3[11]) );
  DFFR_X1 fc_pe_b_peij_2_2_q_im_reg_0_ ( .D(fc_pe_b_peij_2_2_N32), .CK(
        fc_pe_b_peij_2_2_gck), .RN(fc_pe_b_peij_2_2_n12), .Q(
        fc_pe_b_peij_2_2_sgnext[0]) );
  DFFR_X1 fc_pe_b_peij_2_2_q_im_reg_1_ ( .D(fc_pe_b_peij_2_2_N33), .CK(
        fc_pe_b_peij_2_2_gck), .RN(fc_pe_b_peij_2_2_n12), .Q(
        fc_pe_b_peij_2_2_sgnext[1]) );
  DFFR_X1 fc_pe_b_peij_2_2_q_im_reg_2_ ( .D(fc_pe_b_peij_2_2_N34), .CK(
        fc_pe_b_peij_2_2_gck), .RN(fc_pe_b_peij_2_2_n12), .Q(
        fc_pe_b_peij_2_2_sgnext[2]) );
  DFFR_X1 fc_pe_b_peij_2_2_q_im_reg_3_ ( .D(fc_pe_b_peij_2_2_N35), .CK(
        fc_pe_b_peij_2_2_gck), .RN(fc_pe_b_peij_2_2_n12), .Q(
        fc_pe_b_peij_2_2_sgnext_10) );
  SDFFR_X1 fc_pe_b_peij_2_2_q_k_reg ( .D(1'b0), .SI(fc_pe_b_peij_2_2_n14), 
        .SE(i_kernel3[3]), .CK(fc_pe_b_peij_2_2_gck), .RN(fc_pe_b_peij_2_2_n12), .Q(fc_pe_b_peij_2_2_q_k) );
  XOR2_X1 fc_pe_b_peij_2_2_add_U11 ( .A(fc_pe_b_peij_2_2_sgnext[0]), .B(
        fc_pe_b_peij_2_2_q_k), .Z(fc_pe_b_peij_2_2_add_notb[0]) );
  XOR2_X1 fc_pe_b_peij_2_2_add_U10 ( .A(fc_pe_b_peij_2_2_sgnext_10), .B(
        fc_pe_b_peij_2_2_q_k), .Z(fc_pe_b_peij_2_2_add_notb[10]) );
  XOR2_X1 fc_pe_b_peij_2_2_add_U9 ( .A(fc_pe_b_peij_2_2_sgnext[1]), .B(
        fc_pe_b_peij_2_2_q_k), .Z(fc_pe_b_peij_2_2_add_notb[1]) );
  XOR2_X1 fc_pe_b_peij_2_2_add_U8 ( .A(fc_pe_b_peij_2_2_sgnext[2]), .B(
        fc_pe_b_peij_2_2_q_k), .Z(fc_pe_b_peij_2_2_add_notb[2]) );
  XOR2_X1 fc_pe_b_peij_2_2_add_U7 ( .A(fc_pe_b_peij_2_2_sgnext_10), .B(
        fc_pe_b_peij_2_2_q_k), .Z(fc_pe_b_peij_2_2_add_notb[3]) );
  XOR2_X1 fc_pe_b_peij_2_2_add_U6 ( .A(fc_pe_b_peij_2_2_sgnext_10), .B(
        fc_pe_b_peij_2_2_q_k), .Z(fc_pe_b_peij_2_2_add_notb[4]) );
  XOR2_X1 fc_pe_b_peij_2_2_add_U5 ( .A(fc_pe_b_peij_2_2_sgnext_10), .B(
        fc_pe_b_peij_2_2_q_k), .Z(fc_pe_b_peij_2_2_add_notb[5]) );
  XOR2_X1 fc_pe_b_peij_2_2_add_U4 ( .A(fc_pe_b_peij_2_2_sgnext_10), .B(
        fc_pe_b_peij_2_2_q_k), .Z(fc_pe_b_peij_2_2_add_notb[6]) );
  XOR2_X1 fc_pe_b_peij_2_2_add_U3 ( .A(fc_pe_b_peij_2_2_sgnext_10), .B(
        fc_pe_b_peij_2_2_q_k), .Z(fc_pe_b_peij_2_2_add_notb[7]) );
  XOR2_X1 fc_pe_b_peij_2_2_add_U2 ( .A(fc_pe_b_peij_2_2_sgnext_10), .B(
        fc_pe_b_peij_2_2_q_k), .Z(fc_pe_b_peij_2_2_add_notb[8]) );
  XOR2_X1 fc_pe_b_peij_2_2_add_U1 ( .A(fc_pe_b_peij_2_2_sgnext_10), .B(
        fc_pe_b_peij_2_2_q_k), .Z(fc_pe_b_peij_2_2_add_notb[9]) );
  AOI22_X1 fc_pe_b_peij_2_2_add_fai_0_U2 ( .A1(fc_pe_b_peij_2_2_add_notb[0]), 
        .A2(o_data3[11]), .B1(fc_pe_b_peij_2_2_add_fai_0_n5), .B2(
        fc_pe_b_peij_2_2_q_k), .ZN(fc_pe_b_peij_2_2_add_fai_0_n4) );
  INV_X1 fc_pe_b_peij_2_2_add_fai_0_U1 ( .A(fc_pe_b_peij_2_2_add_fai_0_n4), 
        .ZN(fc_pe_b_peij_2_2_add_cprop[1]) );
  XOR2_X1 fc_pe_b_peij_2_2_add_fai_0_U4 ( .A(o_data3[11]), .B(
        fc_pe_b_peij_2_2_add_notb[0]), .Z(fc_pe_b_peij_2_2_add_fai_0_n5) );
  XOR2_X1 fc_pe_b_peij_2_2_add_fai_0_U3 ( .A(fc_pe_b_peij_2_2_q_k), .B(
        fc_pe_b_peij_2_2_add_fai_0_n5), .Z(fc_pe_b_peij_2_2_d_acc[0]) );
  AOI22_X1 fc_pe_b_peij_2_2_add_fai_1_U2 ( .A1(fc_pe_b_peij_2_2_add_notb[1]), 
        .A2(o_data3[12]), .B1(fc_pe_b_peij_2_2_add_fai_1_n5), .B2(
        fc_pe_b_peij_2_2_add_cprop[1]), .ZN(fc_pe_b_peij_2_2_add_fai_1_n4) );
  INV_X1 fc_pe_b_peij_2_2_add_fai_1_U1 ( .A(fc_pe_b_peij_2_2_add_fai_1_n4), 
        .ZN(fc_pe_b_peij_2_2_add_cprop[2]) );
  XOR2_X1 fc_pe_b_peij_2_2_add_fai_1_U4 ( .A(o_data3[12]), .B(
        fc_pe_b_peij_2_2_add_notb[1]), .Z(fc_pe_b_peij_2_2_add_fai_1_n5) );
  XOR2_X1 fc_pe_b_peij_2_2_add_fai_1_U3 ( .A(fc_pe_b_peij_2_2_add_cprop[1]), 
        .B(fc_pe_b_peij_2_2_add_fai_1_n5), .Z(fc_pe_b_peij_2_2_d_acc[1]) );
  AOI22_X1 fc_pe_b_peij_2_2_add_fai_2_U2 ( .A1(fc_pe_b_peij_2_2_add_notb[2]), 
        .A2(o_data3[13]), .B1(fc_pe_b_peij_2_2_add_fai_2_n5), .B2(
        fc_pe_b_peij_2_2_add_cprop[2]), .ZN(fc_pe_b_peij_2_2_add_fai_2_n4) );
  INV_X1 fc_pe_b_peij_2_2_add_fai_2_U1 ( .A(fc_pe_b_peij_2_2_add_fai_2_n4), 
        .ZN(fc_pe_b_peij_2_2_add_cprop[3]) );
  XOR2_X1 fc_pe_b_peij_2_2_add_fai_2_U4 ( .A(o_data3[13]), .B(
        fc_pe_b_peij_2_2_add_notb[2]), .Z(fc_pe_b_peij_2_2_add_fai_2_n5) );
  XOR2_X1 fc_pe_b_peij_2_2_add_fai_2_U3 ( .A(fc_pe_b_peij_2_2_add_cprop[2]), 
        .B(fc_pe_b_peij_2_2_add_fai_2_n5), .Z(fc_pe_b_peij_2_2_d_acc[2]) );
  AOI22_X1 fc_pe_b_peij_2_2_add_fai_3_U2 ( .A1(fc_pe_b_peij_2_2_add_notb[3]), 
        .A2(o_data3[14]), .B1(fc_pe_b_peij_2_2_add_fai_3_n5), .B2(
        fc_pe_b_peij_2_2_add_cprop[3]), .ZN(fc_pe_b_peij_2_2_add_fai_3_n4) );
  INV_X1 fc_pe_b_peij_2_2_add_fai_3_U1 ( .A(fc_pe_b_peij_2_2_add_fai_3_n4), 
        .ZN(fc_pe_b_peij_2_2_add_cprop[4]) );
  XOR2_X1 fc_pe_b_peij_2_2_add_fai_3_U4 ( .A(o_data3[14]), .B(
        fc_pe_b_peij_2_2_add_notb[3]), .Z(fc_pe_b_peij_2_2_add_fai_3_n5) );
  XOR2_X1 fc_pe_b_peij_2_2_add_fai_3_U3 ( .A(fc_pe_b_peij_2_2_add_cprop[3]), 
        .B(fc_pe_b_peij_2_2_add_fai_3_n5), .Z(fc_pe_b_peij_2_2_d_acc[3]) );
  AOI22_X1 fc_pe_b_peij_2_2_add_fai_4_U2 ( .A1(fc_pe_b_peij_2_2_add_notb[4]), 
        .A2(o_data3[15]), .B1(fc_pe_b_peij_2_2_add_fai_4_n5), .B2(
        fc_pe_b_peij_2_2_add_cprop[4]), .ZN(fc_pe_b_peij_2_2_add_fai_4_n4) );
  INV_X1 fc_pe_b_peij_2_2_add_fai_4_U1 ( .A(fc_pe_b_peij_2_2_add_fai_4_n4), 
        .ZN(fc_pe_b_peij_2_2_add_cprop[5]) );
  XOR2_X1 fc_pe_b_peij_2_2_add_fai_4_U4 ( .A(o_data3[15]), .B(
        fc_pe_b_peij_2_2_add_notb[4]), .Z(fc_pe_b_peij_2_2_add_fai_4_n5) );
  XOR2_X1 fc_pe_b_peij_2_2_add_fai_4_U3 ( .A(fc_pe_b_peij_2_2_add_cprop[4]), 
        .B(fc_pe_b_peij_2_2_add_fai_4_n5), .Z(fc_pe_b_peij_2_2_d_acc[4]) );
  AOI22_X1 fc_pe_b_peij_2_2_add_fai_5_U2 ( .A1(fc_pe_b_peij_2_2_add_notb[5]), 
        .A2(o_data3[16]), .B1(fc_pe_b_peij_2_2_add_fai_5_n5), .B2(
        fc_pe_b_peij_2_2_add_cprop[5]), .ZN(fc_pe_b_peij_2_2_add_fai_5_n4) );
  INV_X1 fc_pe_b_peij_2_2_add_fai_5_U1 ( .A(fc_pe_b_peij_2_2_add_fai_5_n4), 
        .ZN(fc_pe_b_peij_2_2_add_cprop[6]) );
  XOR2_X1 fc_pe_b_peij_2_2_add_fai_5_U4 ( .A(o_data3[16]), .B(
        fc_pe_b_peij_2_2_add_notb[5]), .Z(fc_pe_b_peij_2_2_add_fai_5_n5) );
  XOR2_X1 fc_pe_b_peij_2_2_add_fai_5_U3 ( .A(fc_pe_b_peij_2_2_add_cprop[5]), 
        .B(fc_pe_b_peij_2_2_add_fai_5_n5), .Z(fc_pe_b_peij_2_2_d_acc[5]) );
  AOI22_X1 fc_pe_b_peij_2_2_add_fai_6_U2 ( .A1(fc_pe_b_peij_2_2_add_notb[6]), 
        .A2(o_data3[17]), .B1(fc_pe_b_peij_2_2_add_fai_6_n5), .B2(
        fc_pe_b_peij_2_2_add_cprop[6]), .ZN(fc_pe_b_peij_2_2_add_fai_6_n4) );
  INV_X1 fc_pe_b_peij_2_2_add_fai_6_U1 ( .A(fc_pe_b_peij_2_2_add_fai_6_n4), 
        .ZN(fc_pe_b_peij_2_2_add_cprop[7]) );
  XOR2_X1 fc_pe_b_peij_2_2_add_fai_6_U4 ( .A(o_data3[17]), .B(
        fc_pe_b_peij_2_2_add_notb[6]), .Z(fc_pe_b_peij_2_2_add_fai_6_n5) );
  XOR2_X1 fc_pe_b_peij_2_2_add_fai_6_U3 ( .A(fc_pe_b_peij_2_2_add_cprop[6]), 
        .B(fc_pe_b_peij_2_2_add_fai_6_n5), .Z(fc_pe_b_peij_2_2_d_acc[6]) );
  AOI22_X1 fc_pe_b_peij_2_2_add_fai_7_U2 ( .A1(fc_pe_b_peij_2_2_add_notb[7]), 
        .A2(o_data3[18]), .B1(fc_pe_b_peij_2_2_add_fai_7_n5), .B2(
        fc_pe_b_peij_2_2_add_cprop[7]), .ZN(fc_pe_b_peij_2_2_add_fai_7_n4) );
  INV_X1 fc_pe_b_peij_2_2_add_fai_7_U1 ( .A(fc_pe_b_peij_2_2_add_fai_7_n4), 
        .ZN(fc_pe_b_peij_2_2_add_cprop[8]) );
  XOR2_X1 fc_pe_b_peij_2_2_add_fai_7_U4 ( .A(o_data3[18]), .B(
        fc_pe_b_peij_2_2_add_notb[7]), .Z(fc_pe_b_peij_2_2_add_fai_7_n5) );
  XOR2_X1 fc_pe_b_peij_2_2_add_fai_7_U3 ( .A(fc_pe_b_peij_2_2_add_cprop[7]), 
        .B(fc_pe_b_peij_2_2_add_fai_7_n5), .Z(fc_pe_b_peij_2_2_d_acc[7]) );
  AOI22_X1 fc_pe_b_peij_2_2_add_fai_8_U2 ( .A1(fc_pe_b_peij_2_2_add_notb[8]), 
        .A2(o_data3[19]), .B1(fc_pe_b_peij_2_2_add_fai_8_n5), .B2(
        fc_pe_b_peij_2_2_add_cprop[8]), .ZN(fc_pe_b_peij_2_2_add_fai_8_n4) );
  INV_X1 fc_pe_b_peij_2_2_add_fai_8_U1 ( .A(fc_pe_b_peij_2_2_add_fai_8_n4), 
        .ZN(fc_pe_b_peij_2_2_add_cprop[9]) );
  XOR2_X1 fc_pe_b_peij_2_2_add_fai_8_U4 ( .A(o_data3[19]), .B(
        fc_pe_b_peij_2_2_add_notb[8]), .Z(fc_pe_b_peij_2_2_add_fai_8_n5) );
  XOR2_X1 fc_pe_b_peij_2_2_add_fai_8_U3 ( .A(fc_pe_b_peij_2_2_add_cprop[8]), 
        .B(fc_pe_b_peij_2_2_add_fai_8_n5), .Z(fc_pe_b_peij_2_2_d_acc[8]) );
  AOI22_X1 fc_pe_b_peij_2_2_add_fai_9_U2 ( .A1(fc_pe_b_peij_2_2_add_notb[9]), 
        .A2(o_data3[20]), .B1(fc_pe_b_peij_2_2_add_fai_9_n5), .B2(
        fc_pe_b_peij_2_2_add_cprop[9]), .ZN(fc_pe_b_peij_2_2_add_fai_9_n4) );
  INV_X1 fc_pe_b_peij_2_2_add_fai_9_U1 ( .A(fc_pe_b_peij_2_2_add_fai_9_n4), 
        .ZN(fc_pe_b_peij_2_2_add_cprop[10]) );
  XOR2_X1 fc_pe_b_peij_2_2_add_fai_9_U4 ( .A(o_data3[20]), .B(
        fc_pe_b_peij_2_2_add_notb[9]), .Z(fc_pe_b_peij_2_2_add_fai_9_n5) );
  XOR2_X1 fc_pe_b_peij_2_2_add_fai_9_U3 ( .A(fc_pe_b_peij_2_2_add_cprop[9]), 
        .B(fc_pe_b_peij_2_2_add_fai_9_n5), .Z(fc_pe_b_peij_2_2_d_acc[9]) );
  AOI22_X1 fc_pe_b_peij_2_2_add_fai_10_U2 ( .A1(fc_pe_b_peij_2_2_add_notb[10]), 
        .A2(o_data3[21]), .B1(fc_pe_b_peij_2_2_add_fai_10_n5), .B2(
        fc_pe_b_peij_2_2_add_cprop[10]), .ZN(fc_pe_b_peij_2_2_add_fai_10_n4)
         );
  INV_X1 fc_pe_b_peij_2_2_add_fai_10_U1 ( .A(fc_pe_b_peij_2_2_add_fai_10_n4), 
        .ZN(fc_pe_b_peij_2_2_add_c_out) );
  XOR2_X1 fc_pe_b_peij_2_2_add_fai_10_U4 ( .A(o_data3[21]), .B(
        fc_pe_b_peij_2_2_add_notb[10]), .Z(fc_pe_b_peij_2_2_add_fai_10_n5) );
  XOR2_X1 fc_pe_b_peij_2_2_add_fai_10_U3 ( .A(fc_pe_b_peij_2_2_add_cprop[10]), 
        .B(fc_pe_b_peij_2_2_add_fai_10_n5), .Z(fc_pe_b_peij_2_2_d_acc[10]) );
  AND3_X1 fc_pe_b_peij_2_3_U22 ( .A1(fc_pe_b_int_pe_en[4]), .A2(clk), .A3(
        i_kernel3[0]), .ZN(fc_pe_b_peij_2_3_gck) );
  AND2_X1 fc_pe_b_peij_2_3_U21 ( .A1(i_data[3]), .A2(fc_pe_b_peij_2_3_n16), 
        .ZN(fc_pe_b_peij_2_3_N35) );
  AND2_X1 fc_pe_b_peij_2_3_U20 ( .A1(i_data[2]), .A2(fc_pe_b_peij_2_3_n16), 
        .ZN(fc_pe_b_peij_2_3_N34) );
  AND2_X1 fc_pe_b_peij_2_3_U19 ( .A1(i_data[1]), .A2(fc_pe_b_peij_2_3_n16), 
        .ZN(fc_pe_b_peij_2_3_N33) );
  AND2_X1 fc_pe_b_peij_2_3_U18 ( .A1(i_data[0]), .A2(fc_pe_b_peij_2_3_n16), 
        .ZN(fc_pe_b_peij_2_3_N32) );
  AND3_X1 fc_pe_b_peij_2_3_U17 ( .A1(fc_pe_b_int_pe_en[4]), .A2(
        fc_pe_b_peij_2_3_n14), .A3(i_kernel3[0]), .ZN(fc_pe_b_peij_2_3_n16) );
  INV_X1 fc_pe_b_peij_2_3_U16 ( .A(tb_rst_cnt2), .ZN(fc_pe_b_peij_2_3_n12) );
  INV_X1 fc_pe_b_peij_2_3_U14 ( .A(tb_rst_cnt1), .ZN(fc_pe_b_peij_2_3_n14) );
  SDFFR_X1 fc_pe_b_peij_2_3_q_acc_reg_10_ ( .D(1'b0), .SI(fc_pe_b_peij_2_3_n14), .SE(fc_pe_b_peij_2_3_d_acc[10]), .CK(fc_pe_b_peij_2_3_gck), .RN(
        fc_pe_b_peij_2_3_n12), .Q(o_data3[10]) );
  SDFFR_X1 fc_pe_b_peij_2_3_q_acc_reg_9_ ( .D(1'b0), .SI(fc_pe_b_peij_2_3_n14), 
        .SE(fc_pe_b_peij_2_3_d_acc[9]), .CK(fc_pe_b_peij_2_3_gck), .RN(
        fc_pe_b_peij_2_3_n12), .Q(o_data3[9]) );
  SDFFR_X1 fc_pe_b_peij_2_3_q_acc_reg_8_ ( .D(1'b0), .SI(fc_pe_b_peij_2_3_n14), 
        .SE(fc_pe_b_peij_2_3_d_acc[8]), .CK(fc_pe_b_peij_2_3_gck), .RN(
        fc_pe_b_peij_2_3_n12), .Q(o_data3[8]) );
  SDFFR_X1 fc_pe_b_peij_2_3_q_acc_reg_7_ ( .D(1'b0), .SI(fc_pe_b_peij_2_3_n14), 
        .SE(fc_pe_b_peij_2_3_d_acc[7]), .CK(fc_pe_b_peij_2_3_gck), .RN(
        fc_pe_b_peij_2_3_n12), .Q(o_data3[7]) );
  SDFFR_X1 fc_pe_b_peij_2_3_q_acc_reg_6_ ( .D(1'b0), .SI(fc_pe_b_peij_2_3_n14), 
        .SE(fc_pe_b_peij_2_3_d_acc[6]), .CK(fc_pe_b_peij_2_3_gck), .RN(
        fc_pe_b_peij_2_3_n12), .Q(o_data3[6]) );
  SDFFR_X1 fc_pe_b_peij_2_3_q_acc_reg_5_ ( .D(1'b0), .SI(fc_pe_b_peij_2_3_n14), 
        .SE(fc_pe_b_peij_2_3_d_acc[5]), .CK(fc_pe_b_peij_2_3_gck), .RN(
        fc_pe_b_peij_2_3_n12), .Q(o_data3[5]) );
  SDFFR_X1 fc_pe_b_peij_2_3_q_acc_reg_4_ ( .D(1'b0), .SI(fc_pe_b_peij_2_3_n14), 
        .SE(fc_pe_b_peij_2_3_d_acc[4]), .CK(fc_pe_b_peij_2_3_gck), .RN(
        fc_pe_b_peij_2_3_n12), .Q(o_data3[4]) );
  SDFFR_X1 fc_pe_b_peij_2_3_q_acc_reg_3_ ( .D(1'b0), .SI(fc_pe_b_peij_2_3_n14), 
        .SE(fc_pe_b_peij_2_3_d_acc[3]), .CK(fc_pe_b_peij_2_3_gck), .RN(
        fc_pe_b_peij_2_3_n12), .Q(o_data3[3]) );
  SDFFR_X1 fc_pe_b_peij_2_3_q_acc_reg_2_ ( .D(1'b0), .SI(fc_pe_b_peij_2_3_n14), 
        .SE(fc_pe_b_peij_2_3_d_acc[2]), .CK(fc_pe_b_peij_2_3_gck), .RN(
        fc_pe_b_peij_2_3_n12), .Q(o_data3[2]) );
  SDFFR_X1 fc_pe_b_peij_2_3_q_acc_reg_1_ ( .D(1'b0), .SI(fc_pe_b_peij_2_3_n14), 
        .SE(fc_pe_b_peij_2_3_d_acc[1]), .CK(fc_pe_b_peij_2_3_gck), .RN(
        fc_pe_b_peij_2_3_n12), .Q(o_data3[1]) );
  SDFFR_X1 fc_pe_b_peij_2_3_q_acc_reg_0_ ( .D(1'b0), .SI(fc_pe_b_peij_2_3_n14), 
        .SE(fc_pe_b_peij_2_3_d_acc[0]), .CK(fc_pe_b_peij_2_3_gck), .RN(
        fc_pe_b_peij_2_3_n12), .Q(o_data3[0]) );
  DFFR_X1 fc_pe_b_peij_2_3_q_im_reg_0_ ( .D(fc_pe_b_peij_2_3_N32), .CK(
        fc_pe_b_peij_2_3_gck), .RN(fc_pe_b_peij_2_3_n12), .Q(
        fc_pe_b_peij_2_3_sgnext[0]) );
  DFFR_X1 fc_pe_b_peij_2_3_q_im_reg_1_ ( .D(fc_pe_b_peij_2_3_N33), .CK(
        fc_pe_b_peij_2_3_gck), .RN(fc_pe_b_peij_2_3_n12), .Q(
        fc_pe_b_peij_2_3_sgnext[1]) );
  DFFR_X1 fc_pe_b_peij_2_3_q_im_reg_2_ ( .D(fc_pe_b_peij_2_3_N34), .CK(
        fc_pe_b_peij_2_3_gck), .RN(fc_pe_b_peij_2_3_n12), .Q(
        fc_pe_b_peij_2_3_sgnext[2]) );
  DFFR_X1 fc_pe_b_peij_2_3_q_im_reg_3_ ( .D(fc_pe_b_peij_2_3_N35), .CK(
        fc_pe_b_peij_2_3_gck), .RN(fc_pe_b_peij_2_3_n12), .Q(
        fc_pe_b_peij_2_3_sgnext_10) );
  SDFFR_X1 fc_pe_b_peij_2_3_q_k_reg ( .D(1'b0), .SI(fc_pe_b_peij_2_3_n14), 
        .SE(i_kernel3[1]), .CK(fc_pe_b_peij_2_3_gck), .RN(fc_pe_b_peij_2_3_n12), .Q(fc_pe_b_peij_2_3_q_k) );
  XOR2_X1 fc_pe_b_peij_2_3_add_U11 ( .A(fc_pe_b_peij_2_3_sgnext[0]), .B(
        fc_pe_b_peij_2_3_q_k), .Z(fc_pe_b_peij_2_3_add_notb[0]) );
  XOR2_X1 fc_pe_b_peij_2_3_add_U10 ( .A(fc_pe_b_peij_2_3_sgnext_10), .B(
        fc_pe_b_peij_2_3_q_k), .Z(fc_pe_b_peij_2_3_add_notb[10]) );
  XOR2_X1 fc_pe_b_peij_2_3_add_U9 ( .A(fc_pe_b_peij_2_3_sgnext[1]), .B(
        fc_pe_b_peij_2_3_q_k), .Z(fc_pe_b_peij_2_3_add_notb[1]) );
  XOR2_X1 fc_pe_b_peij_2_3_add_U8 ( .A(fc_pe_b_peij_2_3_sgnext[2]), .B(
        fc_pe_b_peij_2_3_q_k), .Z(fc_pe_b_peij_2_3_add_notb[2]) );
  XOR2_X1 fc_pe_b_peij_2_3_add_U7 ( .A(fc_pe_b_peij_2_3_sgnext_10), .B(
        fc_pe_b_peij_2_3_q_k), .Z(fc_pe_b_peij_2_3_add_notb[3]) );
  XOR2_X1 fc_pe_b_peij_2_3_add_U6 ( .A(fc_pe_b_peij_2_3_sgnext_10), .B(
        fc_pe_b_peij_2_3_q_k), .Z(fc_pe_b_peij_2_3_add_notb[4]) );
  XOR2_X1 fc_pe_b_peij_2_3_add_U5 ( .A(fc_pe_b_peij_2_3_sgnext_10), .B(
        fc_pe_b_peij_2_3_q_k), .Z(fc_pe_b_peij_2_3_add_notb[5]) );
  XOR2_X1 fc_pe_b_peij_2_3_add_U4 ( .A(fc_pe_b_peij_2_3_sgnext_10), .B(
        fc_pe_b_peij_2_3_q_k), .Z(fc_pe_b_peij_2_3_add_notb[6]) );
  XOR2_X1 fc_pe_b_peij_2_3_add_U3 ( .A(fc_pe_b_peij_2_3_sgnext_10), .B(
        fc_pe_b_peij_2_3_q_k), .Z(fc_pe_b_peij_2_3_add_notb[7]) );
  XOR2_X1 fc_pe_b_peij_2_3_add_U2 ( .A(fc_pe_b_peij_2_3_sgnext_10), .B(
        fc_pe_b_peij_2_3_q_k), .Z(fc_pe_b_peij_2_3_add_notb[8]) );
  XOR2_X1 fc_pe_b_peij_2_3_add_U1 ( .A(fc_pe_b_peij_2_3_sgnext_10), .B(
        fc_pe_b_peij_2_3_q_k), .Z(fc_pe_b_peij_2_3_add_notb[9]) );
  AOI22_X1 fc_pe_b_peij_2_3_add_fai_0_U2 ( .A1(fc_pe_b_peij_2_3_add_notb[0]), 
        .A2(o_data3[0]), .B1(fc_pe_b_peij_2_3_add_fai_0_n5), .B2(
        fc_pe_b_peij_2_3_q_k), .ZN(fc_pe_b_peij_2_3_add_fai_0_n4) );
  INV_X1 fc_pe_b_peij_2_3_add_fai_0_U1 ( .A(fc_pe_b_peij_2_3_add_fai_0_n4), 
        .ZN(fc_pe_b_peij_2_3_add_cprop[1]) );
  XOR2_X1 fc_pe_b_peij_2_3_add_fai_0_U4 ( .A(o_data3[0]), .B(
        fc_pe_b_peij_2_3_add_notb[0]), .Z(fc_pe_b_peij_2_3_add_fai_0_n5) );
  XOR2_X1 fc_pe_b_peij_2_3_add_fai_0_U3 ( .A(fc_pe_b_peij_2_3_q_k), .B(
        fc_pe_b_peij_2_3_add_fai_0_n5), .Z(fc_pe_b_peij_2_3_d_acc[0]) );
  AOI22_X1 fc_pe_b_peij_2_3_add_fai_1_U2 ( .A1(fc_pe_b_peij_2_3_add_notb[1]), 
        .A2(o_data3[1]), .B1(fc_pe_b_peij_2_3_add_fai_1_n5), .B2(
        fc_pe_b_peij_2_3_add_cprop[1]), .ZN(fc_pe_b_peij_2_3_add_fai_1_n4) );
  INV_X1 fc_pe_b_peij_2_3_add_fai_1_U1 ( .A(fc_pe_b_peij_2_3_add_fai_1_n4), 
        .ZN(fc_pe_b_peij_2_3_add_cprop[2]) );
  XOR2_X1 fc_pe_b_peij_2_3_add_fai_1_U4 ( .A(o_data3[1]), .B(
        fc_pe_b_peij_2_3_add_notb[1]), .Z(fc_pe_b_peij_2_3_add_fai_1_n5) );
  XOR2_X1 fc_pe_b_peij_2_3_add_fai_1_U3 ( .A(fc_pe_b_peij_2_3_add_cprop[1]), 
        .B(fc_pe_b_peij_2_3_add_fai_1_n5), .Z(fc_pe_b_peij_2_3_d_acc[1]) );
  AOI22_X1 fc_pe_b_peij_2_3_add_fai_2_U2 ( .A1(fc_pe_b_peij_2_3_add_notb[2]), 
        .A2(o_data3[2]), .B1(fc_pe_b_peij_2_3_add_fai_2_n5), .B2(
        fc_pe_b_peij_2_3_add_cprop[2]), .ZN(fc_pe_b_peij_2_3_add_fai_2_n4) );
  INV_X1 fc_pe_b_peij_2_3_add_fai_2_U1 ( .A(fc_pe_b_peij_2_3_add_fai_2_n4), 
        .ZN(fc_pe_b_peij_2_3_add_cprop[3]) );
  XOR2_X1 fc_pe_b_peij_2_3_add_fai_2_U4 ( .A(o_data3[2]), .B(
        fc_pe_b_peij_2_3_add_notb[2]), .Z(fc_pe_b_peij_2_3_add_fai_2_n5) );
  XOR2_X1 fc_pe_b_peij_2_3_add_fai_2_U3 ( .A(fc_pe_b_peij_2_3_add_cprop[2]), 
        .B(fc_pe_b_peij_2_3_add_fai_2_n5), .Z(fc_pe_b_peij_2_3_d_acc[2]) );
  AOI22_X1 fc_pe_b_peij_2_3_add_fai_3_U2 ( .A1(fc_pe_b_peij_2_3_add_notb[3]), 
        .A2(o_data3[3]), .B1(fc_pe_b_peij_2_3_add_fai_3_n5), .B2(
        fc_pe_b_peij_2_3_add_cprop[3]), .ZN(fc_pe_b_peij_2_3_add_fai_3_n4) );
  INV_X1 fc_pe_b_peij_2_3_add_fai_3_U1 ( .A(fc_pe_b_peij_2_3_add_fai_3_n4), 
        .ZN(fc_pe_b_peij_2_3_add_cprop[4]) );
  XOR2_X1 fc_pe_b_peij_2_3_add_fai_3_U4 ( .A(o_data3[3]), .B(
        fc_pe_b_peij_2_3_add_notb[3]), .Z(fc_pe_b_peij_2_3_add_fai_3_n5) );
  XOR2_X1 fc_pe_b_peij_2_3_add_fai_3_U3 ( .A(fc_pe_b_peij_2_3_add_cprop[3]), 
        .B(fc_pe_b_peij_2_3_add_fai_3_n5), .Z(fc_pe_b_peij_2_3_d_acc[3]) );
  AOI22_X1 fc_pe_b_peij_2_3_add_fai_4_U2 ( .A1(fc_pe_b_peij_2_3_add_notb[4]), 
        .A2(o_data3[4]), .B1(fc_pe_b_peij_2_3_add_fai_4_n5), .B2(
        fc_pe_b_peij_2_3_add_cprop[4]), .ZN(fc_pe_b_peij_2_3_add_fai_4_n4) );
  INV_X1 fc_pe_b_peij_2_3_add_fai_4_U1 ( .A(fc_pe_b_peij_2_3_add_fai_4_n4), 
        .ZN(fc_pe_b_peij_2_3_add_cprop[5]) );
  XOR2_X1 fc_pe_b_peij_2_3_add_fai_4_U4 ( .A(o_data3[4]), .B(
        fc_pe_b_peij_2_3_add_notb[4]), .Z(fc_pe_b_peij_2_3_add_fai_4_n5) );
  XOR2_X1 fc_pe_b_peij_2_3_add_fai_4_U3 ( .A(fc_pe_b_peij_2_3_add_cprop[4]), 
        .B(fc_pe_b_peij_2_3_add_fai_4_n5), .Z(fc_pe_b_peij_2_3_d_acc[4]) );
  AOI22_X1 fc_pe_b_peij_2_3_add_fai_5_U2 ( .A1(fc_pe_b_peij_2_3_add_notb[5]), 
        .A2(o_data3[5]), .B1(fc_pe_b_peij_2_3_add_fai_5_n5), .B2(
        fc_pe_b_peij_2_3_add_cprop[5]), .ZN(fc_pe_b_peij_2_3_add_fai_5_n4) );
  INV_X1 fc_pe_b_peij_2_3_add_fai_5_U1 ( .A(fc_pe_b_peij_2_3_add_fai_5_n4), 
        .ZN(fc_pe_b_peij_2_3_add_cprop[6]) );
  XOR2_X1 fc_pe_b_peij_2_3_add_fai_5_U4 ( .A(o_data3[5]), .B(
        fc_pe_b_peij_2_3_add_notb[5]), .Z(fc_pe_b_peij_2_3_add_fai_5_n5) );
  XOR2_X1 fc_pe_b_peij_2_3_add_fai_5_U3 ( .A(fc_pe_b_peij_2_3_add_cprop[5]), 
        .B(fc_pe_b_peij_2_3_add_fai_5_n5), .Z(fc_pe_b_peij_2_3_d_acc[5]) );
  AOI22_X1 fc_pe_b_peij_2_3_add_fai_6_U2 ( .A1(fc_pe_b_peij_2_3_add_notb[6]), 
        .A2(o_data3[6]), .B1(fc_pe_b_peij_2_3_add_fai_6_n5), .B2(
        fc_pe_b_peij_2_3_add_cprop[6]), .ZN(fc_pe_b_peij_2_3_add_fai_6_n4) );
  INV_X1 fc_pe_b_peij_2_3_add_fai_6_U1 ( .A(fc_pe_b_peij_2_3_add_fai_6_n4), 
        .ZN(fc_pe_b_peij_2_3_add_cprop[7]) );
  XOR2_X1 fc_pe_b_peij_2_3_add_fai_6_U4 ( .A(o_data3[6]), .B(
        fc_pe_b_peij_2_3_add_notb[6]), .Z(fc_pe_b_peij_2_3_add_fai_6_n5) );
  XOR2_X1 fc_pe_b_peij_2_3_add_fai_6_U3 ( .A(fc_pe_b_peij_2_3_add_cprop[6]), 
        .B(fc_pe_b_peij_2_3_add_fai_6_n5), .Z(fc_pe_b_peij_2_3_d_acc[6]) );
  AOI22_X1 fc_pe_b_peij_2_3_add_fai_7_U2 ( .A1(fc_pe_b_peij_2_3_add_notb[7]), 
        .A2(o_data3[7]), .B1(fc_pe_b_peij_2_3_add_fai_7_n5), .B2(
        fc_pe_b_peij_2_3_add_cprop[7]), .ZN(fc_pe_b_peij_2_3_add_fai_7_n4) );
  INV_X1 fc_pe_b_peij_2_3_add_fai_7_U1 ( .A(fc_pe_b_peij_2_3_add_fai_7_n4), 
        .ZN(fc_pe_b_peij_2_3_add_cprop[8]) );
  XOR2_X1 fc_pe_b_peij_2_3_add_fai_7_U4 ( .A(o_data3[7]), .B(
        fc_pe_b_peij_2_3_add_notb[7]), .Z(fc_pe_b_peij_2_3_add_fai_7_n5) );
  XOR2_X1 fc_pe_b_peij_2_3_add_fai_7_U3 ( .A(fc_pe_b_peij_2_3_add_cprop[7]), 
        .B(fc_pe_b_peij_2_3_add_fai_7_n5), .Z(fc_pe_b_peij_2_3_d_acc[7]) );
  AOI22_X1 fc_pe_b_peij_2_3_add_fai_8_U2 ( .A1(fc_pe_b_peij_2_3_add_notb[8]), 
        .A2(o_data3[8]), .B1(fc_pe_b_peij_2_3_add_fai_8_n5), .B2(
        fc_pe_b_peij_2_3_add_cprop[8]), .ZN(fc_pe_b_peij_2_3_add_fai_8_n4) );
  INV_X1 fc_pe_b_peij_2_3_add_fai_8_U1 ( .A(fc_pe_b_peij_2_3_add_fai_8_n4), 
        .ZN(fc_pe_b_peij_2_3_add_cprop[9]) );
  XOR2_X1 fc_pe_b_peij_2_3_add_fai_8_U4 ( .A(o_data3[8]), .B(
        fc_pe_b_peij_2_3_add_notb[8]), .Z(fc_pe_b_peij_2_3_add_fai_8_n5) );
  XOR2_X1 fc_pe_b_peij_2_3_add_fai_8_U3 ( .A(fc_pe_b_peij_2_3_add_cprop[8]), 
        .B(fc_pe_b_peij_2_3_add_fai_8_n5), .Z(fc_pe_b_peij_2_3_d_acc[8]) );
  AOI22_X1 fc_pe_b_peij_2_3_add_fai_9_U2 ( .A1(fc_pe_b_peij_2_3_add_notb[9]), 
        .A2(o_data3[9]), .B1(fc_pe_b_peij_2_3_add_fai_9_n5), .B2(
        fc_pe_b_peij_2_3_add_cprop[9]), .ZN(fc_pe_b_peij_2_3_add_fai_9_n4) );
  INV_X1 fc_pe_b_peij_2_3_add_fai_9_U1 ( .A(fc_pe_b_peij_2_3_add_fai_9_n4), 
        .ZN(fc_pe_b_peij_2_3_add_cprop[10]) );
  XOR2_X1 fc_pe_b_peij_2_3_add_fai_9_U4 ( .A(o_data3[9]), .B(
        fc_pe_b_peij_2_3_add_notb[9]), .Z(fc_pe_b_peij_2_3_add_fai_9_n5) );
  XOR2_X1 fc_pe_b_peij_2_3_add_fai_9_U3 ( .A(fc_pe_b_peij_2_3_add_cprop[9]), 
        .B(fc_pe_b_peij_2_3_add_fai_9_n5), .Z(fc_pe_b_peij_2_3_d_acc[9]) );
  AOI22_X1 fc_pe_b_peij_2_3_add_fai_10_U2 ( .A1(fc_pe_b_peij_2_3_add_notb[10]), 
        .A2(o_data3[10]), .B1(fc_pe_b_peij_2_3_add_fai_10_n5), .B2(
        fc_pe_b_peij_2_3_add_cprop[10]), .ZN(fc_pe_b_peij_2_3_add_fai_10_n4)
         );
  INV_X1 fc_pe_b_peij_2_3_add_fai_10_U1 ( .A(fc_pe_b_peij_2_3_add_fai_10_n4), 
        .ZN(fc_pe_b_peij_2_3_add_c_out) );
  XOR2_X1 fc_pe_b_peij_2_3_add_fai_10_U4 ( .A(o_data3[10]), .B(
        fc_pe_b_peij_2_3_add_notb[10]), .Z(fc_pe_b_peij_2_3_add_fai_10_n5) );
  XOR2_X1 fc_pe_b_peij_2_3_add_fai_10_U3 ( .A(fc_pe_b_peij_2_3_add_cprop[10]), 
        .B(fc_pe_b_peij_2_3_add_fai_10_n5), .Z(fc_pe_b_peij_2_3_d_acc[10]) );
  AND3_X1 fc_pe_b_peij_3_0_U22 ( .A1(fc_pe_b_int_pe_en[3]), .A2(clk), .A3(
        i_kernel4[6]), .ZN(fc_pe_b_peij_3_0_gck) );
  AND2_X1 fc_pe_b_peij_3_0_U21 ( .A1(i_data[3]), .A2(fc_pe_b_peij_3_0_n16), 
        .ZN(fc_pe_b_peij_3_0_N35) );
  AND2_X1 fc_pe_b_peij_3_0_U20 ( .A1(i_data[2]), .A2(fc_pe_b_peij_3_0_n16), 
        .ZN(fc_pe_b_peij_3_0_N34) );
  AND2_X1 fc_pe_b_peij_3_0_U19 ( .A1(i_data[1]), .A2(fc_pe_b_peij_3_0_n16), 
        .ZN(fc_pe_b_peij_3_0_N33) );
  AND2_X1 fc_pe_b_peij_3_0_U18 ( .A1(i_data[0]), .A2(fc_pe_b_peij_3_0_n16), 
        .ZN(fc_pe_b_peij_3_0_N32) );
  AND3_X1 fc_pe_b_peij_3_0_U17 ( .A1(fc_pe_b_int_pe_en[3]), .A2(
        fc_pe_b_peij_3_0_n14), .A3(i_kernel4[6]), .ZN(fc_pe_b_peij_3_0_n16) );
  INV_X1 fc_pe_b_peij_3_0_U16 ( .A(tb_rst_cnt2), .ZN(fc_pe_b_peij_3_0_n12) );
  INV_X1 fc_pe_b_peij_3_0_U14 ( .A(tb_rst_cnt1), .ZN(fc_pe_b_peij_3_0_n14) );
  SDFFR_X1 fc_pe_b_peij_3_0_q_acc_reg_10_ ( .D(1'b0), .SI(fc_pe_b_peij_3_0_n14), .SE(fc_pe_b_peij_3_0_d_acc[10]), .CK(fc_pe_b_peij_3_0_gck), .RN(
        fc_pe_b_peij_3_0_n12), .Q(o_data4[43]) );
  SDFFR_X1 fc_pe_b_peij_3_0_q_acc_reg_9_ ( .D(1'b0), .SI(fc_pe_b_peij_3_0_n14), 
        .SE(fc_pe_b_peij_3_0_d_acc[9]), .CK(fc_pe_b_peij_3_0_gck), .RN(
        fc_pe_b_peij_3_0_n12), .Q(o_data4[42]) );
  SDFFR_X1 fc_pe_b_peij_3_0_q_acc_reg_8_ ( .D(1'b0), .SI(fc_pe_b_peij_3_0_n14), 
        .SE(fc_pe_b_peij_3_0_d_acc[8]), .CK(fc_pe_b_peij_3_0_gck), .RN(
        fc_pe_b_peij_3_0_n12), .Q(o_data4[41]) );
  SDFFR_X1 fc_pe_b_peij_3_0_q_acc_reg_7_ ( .D(1'b0), .SI(fc_pe_b_peij_3_0_n14), 
        .SE(fc_pe_b_peij_3_0_d_acc[7]), .CK(fc_pe_b_peij_3_0_gck), .RN(
        fc_pe_b_peij_3_0_n12), .Q(o_data4[40]) );
  SDFFR_X1 fc_pe_b_peij_3_0_q_acc_reg_6_ ( .D(1'b0), .SI(fc_pe_b_peij_3_0_n14), 
        .SE(fc_pe_b_peij_3_0_d_acc[6]), .CK(fc_pe_b_peij_3_0_gck), .RN(
        fc_pe_b_peij_3_0_n12), .Q(o_data4[39]) );
  SDFFR_X1 fc_pe_b_peij_3_0_q_acc_reg_5_ ( .D(1'b0), .SI(fc_pe_b_peij_3_0_n14), 
        .SE(fc_pe_b_peij_3_0_d_acc[5]), .CK(fc_pe_b_peij_3_0_gck), .RN(
        fc_pe_b_peij_3_0_n12), .Q(o_data4[38]) );
  SDFFR_X1 fc_pe_b_peij_3_0_q_acc_reg_4_ ( .D(1'b0), .SI(fc_pe_b_peij_3_0_n14), 
        .SE(fc_pe_b_peij_3_0_d_acc[4]), .CK(fc_pe_b_peij_3_0_gck), .RN(
        fc_pe_b_peij_3_0_n12), .Q(o_data4[37]) );
  SDFFR_X1 fc_pe_b_peij_3_0_q_acc_reg_3_ ( .D(1'b0), .SI(fc_pe_b_peij_3_0_n14), 
        .SE(fc_pe_b_peij_3_0_d_acc[3]), .CK(fc_pe_b_peij_3_0_gck), .RN(
        fc_pe_b_peij_3_0_n12), .Q(o_data4[36]) );
  SDFFR_X1 fc_pe_b_peij_3_0_q_acc_reg_2_ ( .D(1'b0), .SI(fc_pe_b_peij_3_0_n14), 
        .SE(fc_pe_b_peij_3_0_d_acc[2]), .CK(fc_pe_b_peij_3_0_gck), .RN(
        fc_pe_b_peij_3_0_n12), .Q(o_data4[35]) );
  SDFFR_X1 fc_pe_b_peij_3_0_q_acc_reg_1_ ( .D(1'b0), .SI(fc_pe_b_peij_3_0_n14), 
        .SE(fc_pe_b_peij_3_0_d_acc[1]), .CK(fc_pe_b_peij_3_0_gck), .RN(
        fc_pe_b_peij_3_0_n12), .Q(o_data4[34]) );
  SDFFR_X1 fc_pe_b_peij_3_0_q_acc_reg_0_ ( .D(1'b0), .SI(fc_pe_b_peij_3_0_n14), 
        .SE(fc_pe_b_peij_3_0_d_acc[0]), .CK(fc_pe_b_peij_3_0_gck), .RN(
        fc_pe_b_peij_3_0_n12), .Q(o_data4[33]) );
  DFFR_X1 fc_pe_b_peij_3_0_q_im_reg_0_ ( .D(fc_pe_b_peij_3_0_N32), .CK(
        fc_pe_b_peij_3_0_gck), .RN(fc_pe_b_peij_3_0_n12), .Q(
        fc_pe_b_peij_3_0_sgnext[0]) );
  DFFR_X1 fc_pe_b_peij_3_0_q_im_reg_1_ ( .D(fc_pe_b_peij_3_0_N33), .CK(
        fc_pe_b_peij_3_0_gck), .RN(fc_pe_b_peij_3_0_n12), .Q(
        fc_pe_b_peij_3_0_sgnext[1]) );
  DFFR_X1 fc_pe_b_peij_3_0_q_im_reg_2_ ( .D(fc_pe_b_peij_3_0_N34), .CK(
        fc_pe_b_peij_3_0_gck), .RN(fc_pe_b_peij_3_0_n12), .Q(
        fc_pe_b_peij_3_0_sgnext[2]) );
  DFFR_X1 fc_pe_b_peij_3_0_q_im_reg_3_ ( .D(fc_pe_b_peij_3_0_N35), .CK(
        fc_pe_b_peij_3_0_gck), .RN(fc_pe_b_peij_3_0_n12), .Q(
        fc_pe_b_peij_3_0_sgnext_10) );
  SDFFR_X1 fc_pe_b_peij_3_0_q_k_reg ( .D(1'b0), .SI(fc_pe_b_peij_3_0_n14), 
        .SE(i_kernel4[7]), .CK(fc_pe_b_peij_3_0_gck), .RN(fc_pe_b_peij_3_0_n12), .Q(fc_pe_b_peij_3_0_q_k) );
  XOR2_X1 fc_pe_b_peij_3_0_add_U11 ( .A(fc_pe_b_peij_3_0_sgnext[0]), .B(
        fc_pe_b_peij_3_0_q_k), .Z(fc_pe_b_peij_3_0_add_notb[0]) );
  XOR2_X1 fc_pe_b_peij_3_0_add_U10 ( .A(fc_pe_b_peij_3_0_sgnext_10), .B(
        fc_pe_b_peij_3_0_q_k), .Z(fc_pe_b_peij_3_0_add_notb[10]) );
  XOR2_X1 fc_pe_b_peij_3_0_add_U9 ( .A(fc_pe_b_peij_3_0_sgnext[1]), .B(
        fc_pe_b_peij_3_0_q_k), .Z(fc_pe_b_peij_3_0_add_notb[1]) );
  XOR2_X1 fc_pe_b_peij_3_0_add_U8 ( .A(fc_pe_b_peij_3_0_sgnext[2]), .B(
        fc_pe_b_peij_3_0_q_k), .Z(fc_pe_b_peij_3_0_add_notb[2]) );
  XOR2_X1 fc_pe_b_peij_3_0_add_U7 ( .A(fc_pe_b_peij_3_0_sgnext_10), .B(
        fc_pe_b_peij_3_0_q_k), .Z(fc_pe_b_peij_3_0_add_notb[3]) );
  XOR2_X1 fc_pe_b_peij_3_0_add_U6 ( .A(fc_pe_b_peij_3_0_sgnext_10), .B(
        fc_pe_b_peij_3_0_q_k), .Z(fc_pe_b_peij_3_0_add_notb[4]) );
  XOR2_X1 fc_pe_b_peij_3_0_add_U5 ( .A(fc_pe_b_peij_3_0_sgnext_10), .B(
        fc_pe_b_peij_3_0_q_k), .Z(fc_pe_b_peij_3_0_add_notb[5]) );
  XOR2_X1 fc_pe_b_peij_3_0_add_U4 ( .A(fc_pe_b_peij_3_0_sgnext_10), .B(
        fc_pe_b_peij_3_0_q_k), .Z(fc_pe_b_peij_3_0_add_notb[6]) );
  XOR2_X1 fc_pe_b_peij_3_0_add_U3 ( .A(fc_pe_b_peij_3_0_sgnext_10), .B(
        fc_pe_b_peij_3_0_q_k), .Z(fc_pe_b_peij_3_0_add_notb[7]) );
  XOR2_X1 fc_pe_b_peij_3_0_add_U2 ( .A(fc_pe_b_peij_3_0_sgnext_10), .B(
        fc_pe_b_peij_3_0_q_k), .Z(fc_pe_b_peij_3_0_add_notb[8]) );
  XOR2_X1 fc_pe_b_peij_3_0_add_U1 ( .A(fc_pe_b_peij_3_0_sgnext_10), .B(
        fc_pe_b_peij_3_0_q_k), .Z(fc_pe_b_peij_3_0_add_notb[9]) );
  AOI22_X1 fc_pe_b_peij_3_0_add_fai_0_U2 ( .A1(fc_pe_b_peij_3_0_add_notb[0]), 
        .A2(o_data4[33]), .B1(fc_pe_b_peij_3_0_add_fai_0_n5), .B2(
        fc_pe_b_peij_3_0_q_k), .ZN(fc_pe_b_peij_3_0_add_fai_0_n4) );
  INV_X1 fc_pe_b_peij_3_0_add_fai_0_U1 ( .A(fc_pe_b_peij_3_0_add_fai_0_n4), 
        .ZN(fc_pe_b_peij_3_0_add_cprop[1]) );
  XOR2_X1 fc_pe_b_peij_3_0_add_fai_0_U4 ( .A(o_data4[33]), .B(
        fc_pe_b_peij_3_0_add_notb[0]), .Z(fc_pe_b_peij_3_0_add_fai_0_n5) );
  XOR2_X1 fc_pe_b_peij_3_0_add_fai_0_U3 ( .A(fc_pe_b_peij_3_0_q_k), .B(
        fc_pe_b_peij_3_0_add_fai_0_n5), .Z(fc_pe_b_peij_3_0_d_acc[0]) );
  AOI22_X1 fc_pe_b_peij_3_0_add_fai_1_U2 ( .A1(fc_pe_b_peij_3_0_add_notb[1]), 
        .A2(o_data4[34]), .B1(fc_pe_b_peij_3_0_add_fai_1_n5), .B2(
        fc_pe_b_peij_3_0_add_cprop[1]), .ZN(fc_pe_b_peij_3_0_add_fai_1_n4) );
  INV_X1 fc_pe_b_peij_3_0_add_fai_1_U1 ( .A(fc_pe_b_peij_3_0_add_fai_1_n4), 
        .ZN(fc_pe_b_peij_3_0_add_cprop[2]) );
  XOR2_X1 fc_pe_b_peij_3_0_add_fai_1_U4 ( .A(o_data4[34]), .B(
        fc_pe_b_peij_3_0_add_notb[1]), .Z(fc_pe_b_peij_3_0_add_fai_1_n5) );
  XOR2_X1 fc_pe_b_peij_3_0_add_fai_1_U3 ( .A(fc_pe_b_peij_3_0_add_cprop[1]), 
        .B(fc_pe_b_peij_3_0_add_fai_1_n5), .Z(fc_pe_b_peij_3_0_d_acc[1]) );
  AOI22_X1 fc_pe_b_peij_3_0_add_fai_2_U2 ( .A1(fc_pe_b_peij_3_0_add_notb[2]), 
        .A2(o_data4[35]), .B1(fc_pe_b_peij_3_0_add_fai_2_n5), .B2(
        fc_pe_b_peij_3_0_add_cprop[2]), .ZN(fc_pe_b_peij_3_0_add_fai_2_n4) );
  INV_X1 fc_pe_b_peij_3_0_add_fai_2_U1 ( .A(fc_pe_b_peij_3_0_add_fai_2_n4), 
        .ZN(fc_pe_b_peij_3_0_add_cprop[3]) );
  XOR2_X1 fc_pe_b_peij_3_0_add_fai_2_U4 ( .A(o_data4[35]), .B(
        fc_pe_b_peij_3_0_add_notb[2]), .Z(fc_pe_b_peij_3_0_add_fai_2_n5) );
  XOR2_X1 fc_pe_b_peij_3_0_add_fai_2_U3 ( .A(fc_pe_b_peij_3_0_add_cprop[2]), 
        .B(fc_pe_b_peij_3_0_add_fai_2_n5), .Z(fc_pe_b_peij_3_0_d_acc[2]) );
  AOI22_X1 fc_pe_b_peij_3_0_add_fai_3_U2 ( .A1(fc_pe_b_peij_3_0_add_notb[3]), 
        .A2(o_data4[36]), .B1(fc_pe_b_peij_3_0_add_fai_3_n5), .B2(
        fc_pe_b_peij_3_0_add_cprop[3]), .ZN(fc_pe_b_peij_3_0_add_fai_3_n4) );
  INV_X1 fc_pe_b_peij_3_0_add_fai_3_U1 ( .A(fc_pe_b_peij_3_0_add_fai_3_n4), 
        .ZN(fc_pe_b_peij_3_0_add_cprop[4]) );
  XOR2_X1 fc_pe_b_peij_3_0_add_fai_3_U4 ( .A(o_data4[36]), .B(
        fc_pe_b_peij_3_0_add_notb[3]), .Z(fc_pe_b_peij_3_0_add_fai_3_n5) );
  XOR2_X1 fc_pe_b_peij_3_0_add_fai_3_U3 ( .A(fc_pe_b_peij_3_0_add_cprop[3]), 
        .B(fc_pe_b_peij_3_0_add_fai_3_n5), .Z(fc_pe_b_peij_3_0_d_acc[3]) );
  AOI22_X1 fc_pe_b_peij_3_0_add_fai_4_U2 ( .A1(fc_pe_b_peij_3_0_add_notb[4]), 
        .A2(o_data4[37]), .B1(fc_pe_b_peij_3_0_add_fai_4_n5), .B2(
        fc_pe_b_peij_3_0_add_cprop[4]), .ZN(fc_pe_b_peij_3_0_add_fai_4_n4) );
  INV_X1 fc_pe_b_peij_3_0_add_fai_4_U1 ( .A(fc_pe_b_peij_3_0_add_fai_4_n4), 
        .ZN(fc_pe_b_peij_3_0_add_cprop[5]) );
  XOR2_X1 fc_pe_b_peij_3_0_add_fai_4_U4 ( .A(o_data4[37]), .B(
        fc_pe_b_peij_3_0_add_notb[4]), .Z(fc_pe_b_peij_3_0_add_fai_4_n5) );
  XOR2_X1 fc_pe_b_peij_3_0_add_fai_4_U3 ( .A(fc_pe_b_peij_3_0_add_cprop[4]), 
        .B(fc_pe_b_peij_3_0_add_fai_4_n5), .Z(fc_pe_b_peij_3_0_d_acc[4]) );
  AOI22_X1 fc_pe_b_peij_3_0_add_fai_5_U2 ( .A1(fc_pe_b_peij_3_0_add_notb[5]), 
        .A2(o_data4[38]), .B1(fc_pe_b_peij_3_0_add_fai_5_n5), .B2(
        fc_pe_b_peij_3_0_add_cprop[5]), .ZN(fc_pe_b_peij_3_0_add_fai_5_n4) );
  INV_X1 fc_pe_b_peij_3_0_add_fai_5_U1 ( .A(fc_pe_b_peij_3_0_add_fai_5_n4), 
        .ZN(fc_pe_b_peij_3_0_add_cprop[6]) );
  XOR2_X1 fc_pe_b_peij_3_0_add_fai_5_U4 ( .A(o_data4[38]), .B(
        fc_pe_b_peij_3_0_add_notb[5]), .Z(fc_pe_b_peij_3_0_add_fai_5_n5) );
  XOR2_X1 fc_pe_b_peij_3_0_add_fai_5_U3 ( .A(fc_pe_b_peij_3_0_add_cprop[5]), 
        .B(fc_pe_b_peij_3_0_add_fai_5_n5), .Z(fc_pe_b_peij_3_0_d_acc[5]) );
  AOI22_X1 fc_pe_b_peij_3_0_add_fai_6_U2 ( .A1(fc_pe_b_peij_3_0_add_notb[6]), 
        .A2(o_data4[39]), .B1(fc_pe_b_peij_3_0_add_fai_6_n5), .B2(
        fc_pe_b_peij_3_0_add_cprop[6]), .ZN(fc_pe_b_peij_3_0_add_fai_6_n4) );
  INV_X1 fc_pe_b_peij_3_0_add_fai_6_U1 ( .A(fc_pe_b_peij_3_0_add_fai_6_n4), 
        .ZN(fc_pe_b_peij_3_0_add_cprop[7]) );
  XOR2_X1 fc_pe_b_peij_3_0_add_fai_6_U4 ( .A(o_data4[39]), .B(
        fc_pe_b_peij_3_0_add_notb[6]), .Z(fc_pe_b_peij_3_0_add_fai_6_n5) );
  XOR2_X1 fc_pe_b_peij_3_0_add_fai_6_U3 ( .A(fc_pe_b_peij_3_0_add_cprop[6]), 
        .B(fc_pe_b_peij_3_0_add_fai_6_n5), .Z(fc_pe_b_peij_3_0_d_acc[6]) );
  AOI22_X1 fc_pe_b_peij_3_0_add_fai_7_U2 ( .A1(fc_pe_b_peij_3_0_add_notb[7]), 
        .A2(o_data4[40]), .B1(fc_pe_b_peij_3_0_add_fai_7_n5), .B2(
        fc_pe_b_peij_3_0_add_cprop[7]), .ZN(fc_pe_b_peij_3_0_add_fai_7_n4) );
  INV_X1 fc_pe_b_peij_3_0_add_fai_7_U1 ( .A(fc_pe_b_peij_3_0_add_fai_7_n4), 
        .ZN(fc_pe_b_peij_3_0_add_cprop[8]) );
  XOR2_X1 fc_pe_b_peij_3_0_add_fai_7_U4 ( .A(o_data4[40]), .B(
        fc_pe_b_peij_3_0_add_notb[7]), .Z(fc_pe_b_peij_3_0_add_fai_7_n5) );
  XOR2_X1 fc_pe_b_peij_3_0_add_fai_7_U3 ( .A(fc_pe_b_peij_3_0_add_cprop[7]), 
        .B(fc_pe_b_peij_3_0_add_fai_7_n5), .Z(fc_pe_b_peij_3_0_d_acc[7]) );
  AOI22_X1 fc_pe_b_peij_3_0_add_fai_8_U2 ( .A1(fc_pe_b_peij_3_0_add_notb[8]), 
        .A2(o_data4[41]), .B1(fc_pe_b_peij_3_0_add_fai_8_n5), .B2(
        fc_pe_b_peij_3_0_add_cprop[8]), .ZN(fc_pe_b_peij_3_0_add_fai_8_n4) );
  INV_X1 fc_pe_b_peij_3_0_add_fai_8_U1 ( .A(fc_pe_b_peij_3_0_add_fai_8_n4), 
        .ZN(fc_pe_b_peij_3_0_add_cprop[9]) );
  XOR2_X1 fc_pe_b_peij_3_0_add_fai_8_U4 ( .A(o_data4[41]), .B(
        fc_pe_b_peij_3_0_add_notb[8]), .Z(fc_pe_b_peij_3_0_add_fai_8_n5) );
  XOR2_X1 fc_pe_b_peij_3_0_add_fai_8_U3 ( .A(fc_pe_b_peij_3_0_add_cprop[8]), 
        .B(fc_pe_b_peij_3_0_add_fai_8_n5), .Z(fc_pe_b_peij_3_0_d_acc[8]) );
  AOI22_X1 fc_pe_b_peij_3_0_add_fai_9_U2 ( .A1(fc_pe_b_peij_3_0_add_notb[9]), 
        .A2(o_data4[42]), .B1(fc_pe_b_peij_3_0_add_fai_9_n5), .B2(
        fc_pe_b_peij_3_0_add_cprop[9]), .ZN(fc_pe_b_peij_3_0_add_fai_9_n4) );
  INV_X1 fc_pe_b_peij_3_0_add_fai_9_U1 ( .A(fc_pe_b_peij_3_0_add_fai_9_n4), 
        .ZN(fc_pe_b_peij_3_0_add_cprop[10]) );
  XOR2_X1 fc_pe_b_peij_3_0_add_fai_9_U4 ( .A(o_data4[42]), .B(
        fc_pe_b_peij_3_0_add_notb[9]), .Z(fc_pe_b_peij_3_0_add_fai_9_n5) );
  XOR2_X1 fc_pe_b_peij_3_0_add_fai_9_U3 ( .A(fc_pe_b_peij_3_0_add_cprop[9]), 
        .B(fc_pe_b_peij_3_0_add_fai_9_n5), .Z(fc_pe_b_peij_3_0_d_acc[9]) );
  AOI22_X1 fc_pe_b_peij_3_0_add_fai_10_U2 ( .A1(fc_pe_b_peij_3_0_add_notb[10]), 
        .A2(o_data4[43]), .B1(fc_pe_b_peij_3_0_add_fai_10_n5), .B2(
        fc_pe_b_peij_3_0_add_cprop[10]), .ZN(fc_pe_b_peij_3_0_add_fai_10_n4)
         );
  INV_X1 fc_pe_b_peij_3_0_add_fai_10_U1 ( .A(fc_pe_b_peij_3_0_add_fai_10_n4), 
        .ZN(fc_pe_b_peij_3_0_add_c_out) );
  XOR2_X1 fc_pe_b_peij_3_0_add_fai_10_U4 ( .A(o_data4[43]), .B(
        fc_pe_b_peij_3_0_add_notb[10]), .Z(fc_pe_b_peij_3_0_add_fai_10_n5) );
  XOR2_X1 fc_pe_b_peij_3_0_add_fai_10_U3 ( .A(fc_pe_b_peij_3_0_add_cprop[10]), 
        .B(fc_pe_b_peij_3_0_add_fai_10_n5), .Z(fc_pe_b_peij_3_0_d_acc[10]) );
  AND3_X1 fc_pe_b_peij_3_1_U22 ( .A1(fc_pe_b_int_pe_en[2]), .A2(clk), .A3(
        i_kernel4[4]), .ZN(fc_pe_b_peij_3_1_gck) );
  AND2_X1 fc_pe_b_peij_3_1_U21 ( .A1(i_data[3]), .A2(fc_pe_b_peij_3_1_n16), 
        .ZN(fc_pe_b_peij_3_1_N35) );
  AND2_X1 fc_pe_b_peij_3_1_U20 ( .A1(i_data[2]), .A2(fc_pe_b_peij_3_1_n16), 
        .ZN(fc_pe_b_peij_3_1_N34) );
  AND2_X1 fc_pe_b_peij_3_1_U19 ( .A1(i_data[1]), .A2(fc_pe_b_peij_3_1_n16), 
        .ZN(fc_pe_b_peij_3_1_N33) );
  AND2_X1 fc_pe_b_peij_3_1_U18 ( .A1(i_data[0]), .A2(fc_pe_b_peij_3_1_n16), 
        .ZN(fc_pe_b_peij_3_1_N32) );
  AND3_X1 fc_pe_b_peij_3_1_U17 ( .A1(fc_pe_b_int_pe_en[2]), .A2(
        fc_pe_b_peij_3_1_n14), .A3(i_kernel4[4]), .ZN(fc_pe_b_peij_3_1_n16) );
  INV_X1 fc_pe_b_peij_3_1_U16 ( .A(tb_rst_cnt2), .ZN(fc_pe_b_peij_3_1_n12) );
  INV_X1 fc_pe_b_peij_3_1_U14 ( .A(tb_rst_cnt1), .ZN(fc_pe_b_peij_3_1_n14) );
  SDFFR_X1 fc_pe_b_peij_3_1_q_acc_reg_10_ ( .D(1'b0), .SI(fc_pe_b_peij_3_1_n14), .SE(fc_pe_b_peij_3_1_d_acc[10]), .CK(fc_pe_b_peij_3_1_gck), .RN(
        fc_pe_b_peij_3_1_n12), .Q(o_data4[32]) );
  SDFFR_X1 fc_pe_b_peij_3_1_q_acc_reg_9_ ( .D(1'b0), .SI(fc_pe_b_peij_3_1_n14), 
        .SE(fc_pe_b_peij_3_1_d_acc[9]), .CK(fc_pe_b_peij_3_1_gck), .RN(
        fc_pe_b_peij_3_1_n12), .Q(o_data4[31]) );
  SDFFR_X1 fc_pe_b_peij_3_1_q_acc_reg_8_ ( .D(1'b0), .SI(fc_pe_b_peij_3_1_n14), 
        .SE(fc_pe_b_peij_3_1_d_acc[8]), .CK(fc_pe_b_peij_3_1_gck), .RN(
        fc_pe_b_peij_3_1_n12), .Q(o_data4[30]) );
  SDFFR_X1 fc_pe_b_peij_3_1_q_acc_reg_7_ ( .D(1'b0), .SI(fc_pe_b_peij_3_1_n14), 
        .SE(fc_pe_b_peij_3_1_d_acc[7]), .CK(fc_pe_b_peij_3_1_gck), .RN(
        fc_pe_b_peij_3_1_n12), .Q(o_data4[29]) );
  SDFFR_X1 fc_pe_b_peij_3_1_q_acc_reg_6_ ( .D(1'b0), .SI(fc_pe_b_peij_3_1_n14), 
        .SE(fc_pe_b_peij_3_1_d_acc[6]), .CK(fc_pe_b_peij_3_1_gck), .RN(
        fc_pe_b_peij_3_1_n12), .Q(o_data4[28]) );
  SDFFR_X1 fc_pe_b_peij_3_1_q_acc_reg_5_ ( .D(1'b0), .SI(fc_pe_b_peij_3_1_n14), 
        .SE(fc_pe_b_peij_3_1_d_acc[5]), .CK(fc_pe_b_peij_3_1_gck), .RN(
        fc_pe_b_peij_3_1_n12), .Q(o_data4[27]) );
  SDFFR_X1 fc_pe_b_peij_3_1_q_acc_reg_4_ ( .D(1'b0), .SI(fc_pe_b_peij_3_1_n14), 
        .SE(fc_pe_b_peij_3_1_d_acc[4]), .CK(fc_pe_b_peij_3_1_gck), .RN(
        fc_pe_b_peij_3_1_n12), .Q(o_data4[26]) );
  SDFFR_X1 fc_pe_b_peij_3_1_q_acc_reg_3_ ( .D(1'b0), .SI(fc_pe_b_peij_3_1_n14), 
        .SE(fc_pe_b_peij_3_1_d_acc[3]), .CK(fc_pe_b_peij_3_1_gck), .RN(
        fc_pe_b_peij_3_1_n12), .Q(o_data4[25]) );
  SDFFR_X1 fc_pe_b_peij_3_1_q_acc_reg_2_ ( .D(1'b0), .SI(fc_pe_b_peij_3_1_n14), 
        .SE(fc_pe_b_peij_3_1_d_acc[2]), .CK(fc_pe_b_peij_3_1_gck), .RN(
        fc_pe_b_peij_3_1_n12), .Q(o_data4[24]) );
  SDFFR_X1 fc_pe_b_peij_3_1_q_acc_reg_1_ ( .D(1'b0), .SI(fc_pe_b_peij_3_1_n14), 
        .SE(fc_pe_b_peij_3_1_d_acc[1]), .CK(fc_pe_b_peij_3_1_gck), .RN(
        fc_pe_b_peij_3_1_n12), .Q(o_data4[23]) );
  SDFFR_X1 fc_pe_b_peij_3_1_q_acc_reg_0_ ( .D(1'b0), .SI(fc_pe_b_peij_3_1_n14), 
        .SE(fc_pe_b_peij_3_1_d_acc[0]), .CK(fc_pe_b_peij_3_1_gck), .RN(
        fc_pe_b_peij_3_1_n12), .Q(o_data4[22]) );
  DFFR_X1 fc_pe_b_peij_3_1_q_im_reg_0_ ( .D(fc_pe_b_peij_3_1_N32), .CK(
        fc_pe_b_peij_3_1_gck), .RN(fc_pe_b_peij_3_1_n12), .Q(
        fc_pe_b_peij_3_1_sgnext[0]) );
  DFFR_X1 fc_pe_b_peij_3_1_q_im_reg_1_ ( .D(fc_pe_b_peij_3_1_N33), .CK(
        fc_pe_b_peij_3_1_gck), .RN(fc_pe_b_peij_3_1_n12), .Q(
        fc_pe_b_peij_3_1_sgnext[1]) );
  DFFR_X1 fc_pe_b_peij_3_1_q_im_reg_2_ ( .D(fc_pe_b_peij_3_1_N34), .CK(
        fc_pe_b_peij_3_1_gck), .RN(fc_pe_b_peij_3_1_n12), .Q(
        fc_pe_b_peij_3_1_sgnext[2]) );
  DFFR_X1 fc_pe_b_peij_3_1_q_im_reg_3_ ( .D(fc_pe_b_peij_3_1_N35), .CK(
        fc_pe_b_peij_3_1_gck), .RN(fc_pe_b_peij_3_1_n12), .Q(
        fc_pe_b_peij_3_1_sgnext_10) );
  SDFFR_X1 fc_pe_b_peij_3_1_q_k_reg ( .D(1'b0), .SI(fc_pe_b_peij_3_1_n14), 
        .SE(i_kernel4[5]), .CK(fc_pe_b_peij_3_1_gck), .RN(fc_pe_b_peij_3_1_n12), .Q(fc_pe_b_peij_3_1_q_k) );
  XOR2_X1 fc_pe_b_peij_3_1_add_U11 ( .A(fc_pe_b_peij_3_1_sgnext[0]), .B(
        fc_pe_b_peij_3_1_q_k), .Z(fc_pe_b_peij_3_1_add_notb[0]) );
  XOR2_X1 fc_pe_b_peij_3_1_add_U10 ( .A(fc_pe_b_peij_3_1_sgnext_10), .B(
        fc_pe_b_peij_3_1_q_k), .Z(fc_pe_b_peij_3_1_add_notb[10]) );
  XOR2_X1 fc_pe_b_peij_3_1_add_U9 ( .A(fc_pe_b_peij_3_1_sgnext[1]), .B(
        fc_pe_b_peij_3_1_q_k), .Z(fc_pe_b_peij_3_1_add_notb[1]) );
  XOR2_X1 fc_pe_b_peij_3_1_add_U8 ( .A(fc_pe_b_peij_3_1_sgnext[2]), .B(
        fc_pe_b_peij_3_1_q_k), .Z(fc_pe_b_peij_3_1_add_notb[2]) );
  XOR2_X1 fc_pe_b_peij_3_1_add_U7 ( .A(fc_pe_b_peij_3_1_sgnext_10), .B(
        fc_pe_b_peij_3_1_q_k), .Z(fc_pe_b_peij_3_1_add_notb[3]) );
  XOR2_X1 fc_pe_b_peij_3_1_add_U6 ( .A(fc_pe_b_peij_3_1_sgnext_10), .B(
        fc_pe_b_peij_3_1_q_k), .Z(fc_pe_b_peij_3_1_add_notb[4]) );
  XOR2_X1 fc_pe_b_peij_3_1_add_U5 ( .A(fc_pe_b_peij_3_1_sgnext_10), .B(
        fc_pe_b_peij_3_1_q_k), .Z(fc_pe_b_peij_3_1_add_notb[5]) );
  XOR2_X1 fc_pe_b_peij_3_1_add_U4 ( .A(fc_pe_b_peij_3_1_sgnext_10), .B(
        fc_pe_b_peij_3_1_q_k), .Z(fc_pe_b_peij_3_1_add_notb[6]) );
  XOR2_X1 fc_pe_b_peij_3_1_add_U3 ( .A(fc_pe_b_peij_3_1_sgnext_10), .B(
        fc_pe_b_peij_3_1_q_k), .Z(fc_pe_b_peij_3_1_add_notb[7]) );
  XOR2_X1 fc_pe_b_peij_3_1_add_U2 ( .A(fc_pe_b_peij_3_1_sgnext_10), .B(
        fc_pe_b_peij_3_1_q_k), .Z(fc_pe_b_peij_3_1_add_notb[8]) );
  XOR2_X1 fc_pe_b_peij_3_1_add_U1 ( .A(fc_pe_b_peij_3_1_sgnext_10), .B(
        fc_pe_b_peij_3_1_q_k), .Z(fc_pe_b_peij_3_1_add_notb[9]) );
  AOI22_X1 fc_pe_b_peij_3_1_add_fai_0_U2 ( .A1(fc_pe_b_peij_3_1_add_notb[0]), 
        .A2(o_data4[22]), .B1(fc_pe_b_peij_3_1_add_fai_0_n5), .B2(
        fc_pe_b_peij_3_1_q_k), .ZN(fc_pe_b_peij_3_1_add_fai_0_n4) );
  INV_X1 fc_pe_b_peij_3_1_add_fai_0_U1 ( .A(fc_pe_b_peij_3_1_add_fai_0_n4), 
        .ZN(fc_pe_b_peij_3_1_add_cprop[1]) );
  XOR2_X1 fc_pe_b_peij_3_1_add_fai_0_U4 ( .A(o_data4[22]), .B(
        fc_pe_b_peij_3_1_add_notb[0]), .Z(fc_pe_b_peij_3_1_add_fai_0_n5) );
  XOR2_X1 fc_pe_b_peij_3_1_add_fai_0_U3 ( .A(fc_pe_b_peij_3_1_q_k), .B(
        fc_pe_b_peij_3_1_add_fai_0_n5), .Z(fc_pe_b_peij_3_1_d_acc[0]) );
  AOI22_X1 fc_pe_b_peij_3_1_add_fai_1_U2 ( .A1(fc_pe_b_peij_3_1_add_notb[1]), 
        .A2(o_data4[23]), .B1(fc_pe_b_peij_3_1_add_fai_1_n5), .B2(
        fc_pe_b_peij_3_1_add_cprop[1]), .ZN(fc_pe_b_peij_3_1_add_fai_1_n4) );
  INV_X1 fc_pe_b_peij_3_1_add_fai_1_U1 ( .A(fc_pe_b_peij_3_1_add_fai_1_n4), 
        .ZN(fc_pe_b_peij_3_1_add_cprop[2]) );
  XOR2_X1 fc_pe_b_peij_3_1_add_fai_1_U4 ( .A(o_data4[23]), .B(
        fc_pe_b_peij_3_1_add_notb[1]), .Z(fc_pe_b_peij_3_1_add_fai_1_n5) );
  XOR2_X1 fc_pe_b_peij_3_1_add_fai_1_U3 ( .A(fc_pe_b_peij_3_1_add_cprop[1]), 
        .B(fc_pe_b_peij_3_1_add_fai_1_n5), .Z(fc_pe_b_peij_3_1_d_acc[1]) );
  AOI22_X1 fc_pe_b_peij_3_1_add_fai_2_U2 ( .A1(fc_pe_b_peij_3_1_add_notb[2]), 
        .A2(o_data4[24]), .B1(fc_pe_b_peij_3_1_add_fai_2_n5), .B2(
        fc_pe_b_peij_3_1_add_cprop[2]), .ZN(fc_pe_b_peij_3_1_add_fai_2_n4) );
  INV_X1 fc_pe_b_peij_3_1_add_fai_2_U1 ( .A(fc_pe_b_peij_3_1_add_fai_2_n4), 
        .ZN(fc_pe_b_peij_3_1_add_cprop[3]) );
  XOR2_X1 fc_pe_b_peij_3_1_add_fai_2_U4 ( .A(o_data4[24]), .B(
        fc_pe_b_peij_3_1_add_notb[2]), .Z(fc_pe_b_peij_3_1_add_fai_2_n5) );
  XOR2_X1 fc_pe_b_peij_3_1_add_fai_2_U3 ( .A(fc_pe_b_peij_3_1_add_cprop[2]), 
        .B(fc_pe_b_peij_3_1_add_fai_2_n5), .Z(fc_pe_b_peij_3_1_d_acc[2]) );
  AOI22_X1 fc_pe_b_peij_3_1_add_fai_3_U2 ( .A1(fc_pe_b_peij_3_1_add_notb[3]), 
        .A2(o_data4[25]), .B1(fc_pe_b_peij_3_1_add_fai_3_n5), .B2(
        fc_pe_b_peij_3_1_add_cprop[3]), .ZN(fc_pe_b_peij_3_1_add_fai_3_n4) );
  INV_X1 fc_pe_b_peij_3_1_add_fai_3_U1 ( .A(fc_pe_b_peij_3_1_add_fai_3_n4), 
        .ZN(fc_pe_b_peij_3_1_add_cprop[4]) );
  XOR2_X1 fc_pe_b_peij_3_1_add_fai_3_U4 ( .A(o_data4[25]), .B(
        fc_pe_b_peij_3_1_add_notb[3]), .Z(fc_pe_b_peij_3_1_add_fai_3_n5) );
  XOR2_X1 fc_pe_b_peij_3_1_add_fai_3_U3 ( .A(fc_pe_b_peij_3_1_add_cprop[3]), 
        .B(fc_pe_b_peij_3_1_add_fai_3_n5), .Z(fc_pe_b_peij_3_1_d_acc[3]) );
  AOI22_X1 fc_pe_b_peij_3_1_add_fai_4_U2 ( .A1(fc_pe_b_peij_3_1_add_notb[4]), 
        .A2(o_data4[26]), .B1(fc_pe_b_peij_3_1_add_fai_4_n5), .B2(
        fc_pe_b_peij_3_1_add_cprop[4]), .ZN(fc_pe_b_peij_3_1_add_fai_4_n4) );
  INV_X1 fc_pe_b_peij_3_1_add_fai_4_U1 ( .A(fc_pe_b_peij_3_1_add_fai_4_n4), 
        .ZN(fc_pe_b_peij_3_1_add_cprop[5]) );
  XOR2_X1 fc_pe_b_peij_3_1_add_fai_4_U4 ( .A(o_data4[26]), .B(
        fc_pe_b_peij_3_1_add_notb[4]), .Z(fc_pe_b_peij_3_1_add_fai_4_n5) );
  XOR2_X1 fc_pe_b_peij_3_1_add_fai_4_U3 ( .A(fc_pe_b_peij_3_1_add_cprop[4]), 
        .B(fc_pe_b_peij_3_1_add_fai_4_n5), .Z(fc_pe_b_peij_3_1_d_acc[4]) );
  AOI22_X1 fc_pe_b_peij_3_1_add_fai_5_U2 ( .A1(fc_pe_b_peij_3_1_add_notb[5]), 
        .A2(o_data4[27]), .B1(fc_pe_b_peij_3_1_add_fai_5_n5), .B2(
        fc_pe_b_peij_3_1_add_cprop[5]), .ZN(fc_pe_b_peij_3_1_add_fai_5_n4) );
  INV_X1 fc_pe_b_peij_3_1_add_fai_5_U1 ( .A(fc_pe_b_peij_3_1_add_fai_5_n4), 
        .ZN(fc_pe_b_peij_3_1_add_cprop[6]) );
  XOR2_X1 fc_pe_b_peij_3_1_add_fai_5_U4 ( .A(o_data4[27]), .B(
        fc_pe_b_peij_3_1_add_notb[5]), .Z(fc_pe_b_peij_3_1_add_fai_5_n5) );
  XOR2_X1 fc_pe_b_peij_3_1_add_fai_5_U3 ( .A(fc_pe_b_peij_3_1_add_cprop[5]), 
        .B(fc_pe_b_peij_3_1_add_fai_5_n5), .Z(fc_pe_b_peij_3_1_d_acc[5]) );
  AOI22_X1 fc_pe_b_peij_3_1_add_fai_6_U2 ( .A1(fc_pe_b_peij_3_1_add_notb[6]), 
        .A2(o_data4[28]), .B1(fc_pe_b_peij_3_1_add_fai_6_n5), .B2(
        fc_pe_b_peij_3_1_add_cprop[6]), .ZN(fc_pe_b_peij_3_1_add_fai_6_n4) );
  INV_X1 fc_pe_b_peij_3_1_add_fai_6_U1 ( .A(fc_pe_b_peij_3_1_add_fai_6_n4), 
        .ZN(fc_pe_b_peij_3_1_add_cprop[7]) );
  XOR2_X1 fc_pe_b_peij_3_1_add_fai_6_U4 ( .A(o_data4[28]), .B(
        fc_pe_b_peij_3_1_add_notb[6]), .Z(fc_pe_b_peij_3_1_add_fai_6_n5) );
  XOR2_X1 fc_pe_b_peij_3_1_add_fai_6_U3 ( .A(fc_pe_b_peij_3_1_add_cprop[6]), 
        .B(fc_pe_b_peij_3_1_add_fai_6_n5), .Z(fc_pe_b_peij_3_1_d_acc[6]) );
  AOI22_X1 fc_pe_b_peij_3_1_add_fai_7_U2 ( .A1(fc_pe_b_peij_3_1_add_notb[7]), 
        .A2(o_data4[29]), .B1(fc_pe_b_peij_3_1_add_fai_7_n5), .B2(
        fc_pe_b_peij_3_1_add_cprop[7]), .ZN(fc_pe_b_peij_3_1_add_fai_7_n4) );
  INV_X1 fc_pe_b_peij_3_1_add_fai_7_U1 ( .A(fc_pe_b_peij_3_1_add_fai_7_n4), 
        .ZN(fc_pe_b_peij_3_1_add_cprop[8]) );
  XOR2_X1 fc_pe_b_peij_3_1_add_fai_7_U4 ( .A(o_data4[29]), .B(
        fc_pe_b_peij_3_1_add_notb[7]), .Z(fc_pe_b_peij_3_1_add_fai_7_n5) );
  XOR2_X1 fc_pe_b_peij_3_1_add_fai_7_U3 ( .A(fc_pe_b_peij_3_1_add_cprop[7]), 
        .B(fc_pe_b_peij_3_1_add_fai_7_n5), .Z(fc_pe_b_peij_3_1_d_acc[7]) );
  AOI22_X1 fc_pe_b_peij_3_1_add_fai_8_U2 ( .A1(fc_pe_b_peij_3_1_add_notb[8]), 
        .A2(o_data4[30]), .B1(fc_pe_b_peij_3_1_add_fai_8_n5), .B2(
        fc_pe_b_peij_3_1_add_cprop[8]), .ZN(fc_pe_b_peij_3_1_add_fai_8_n4) );
  INV_X1 fc_pe_b_peij_3_1_add_fai_8_U1 ( .A(fc_pe_b_peij_3_1_add_fai_8_n4), 
        .ZN(fc_pe_b_peij_3_1_add_cprop[9]) );
  XOR2_X1 fc_pe_b_peij_3_1_add_fai_8_U4 ( .A(o_data4[30]), .B(
        fc_pe_b_peij_3_1_add_notb[8]), .Z(fc_pe_b_peij_3_1_add_fai_8_n5) );
  XOR2_X1 fc_pe_b_peij_3_1_add_fai_8_U3 ( .A(fc_pe_b_peij_3_1_add_cprop[8]), 
        .B(fc_pe_b_peij_3_1_add_fai_8_n5), .Z(fc_pe_b_peij_3_1_d_acc[8]) );
  AOI22_X1 fc_pe_b_peij_3_1_add_fai_9_U2 ( .A1(fc_pe_b_peij_3_1_add_notb[9]), 
        .A2(o_data4[31]), .B1(fc_pe_b_peij_3_1_add_fai_9_n5), .B2(
        fc_pe_b_peij_3_1_add_cprop[9]), .ZN(fc_pe_b_peij_3_1_add_fai_9_n4) );
  INV_X1 fc_pe_b_peij_3_1_add_fai_9_U1 ( .A(fc_pe_b_peij_3_1_add_fai_9_n4), 
        .ZN(fc_pe_b_peij_3_1_add_cprop[10]) );
  XOR2_X1 fc_pe_b_peij_3_1_add_fai_9_U4 ( .A(o_data4[31]), .B(
        fc_pe_b_peij_3_1_add_notb[9]), .Z(fc_pe_b_peij_3_1_add_fai_9_n5) );
  XOR2_X1 fc_pe_b_peij_3_1_add_fai_9_U3 ( .A(fc_pe_b_peij_3_1_add_cprop[9]), 
        .B(fc_pe_b_peij_3_1_add_fai_9_n5), .Z(fc_pe_b_peij_3_1_d_acc[9]) );
  AOI22_X1 fc_pe_b_peij_3_1_add_fai_10_U2 ( .A1(fc_pe_b_peij_3_1_add_notb[10]), 
        .A2(o_data4[32]), .B1(fc_pe_b_peij_3_1_add_fai_10_n5), .B2(
        fc_pe_b_peij_3_1_add_cprop[10]), .ZN(fc_pe_b_peij_3_1_add_fai_10_n4)
         );
  INV_X1 fc_pe_b_peij_3_1_add_fai_10_U1 ( .A(fc_pe_b_peij_3_1_add_fai_10_n4), 
        .ZN(fc_pe_b_peij_3_1_add_c_out) );
  XOR2_X1 fc_pe_b_peij_3_1_add_fai_10_U4 ( .A(o_data4[32]), .B(
        fc_pe_b_peij_3_1_add_notb[10]), .Z(fc_pe_b_peij_3_1_add_fai_10_n5) );
  XOR2_X1 fc_pe_b_peij_3_1_add_fai_10_U3 ( .A(fc_pe_b_peij_3_1_add_cprop[10]), 
        .B(fc_pe_b_peij_3_1_add_fai_10_n5), .Z(fc_pe_b_peij_3_1_d_acc[10]) );
  AND3_X1 fc_pe_b_peij_3_2_U22 ( .A1(fc_pe_b_int_pe_en[1]), .A2(clk), .A3(
        i_kernel4[2]), .ZN(fc_pe_b_peij_3_2_gck) );
  AND2_X1 fc_pe_b_peij_3_2_U21 ( .A1(i_data[3]), .A2(fc_pe_b_peij_3_2_n16), 
        .ZN(fc_pe_b_peij_3_2_N35) );
  AND2_X1 fc_pe_b_peij_3_2_U20 ( .A1(i_data[2]), .A2(fc_pe_b_peij_3_2_n16), 
        .ZN(fc_pe_b_peij_3_2_N34) );
  AND2_X1 fc_pe_b_peij_3_2_U19 ( .A1(i_data[1]), .A2(fc_pe_b_peij_3_2_n16), 
        .ZN(fc_pe_b_peij_3_2_N33) );
  AND2_X1 fc_pe_b_peij_3_2_U18 ( .A1(i_data[0]), .A2(fc_pe_b_peij_3_2_n16), 
        .ZN(fc_pe_b_peij_3_2_N32) );
  AND3_X1 fc_pe_b_peij_3_2_U17 ( .A1(fc_pe_b_int_pe_en[1]), .A2(
        fc_pe_b_peij_3_2_n14), .A3(i_kernel4[2]), .ZN(fc_pe_b_peij_3_2_n16) );
  INV_X1 fc_pe_b_peij_3_2_U16 ( .A(tb_rst_cnt2), .ZN(fc_pe_b_peij_3_2_n12) );
  INV_X1 fc_pe_b_peij_3_2_U14 ( .A(tb_rst_cnt1), .ZN(fc_pe_b_peij_3_2_n14) );
  SDFFR_X1 fc_pe_b_peij_3_2_q_acc_reg_10_ ( .D(1'b0), .SI(fc_pe_b_peij_3_2_n14), .SE(fc_pe_b_peij_3_2_d_acc[10]), .CK(fc_pe_b_peij_3_2_gck), .RN(
        fc_pe_b_peij_3_2_n12), .Q(o_data4[21]) );
  SDFFR_X1 fc_pe_b_peij_3_2_q_acc_reg_9_ ( .D(1'b0), .SI(fc_pe_b_peij_3_2_n14), 
        .SE(fc_pe_b_peij_3_2_d_acc[9]), .CK(fc_pe_b_peij_3_2_gck), .RN(
        fc_pe_b_peij_3_2_n12), .Q(o_data4[20]) );
  SDFFR_X1 fc_pe_b_peij_3_2_q_acc_reg_8_ ( .D(1'b0), .SI(fc_pe_b_peij_3_2_n14), 
        .SE(fc_pe_b_peij_3_2_d_acc[8]), .CK(fc_pe_b_peij_3_2_gck), .RN(
        fc_pe_b_peij_3_2_n12), .Q(o_data4[19]) );
  SDFFR_X1 fc_pe_b_peij_3_2_q_acc_reg_7_ ( .D(1'b0), .SI(fc_pe_b_peij_3_2_n14), 
        .SE(fc_pe_b_peij_3_2_d_acc[7]), .CK(fc_pe_b_peij_3_2_gck), .RN(
        fc_pe_b_peij_3_2_n12), .Q(o_data4[18]) );
  SDFFR_X1 fc_pe_b_peij_3_2_q_acc_reg_6_ ( .D(1'b0), .SI(fc_pe_b_peij_3_2_n14), 
        .SE(fc_pe_b_peij_3_2_d_acc[6]), .CK(fc_pe_b_peij_3_2_gck), .RN(
        fc_pe_b_peij_3_2_n12), .Q(o_data4[17]) );
  SDFFR_X1 fc_pe_b_peij_3_2_q_acc_reg_5_ ( .D(1'b0), .SI(fc_pe_b_peij_3_2_n14), 
        .SE(fc_pe_b_peij_3_2_d_acc[5]), .CK(fc_pe_b_peij_3_2_gck), .RN(
        fc_pe_b_peij_3_2_n12), .Q(o_data4[16]) );
  SDFFR_X1 fc_pe_b_peij_3_2_q_acc_reg_4_ ( .D(1'b0), .SI(fc_pe_b_peij_3_2_n14), 
        .SE(fc_pe_b_peij_3_2_d_acc[4]), .CK(fc_pe_b_peij_3_2_gck), .RN(
        fc_pe_b_peij_3_2_n12), .Q(o_data4[15]) );
  SDFFR_X1 fc_pe_b_peij_3_2_q_acc_reg_3_ ( .D(1'b0), .SI(fc_pe_b_peij_3_2_n14), 
        .SE(fc_pe_b_peij_3_2_d_acc[3]), .CK(fc_pe_b_peij_3_2_gck), .RN(
        fc_pe_b_peij_3_2_n12), .Q(o_data4[14]) );
  SDFFR_X1 fc_pe_b_peij_3_2_q_acc_reg_2_ ( .D(1'b0), .SI(fc_pe_b_peij_3_2_n14), 
        .SE(fc_pe_b_peij_3_2_d_acc[2]), .CK(fc_pe_b_peij_3_2_gck), .RN(
        fc_pe_b_peij_3_2_n12), .Q(o_data4[13]) );
  SDFFR_X1 fc_pe_b_peij_3_2_q_acc_reg_1_ ( .D(1'b0), .SI(fc_pe_b_peij_3_2_n14), 
        .SE(fc_pe_b_peij_3_2_d_acc[1]), .CK(fc_pe_b_peij_3_2_gck), .RN(
        fc_pe_b_peij_3_2_n12), .Q(o_data4[12]) );
  SDFFR_X1 fc_pe_b_peij_3_2_q_acc_reg_0_ ( .D(1'b0), .SI(fc_pe_b_peij_3_2_n14), 
        .SE(fc_pe_b_peij_3_2_d_acc[0]), .CK(fc_pe_b_peij_3_2_gck), .RN(
        fc_pe_b_peij_3_2_n12), .Q(o_data4[11]) );
  DFFR_X1 fc_pe_b_peij_3_2_q_im_reg_0_ ( .D(fc_pe_b_peij_3_2_N32), .CK(
        fc_pe_b_peij_3_2_gck), .RN(fc_pe_b_peij_3_2_n12), .Q(
        fc_pe_b_peij_3_2_sgnext[0]) );
  DFFR_X1 fc_pe_b_peij_3_2_q_im_reg_1_ ( .D(fc_pe_b_peij_3_2_N33), .CK(
        fc_pe_b_peij_3_2_gck), .RN(fc_pe_b_peij_3_2_n12), .Q(
        fc_pe_b_peij_3_2_sgnext[1]) );
  DFFR_X1 fc_pe_b_peij_3_2_q_im_reg_2_ ( .D(fc_pe_b_peij_3_2_N34), .CK(
        fc_pe_b_peij_3_2_gck), .RN(fc_pe_b_peij_3_2_n12), .Q(
        fc_pe_b_peij_3_2_sgnext[2]) );
  DFFR_X1 fc_pe_b_peij_3_2_q_im_reg_3_ ( .D(fc_pe_b_peij_3_2_N35), .CK(
        fc_pe_b_peij_3_2_gck), .RN(fc_pe_b_peij_3_2_n12), .Q(
        fc_pe_b_peij_3_2_sgnext_10) );
  SDFFR_X1 fc_pe_b_peij_3_2_q_k_reg ( .D(1'b0), .SI(fc_pe_b_peij_3_2_n14), 
        .SE(i_kernel4[3]), .CK(fc_pe_b_peij_3_2_gck), .RN(fc_pe_b_peij_3_2_n12), .Q(fc_pe_b_peij_3_2_q_k) );
  XOR2_X1 fc_pe_b_peij_3_2_add_U11 ( .A(fc_pe_b_peij_3_2_sgnext[0]), .B(
        fc_pe_b_peij_3_2_q_k), .Z(fc_pe_b_peij_3_2_add_notb[0]) );
  XOR2_X1 fc_pe_b_peij_3_2_add_U10 ( .A(fc_pe_b_peij_3_2_sgnext_10), .B(
        fc_pe_b_peij_3_2_q_k), .Z(fc_pe_b_peij_3_2_add_notb[10]) );
  XOR2_X1 fc_pe_b_peij_3_2_add_U9 ( .A(fc_pe_b_peij_3_2_sgnext[1]), .B(
        fc_pe_b_peij_3_2_q_k), .Z(fc_pe_b_peij_3_2_add_notb[1]) );
  XOR2_X1 fc_pe_b_peij_3_2_add_U8 ( .A(fc_pe_b_peij_3_2_sgnext[2]), .B(
        fc_pe_b_peij_3_2_q_k), .Z(fc_pe_b_peij_3_2_add_notb[2]) );
  XOR2_X1 fc_pe_b_peij_3_2_add_U7 ( .A(fc_pe_b_peij_3_2_sgnext_10), .B(
        fc_pe_b_peij_3_2_q_k), .Z(fc_pe_b_peij_3_2_add_notb[3]) );
  XOR2_X1 fc_pe_b_peij_3_2_add_U6 ( .A(fc_pe_b_peij_3_2_sgnext_10), .B(
        fc_pe_b_peij_3_2_q_k), .Z(fc_pe_b_peij_3_2_add_notb[4]) );
  XOR2_X1 fc_pe_b_peij_3_2_add_U5 ( .A(fc_pe_b_peij_3_2_sgnext_10), .B(
        fc_pe_b_peij_3_2_q_k), .Z(fc_pe_b_peij_3_2_add_notb[5]) );
  XOR2_X1 fc_pe_b_peij_3_2_add_U4 ( .A(fc_pe_b_peij_3_2_sgnext_10), .B(
        fc_pe_b_peij_3_2_q_k), .Z(fc_pe_b_peij_3_2_add_notb[6]) );
  XOR2_X1 fc_pe_b_peij_3_2_add_U3 ( .A(fc_pe_b_peij_3_2_sgnext_10), .B(
        fc_pe_b_peij_3_2_q_k), .Z(fc_pe_b_peij_3_2_add_notb[7]) );
  XOR2_X1 fc_pe_b_peij_3_2_add_U2 ( .A(fc_pe_b_peij_3_2_sgnext_10), .B(
        fc_pe_b_peij_3_2_q_k), .Z(fc_pe_b_peij_3_2_add_notb[8]) );
  XOR2_X1 fc_pe_b_peij_3_2_add_U1 ( .A(fc_pe_b_peij_3_2_sgnext_10), .B(
        fc_pe_b_peij_3_2_q_k), .Z(fc_pe_b_peij_3_2_add_notb[9]) );
  AOI22_X1 fc_pe_b_peij_3_2_add_fai_0_U2 ( .A1(fc_pe_b_peij_3_2_add_notb[0]), 
        .A2(o_data4[11]), .B1(fc_pe_b_peij_3_2_add_fai_0_n5), .B2(
        fc_pe_b_peij_3_2_q_k), .ZN(fc_pe_b_peij_3_2_add_fai_0_n4) );
  INV_X1 fc_pe_b_peij_3_2_add_fai_0_U1 ( .A(fc_pe_b_peij_3_2_add_fai_0_n4), 
        .ZN(fc_pe_b_peij_3_2_add_cprop[1]) );
  XOR2_X1 fc_pe_b_peij_3_2_add_fai_0_U4 ( .A(o_data4[11]), .B(
        fc_pe_b_peij_3_2_add_notb[0]), .Z(fc_pe_b_peij_3_2_add_fai_0_n5) );
  XOR2_X1 fc_pe_b_peij_3_2_add_fai_0_U3 ( .A(fc_pe_b_peij_3_2_q_k), .B(
        fc_pe_b_peij_3_2_add_fai_0_n5), .Z(fc_pe_b_peij_3_2_d_acc[0]) );
  AOI22_X1 fc_pe_b_peij_3_2_add_fai_1_U2 ( .A1(fc_pe_b_peij_3_2_add_notb[1]), 
        .A2(o_data4[12]), .B1(fc_pe_b_peij_3_2_add_fai_1_n5), .B2(
        fc_pe_b_peij_3_2_add_cprop[1]), .ZN(fc_pe_b_peij_3_2_add_fai_1_n4) );
  INV_X1 fc_pe_b_peij_3_2_add_fai_1_U1 ( .A(fc_pe_b_peij_3_2_add_fai_1_n4), 
        .ZN(fc_pe_b_peij_3_2_add_cprop[2]) );
  XOR2_X1 fc_pe_b_peij_3_2_add_fai_1_U4 ( .A(o_data4[12]), .B(
        fc_pe_b_peij_3_2_add_notb[1]), .Z(fc_pe_b_peij_3_2_add_fai_1_n5) );
  XOR2_X1 fc_pe_b_peij_3_2_add_fai_1_U3 ( .A(fc_pe_b_peij_3_2_add_cprop[1]), 
        .B(fc_pe_b_peij_3_2_add_fai_1_n5), .Z(fc_pe_b_peij_3_2_d_acc[1]) );
  AOI22_X1 fc_pe_b_peij_3_2_add_fai_2_U2 ( .A1(fc_pe_b_peij_3_2_add_notb[2]), 
        .A2(o_data4[13]), .B1(fc_pe_b_peij_3_2_add_fai_2_n5), .B2(
        fc_pe_b_peij_3_2_add_cprop[2]), .ZN(fc_pe_b_peij_3_2_add_fai_2_n4) );
  INV_X1 fc_pe_b_peij_3_2_add_fai_2_U1 ( .A(fc_pe_b_peij_3_2_add_fai_2_n4), 
        .ZN(fc_pe_b_peij_3_2_add_cprop[3]) );
  XOR2_X1 fc_pe_b_peij_3_2_add_fai_2_U4 ( .A(o_data4[13]), .B(
        fc_pe_b_peij_3_2_add_notb[2]), .Z(fc_pe_b_peij_3_2_add_fai_2_n5) );
  XOR2_X1 fc_pe_b_peij_3_2_add_fai_2_U3 ( .A(fc_pe_b_peij_3_2_add_cprop[2]), 
        .B(fc_pe_b_peij_3_2_add_fai_2_n5), .Z(fc_pe_b_peij_3_2_d_acc[2]) );
  AOI22_X1 fc_pe_b_peij_3_2_add_fai_3_U2 ( .A1(fc_pe_b_peij_3_2_add_notb[3]), 
        .A2(o_data4[14]), .B1(fc_pe_b_peij_3_2_add_fai_3_n5), .B2(
        fc_pe_b_peij_3_2_add_cprop[3]), .ZN(fc_pe_b_peij_3_2_add_fai_3_n4) );
  INV_X1 fc_pe_b_peij_3_2_add_fai_3_U1 ( .A(fc_pe_b_peij_3_2_add_fai_3_n4), 
        .ZN(fc_pe_b_peij_3_2_add_cprop[4]) );
  XOR2_X1 fc_pe_b_peij_3_2_add_fai_3_U4 ( .A(o_data4[14]), .B(
        fc_pe_b_peij_3_2_add_notb[3]), .Z(fc_pe_b_peij_3_2_add_fai_3_n5) );
  XOR2_X1 fc_pe_b_peij_3_2_add_fai_3_U3 ( .A(fc_pe_b_peij_3_2_add_cprop[3]), 
        .B(fc_pe_b_peij_3_2_add_fai_3_n5), .Z(fc_pe_b_peij_3_2_d_acc[3]) );
  AOI22_X1 fc_pe_b_peij_3_2_add_fai_4_U2 ( .A1(fc_pe_b_peij_3_2_add_notb[4]), 
        .A2(o_data4[15]), .B1(fc_pe_b_peij_3_2_add_fai_4_n5), .B2(
        fc_pe_b_peij_3_2_add_cprop[4]), .ZN(fc_pe_b_peij_3_2_add_fai_4_n4) );
  INV_X1 fc_pe_b_peij_3_2_add_fai_4_U1 ( .A(fc_pe_b_peij_3_2_add_fai_4_n4), 
        .ZN(fc_pe_b_peij_3_2_add_cprop[5]) );
  XOR2_X1 fc_pe_b_peij_3_2_add_fai_4_U4 ( .A(o_data4[15]), .B(
        fc_pe_b_peij_3_2_add_notb[4]), .Z(fc_pe_b_peij_3_2_add_fai_4_n5) );
  XOR2_X1 fc_pe_b_peij_3_2_add_fai_4_U3 ( .A(fc_pe_b_peij_3_2_add_cprop[4]), 
        .B(fc_pe_b_peij_3_2_add_fai_4_n5), .Z(fc_pe_b_peij_3_2_d_acc[4]) );
  AOI22_X1 fc_pe_b_peij_3_2_add_fai_5_U2 ( .A1(fc_pe_b_peij_3_2_add_notb[5]), 
        .A2(o_data4[16]), .B1(fc_pe_b_peij_3_2_add_fai_5_n5), .B2(
        fc_pe_b_peij_3_2_add_cprop[5]), .ZN(fc_pe_b_peij_3_2_add_fai_5_n4) );
  INV_X1 fc_pe_b_peij_3_2_add_fai_5_U1 ( .A(fc_pe_b_peij_3_2_add_fai_5_n4), 
        .ZN(fc_pe_b_peij_3_2_add_cprop[6]) );
  XOR2_X1 fc_pe_b_peij_3_2_add_fai_5_U4 ( .A(o_data4[16]), .B(
        fc_pe_b_peij_3_2_add_notb[5]), .Z(fc_pe_b_peij_3_2_add_fai_5_n5) );
  XOR2_X1 fc_pe_b_peij_3_2_add_fai_5_U3 ( .A(fc_pe_b_peij_3_2_add_cprop[5]), 
        .B(fc_pe_b_peij_3_2_add_fai_5_n5), .Z(fc_pe_b_peij_3_2_d_acc[5]) );
  AOI22_X1 fc_pe_b_peij_3_2_add_fai_6_U2 ( .A1(fc_pe_b_peij_3_2_add_notb[6]), 
        .A2(o_data4[17]), .B1(fc_pe_b_peij_3_2_add_fai_6_n5), .B2(
        fc_pe_b_peij_3_2_add_cprop[6]), .ZN(fc_pe_b_peij_3_2_add_fai_6_n4) );
  INV_X1 fc_pe_b_peij_3_2_add_fai_6_U1 ( .A(fc_pe_b_peij_3_2_add_fai_6_n4), 
        .ZN(fc_pe_b_peij_3_2_add_cprop[7]) );
  XOR2_X1 fc_pe_b_peij_3_2_add_fai_6_U4 ( .A(o_data4[17]), .B(
        fc_pe_b_peij_3_2_add_notb[6]), .Z(fc_pe_b_peij_3_2_add_fai_6_n5) );
  XOR2_X1 fc_pe_b_peij_3_2_add_fai_6_U3 ( .A(fc_pe_b_peij_3_2_add_cprop[6]), 
        .B(fc_pe_b_peij_3_2_add_fai_6_n5), .Z(fc_pe_b_peij_3_2_d_acc[6]) );
  AOI22_X1 fc_pe_b_peij_3_2_add_fai_7_U2 ( .A1(fc_pe_b_peij_3_2_add_notb[7]), 
        .A2(o_data4[18]), .B1(fc_pe_b_peij_3_2_add_fai_7_n5), .B2(
        fc_pe_b_peij_3_2_add_cprop[7]), .ZN(fc_pe_b_peij_3_2_add_fai_7_n4) );
  INV_X1 fc_pe_b_peij_3_2_add_fai_7_U1 ( .A(fc_pe_b_peij_3_2_add_fai_7_n4), 
        .ZN(fc_pe_b_peij_3_2_add_cprop[8]) );
  XOR2_X1 fc_pe_b_peij_3_2_add_fai_7_U4 ( .A(o_data4[18]), .B(
        fc_pe_b_peij_3_2_add_notb[7]), .Z(fc_pe_b_peij_3_2_add_fai_7_n5) );
  XOR2_X1 fc_pe_b_peij_3_2_add_fai_7_U3 ( .A(fc_pe_b_peij_3_2_add_cprop[7]), 
        .B(fc_pe_b_peij_3_2_add_fai_7_n5), .Z(fc_pe_b_peij_3_2_d_acc[7]) );
  AOI22_X1 fc_pe_b_peij_3_2_add_fai_8_U2 ( .A1(fc_pe_b_peij_3_2_add_notb[8]), 
        .A2(o_data4[19]), .B1(fc_pe_b_peij_3_2_add_fai_8_n5), .B2(
        fc_pe_b_peij_3_2_add_cprop[8]), .ZN(fc_pe_b_peij_3_2_add_fai_8_n4) );
  INV_X1 fc_pe_b_peij_3_2_add_fai_8_U1 ( .A(fc_pe_b_peij_3_2_add_fai_8_n4), 
        .ZN(fc_pe_b_peij_3_2_add_cprop[9]) );
  XOR2_X1 fc_pe_b_peij_3_2_add_fai_8_U4 ( .A(o_data4[19]), .B(
        fc_pe_b_peij_3_2_add_notb[8]), .Z(fc_pe_b_peij_3_2_add_fai_8_n5) );
  XOR2_X1 fc_pe_b_peij_3_2_add_fai_8_U3 ( .A(fc_pe_b_peij_3_2_add_cprop[8]), 
        .B(fc_pe_b_peij_3_2_add_fai_8_n5), .Z(fc_pe_b_peij_3_2_d_acc[8]) );
  AOI22_X1 fc_pe_b_peij_3_2_add_fai_9_U2 ( .A1(fc_pe_b_peij_3_2_add_notb[9]), 
        .A2(o_data4[20]), .B1(fc_pe_b_peij_3_2_add_fai_9_n5), .B2(
        fc_pe_b_peij_3_2_add_cprop[9]), .ZN(fc_pe_b_peij_3_2_add_fai_9_n4) );
  INV_X1 fc_pe_b_peij_3_2_add_fai_9_U1 ( .A(fc_pe_b_peij_3_2_add_fai_9_n4), 
        .ZN(fc_pe_b_peij_3_2_add_cprop[10]) );
  XOR2_X1 fc_pe_b_peij_3_2_add_fai_9_U4 ( .A(o_data4[20]), .B(
        fc_pe_b_peij_3_2_add_notb[9]), .Z(fc_pe_b_peij_3_2_add_fai_9_n5) );
  XOR2_X1 fc_pe_b_peij_3_2_add_fai_9_U3 ( .A(fc_pe_b_peij_3_2_add_cprop[9]), 
        .B(fc_pe_b_peij_3_2_add_fai_9_n5), .Z(fc_pe_b_peij_3_2_d_acc[9]) );
  AOI22_X1 fc_pe_b_peij_3_2_add_fai_10_U2 ( .A1(fc_pe_b_peij_3_2_add_notb[10]), 
        .A2(o_data4[21]), .B1(fc_pe_b_peij_3_2_add_fai_10_n5), .B2(
        fc_pe_b_peij_3_2_add_cprop[10]), .ZN(fc_pe_b_peij_3_2_add_fai_10_n4)
         );
  INV_X1 fc_pe_b_peij_3_2_add_fai_10_U1 ( .A(fc_pe_b_peij_3_2_add_fai_10_n4), 
        .ZN(fc_pe_b_peij_3_2_add_c_out) );
  XOR2_X1 fc_pe_b_peij_3_2_add_fai_10_U4 ( .A(o_data4[21]), .B(
        fc_pe_b_peij_3_2_add_notb[10]), .Z(fc_pe_b_peij_3_2_add_fai_10_n5) );
  XOR2_X1 fc_pe_b_peij_3_2_add_fai_10_U3 ( .A(fc_pe_b_peij_3_2_add_cprop[10]), 
        .B(fc_pe_b_peij_3_2_add_fai_10_n5), .Z(fc_pe_b_peij_3_2_d_acc[10]) );
  AND3_X1 fc_pe_b_peij_3_3_U22 ( .A1(fc_pe_b_int_pe_en[0]), .A2(clk), .A3(
        i_kernel4[0]), .ZN(fc_pe_b_peij_3_3_gck) );
  AND2_X1 fc_pe_b_peij_3_3_U21 ( .A1(i_data[3]), .A2(fc_pe_b_peij_3_3_n16), 
        .ZN(fc_pe_b_peij_3_3_N35) );
  AND2_X1 fc_pe_b_peij_3_3_U20 ( .A1(i_data[2]), .A2(fc_pe_b_peij_3_3_n16), 
        .ZN(fc_pe_b_peij_3_3_N34) );
  AND2_X1 fc_pe_b_peij_3_3_U19 ( .A1(i_data[1]), .A2(fc_pe_b_peij_3_3_n16), 
        .ZN(fc_pe_b_peij_3_3_N33) );
  AND2_X1 fc_pe_b_peij_3_3_U18 ( .A1(i_data[0]), .A2(fc_pe_b_peij_3_3_n16), 
        .ZN(fc_pe_b_peij_3_3_N32) );
  AND3_X1 fc_pe_b_peij_3_3_U17 ( .A1(fc_pe_b_int_pe_en[0]), .A2(
        fc_pe_b_peij_3_3_n14), .A3(i_kernel4[0]), .ZN(fc_pe_b_peij_3_3_n16) );
  INV_X1 fc_pe_b_peij_3_3_U16 ( .A(tb_rst_cnt2), .ZN(fc_pe_b_peij_3_3_n12) );
  INV_X1 fc_pe_b_peij_3_3_U14 ( .A(tb_rst_cnt1), .ZN(fc_pe_b_peij_3_3_n14) );
  SDFFR_X1 fc_pe_b_peij_3_3_q_acc_reg_10_ ( .D(1'b0), .SI(fc_pe_b_peij_3_3_n14), .SE(fc_pe_b_peij_3_3_d_acc[10]), .CK(fc_pe_b_peij_3_3_gck), .RN(
        fc_pe_b_peij_3_3_n12), .Q(o_data4[10]) );
  SDFFR_X1 fc_pe_b_peij_3_3_q_acc_reg_9_ ( .D(1'b0), .SI(fc_pe_b_peij_3_3_n14), 
        .SE(fc_pe_b_peij_3_3_d_acc[9]), .CK(fc_pe_b_peij_3_3_gck), .RN(
        fc_pe_b_peij_3_3_n12), .Q(o_data4[9]) );
  SDFFR_X1 fc_pe_b_peij_3_3_q_acc_reg_8_ ( .D(1'b0), .SI(fc_pe_b_peij_3_3_n14), 
        .SE(fc_pe_b_peij_3_3_d_acc[8]), .CK(fc_pe_b_peij_3_3_gck), .RN(
        fc_pe_b_peij_3_3_n12), .Q(o_data4[8]) );
  SDFFR_X1 fc_pe_b_peij_3_3_q_acc_reg_7_ ( .D(1'b0), .SI(fc_pe_b_peij_3_3_n14), 
        .SE(fc_pe_b_peij_3_3_d_acc[7]), .CK(fc_pe_b_peij_3_3_gck), .RN(
        fc_pe_b_peij_3_3_n12), .Q(o_data4[7]) );
  SDFFR_X1 fc_pe_b_peij_3_3_q_acc_reg_6_ ( .D(1'b0), .SI(fc_pe_b_peij_3_3_n14), 
        .SE(fc_pe_b_peij_3_3_d_acc[6]), .CK(fc_pe_b_peij_3_3_gck), .RN(
        fc_pe_b_peij_3_3_n12), .Q(o_data4[6]) );
  SDFFR_X1 fc_pe_b_peij_3_3_q_acc_reg_5_ ( .D(1'b0), .SI(fc_pe_b_peij_3_3_n14), 
        .SE(fc_pe_b_peij_3_3_d_acc[5]), .CK(fc_pe_b_peij_3_3_gck), .RN(
        fc_pe_b_peij_3_3_n12), .Q(o_data4[5]) );
  SDFFR_X1 fc_pe_b_peij_3_3_q_acc_reg_4_ ( .D(1'b0), .SI(fc_pe_b_peij_3_3_n14), 
        .SE(fc_pe_b_peij_3_3_d_acc[4]), .CK(fc_pe_b_peij_3_3_gck), .RN(
        fc_pe_b_peij_3_3_n12), .Q(o_data4[4]) );
  SDFFR_X1 fc_pe_b_peij_3_3_q_acc_reg_3_ ( .D(1'b0), .SI(fc_pe_b_peij_3_3_n14), 
        .SE(fc_pe_b_peij_3_3_d_acc[3]), .CK(fc_pe_b_peij_3_3_gck), .RN(
        fc_pe_b_peij_3_3_n12), .Q(o_data4[3]) );
  SDFFR_X1 fc_pe_b_peij_3_3_q_acc_reg_2_ ( .D(1'b0), .SI(fc_pe_b_peij_3_3_n14), 
        .SE(fc_pe_b_peij_3_3_d_acc[2]), .CK(fc_pe_b_peij_3_3_gck), .RN(
        fc_pe_b_peij_3_3_n12), .Q(o_data4[2]) );
  SDFFR_X1 fc_pe_b_peij_3_3_q_acc_reg_1_ ( .D(1'b0), .SI(fc_pe_b_peij_3_3_n14), 
        .SE(fc_pe_b_peij_3_3_d_acc[1]), .CK(fc_pe_b_peij_3_3_gck), .RN(
        fc_pe_b_peij_3_3_n12), .Q(o_data4[1]) );
  SDFFR_X1 fc_pe_b_peij_3_3_q_acc_reg_0_ ( .D(1'b0), .SI(fc_pe_b_peij_3_3_n14), 
        .SE(fc_pe_b_peij_3_3_d_acc[0]), .CK(fc_pe_b_peij_3_3_gck), .RN(
        fc_pe_b_peij_3_3_n12), .Q(o_data4[0]) );
  DFFR_X1 fc_pe_b_peij_3_3_q_im_reg_0_ ( .D(fc_pe_b_peij_3_3_N32), .CK(
        fc_pe_b_peij_3_3_gck), .RN(fc_pe_b_peij_3_3_n12), .Q(
        fc_pe_b_peij_3_3_sgnext[0]) );
  DFFR_X1 fc_pe_b_peij_3_3_q_im_reg_1_ ( .D(fc_pe_b_peij_3_3_N33), .CK(
        fc_pe_b_peij_3_3_gck), .RN(fc_pe_b_peij_3_3_n12), .Q(
        fc_pe_b_peij_3_3_sgnext[1]) );
  DFFR_X1 fc_pe_b_peij_3_3_q_im_reg_2_ ( .D(fc_pe_b_peij_3_3_N34), .CK(
        fc_pe_b_peij_3_3_gck), .RN(fc_pe_b_peij_3_3_n12), .Q(
        fc_pe_b_peij_3_3_sgnext[2]) );
  DFFR_X1 fc_pe_b_peij_3_3_q_im_reg_3_ ( .D(fc_pe_b_peij_3_3_N35), .CK(
        fc_pe_b_peij_3_3_gck), .RN(fc_pe_b_peij_3_3_n12), .Q(
        fc_pe_b_peij_3_3_sgnext_10) );
  SDFFR_X1 fc_pe_b_peij_3_3_q_k_reg ( .D(1'b0), .SI(fc_pe_b_peij_3_3_n14), 
        .SE(i_kernel4[1]), .CK(fc_pe_b_peij_3_3_gck), .RN(fc_pe_b_peij_3_3_n12), .Q(fc_pe_b_peij_3_3_q_k) );
  XOR2_X1 fc_pe_b_peij_3_3_add_U11 ( .A(fc_pe_b_peij_3_3_sgnext[0]), .B(
        fc_pe_b_peij_3_3_q_k), .Z(fc_pe_b_peij_3_3_add_notb[0]) );
  XOR2_X1 fc_pe_b_peij_3_3_add_U10 ( .A(fc_pe_b_peij_3_3_sgnext_10), .B(
        fc_pe_b_peij_3_3_q_k), .Z(fc_pe_b_peij_3_3_add_notb[10]) );
  XOR2_X1 fc_pe_b_peij_3_3_add_U9 ( .A(fc_pe_b_peij_3_3_sgnext[1]), .B(
        fc_pe_b_peij_3_3_q_k), .Z(fc_pe_b_peij_3_3_add_notb[1]) );
  XOR2_X1 fc_pe_b_peij_3_3_add_U8 ( .A(fc_pe_b_peij_3_3_sgnext[2]), .B(
        fc_pe_b_peij_3_3_q_k), .Z(fc_pe_b_peij_3_3_add_notb[2]) );
  XOR2_X1 fc_pe_b_peij_3_3_add_U7 ( .A(fc_pe_b_peij_3_3_sgnext_10), .B(
        fc_pe_b_peij_3_3_q_k), .Z(fc_pe_b_peij_3_3_add_notb[3]) );
  XOR2_X1 fc_pe_b_peij_3_3_add_U6 ( .A(fc_pe_b_peij_3_3_sgnext_10), .B(
        fc_pe_b_peij_3_3_q_k), .Z(fc_pe_b_peij_3_3_add_notb[4]) );
  XOR2_X1 fc_pe_b_peij_3_3_add_U5 ( .A(fc_pe_b_peij_3_3_sgnext_10), .B(
        fc_pe_b_peij_3_3_q_k), .Z(fc_pe_b_peij_3_3_add_notb[5]) );
  XOR2_X1 fc_pe_b_peij_3_3_add_U4 ( .A(fc_pe_b_peij_3_3_sgnext_10), .B(
        fc_pe_b_peij_3_3_q_k), .Z(fc_pe_b_peij_3_3_add_notb[6]) );
  XOR2_X1 fc_pe_b_peij_3_3_add_U3 ( .A(fc_pe_b_peij_3_3_sgnext_10), .B(
        fc_pe_b_peij_3_3_q_k), .Z(fc_pe_b_peij_3_3_add_notb[7]) );
  XOR2_X1 fc_pe_b_peij_3_3_add_U2 ( .A(fc_pe_b_peij_3_3_sgnext_10), .B(
        fc_pe_b_peij_3_3_q_k), .Z(fc_pe_b_peij_3_3_add_notb[8]) );
  XOR2_X1 fc_pe_b_peij_3_3_add_U1 ( .A(fc_pe_b_peij_3_3_sgnext_10), .B(
        fc_pe_b_peij_3_3_q_k), .Z(fc_pe_b_peij_3_3_add_notb[9]) );
  AOI22_X1 fc_pe_b_peij_3_3_add_fai_0_U2 ( .A1(fc_pe_b_peij_3_3_add_notb[0]), 
        .A2(o_data4[0]), .B1(fc_pe_b_peij_3_3_add_fai_0_n5), .B2(
        fc_pe_b_peij_3_3_q_k), .ZN(fc_pe_b_peij_3_3_add_fai_0_n4) );
  INV_X1 fc_pe_b_peij_3_3_add_fai_0_U1 ( .A(fc_pe_b_peij_3_3_add_fai_0_n4), 
        .ZN(fc_pe_b_peij_3_3_add_cprop[1]) );
  XOR2_X1 fc_pe_b_peij_3_3_add_fai_0_U4 ( .A(o_data4[0]), .B(
        fc_pe_b_peij_3_3_add_notb[0]), .Z(fc_pe_b_peij_3_3_add_fai_0_n5) );
  XOR2_X1 fc_pe_b_peij_3_3_add_fai_0_U3 ( .A(fc_pe_b_peij_3_3_q_k), .B(
        fc_pe_b_peij_3_3_add_fai_0_n5), .Z(fc_pe_b_peij_3_3_d_acc[0]) );
  AOI22_X1 fc_pe_b_peij_3_3_add_fai_1_U2 ( .A1(fc_pe_b_peij_3_3_add_notb[1]), 
        .A2(o_data4[1]), .B1(fc_pe_b_peij_3_3_add_fai_1_n5), .B2(
        fc_pe_b_peij_3_3_add_cprop[1]), .ZN(fc_pe_b_peij_3_3_add_fai_1_n4) );
  INV_X1 fc_pe_b_peij_3_3_add_fai_1_U1 ( .A(fc_pe_b_peij_3_3_add_fai_1_n4), 
        .ZN(fc_pe_b_peij_3_3_add_cprop[2]) );
  XOR2_X1 fc_pe_b_peij_3_3_add_fai_1_U4 ( .A(o_data4[1]), .B(
        fc_pe_b_peij_3_3_add_notb[1]), .Z(fc_pe_b_peij_3_3_add_fai_1_n5) );
  XOR2_X1 fc_pe_b_peij_3_3_add_fai_1_U3 ( .A(fc_pe_b_peij_3_3_add_cprop[1]), 
        .B(fc_pe_b_peij_3_3_add_fai_1_n5), .Z(fc_pe_b_peij_3_3_d_acc[1]) );
  AOI22_X1 fc_pe_b_peij_3_3_add_fai_2_U2 ( .A1(fc_pe_b_peij_3_3_add_notb[2]), 
        .A2(o_data4[2]), .B1(fc_pe_b_peij_3_3_add_fai_2_n5), .B2(
        fc_pe_b_peij_3_3_add_cprop[2]), .ZN(fc_pe_b_peij_3_3_add_fai_2_n4) );
  INV_X1 fc_pe_b_peij_3_3_add_fai_2_U1 ( .A(fc_pe_b_peij_3_3_add_fai_2_n4), 
        .ZN(fc_pe_b_peij_3_3_add_cprop[3]) );
  XOR2_X1 fc_pe_b_peij_3_3_add_fai_2_U4 ( .A(o_data4[2]), .B(
        fc_pe_b_peij_3_3_add_notb[2]), .Z(fc_pe_b_peij_3_3_add_fai_2_n5) );
  XOR2_X1 fc_pe_b_peij_3_3_add_fai_2_U3 ( .A(fc_pe_b_peij_3_3_add_cprop[2]), 
        .B(fc_pe_b_peij_3_3_add_fai_2_n5), .Z(fc_pe_b_peij_3_3_d_acc[2]) );
  AOI22_X1 fc_pe_b_peij_3_3_add_fai_3_U2 ( .A1(fc_pe_b_peij_3_3_add_notb[3]), 
        .A2(o_data4[3]), .B1(fc_pe_b_peij_3_3_add_fai_3_n5), .B2(
        fc_pe_b_peij_3_3_add_cprop[3]), .ZN(fc_pe_b_peij_3_3_add_fai_3_n4) );
  INV_X1 fc_pe_b_peij_3_3_add_fai_3_U1 ( .A(fc_pe_b_peij_3_3_add_fai_3_n4), 
        .ZN(fc_pe_b_peij_3_3_add_cprop[4]) );
  XOR2_X1 fc_pe_b_peij_3_3_add_fai_3_U4 ( .A(o_data4[3]), .B(
        fc_pe_b_peij_3_3_add_notb[3]), .Z(fc_pe_b_peij_3_3_add_fai_3_n5) );
  XOR2_X1 fc_pe_b_peij_3_3_add_fai_3_U3 ( .A(fc_pe_b_peij_3_3_add_cprop[3]), 
        .B(fc_pe_b_peij_3_3_add_fai_3_n5), .Z(fc_pe_b_peij_3_3_d_acc[3]) );
  AOI22_X1 fc_pe_b_peij_3_3_add_fai_4_U2 ( .A1(fc_pe_b_peij_3_3_add_notb[4]), 
        .A2(o_data4[4]), .B1(fc_pe_b_peij_3_3_add_fai_4_n5), .B2(
        fc_pe_b_peij_3_3_add_cprop[4]), .ZN(fc_pe_b_peij_3_3_add_fai_4_n4) );
  INV_X1 fc_pe_b_peij_3_3_add_fai_4_U1 ( .A(fc_pe_b_peij_3_3_add_fai_4_n4), 
        .ZN(fc_pe_b_peij_3_3_add_cprop[5]) );
  XOR2_X1 fc_pe_b_peij_3_3_add_fai_4_U4 ( .A(o_data4[4]), .B(
        fc_pe_b_peij_3_3_add_notb[4]), .Z(fc_pe_b_peij_3_3_add_fai_4_n5) );
  XOR2_X1 fc_pe_b_peij_3_3_add_fai_4_U3 ( .A(fc_pe_b_peij_3_3_add_cprop[4]), 
        .B(fc_pe_b_peij_3_3_add_fai_4_n5), .Z(fc_pe_b_peij_3_3_d_acc[4]) );
  AOI22_X1 fc_pe_b_peij_3_3_add_fai_5_U2 ( .A1(fc_pe_b_peij_3_3_add_notb[5]), 
        .A2(o_data4[5]), .B1(fc_pe_b_peij_3_3_add_fai_5_n5), .B2(
        fc_pe_b_peij_3_3_add_cprop[5]), .ZN(fc_pe_b_peij_3_3_add_fai_5_n4) );
  INV_X1 fc_pe_b_peij_3_3_add_fai_5_U1 ( .A(fc_pe_b_peij_3_3_add_fai_5_n4), 
        .ZN(fc_pe_b_peij_3_3_add_cprop[6]) );
  XOR2_X1 fc_pe_b_peij_3_3_add_fai_5_U4 ( .A(o_data4[5]), .B(
        fc_pe_b_peij_3_3_add_notb[5]), .Z(fc_pe_b_peij_3_3_add_fai_5_n5) );
  XOR2_X1 fc_pe_b_peij_3_3_add_fai_5_U3 ( .A(fc_pe_b_peij_3_3_add_cprop[5]), 
        .B(fc_pe_b_peij_3_3_add_fai_5_n5), .Z(fc_pe_b_peij_3_3_d_acc[5]) );
  AOI22_X1 fc_pe_b_peij_3_3_add_fai_6_U2 ( .A1(fc_pe_b_peij_3_3_add_notb[6]), 
        .A2(o_data4[6]), .B1(fc_pe_b_peij_3_3_add_fai_6_n5), .B2(
        fc_pe_b_peij_3_3_add_cprop[6]), .ZN(fc_pe_b_peij_3_3_add_fai_6_n4) );
  INV_X1 fc_pe_b_peij_3_3_add_fai_6_U1 ( .A(fc_pe_b_peij_3_3_add_fai_6_n4), 
        .ZN(fc_pe_b_peij_3_3_add_cprop[7]) );
  XOR2_X1 fc_pe_b_peij_3_3_add_fai_6_U4 ( .A(o_data4[6]), .B(
        fc_pe_b_peij_3_3_add_notb[6]), .Z(fc_pe_b_peij_3_3_add_fai_6_n5) );
  XOR2_X1 fc_pe_b_peij_3_3_add_fai_6_U3 ( .A(fc_pe_b_peij_3_3_add_cprop[6]), 
        .B(fc_pe_b_peij_3_3_add_fai_6_n5), .Z(fc_pe_b_peij_3_3_d_acc[6]) );
  AOI22_X1 fc_pe_b_peij_3_3_add_fai_7_U2 ( .A1(fc_pe_b_peij_3_3_add_notb[7]), 
        .A2(o_data4[7]), .B1(fc_pe_b_peij_3_3_add_fai_7_n5), .B2(
        fc_pe_b_peij_3_3_add_cprop[7]), .ZN(fc_pe_b_peij_3_3_add_fai_7_n4) );
  INV_X1 fc_pe_b_peij_3_3_add_fai_7_U1 ( .A(fc_pe_b_peij_3_3_add_fai_7_n4), 
        .ZN(fc_pe_b_peij_3_3_add_cprop[8]) );
  XOR2_X1 fc_pe_b_peij_3_3_add_fai_7_U4 ( .A(o_data4[7]), .B(
        fc_pe_b_peij_3_3_add_notb[7]), .Z(fc_pe_b_peij_3_3_add_fai_7_n5) );
  XOR2_X1 fc_pe_b_peij_3_3_add_fai_7_U3 ( .A(fc_pe_b_peij_3_3_add_cprop[7]), 
        .B(fc_pe_b_peij_3_3_add_fai_7_n5), .Z(fc_pe_b_peij_3_3_d_acc[7]) );
  AOI22_X1 fc_pe_b_peij_3_3_add_fai_8_U2 ( .A1(fc_pe_b_peij_3_3_add_notb[8]), 
        .A2(o_data4[8]), .B1(fc_pe_b_peij_3_3_add_fai_8_n5), .B2(
        fc_pe_b_peij_3_3_add_cprop[8]), .ZN(fc_pe_b_peij_3_3_add_fai_8_n4) );
  INV_X1 fc_pe_b_peij_3_3_add_fai_8_U1 ( .A(fc_pe_b_peij_3_3_add_fai_8_n4), 
        .ZN(fc_pe_b_peij_3_3_add_cprop[9]) );
  XOR2_X1 fc_pe_b_peij_3_3_add_fai_8_U4 ( .A(o_data4[8]), .B(
        fc_pe_b_peij_3_3_add_notb[8]), .Z(fc_pe_b_peij_3_3_add_fai_8_n5) );
  XOR2_X1 fc_pe_b_peij_3_3_add_fai_8_U3 ( .A(fc_pe_b_peij_3_3_add_cprop[8]), 
        .B(fc_pe_b_peij_3_3_add_fai_8_n5), .Z(fc_pe_b_peij_3_3_d_acc[8]) );
  AOI22_X1 fc_pe_b_peij_3_3_add_fai_9_U2 ( .A1(fc_pe_b_peij_3_3_add_notb[9]), 
        .A2(o_data4[9]), .B1(fc_pe_b_peij_3_3_add_fai_9_n5), .B2(
        fc_pe_b_peij_3_3_add_cprop[9]), .ZN(fc_pe_b_peij_3_3_add_fai_9_n4) );
  INV_X1 fc_pe_b_peij_3_3_add_fai_9_U1 ( .A(fc_pe_b_peij_3_3_add_fai_9_n4), 
        .ZN(fc_pe_b_peij_3_3_add_cprop[10]) );
  XOR2_X1 fc_pe_b_peij_3_3_add_fai_9_U4 ( .A(o_data4[9]), .B(
        fc_pe_b_peij_3_3_add_notb[9]), .Z(fc_pe_b_peij_3_3_add_fai_9_n5) );
  XOR2_X1 fc_pe_b_peij_3_3_add_fai_9_U3 ( .A(fc_pe_b_peij_3_3_add_cprop[9]), 
        .B(fc_pe_b_peij_3_3_add_fai_9_n5), .Z(fc_pe_b_peij_3_3_d_acc[9]) );
  AOI22_X1 fc_pe_b_peij_3_3_add_fai_10_U2 ( .A1(fc_pe_b_peij_3_3_add_notb[10]), 
        .A2(o_data4[10]), .B1(fc_pe_b_peij_3_3_add_fai_10_n5), .B2(
        fc_pe_b_peij_3_3_add_cprop[10]), .ZN(fc_pe_b_peij_3_3_add_fai_10_n4)
         );
  INV_X1 fc_pe_b_peij_3_3_add_fai_10_U1 ( .A(fc_pe_b_peij_3_3_add_fai_10_n4), 
        .ZN(fc_pe_b_peij_3_3_add_c_out) );
  XOR2_X1 fc_pe_b_peij_3_3_add_fai_10_U4 ( .A(o_data4[10]), .B(
        fc_pe_b_peij_3_3_add_notb[10]), .Z(fc_pe_b_peij_3_3_add_fai_10_n5) );
  XOR2_X1 fc_pe_b_peij_3_3_add_fai_10_U3 ( .A(fc_pe_b_peij_3_3_add_cprop[10]), 
        .B(fc_pe_b_peij_3_3_add_fai_10_n5), .Z(fc_pe_b_peij_3_3_d_acc[10]) );
  OR4_X1 fc_zero_skipping_U1 ( .A1(i_data[1]), .A2(i_data[0]), .A3(i_data[3]), 
        .A4(i_data[2]), .ZN(fc_s_en_pe) );
  NOR2_X1 fc_clk_gating_unit_U11 ( .A1(layer_fc[1]), .A2(fc_cnt2_3_), .ZN(
        fc_clk_gating_unit_n8) );
  AND3_X1 fc_clk_gating_unit_U10 ( .A1(fc_cnt2_2_), .A2(fc_cnt2_0_), .A3(
        fc_clk_gating_unit_n8), .ZN(fc_clk_gating_unit_n7) );
  INV_X1 fc_clk_gating_unit_U9 ( .A(layer_fc[0]), .ZN(fc_clk_gating_unit_n4)
         );
  INV_X1 fc_clk_gating_unit_U8 ( .A(layer_fc[1]), .ZN(fc_clk_gating_unit_n3)
         );
  INV_X1 fc_clk_gating_unit_U6 ( .A(fc_cnt2_1_), .ZN(fc_clk_gating_unit_n2) );
  INV_X1 fc_clk_gating_unit_U5 ( .A(fc_s_ckg_rmask[1]), .ZN(
        fc_clk_gating_unit_n1) );
  NAND2_X1 fc_clk_gating_unit_U4 ( .A1(fc_clk_gating_unit_n6), .A2(
        fc_clk_gating_unit_n1), .ZN(fc_s_ckg_rmask[2]) );
  OAI21_X1 fc_clk_gating_unit_U3 ( .B1(fc_clk_gating_unit_n4), .B2(
        fc_clk_gating_unit_n3), .A(fc_clk_gating_unit_n5), .ZN(
        fc_s_ckg_rmask[1]) );
  NAND3_X1 fc_clk_gating_unit_U14 ( .A1(fc_clk_gating_unit_n7), .A2(
        fc_clk_gating_unit_n2), .A3(layer_fc[0]), .ZN(fc_clk_gating_unit_n5)
         );
  NAND3_X1 fc_clk_gating_unit_U13 ( .A1(fc_clk_gating_unit_n7), .A2(
        fc_clk_gating_unit_n4), .A3(fc_cnt2_1_), .ZN(fc_clk_gating_unit_n6) );
  NAND3_X1 fc_clk_gating_unit_U12 ( .A1(fc_clk_gating_unit_n5), .A2(
        fc_clk_gating_unit_n3), .A3(fc_clk_gating_unit_n6), .ZN(
        fc_s_ckg_rmask[3]) );
  NOR2_X2 fc_clk_gating_unit_U7 ( .A1(fc_clk_gating_unit_n3), .A2(
        fc_clk_gating_unit_n4), .ZN(fc_s_ckg_rmask[0]) );
  NOR4_X1 fc_count_U50 ( .A1(fc_count_n31), .A2(fc_count_n30), .A3(
        fc_count_n29), .A4(fc_count_n28), .ZN(fc_count_N26) );
  XOR2_X1 fc_count_U49 ( .A(fc_count_N21), .B(fc_cnt1_4_), .Z(fc_count_n28) );
  XOR2_X1 fc_count_U48 ( .A(fc_count_N20), .B(fc_cnt1_3_), .Z(fc_count_n29) );
  NAND3_X1 fc_count_U47 ( .A1(fc_count_n27), .A2(fc_count_n26), .A3(
        fc_count_n25), .ZN(fc_count_n30) );
  XNOR2_X1 fc_count_U46 ( .A(fc_count_N19), .B(fc_cnt1_2_), .ZN(fc_count_n25)
         );
  OAI22_X1 fc_count_U45 ( .A1(fc_cnt1_1_), .A2(fc_count_n24), .B1(fc_count_n24), .B2(fc_count_n32), .ZN(fc_count_n26) );
  AND2_X1 fc_count_U44 ( .A1(fc_cnt1_0_), .A2(1'b0), .ZN(fc_count_n24) );
  OAI22_X1 fc_count_U43 ( .A1(fc_count_n23), .A2(fc_count_n1), .B1(
        fc_count_N18), .B2(fc_count_n23), .ZN(fc_count_n27) );
  NOR2_X1 fc_count_U42 ( .A1(1'b0), .A2(fc_cnt1_0_), .ZN(fc_count_n23) );
  NAND4_X1 fc_count_U41 ( .A1(fc_count_n22), .A2(fc_count_n21), .A3(
        fc_count_n20), .A4(fc_count_n19), .ZN(fc_count_n31) );
  XNOR2_X1 fc_count_U40 ( .A(fc_count_N23), .B(fc_cnt1_6_), .ZN(fc_count_n20)
         );
  XNOR2_X1 fc_count_U39 ( .A(fc_count_N24), .B(fc_cnt1_7_), .ZN(fc_count_n21)
         );
  XNOR2_X1 fc_count_U38 ( .A(fc_count_N25), .B(fc_cnt1_8_), .ZN(fc_count_n22)
         );
  XOR2_X1 fc_count_U37 ( .A(fc_out_mux[8]), .B(fc_count_n13), .Z(fc_count_N25)
         );
  NOR2_X1 fc_count_U36 ( .A1(fc_out_mux[8]), .A2(fc_count_n12), .ZN(
        fc_count_n13) );
  XNOR2_X1 fc_count_U35 ( .A(fc_out_mux[8]), .B(fc_count_n12), .ZN(
        fc_count_N24) );
  OAI21_X1 fc_count_U34 ( .B1(fc_count_n11), .B2(fc_count_n15), .A(
        fc_count_n12), .ZN(fc_count_N23) );
  NAND2_X1 fc_count_U33 ( .A1(fc_count_n11), .A2(fc_count_n15), .ZN(
        fc_count_n12) );
  AOI21_X1 fc_count_U32 ( .B1(fc_count_n9), .B2(fc_out_mux[5]), .A(
        fc_count_n11), .ZN(fc_count_n10) );
  NOR2_X1 fc_count_U31 ( .A1(fc_count_n9), .A2(fc_out_mux[5]), .ZN(
        fc_count_n11) );
  OAI21_X1 fc_count_U30 ( .B1(fc_count_n8), .B2(fc_count_n14), .A(fc_count_n9), 
        .ZN(fc_count_N21) );
  NAND2_X1 fc_count_U29 ( .A1(fc_count_n8), .A2(fc_count_n14), .ZN(fc_count_n9) );
  AOI21_X1 fc_count_U28 ( .B1(fc_count_n2), .B2(fc_out_mux[5]), .A(fc_count_n8), .ZN(fc_count_n7) );
  NOR2_X1 fc_count_U27 ( .A1(fc_count_n2), .A2(fc_out_mux[5]), .ZN(fc_count_n8) );
  OAI21_X1 fc_count_U26 ( .B1(fc_count_n3), .B2(fc_count_n16), .A(fc_count_n2), 
        .ZN(fc_count_N19) );
  OAI21_X1 fc_count_U25 ( .B1(fc_count_N17), .B2(fc_count_n17), .A(
        fc_count_n18), .ZN(fc_count_N18) );
  NOR2_X1 fc_count_U24 ( .A1(1'b0), .A2(1'b0), .ZN(fc_count_n3) );
  INV_X1 fc_count_U23 ( .A(1'b0), .ZN(fc_count_N17) );
  INV_X1 fc_count_U22 ( .A(fc_out_mux[4]), .ZN(fc_count_n14) );
  INV_X1 fc_count_U21 ( .A(1'b0), .ZN(fc_count_n17) );
  AND2_X1 fc_count_U20 ( .A1(fc_count_N9), .A2(fc_count_n5), .ZN(fc_count_N28)
         );
  AND2_X1 fc_count_U19 ( .A1(fc_count_N10), .A2(fc_count_n5), .ZN(fc_count_N29) );
  AND2_X1 fc_count_U18 ( .A1(fc_count_N11), .A2(fc_count_n5), .ZN(fc_count_N30) );
  AND2_X1 fc_count_U17 ( .A1(fc_count_N12), .A2(fc_count_n5), .ZN(fc_count_N31) );
  AND2_X1 fc_count_U16 ( .A1(fc_count_N13), .A2(fc_count_n5), .ZN(fc_count_N32) );
  AND2_X1 fc_count_U15 ( .A1(fc_count_N14), .A2(fc_count_n5), .ZN(fc_count_N33) );
  AND2_X1 fc_count_U14 ( .A1(fc_count_N15), .A2(fc_count_n5), .ZN(fc_count_N34) );
  XOR2_X1 fc_count_U13 ( .A(fc_count_n10), .B(fc_cnt1_5_), .Z(fc_count_n19) );
  AND2_X1 fc_count_U12 ( .A1(fc_count_N16), .A2(fc_count_n5), .ZN(fc_count_N35) );
  AND2_X1 fc_count_U11 ( .A1(fc_count_N26), .A2(fc_count_n5), .ZN(fc_count_n6)
         );
  INV_X1 fc_count_U10 ( .A(fc_count_N18), .ZN(fc_count_n32) );
  INV_X1 fc_count_U9 ( .A(fc_count_n3), .ZN(fc_count_n18) );
  INV_X1 fc_count_U8 ( .A(fc_out_mux[6]), .ZN(fc_count_n15) );
  INV_X1 fc_count_U7 ( .A(fc_count_n7), .ZN(fc_count_N20) );
  OR2_X1 fc_count_U6 ( .A1(fc_count_n18), .A2(fc_out_mux[2]), .ZN(fc_count_n2)
         );
  INV_X1 fc_count_U5 ( .A(fc_out_mux[2]), .ZN(fc_count_n16) );
  INV_X1 fc_count_U3 ( .A(tb_rst_cnt1), .ZN(fc_count_n33) );
  SNPS_CLOCK_GATE_HIGH_countern_N9 fc_count_clk_gate_cnt_out_reg ( .CLK(clk), 
        .EN(tb_en_cnt1), .ENCLK(fc_count_net439), .TE(1'b0) );
  DFFR_X1 fc_count_cnt_out_reg_8_ ( .D(fc_count_N35), .CK(fc_count_net439), 
        .RN(fc_count_n33), .Q(fc_cnt1_8_) );
  DFFR_X1 fc_count_cnt_out_reg_7_ ( .D(fc_count_N34), .CK(fc_count_net439), 
        .RN(fc_count_n33), .Q(fc_cnt1_7_) );
  DFFR_X1 fc_count_cnt_out_reg_6_ ( .D(fc_count_N33), .CK(fc_count_net439), 
        .RN(fc_count_n33), .Q(fc_cnt1_6_) );
  DFFR_X1 fc_count_cnt_out_reg_5_ ( .D(fc_count_N32), .CK(fc_count_net439), 
        .RN(fc_count_n33), .Q(fc_cnt1_5_) );
  DFFR_X1 fc_count_cnt_out_reg_4_ ( .D(fc_count_N31), .CK(fc_count_net439), 
        .RN(fc_count_n33), .Q(fc_cnt1_4_) );
  DFFR_X1 fc_count_cnt_out_reg_3_ ( .D(fc_count_N30), .CK(fc_count_net439), 
        .RN(fc_count_n33), .Q(fc_cnt1_3_) );
  DFFR_X1 fc_count_cnt_out_reg_2_ ( .D(fc_count_N29), .CK(fc_count_net439), 
        .RN(fc_count_n33), .Q(fc_cnt1_2_) );
  DFFR_X1 fc_count_cnt_out_reg_1_ ( .D(fc_count_N28), .CK(fc_count_net439), 
        .RN(fc_count_n33), .Q(fc_cnt1_1_), .QN(fc_count_n1) );
  DFFR_X1 fc_count_terminal_cnt_reg ( .D(fc_count_n6), .CK(fc_count_net439), 
        .RN(fc_count_n33), .Q(tc), .QN(fc_count_n5) );
  SDFFR_X1 fc_count_cnt_out_reg_0_ ( .D(1'b0), .SI(fc_count_n5), .SE(
        fc_count_N8), .CK(fc_count_net439), .RN(fc_count_n33), .Q(fc_cnt1_0_)
         );
  XOR2_X1 fc_count_add_35_U2 ( .A(fc_count_add_35_carry[8]), .B(fc_cnt1_8_), 
        .Z(fc_count_N16) );
  INV_X1 fc_count_add_35_U1 ( .A(fc_cnt1_0_), .ZN(fc_count_N8) );
  HA_X1 fc_count_add_35_U1_1_1 ( .A(fc_cnt1_1_), .B(fc_cnt1_0_), .CO(
        fc_count_add_35_carry[2]), .S(fc_count_N9) );
  HA_X1 fc_count_add_35_U1_1_2 ( .A(fc_cnt1_2_), .B(fc_count_add_35_carry[2]), 
        .CO(fc_count_add_35_carry[3]), .S(fc_count_N10) );
  HA_X1 fc_count_add_35_U1_1_3 ( .A(fc_cnt1_3_), .B(fc_count_add_35_carry[3]), 
        .CO(fc_count_add_35_carry[4]), .S(fc_count_N11) );
  HA_X1 fc_count_add_35_U1_1_4 ( .A(fc_cnt1_4_), .B(fc_count_add_35_carry[4]), 
        .CO(fc_count_add_35_carry[5]), .S(fc_count_N12) );
  HA_X1 fc_count_add_35_U1_1_5 ( .A(fc_cnt1_5_), .B(fc_count_add_35_carry[5]), 
        .CO(fc_count_add_35_carry[6]), .S(fc_count_N13) );
  HA_X1 fc_count_add_35_U1_1_6 ( .A(fc_cnt1_6_), .B(fc_count_add_35_carry[6]), 
        .CO(fc_count_add_35_carry[7]), .S(fc_count_N14) );
  HA_X1 fc_count_add_35_U1_1_7 ( .A(fc_cnt1_7_), .B(fc_count_add_35_carry[7]), 
        .CO(fc_count_add_35_carry[8]), .S(fc_count_N15) );
  NOR2_X1 fc_count2_U17 ( .A1(tb_tc2), .A2(fc_count2_n24), .ZN(fc_count2_N18)
         );
  AOI21_X1 fc_count2_U16 ( .B1(fc_out_mux2[0]), .B2(fc_out_mux2[2]), .A(
        fc_count2_n13), .ZN(fc_count2_n19) );
  XNOR2_X1 fc_count2_U15 ( .A(fc_count2_n8), .B(fc_count2_n19), .ZN(
        fc_count2_n18) );
  NOR2_X1 fc_count2_U14 ( .A1(fc_cnt2_0_), .A2(tb_tc2), .ZN(fc_count2_N17) );
  NOR3_X1 fc_count2_U13 ( .A1(fc_count2_n10), .A2(fc_count2_n11), .A3(
        fc_count2_n12), .ZN(fc_count2_n25) );
  OAI22_X1 fc_count2_U12 ( .A1(fc_count2_n23), .A2(fc_count2_n7), .B1(
        fc_cnt2_2_), .B2(fc_count2_n21), .ZN(fc_count2_N19) );
  INV_X1 fc_count2_U11 ( .A(fc_count2_n23), .ZN(fc_count2_n1) );
  AOI21_X1 fc_count2_U10 ( .B1(fc_count2_n7), .B2(fc_count2_n5), .A(
        fc_count2_n1), .ZN(fc_count2_n20) );
  NAND2_X1 fc_count2_U9 ( .A1(fc_cnt2_2_), .A2(fc_count2_n6), .ZN(
        fc_count2_n22) );
  OAI22_X1 fc_count2_U8 ( .A1(fc_count2_n20), .A2(fc_count2_n6), .B1(
        fc_count2_n21), .B2(fc_count2_n22), .ZN(fc_count2_N20) );
  AOI21_X1 fc_count2_U7 ( .B1(fc_count2_n5), .B2(fc_count2_n8), .A(
        fc_count2_N17), .ZN(fc_count2_n23) );
  INV_X1 fc_count2_U6 ( .A(fc_out_mux2[2]), .ZN(fc_count2_n3) );
  NAND2_X1 fc_count2_U5 ( .A1(fc_count2_n13), .A2(fc_count2_n3), .ZN(
        fc_count2_n15) );
  NOR2_X1 fc_count2_U4 ( .A1(fc_out_mux2[2]), .A2(fc_out_mux2[0]), .ZN(
        fc_count2_n13) );
  INV_X1 fc_count2_U3 ( .A(tb_rst_cnt2), .ZN(fc_count2_n2) );
  SNPS_CLOCK_GATE_HIGH_countern_N4 fc_count2_clk_gate_cnt_out_reg ( .CLK(tc), 
        .EN(tb_en_cnt2), .ENCLK(fc_count2_net421), .TE(1'b0) );
  XOR2_X1 fc_count2_U25 ( .A(fc_cnt2_0_), .B(fc_count2_n8), .Z(fc_count2_n24)
         );
  NAND3_X1 fc_count2_U24 ( .A1(fc_cnt2_0_), .A2(fc_count2_n5), .A3(fc_cnt2_1_), 
        .ZN(fc_count2_n21) );
  XOR2_X1 fc_count2_U23 ( .A(fc_cnt2_0_), .B(fc_out_mux2[0]), .Z(fc_count2_n17) );
  NAND3_X1 fc_count2_U22 ( .A1(fc_count2_n17), .A2(fc_count2_n5), .A3(
        fc_count2_n18), .ZN(fc_count2_n10) );
  XOR2_X1 fc_count2_U21 ( .A(fc_count2_n6), .B(fc_out_mux2[3]), .Z(
        fc_count2_n16) );
  XOR2_X1 fc_count2_U20 ( .A(fc_count2_n15), .B(fc_count2_n16), .Z(
        fc_count2_n11) );
  XOR2_X1 fc_count2_U19 ( .A(fc_cnt2_2_), .B(fc_out_mux2[2]), .Z(fc_count2_n14) );
  XOR2_X1 fc_count2_U18 ( .A(fc_count2_n13), .B(fc_count2_n14), .Z(
        fc_count2_n12) );
  DFFR_X1 fc_count2_cnt_out_reg_1_ ( .D(fc_count2_N18), .CK(fc_count2_net421), 
        .RN(fc_count2_n2), .Q(fc_cnt2_1_), .QN(fc_count2_n8) );
  DFFR_X1 fc_count2_terminal_cnt_reg ( .D(fc_count2_n25), .CK(fc_count2_net421), .RN(fc_count2_n2), .Q(tb_tc2), .QN(fc_count2_n5) );
  DFFR_X1 fc_count2_cnt_out_reg_3_ ( .D(fc_count2_N20), .CK(fc_count2_net421), 
        .RN(fc_count2_n2), .Q(fc_cnt2_3_), .QN(fc_count2_n6) );
  DFFR_X1 fc_count2_cnt_out_reg_2_ ( .D(fc_count2_N19), .CK(fc_count2_net421), 
        .RN(fc_count2_n2), .Q(fc_cnt2_2_), .QN(fc_count2_n7) );
  DFFR_X1 fc_count2_cnt_out_reg_0_ ( .D(fc_count2_N17), .CK(fc_count2_net421), 
        .RN(fc_count2_n2), .Q(fc_cnt2_0_) );
  NAND2_X1 fc_mux_U7 ( .A1(layer_fc[1]), .A2(layer_fc[0]), .ZN(fc_out_mux[4])
         );
  INV_X1 fc_mux_U6 ( .A(layer_fc[1]), .ZN(fc_mux_n1) );
  AND2_X1 fc_mux_U5 ( .A1(layer_fc[0]), .A2(fc_mux_n1), .ZN(fc_out_mux[5]) );
  NOR2_X1 fc_mux_U4 ( .A1(layer_fc[1]), .A2(layer_fc[0]), .ZN(fc_out_mux[8])
         );
  NOR2_X1 fc_mux_U3 ( .A1(fc_mux_n1), .A2(layer_fc[0]), .ZN(fc_out_mux[2]) );
  OR2_X1 fc_mux_U2 ( .A1(fc_out_mux[2]), .A2(fc_out_mux[5]), .ZN(fc_out_mux[6]) );
  INV_X1 fc_mux2_U4 ( .A(layer_fc[0]), .ZN(fc_mux2_n1) );
  AND2_X1 fc_mux2_U3 ( .A1(fc_mux2_n1), .A2(layer_fc[1]), .ZN(fc_out_mux2[0])
         );
  NOR2_X1 fc_mux2_U2 ( .A1(layer_fc[1]), .A2(layer_fc[0]), .ZN(fc_out_mux2[3])
         );
  NOR2_X1 fc_mux2_U1 ( .A1(layer_fc[1]), .A2(fc_mux2_n1), .ZN(fc_out_mux2[2])
         );
  INV_X1 fsm_U11 ( .A(rst_fsm), .ZN(fsm_n2) );
  OAI21_X1 fsm_U10 ( .B1(fsm_current_state_0_), .B2(fsm_n3), .A(tb_rst_cnt1), 
        .ZN(tb_en_cnt2) );
  XNOR2_X1 fsm_U9 ( .A(fsm_current_state_0_), .B(fsm_n5), .ZN(fsm_n9) );
  OAI21_X1 fsm_U8 ( .B1(tb_rst_cnt1), .B2(fsm_n5), .A(fsm_n6), .ZN(fsm_n8) );
  OR2_X1 fsm_U7 ( .A1(start), .A2(fsm_current_state_1_), .ZN(fsm_n7) );
  OAI22_X1 fsm_U6 ( .A1(tc), .A2(tb_rst_cnt1), .B1(fsm_current_state_0_), .B2(
        fsm_n7), .ZN(fsm_n5) );
  INV_X1 fsm_U5 ( .A(tb_rst_cnt1), .ZN(tb_en_cnt1) );
  NAND2_X1 fsm_U3 ( .A1(fsm_current_state_0_), .A2(fsm_n3), .ZN(tb_rst_cnt1)
         );
  NAND3_X1 fsm_U12 ( .A1(fsm_current_state_1_), .A2(fsm_n4), .A3(tb_tc2), .ZN(
        fsm_n6) );
  XNOR2_X2 fsm_U4 ( .A(fsm_n3), .B(fsm_n4), .ZN(tb_rst_cnt2) );
  DFFR_X1 fsm_current_state_reg_1_ ( .D(fsm_n8), .CK(clk), .RN(fsm_n2), .Q(
        fsm_current_state_1_), .QN(fsm_n3) );
  DFFR_X1 fsm_current_state_reg_0_ ( .D(fsm_n9), .CK(clk), .RN(fsm_n2), .Q(
        fsm_current_state_0_), .QN(fsm_n4) );
endmodule
