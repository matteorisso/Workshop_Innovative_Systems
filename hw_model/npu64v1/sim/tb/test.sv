import globals_sv::*;

  
module test;

   parameter CLK = 4;
   
   // -----------------------------------------------
  
   reg ck;
   reg rst;

   /* -----------------------------------------------
   npu inst.
    ----------------------------------------------- */

   wire [1:0] k;
   wire [(N+BG)*W-1:0] results;
   reg [(N+BG)-1:0]    res[0:W-1]; // util
   
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
   wire 	       done;

   /* -----------------------------------------------
   npu ctrl inst.
      ----------------------------------------------- */
   
   localparam ARV_K = K-1;
   localparam ARV_W = W-1;
   
   reg [CLOG2K-1:0]    arv_hmode  = '0; //default size is 32: truncated unsigned vector
   reg [CLOG2K-1:0]    arv_vmode  = '0;
   reg [CLOG2K-1:0]    arv_k 	  = '0;
   reg [CLOG2W-1:0]    arv_res 	  = '0;
      
   /* -----------------------------------------------
   tile ctrl inst.
      ----------------------------------------------- */
   /*
    * test Cx
    */
   
   localparam ARV_TV = C2_NB_TILE-1;
   localparam ARV_TH = C2_NB_TILE-1;
   localparam ARV_TB = C2_NB_TILEB-1;
   localparam ARV_TC = C2_NB_TILEC-1;
   
   reg [CLOG2W-1:0]    arv_npu 	   = '0;
   reg [CLOG2T-1:0]    arv_tile    = '0;
   reg [CLOG2B-1:0]    arv_ifmaps  = '0;
   reg [CLOG2C-1:0]    arv_ofmaps  = '0;
   
   /* -----------------------------------------------
    clk gating ctrl inst.
    ----------------------------------------------- */
   
   reg [CLOG2W-1:0]    arv_ckg 	   = '0;
   
   /* -----------------------------------------------
    address gen. inst.
    ----------------------------------------------- */
   
   wire 	       even_odd_n;
   wire [CLOG2M+CLOG2W-1:0] even_addr;
   wire [CLOG2M+CLOG2W-1:0] odd_addr;
   
   
   /* -----------------------------------------------
    memory_array
    ------------------------------------------------- */
   
   reg [4*W-1:0] 	  test_mem_even[0:1023];//[0:CL_MEM_WIDTH-1];
   reg [4*W-1:0] 	  test_mem_odd[0:1023];//CL_MEM_WIDTH-1];
   reg [(N+BG)-1:0] 	  test_res[0:4703];
   reg [1:0] 		  test_k[0:NB_TILEB*NB_TILEC*KK-1];

   
   /* -----------------------------------------------
    clock gen.
    ----------------------------------------------- */

   initial // Clock generator
     begin
	ck = 0;
	forever #(CLK/2) ck = ~ck;
     end

   /*
    ==============================================
                   TESTBENCH BODY
    ==============================================
    */
   
   integer i; // loop index
   integer mem_width = $size(test_mem_even); // my mem size
 
   /* -----------------------------------------------
    procedural timing block - test
    ----------------------------------------------- */
   
   initial
     begin
	/* -----------------------------------------------
	 
	 Init auto-reload values for counters
	 	 
	 trick to use parameters in number literals 
	 N.B. init '0 in wire or reg declaration
	 
	 ----------------------------------------------- */
	
	arv_hmode   = arv_hmode + ARV_K;
	arv_vmode   = arv_vmode + ARV_K;
	arv_k 	    = arv_vmode;
	arv_res     = arv_res + ARV_W;
	arv_ckg     = arv_ckg + 1;
// ARV_K - 1;
	arv_npu     = arv_npu + ARV_W;
	arv_tile    = arv_tile + ARV_TV;
	arv_ifmaps  = arv_ifmaps + ARV_TB;
	arv_ofmaps  = arv_ofmaps + ARV_TC;
	
	//Force idle state and start fsm
	rst 	    = 1'b1;
	start 	    = 1'b0;
	
	//Initialize test mem
		
	for(i=0; i<$size(test_mem_even); i++)
	  begin
	     test_mem_even[i] = 0;
	     test_mem_odd[i]  = 0;	     
	  end
	
	$readmemh("mem/evenc2act.mem", test_mem_even);
	$readmemh("mem/oddc2act.mem", test_mem_odd);

	//Initialize res mem
		
	for(i=0; i<$size(test_res); i++)
	     test_res[i] = 0;
	
	$readmemh("mem/c2result.mem", test_res);
	  
	//Initialize kernel buffer
	       
	for(i=0; i<$size(test_k); i++)
	     test_k[i] = 0;
	
        $readmemh("mem/c2kernel.mem", test_k);
	
	// Test

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
     dp ctrl pipe stage
     ----------------------------------------------- */

   reg ps_ctrl_en_hmode;
   reg ps_ctrl_wr_pipe;
   
   always @(posedge ck, posedge rst)
     begin
	if (rst == 1'b1)
	  begin
	     ps_ctrl_en_hmode <= 1'b0;
	     ps_ctrl_wr_pipe  <= 1'b0;	     
	  end
	else
	  begin
	     ps_ctrl_en_hmode <= ctrl_en_hmode;	     
	     ps_ctrl_wr_pipe  <= ctrl_wr_pipe;
	  end
     end // always @ (posedge ck, posedge rst)
   
   /* -----------------------------------------------
    stimuli (MEM)
      ----------------------------------------------- */
   /* -----------------------------------------------
    input data
    ----------------------------------------------- */
   
   reg [4*W-1:0] 	  i_data_h;
   reg [4*W-1:0] 	  i_data_v;
   
   always_comb // xbar MEM IF  
     begin
	i_data_h <= even_odd_n == 1'b0 ? test_mem_odd[int'(odd_addr)] : test_mem_even[int'(even_addr)];
	i_data_v <= even_odd_n == 1'b0 ? test_mem_even[int'(even_addr)] : test_mem_odd[int'(odd_addr)];
     end

   // from HEX to 2b activations
   
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
    kernel address
      ----------------------------------------------- */
   
   integer kaddr 	 = 0;
   integer koffs 	 = 0;
   integer kernel_addr 	 = 0;
   
   always @(posedge ck)
     begin
	if ((s_tc_tileh && s_tc_tilev && s_tc_res) == 1'b1)
	  koffs = kernel_addr;
     end
   
   always @(posedge ck)
     begin
	if (s_tc_res == 1'b1)
	  kaddr = 0;
	else
	  if (ps_ctrl_en_hmode == 1'b1) // with reg at output use ctrl_ld_h instead of ps_ctrl_ld_h
	    kaddr  += 1;
     end // always @ (posedge ck)
   
   always_comb
     kernel_addr = kaddr + koffs;
   
   assign k  = test_k[kernel_addr];  // put reg
   
   /* -----------------------------------------------
    check results
    ----------------------------------------------- */
   
   localparam RES_HIGH = (N+BG)*W-1;
   integer addr = 0;
    
   always @(posedge ck)
     begin
	if (ps_ctrl_wr_pipe == 1'b1)
	  begin
	     for(i=0; i < W; i++)
	       begin
		  res[i] = results[RES_HIGH - i*(N+BG) -: (N+BG)];
		  if (test_res[addr] != res[i])
		    begin		       
 		       $display("* ERROR: %t %h != %h\t", $time, test_res[addr], res[i]);
		       $display("* Pause sim.");
		       $stop;
		    end		  
		  addr += 1;
	       end // for (i=0; i < W; i++)
	  end // if (ps_ctrl_wr_pipe == 1'b1)
     end
   
   /* -----------------------------------------------
    DUT
    ----------------------------------------------- */
   
   dp dp_inst (
	       .ck(ck),
	       .rst(rst),
	       .i_acth(i_acth),
	       .i_actv(i_actv),
	       .i_weight(k),                                                                         
	       .ctrl_en_npu(ctrl_en_npu),
	       .ctrl_ldh_v_n(ctrl_ldh_v_n),
	       .ctrl_wr_pipe(ctrl_wr_pipe),
	       .ctrl_en_hmode(ctrl_en_hmode),
	       .ctrl_en_vmode(ctrl_en_vmode),	       
	       .s_tc_npu_ptr(s_tc_npu_ptr),
	       .s_tc_hmode(s_tc_hmode),
	       .s_tc_vmode(s_tc_vmode),
	       .s_tc_res(s_tc_res),
	       .s_tc_tilev(s_tc_tilev),
	       .s_tc_tileh(s_tc_tileh),
	       .s_tc_ifmaps(s_tc_ifmaps),
	       .s_tc_ofmaps(s_tc_ofmaps),	   
	       .arv_npu(arv_npu),
	       .arv_ckg(arv_ckg),
	       .arv_k(arv_k),
	       .arv_tile(arv_tile),
	       .arv_ifmaps(arv_ifmaps),
	       .arv_ofmaps(arv_ofmaps),
	       .i_data_even_addr(even_addr),
	       .i_data_odd_addr(odd_addr),
	       .i_data_ev_odd_n(even_odd_n),
	       .o_data(results)
	       );

   fsm fsm_inst (
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
		 .done(done)
		 );
  
endmodule // tb_if
