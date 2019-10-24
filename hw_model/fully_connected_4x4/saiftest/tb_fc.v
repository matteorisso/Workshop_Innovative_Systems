//`timescale 1ns

module tb_fc ();

   wire clk_i;
   wire rst_i;
   wire rst_fsm_i;
   wire start_i;
   wire sync_clr_i;
   wire rst_cnt1_i;
   wire en_cnt1_i;
   wire rst_cnt2_i;
   wire en_cnt2_i;
   wire [1:0] layer_fc_i;
   wire [7:0] i_kernel1_i;
   wire [7:0] i_kernel2_i;
   wire [7:0] i_kernel3_i;
   wire [7:0] i_kernel4_i;
   wire [3:0] i_data_i;
   wire [6:0] cnt1_i;
   wire [2:0] cnt2_i;
   wire tc_i;
   wire tc2_i;
   wire [43:0] o_data1_i;
   wire [43:0] o_data2_i;
   wire [43:0] o_data3_i;
   wire [43:0] o_data4_i;


   clk_gen CG(
  	      .CLK(clk_i),
	      .RST_fsm(rst_fsm_i));

   data_maker_new SM(
         .clk(clk_i),
         .o_data1(o_data1_i),
         .o_data2(o_data2_i),
         .o_data3(o_data3_i),
         .o_data4(o_data4_i),
         .i_kernel1(i_kernel1_i),
         .i_kernel2(i_kernel2_i),
         .i_kernel3(i_kernel3_i),
         .i_kernel4(i_kernel4_i),
	     .i_data(i_data_i),
         .layer_fc(layer_fc_i),
         .start(start_i));	

   fully_connected_all UUT(
         .clk(clk_i),
	     .rst_fsm(rst_fsm_i),
	     .start(start_i),	 		  	  
		 .layer_fc(layer_fc_i),	     
		 .i_kernel1(i_kernel1_i),
		 .i_kernel2(i_kernel2_i),
		 .i_kernel3(i_kernel3_i),
		 .i_kernel4(i_kernel4_i),
		 .i_data(i_data_i),
		 .o_data1(o_data1_i),
		 .o_data2(o_data2_i),
		 .o_data3(o_data3_i),
		 .o_data4(o_data4_i));
 


endmodule

		   
