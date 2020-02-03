import globals_sv::*;

module test;

   parameter CLK = 4;
   
   // -----------------------------------------------
  
   reg 	      ck;
   reg 	      rst;

   /* -----------------------------------------------
   npu inst.
    ----------------------------------------------- */

   wire [1:0] i_c_weight;
   reg [127:0] i_fc_weight = 128'h0;
   
   wire       o_data_wr;
   wire       o_data_wrh;
   wire       o_data_wrh_l_n;

   //wire [N*W-1:0] o_data_npu; // dbg
   
   wire [N*W-1:0] o_data;  
   
   /* -----------------------------------------------
   fsm inst.
      ----------------------------------------------- */
   
   reg 		       start;
   wire 	       s_tc_hmode;
   wire 	       s_tc_vmode;
   wire 	       s_tc_res;   
   wire 	       s_tc_L1;
   wire 	       s_tc_L2;
   wire 	       s_tc_L3;
   wire 	       s_tc_L0;
   wire 	       s_tc_L4;
   wire 	       ctrl_en_npu;
   wire 	       ctrl_en_hmode;
   wire 	       ctrl_en_vmode;
   wire 	       ctrl_ldh_v_n;
   wire 	       ctrl_wr_pipe;
   wire 	       ctrl_en_p;
   wire 	       ctrl_en_st;
   wire 	       ctrl_wr_mem;
   wire 	       done;
   
   /* -----------------------------------------------
   ctrl param. inst.
    ----------------------------------------------- */
   
   reg [2:0] 	       opcode;
   reg [CLOG2K-1:0]    arv_KSI;
   reg [CLOG2W-1:0]    arv_CKG;
   reg [CLOG2L-1:0]    arv_L0;
   reg [CLOG2L-1:0]    arv_L1;
   reg [CLOG2L-1:0]    arv_L2;
   reg [CLOG2L-1:0]    arv_L3;
   reg [CLOG2L-1:0]    arv_L4;

   /* -----------------------------------------------
    address gen. inst.
    ----------------------------------------------- */

   wire 	       i_data_even_odd_n;
   wire 	       o_data_even_odd_n;
   	          	       
   wire [CLOG2M+CLOG2W-1:0] i_data_even_addr;
   wire [CLOG2M+CLOG2W-1:0] i_data_odd_addr;

   wire [CLOG2M+CLOG2W-1:0] o_data_even_addr;
   wire [CLOG2M+CLOG2W-1:0] o_data_odd_addr;
   
   wire [CLOG2MW-1:0] 	    i_weight_addr;
   
   /* -----------------------------------------------
    test memory array
    ------------------------------------------------- */
   
   reg [4*W-1:0] 	  test_mem_even[0:1024*6-1];
   reg [4*W-1:0] 	  test_mem_odd[0:1024*6-1];
   reg [4*W-1:0] 	  test_res_even[0:1024*16-1];   
   reg [4*W-1:0] 	  test_res_odd[0:1024*16-1];   
   reg [1:0] 		  test_k[0:NB_IFMAPS*NB_OFMAPS*KK-1];
   
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
   integer fd; // variable for file descriptor handle
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
       
        $readmemh("mem/c1kernel.mem",  test_k);
	$readmemh("mem/c1acteven.mem", test_mem_even);
	$readmemh("mem/c1actodd.mem",  test_mem_odd);
	$readmemh("mem/c2acteven.mem", test_res_even);
	$readmemh("mem/c2actodd.mem",  test_res_odd);		
        
	// Test
	
	opcode = 3'b000; // select conv layer
	
	$display("\nProcessing\n");
	
	fd = $fopen("results","w");
   
	@(posedge ck) rst    = ~rst;
	@(posedge ck) start  = ~start; // start fsm 
	@(posedge ck) start  = ~start; // only one convolution
  
	@(posedge done)

	  begin
	     $display("\nFirst layer done");	     
	     $display("Processing second layer\n");
	     
	     opcode = 3'b001; // select conv layer
	
	     $readmemh("mem/c2acteven.mem", test_mem_even);
	     $readmemh("mem/c2actodd.mem", test_mem_odd);		
             $readmemh("mem/c2kernel.mem", test_k);
	     $readmemh("mem/c3acteven.mem", test_res_even);
	     $readmemh("mem/c3actodd.mem", test_res_odd);	     
	  end // @ (posedge done)
	
	rst = 1'b1;
	#CLK rst =1'b0 ;
	
	@(posedge ck) #(2*CLK) start = ~start;
	
	@(posedge done) 
	  begin	     	     
	     $display("\nSuccess.\n");
	     $fclose(fd);	     
	     $stop;
	  end	 	
     end // initial begin

   
   /* -----------------------------------------------
    layer config
    ----------------------------------------------- */
   
   cfg 
     cfg_inst (
	       .opcode(opcode),
	       .arv_KSI(arv_KSI),
	       .arv_CKG(arv_CKG),
	       .arv_L0(arv_L0),
	       .arv_L1(arv_L1),
	       .arv_L2(arv_L2),
	       .arv_L3(arv_L3),
	       .arv_L4(arv_L4));
   
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

   always @(posedge ck)// mux result mem. if.
     o_data_r <=  o_data_even_odd_n == 1'b1 ? test_res_odd[int'(o_data_odd_addr)] : test_res_even[int'(o_data_even_addr)];
  
   wire [N*W-1:0] o_actr;
  
   assign o_actr[N*W-(N*0)-1 -: N] =  o_data_r[4*W-1-(4*0) -: 4];
   assign o_actr[N*W-(N*1)-1 -: N] =  o_data_r[4*W-1-(4*1) -: 4];
   assign o_actr[N*W-(N*2)-1 -: N] =  o_data_r[4*W-1-(4*2) -: 4];
   assign o_actr[N*W-(N*3)-1 -: N] =  o_data_r[4*W-1-(4*3) -: 4];
   assign o_actr[N*W-(N*4)-1 -: N] =  o_data_r[4*W-1-(4*4) -: 4];
   assign o_actr[N*W-(N*5)-1 -: N] =  o_data_r[4*W-1-(4*5) -: 4];
   assign o_actr[N*W-(N*6)-1 -: N] =  o_data_r[4*W-1-(4*6) -: 4];
   assign o_actr[N*W-(N*7)-1 -: N] =  o_data_r[4*W-1-(4*7) -: 4];
   
   
   /* -----------------------------------------------
    Scoreboard
    ----------------------------------------------- */
   
   integer 	  RES_HIGH;
   integer 	  WL;

   
   reg [N-1:0] 	  DUT_RES[0:W-1]; // util   
   reg [N-1:0] 	  TEST_RES[0:W-1]; // util
   
   always_comb
     begin
	RES_HIGH = (o_data_wrh_l_n) ? N*(W/2)-1 : N*W-1;
	WL = (o_data_wrh) ? W/2 : W;
     end

   always @(posedge ck)
     begin
	if (o_data_wr == 1'b1)
	  begin	     	     
	     for(i=0; i < WL; i++)	     
	       begin
		  
		  DUT_RES[i]   = o_data[RES_HIGH - i*N -: N]; 
		  TEST_RES[i]  = o_actr[RES_HIGH - i*N -: N];
		  
		  // dump
		  $fdisplay(fd, " TIME:\t%t\n REF: \t %h\n DP: \t %h \n RES_HIGH: \t%d \n", $time, TEST_RES[i], DUT_RES[i], RES_HIGH);
		  
		  if (DUT_RES[i] != TEST_RES[i])		  
		    begin		       		       
		       $display("* ERROR: %t RES : %h != %h\t", $time, TEST_RES[i], DUT_RES[i]);		       
		       $display("* Pause sim.");
		       $stop;
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
	      .hctrl_fc(opcode[2]),
	      .i_acth(i_acth),
	      .i_actv(i_actv),
	      .i_c_weight(i_c_weight),
	      .i_fc_weight(i_fc_weight),
	      .ctrl_en_npu(ctrl_en_npu),
	      .ctrl_ldh_v_n(ctrl_ldh_v_n),
	      .ctrl_wr_pipe(ctrl_wr_pipe),
	      .ctrl_en_hmode(ctrl_en_hmode),
	      .ctrl_en_vmode(ctrl_en_vmode),
	      .ctrl_en_p(ctrl_en_p),
	      .ctrl_en_st(ctrl_en_st),
	      .ctrl_wr_mem(ctrl_wr_mem),	      
	      .s_tc_hmode(s_tc_hmode),
	      .s_tc_vmode(s_tc_vmode),
	      .s_tc_res(s_tc_res),	      
	      .s_tc_L0(s_tc_L0),
	      .s_tc_L1(s_tc_L1),
	      .s_tc_L2(s_tc_L2),
	      .s_tc_L3(s_tc_L3),
	      .s_tc_L4(s_tc_L4),	   
	      .arv_CKG(arv_CKG),
	      .arv_KSI(arv_KSI),
	      .arv_L0(arv_L0),
	      .arv_L1(arv_L1),
	      .arv_L2(arv_L2),
	      .arv_L3(arv_L3),
	      .arv_L4(arv_L4),
	      .i_weight_addr(i_weight_addr),	      
	      .i_data_ev_odd_n(i_data_even_odd_n),	      
	      .i_data_even_addr(i_data_even_addr),
	      .i_data_odd_addr(i_data_odd_addr),
	      .o_data_ev_odd_n(o_data_even_odd_n),
	      .o_data_even_addr(o_data_even_addr),
	      .o_data_odd_addr(o_data_odd_addr),
	      .o_data_wr(o_data_wr),
	      .o_data_wrh(o_data_wrh),
	      .o_data_wrh_l_n(o_data_wrh_l_n),
	      .o_data(o_data));
   fsm 
     fsm_inst (
	       .ck(ck),
	       .rst(rst),
	       .start(start),
	       .s_tc_hmode(s_tc_hmode),
	       .s_tc_vmode(s_tc_vmode),
	       .s_tc_res(s_tc_res),	       
	       .s_tc_L0(s_tc_L0),	       
	       .s_tc_L1(s_tc_L1),
	       .s_tc_L2(s_tc_L2),
	       .s_tc_L3(s_tc_L3),
	       .s_tc_L4(s_tc_L4),
	       .ctrl_en_hmode(ctrl_en_hmode),
	       .ctrl_en_vmode(ctrl_en_vmode),
	       .ctrl_en_npu(ctrl_en_npu),
	       .ctrl_ldh_v_n(ctrl_ldh_v_n),
	       .ctrl_wr_pipe(ctrl_wr_pipe),
	       .ctrl_en_p(ctrl_en_p),
	       .ctrl_en_st(ctrl_en_st),
	       .ctrl_wr_mem(ctrl_wr_mem),
	       .done(done));

endmodule // tb_if
