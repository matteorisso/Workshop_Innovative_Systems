//`timescale 1ns

module tb_pool ();

   wire clk_i;
   wire rst_fsm_i;
   wire start_i;
   wire done_i;
   wire en_i;
   wire size1_i;
   wire size2_i;
   wire pool_sel_i;
   wire [15:0] i_data0_i;
   wire [15:0] i_data1_i;
   wire [15:0] i_data2_i;
   wire [15:0] i_data3_i;
   wire [15:0] i_data4_i;
   wire [15:0] i_data5_i;
   wire [15:0] i_data6_i;
   wire [15:0] i_data7_i;
   wire [15:0] o_data1_i;
   wire [15:0] o_data2_i;
   wire [15:0] o_data3_i;
   wire [15:0] o_data4_i;


   clk_gen CG(
  	      .CLK(clk_i),
	      .RST_fsm(rst_fsm_i));

   data_maker_new SM(
         .clk(clk_i),
         .o_data1(o_data1_i),
         .o_data2(o_data2_i),
         .o_data3(o_data3_i),
         .o_data4(o_data4_i),
		 .tb_d_0(i_data0_i),
		 .tb_d_1(i_data1_i),
		 .tb_d_2(i_data2_i),
		 .tb_d_3(i_data3_i),
		 .tb_d_4(i_data4_i),
		 .tb_d_5(i_data5_i),
		 .tb_d_6(i_data6_i),
		 .tb_d_7(i_data7_i),
		 .en(en_i),
		 .size1(size1_i),
		 .size2(size2_i),
		 .pool_sel(pool_sel_i),
         .start(start_i),
		 .done(done_i));	

   avr_pooling_unrolled UUT(
         .clk(clk_i),
	     .rst_fsm(rst_fsm_i),
	     .start(start_i),
		 .done(done_i),
		 .en(en_i),
		 .size1(size1_i),
		 .size2(size2_i),
		 .pool_sel(pool_sel_i),
		 .d_0(i_data0_i),
		 .d_1(i_data1_i),
		 .d_2(i_data2_i),
		 .d_3(i_data3_i),
		 .d_4(i_data4_i),
		 .d_5(i_data5_i),
		 .d_6(i_data6_i),
		 .d_7(i_data7_i),
		 .o_pool_1(o_data1_i),
		 .o_pool_2(o_data2_i),
		 .o_pool_3(o_data3_i),
		 .o_pool_4(o_data4_i));
 


endmodule

		   
