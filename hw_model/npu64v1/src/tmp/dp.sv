import globals_sv::*;

module dp (
	   input 		      ck ,
	   input 		      rst,
	   input [N*W-1:0] 	      i_acth,
	   input [N*W-1:0] 	      i_actv, 
	   input [1:0] 		      i_weight,
	   
	   input [CLOG2W-1:0] 	      arv_npu,
	   input [CLOG2W-1:0] 	      arv_ckg,
	   input [CLOG2K-1:0] 	      arv_k,
	   input [CLOG2V-1:0] 	      arv_tilev,
	   input [CLOG2H-1:0] 	      arv_tileh,
	   input [CLOG2B-1:0] 	      arv_tileb,
	   input [CLOG2C-1:0] 	      arv_tilec,
	   
	   /// fsm ctrl
	   input 		      ctrl_en_npu,
	   input 		      ctrl_ldh_v_n,
	   input 		      ctrl_wr_pipe,
	   input 		      ctrl_en_hmode,
	   input 		      ctrl_en_vmode,

	   output 		      s_tc_hmode,
	   output 		      s_tc_vmode,
	   output 		      s_tc_res,
	   output 		      s_tc_npu_ptr,
	   output 		      s_tc_tilev,
	   output 		      s_tc_tileh,
	   output 		      s_tc_tileb,
	   output 		      s_tc_tilec,
	   
	   /// address out
	   output 		      even_odd_n,
	   output [CLOG2M+CLOG2W-1:0] even_addr,
	   output [CLOG2M+CLOG2W-1:0] odd_addr,
	   
	   /// results
	   output [(N+BG)*W-1:0]      o_data
	   
	   );

   /* -----------------------------------------------
     ctrl pipe stage
    ----------------------------------------------- */

   reg 				      ps_ctrl_en_npu;
   reg 				      ps_ctrl_en_hmode;
   reg 				      ps_ctrl_ldh_v_n;   
   reg 				      ps_ctrl_wr_pipe;
   
   always @(posedge ck, posedge rst)
     begin
	if (rst == 1'b1)
	  begin
	     
	     ps_ctrl_en_npu   <= 1'b0;
	     ps_ctrl_en_hmode <= 1'b0;
	     ps_ctrl_ldh_v_n  <= 1'b0;
	     ps_ctrl_wr_pipe  <= 1'b0;
	     
	  end
	else
	  begin
	     ps_ctrl_en_npu   <= ctrl_en_npu;
	     ps_ctrl_en_hmode <= ctrl_en_hmode;
	     ps_ctrl_ldh_v_n  <= ctrl_ldh_v_n;	     
	     ps_ctrl_wr_pipe  <= ctrl_wr_pipe;
	     
	end
     end // always @ (posedge ck, posedge rst)
   
   /* -----------------------------------------------
    act if input
    ----------------------------------------------- */
   
   wire [N*(K-1)-1:0] 		    i_data_if1;
   wire [N*(K-1)-1:0] 		    i_data_if2;
   wire [N*(K-1)-1:0] 		    i_data_if3;
   wire [N*(K-1)-1:0] 		    i_data_if4;
   wire [N*(K-1)-1:0] 		    i_data_if5;
   wire [N*(K-1)-1:0] 		    i_data_if6;
   wire [N*(K-1)-1:0] 		    i_data_if7;
   wire [N*(K-1)-1:0] 		    i_data_if8;
   
   /* -----------------------------------------------
    npu input
    ----------------------------------------------- */
   
   wire [N-1:0] 		    i_data_h_npu1;
   wire [N-1:0] 		    i_data_h_npu2;
   wire [N-1:0] 		    i_data_h_npu3;
   wire [N-1:0] 		    i_data_h_npu4;   
   wire [N-1:0] 		    i_data_h_npu5;
   wire [N-1:0] 		    i_data_h_npu6;
   wire [N-1:0] 		    i_data_h_npu7;
   wire [N-1:0] 		    i_data_h_npu8;
   
   reg [N*W-1:0] 		    i_data_v_npu;

   /* -----------------------------------------------
    counters
    ----------------------------------------------- */
   
   wire [CLOG2K-1:0] hmode_cnt;
   wire [CLOG2K-1:0] vmode_cnt;
   wire [CLOG2W-1:0] res_ptr;
   wire [CLOG2W-1:0] npu_ptr;
   wire [CLOG2V-1:0] tilev_ptr;
   
   wire [CLOG2W-1:0] arv_res;

   wire 	     int_s_tc_res;
   wire 	     int_s_tc_tilev;
   wire 	     int_s_tc_tileh;
   wire 	     int_s_tc_tileb;
   wire 	     int_s_tc_tilec;

   assign s_tc_res   = int_s_tc_res;
   assign s_tc_tilev = int_s_tc_tilev;
   assign s_tc_tileh = int_s_tc_tileh;
   assign s_tc_tileb = int_s_tc_tileb;
   assign s_tc_tilec = int_s_tc_tilec;

   /* -----------------------------------------------
    clk gating mask
    ----------------------------------------------- */
   
   wire [0:7] 	     ckg_rmask;
   wire [0:7] 	     ckg_cmask;
   
   /* -----------------------------------------------
    Convolution/Dot-p engine
    ----------------------------------------------- */

   wire [N*W-1:0]    i_data_h_npu;
   
   assign i_data_h_npu = {i_data_h_npu1, 
			  i_data_h_npu2, 
			  i_data_h_npu3, 
			  i_data_h_npu4,
			  i_data_h_npu5, 
			  i_data_h_npu6, 
			  i_data_h_npu7,
			  i_data_h_npu8};
   npu npu_1 (
	      .ck(ck),
	      .rst(rst),
	      .en(ps_ctrl_en_npu),
	      .ldh_v_n(ps_ctrl_ldh_v_n),
	      .wr_pipe(ps_ctrl_wr_pipe),
	      .ckg_rmask(ckg_rmask),
	      .ckg_cmask(ckg_cmask),
	      .i_weight(i_weight),
	      .i_data_conv_h(i_data_h_npu),
	      .i_data_conv_v(i_data_v_npu),
	      .i_data_acc(64'h0),
	      .o_data(o_data)
	      );

   
   /* -----------------------------------------------
    activation queue 
    ----------------------------------------------- */
   
   reg [CLOG2K-1:0] ps_hmode_cnt; // h-mode ptr pipe stage
   
   always @(posedge ck, posedge rst)
     begin
	if (rst == 1'b1)
	  ps_hmode_cnt  <= '0;	
	else
	  ps_hmode_cnt  <= hmode_cnt;
     end
   
   /* -----------------------------------------------
    activation buffer
    ----------------------------------------------- */
   
   always @(posedge ck, posedge rst)
     begin
	if (rst == 1'b1)
	  i_data_v_npu <= '0;
	
	else if (ctrl_ldh_v_n == 1'b1)
	  i_data_v_npu <= i_actv;
	
     end
   
   act_buffer act_buf_1 (
			 .ck(ck),
			 .rst(rst),
			 .i_wr(ctrl_ldh_v_n),
			 .i_wr_ptr(npu_ptr),
			 .i_data(i_acth[N*W-1 -: N*(K-1)] ),
			 .o_data1(i_data_if1),
			 .o_data2(i_data_if2),
			 .o_data3(i_data_if3),
			 .o_data4(i_data_if4),
			 .o_data5(i_data_if5),
			 .o_data6(i_data_if6),
			 .o_data7(i_data_if7),
			 .o_data8(i_data_if8)
			 );
   
   /* -----------------------------------------------
    activation interface
    ----------------------------------------------- */
   
   act_if act_if_1 (		    
		    .i_sel_rotate(npu_ptr),
		    .i_sel_column({1'b0, ps_hmode_cnt[CLOG2K-2:0]}),
		    .i_data1(i_data_if1),
		    .i_data2(i_data_if2),
		    .i_data3(i_data_if3),
		    .i_data4(i_data_if4),
		    .i_data5(i_data_if5),
		    .i_data6(i_data_if6),
		    .i_data7(i_data_if7),
		    .i_data8(i_data_if8),
		    .o_data1(i_data_h_npu1),
		    .o_data2(i_data_h_npu2),
		    .o_data3(i_data_h_npu3),
		    .o_data4(i_data_h_npu4),
		    .o_data5(i_data_h_npu5),
		    .o_data6(i_data_h_npu6),
		    .o_data7(i_data_h_npu7),
		    .o_data8(i_data_h_npu8)
		    );
   
   /* -----------------------------------------------
    clk gating controller
    ----------------------------------------------- */

   reg ps_int_s_tc_tilev;
   reg ps_int_s_tc_tileh;

   always @(posedge ck)
     begin
	ps_int_s_tc_tilev <= int_s_tc_tilev;	   
	ps_int_s_tc_tileh <= int_s_tc_tileh;
	  	
     end
   
   ckg_ctrl8b ckg_ctrl_1 (
			  .arv_npu(arv_npu),
			  .arv_ckg(arv_ckg),
			  .en_ckgr(ps_int_s_tc_tilev),
			  .en_ckgc(ps_int_s_tc_tileh),
			  .arv_res(arv_res),
			  .ckg_rmask(ckg_rmask),
			  .ckg_cmask(ckg_cmask)
			  );   
      
   /* -----------------------------------------------
    npu controller // KERNEL COUNTERS 
    ----------------------------------------------- */
   
   kernel_cnt kernel_cnt_1 (
			    .ck(ck),
			    .rst(rst),
			    .en_hcnt(ctrl_en_hmode),
			    .en_vcnt(ctrl_en_vmode || int_s_tc_res), 
			    .arv_hcnt(arv_k),
			    .arv_vcnt(arv_k),
			    .q_hcnt(hmode_cnt),
			    .q_vcnt(vmode_cnt),
			    .tc_hcnt(s_tc_hmode),
			    .tc_vcnt(s_tc_vmode),
			    );
   
   /* -----------------------------------------------
    tile controller // TILE COUNTERS
    ----------------------------------------------- */
      
   wire 	     inc_even;
   wire 	     inc_odd;
   wire 	     rst_addr;

   tile_ctrl tile_ctrl_1 (
			.ck(ck),
			.rst(rst),
			.s_tc_res(int_s_tc_res), 
			.ctrl_ld_v(ctrl_ldh_v_n),
			.arv_npu_ptr(arv_npu),
			.arv_tilev(arv_tilev),
			.arv_tileh(arv_tileh), 
			.arv_tileb(arv_tileb),
			.arv_tilec(arv_tilec),
			.s_tc_npu_ptr(s_tc_npu_ptr),
			.s_tc_tilev(int_s_tc_tilev),
			.s_tc_tileh(int_s_tc_tileh),
			.s_tc_tileb(int_s_tc_tileb),
			.s_tc_tilec(int_s_tc_tilec),	
			.even_odd_n(even_odd_n),
			.inc_even(inc_even), 
			.inc_odd(inc_odd),   
			.rst_addr(rst_addr), 
			.npu_ptr(npu_ptr)
			);
   
    /* -----------------------------------------------
    result cnt
    ----------------------------------------------- */
   
   countern #(.N($size{arv_res})) res_cnt (
					   .ck(ck),
					   .rst(rst),
					   .sync_clr(1'b0),
					   .en(ctrl_wr_pipe),
					   .arv(arv_res),
					   //.q(res_ptr),
					   .tc(int_s_tc_res)
					   );
   
   /* -----------------------------------------------
    address generation unit
    ----------------------------------------------- */
   
   addr_gen addr_gen_1 (
			  .ck(ck),
			  .rst(rst),
			  .sync_clr(rst_addr),
			  .en(ctrl_ldh_v_n),
			  .inc_even(inc_even),
			  .inc_odd(inc_odd),
			  .arv_tilev(arv_tilev),
			  .i_data_even_addr(even_addr),
			  .i_data_odd_addr(odd_addr)
			  );
   
endmodule // dp


  
