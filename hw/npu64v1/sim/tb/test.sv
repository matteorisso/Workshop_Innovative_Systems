import globals_sv::*;
  
module test;

   parameter CLK = 2;
   
   // -----------------------------------------------
  
   reg 	      ck;
   reg 	      rst;

   /* -----------------------------------------------
   npu inst.
    ----------------------------------------------- */

   wire [1:0] i_c_weight;
   
   wire       o_data_wr;
   wire       o_data_wrh_l_n;

   wire [N*W-1:0] o_data_npu; // dbg
   
   wire [N*(W/2)-1:0] o_data;  
   reg [N-1:0] 	  o_data_act[0:(W/2)-1]; // util
   
   /* -----------------------------------------------
   fsm inst.
      ----------------------------------------------- */
   
   reg 		       start;
   wire 	       s_tc_npu_ptr;
   wire 	       s_tc_hmode;
   wire 	       s_tc_vmode;
   wire 	       s_tc_res;
   wire 	       s_tc_tilev;
   wire 	       s_tc_tileh;
   wire 	       s_tc_ifmaps;
   wire 	       s_tc_ofmaps;
   wire 	       ctrl_en_npu;
   wire 	       ctrl_en_hmode;
   wire 	       ctrl_en_vmode;
   wire 	       ctrl_ldh_v_n;
   wire 	       ctrl_wr_pipe;
   wire 	       ctrl_en_p;
   wire 	       ctrl_wr_mem;
   wire 	       done;
   
   /* -----------------------------------------------
   ctrl param. inst.
    ----------------------------------------------- */
   
   reg 		       c1_c2_n;
   reg [CLOG2K-1:0]    arv_k;
   reg [CLOG2W-1:0]    arv_ckg;
   reg [CLOG2T-1:0]    arv_i_tile;
   reg [CLOG2T-1:0]    arv_o_tile;
   reg [CLOG2B-1:0]    arv_ifmaps;
   reg [CLOG2C-1:0]    arv_ofmaps;

   /* -----------------------------------------------
    address gen. inst.
    ----------------------------------------------- */

   wire 	       i_data_even_odd_n;
   wire 	       o_data_even_odd_n;
   	          	       
   wire [CLOG2M+CLOG2W-1:0] i_data_even_addr;
   wire [CLOG2M+CLOG2W-1:0] i_data_odd_addr;

   wire [CLOG2M+CLOG2W-1:0] o_data_even_addr;
   wire [CLOG2M+CLOG2W-1:0] o_data_odd_addr;
   
   wire [15:0] 		    i_weight_addr;
   
   /* -----------------------------------------------
    test memory array
    ------------------------------------------------- */
   
   reg [4*W-1:0] 	  test_mem_even[0:1023];
   reg [4*W-1:0] 	  test_mem_odd[0:1023];
   reg [4*W-1:0] 	  test_res_even[0:1024*16-1];   
   reg [4*W-1:0] 	  test_res_odd[0:1024*16-1];   
   reg [1:0] 		  test_k[0:NB_TILEB*NB_TILEC*KK-1];

   
   /*
    ==============================================
                   TESTBENCH BODY
    ==============================================
    */
   
   /* -----------------------------------------------
    clock gen.
    ----------------------------------------------- */

   initial // Clock generator
     begin
	ck = 0;
	forever #(CLK/2) ck = ~ck;
     end


   integer i; // loop index
   integer mem_width = $size(test_mem_even); // my mem size
 
   /* -----------------------------------------------
    procedural timing block - test
    ----------------------------------------------- */
   
   initial
     begin
	rst 	    = 1'b1;
	start 	    = 1'b0;
	
	//Reset act mem		
	for(i=0; i<$size(test_mem_even); i++)
	  begin
	     test_mem_even[i] = 0;
	     test_mem_odd[i]  = 0;	     
	  end
	
	//Reset res mem		
	for(i=0; i<$size(test_res_even); i++)
	  begin
	     test_res_even[i] = 0;
	     test_res_odd[i]  = 0;	     
	  end	
	
	//Reset kernel mem
	for(i=0; i<$size(test_k); i++)
	     test_k[i] = 0;

	//Initialize test mem
	// 		
	$readmemh("mem/c2acteven.mem", test_mem_even);
	$readmemh("mem/c2actodd.mem", test_mem_odd);		
        $readmemh("mem/c2kernel.mem", test_k);
	$readmemh("mem/c3acteven.mem", test_res_even);
	$readmemh("mem/c3actodd.mem", test_res_odd);		
        
	// Test
	
	c1_c2_n = 1'b1; // select conv layer
	
	$display("\nProcessing\n");
	  
	@(posedge ck) rst    = ~rst;
	@(posedge ck) start  = ~start; // start fsm 
	@(posedge ck) start  = ~start; // only one convolution

	@(posedge done)
	  begin
	     $display("\nSuccess.\n");
	     
	     #(2*CLK) $stop; //$finish
	  end
	
     end // initial begin

   
   /* -----------------------------------------------
    layer config
    ----------------------------------------------- */
   
   ctrl_param 
     ctrl_param_inst (
		      .c1_c2_n(c1_c2_n),
		      .arv_ksize(arv_k),
		      .arv_ckgate(arv_ckg),
		      .arv_i_tile(arv_i_tile),
		      .arv_o_tile(arv_o_tile),
		      .arv_ifmaps(arv_ifmaps),
		      .arv_ofmaps(arv_ofmaps));
   
   /* -----------------------------------------------
    input stimuli
    ----------------------------------------------- */
   
   reg [4*W-1:0] 	  i_data_h;
   reg [4*W-1:0] 	  i_data_v;
    
   always_comb // xbar mem. if.
     begin
	i_data_h <= i_data_even_odd_n == 1'b0 ? test_mem_odd[int'(i_data_odd_addr)]   : test_mem_even[int'(i_data_even_addr)];
	i_data_v <= i_data_even_odd_n == 1'b0 ? test_mem_even[int'(i_data_even_addr)] : test_mem_odd[int'(i_data_odd_addr)];
     end
   
   // convolution kernel 
   assign i_c_weight = test_k[i_weight_addr];
   
   /* -----------------------------------------------
    Driver  
    ----------------------------------------------- */
   
   wire [N*W-1:0] i_acth;
   wire [N*W-1:0] i_actv;
   
   assign i_acth[N*W-(N*0)-1 -: N] = i_data_h[4*W-1-(4*0) -: 4]; 
   assign i_acth[N*W-(N*1)-1 -: N] = i_data_h[4*W-1-(4*1) -: 4];
   assign i_acth[N*W-(N*2)-1 -: N] = i_data_h[4*W-1-(4*2) -: 4]; 
   assign i_acth[N*W-(N*3)-1 -: N] = i_data_h[4*W-1-(4*3) -: 4];
   assign i_acth[N*W-(N*4)-1 -: N] = i_data_h[4*W-1-(4*4) -: 4]; 
   assign i_acth[N*W-(N*5)-1 -: N] = i_data_h[4*W-1-(4*5) -: 4];
   assign i_acth[N*W-(N*6)-1 -: N] = i_data_h[4*W-1-(4*6) -: 4]; 
   assign i_acth[N*W-(N*7)-1 -: N] = i_data_h[4*W-1-(4*7) -: 4];
   
   assign i_actv[N*W-(N*0)-1 -: N] = i_data_v[4*W-1-(4*0) -: 4]; 
   assign i_actv[N*W-(N*1)-1 -: N] = i_data_v[4*W-1-(4*1) -: 4];
   assign i_actv[N*W-(N*2)-1 -: N] = i_data_v[4*W-1-(4*2) -: 4]; 
   assign i_actv[N*W-(N*3)-1 -: N] = i_data_v[4*W-1-(4*3) -: 4];
   assign i_actv[N*W-(N*4)-1 -: N] = i_data_v[4*W-1-(4*4) -: 4]; 
   assign i_actv[N*W-(N*5)-1 -: N] = i_data_v[4*W-1-(4*5) -: 4];
   assign i_actv[N*W-(N*6)-1 -: N] = i_data_v[4*W-1-(4*6) -: 4]; 
   assign i_actv[N*W-(N*7)-1 -: N] = i_data_v[4*W-1-(4*7) -: 4];
   
    /* -----------------------------------------------
    golden model for Scoreboard
    ----------------------------------------------- */
   reg [4*W-1:0]  o_data_r;

   always_comb// mux result mem. if.
     o_data_r <=  o_data_even_odd_n == 1'b1 ? test_res_odd[int'(o_data_odd_addr)] : test_res_even[int'(o_data_even_addr)];
   
   wire [N*(W/2)-1:0] o_actr;
    
   assign o_actr[N*(W/2)-(N*0)-1 -: N] = o_data_wrh_l_n == 1'b0 ? o_data_r[4*W-1-(4*0) -: 4] : o_data_r[4*W-1-(4*4) -: 4];
   assign o_actr[N*(W/2)-(N*1)-1 -: N] = o_data_wrh_l_n == 1'b0 ? o_data_r[4*W-1-(4*1) -: 4] : o_data_r[4*W-1-(4*5) -: 4]; 
   assign o_actr[N*(W/2)-(N*2)-1 -: N] = o_data_wrh_l_n == 1'b0 ? o_data_r[4*W-1-(4*2) -: 4] : o_data_r[4*W-1-(4*6) -: 4];  
   assign o_actr[N*(W/2)-(N*3)-1 -: N] = o_data_wrh_l_n == 1'b0 ? o_data_r[4*W-1-(4*3) -: 4] : o_data_r[4*W-1-(4*7) -: 4];
   
//   assign o_actr[N*W-(N*4)-1 -: N] = o_data_r[4*W-1-(4*4) -: 4]; 
//   assign o_actr[N*W-(N*5)-1 -: N] = o_data_r[4*W-1-(4*5) -: 4];
//   assign o_actr[N*W-(N*6)-1 -: N] = o_data_r[4*W-1-(4*6) -: 4]; 
//   assign o_actr[N*W-(N*7)-1 -: N] = o_data_r[4*W-1-(4*7) -: 4];
   
   /* -----------------------------------------------
    Scoreboard
    ----------------------------------------------- */
   
   // procedure
   localparam RES_HIGH = N*(W/2)-1;
    
   always @(posedge ck)
     begin
	if (o_data_wr == 1'b1)
	  begin
	     for(i=0; i < W; i++)	     
	       begin		  
		  o_data_act[i] = o_data[RES_HIGH - i*N -: N]; // non-blocking
		  if (o_actr[RES_HIGH - i*N -: N] != o_data_act[i])		  
		    begin		       		       
		       $display("* ERROR: %t %h != %h\t", $time, o_actr[RES_HIGH - i*N -: N], o_data_act[i]);		       
		       $display("* Pause sim.");
		       #(4*CLK)$stop;
		    end 
	       end // for (i=0; i < W; i++)
	  end // if (ps_ctrl_wr_pipe == 1'b1)
     end
   
   /* -----------------------------------------------
    DUT
    ----------------------------------------------- */
   
   dp 
     dp_inst (
	      .ck(ck),
	      .rst(rst),
	      .i_acth(i_acth),
	      .i_actv(i_actv),
	      .i_weight(i_c_weight),    
	      .ctrl_en_npu(ctrl_en_npu),
	      .ctrl_ldh_v_n(ctrl_ldh_v_n),
	      .ctrl_wr_pipe(ctrl_wr_pipe),
	      .ctrl_en_hmode(ctrl_en_hmode),
	      .ctrl_en_vmode(ctrl_en_vmode),
	      .ctrl_en_p(ctrl_en_p),
	      .ctrl_wr_mem(ctrl_wr_mem),
	      .s_tc_npu_ptr(s_tc_npu_ptr),
	      .s_tc_hmode(s_tc_hmode),
	      .s_tc_vmode(s_tc_vmode),
	      .s_tc_res(s_tc_res),
	      .s_tc_tilev(s_tc_tilev),
	      .s_tc_tileh(s_tc_tileh),
	      .s_tc_ifmaps(s_tc_ifmaps),
	      .s_tc_ofmaps(s_tc_ofmaps),	   
	      .arv_ckg(arv_ckg),
	      .arv_k(arv_k),
	      .arv_i_tile(arv_i_tile),
	      .arv_o_tile(arv_o_tile),
	      .arv_ifmaps(arv_ifmaps),
	      .arv_ofmaps(arv_ofmaps),
	      .i_weight_addr(i_weight_addr),	      
	      .i_data_ev_odd_n(i_data_even_odd_n),	      
	      .i_data_even_addr(i_data_even_addr),
	      .i_data_odd_addr(i_data_odd_addr),
	      .o_data_ev_odd_n(o_data_even_odd_n),
	      .o_data_even_addr(o_data_even_addr),
	      .o_data_odd_addr(o_data_odd_addr),
	      .o_data_wr(o_data_wr),	   
	      .o_data_wrh_l_n(o_data_wrh_l_n),
	      .o_data(o_data));
   fsm 
     fsm_inst (
	       .ck(ck),
	       .rst(rst),
	       .start(start),
	       .s_tc_npu_ptr(s_tc_npu_ptr),
	       .s_tc_hmode(s_tc_hmode),
	       .s_tc_vmode(s_tc_vmode),
	       .s_tc_res(s_tc_res),
	       .s_tc_tilev(s_tc_tilev),
	       .s_tc_tileh(s_tc_tileh),
	       .s_tc_ifmaps(s_tc_ifmaps),
	       .s_tc_ofmaps(s_tc_ofmaps),
	       .ctrl_en_hmode(ctrl_en_hmode),
	       .ctrl_en_vmode(ctrl_en_vmode),
	       .ctrl_en_npu(ctrl_en_npu),
	       .ctrl_ldh_v_n(ctrl_ldh_v_n),
	       .ctrl_wr_pipe(ctrl_wr_pipe),
	       .ctrl_en_p(ctrl_en_p),
	       .ctrl_wr_mem(ctrl_wr_mem),
	       .done(done));

endmodule // tb_if
