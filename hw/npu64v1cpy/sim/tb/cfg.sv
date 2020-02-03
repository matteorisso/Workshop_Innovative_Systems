import globals_sv::*;

module cfg (
	    input [2:0] 	opcode,
	    output [CLOG2K-1:0] arv_KSI,
	    output [CLOG2W-1:0] arv_CKG,
	    output [CLOG2L-1:0] arv_L0,
	    output [CLOG2L-1:0] arv_L1,
	    output [CLOG2L-1:0] arv_L2,
	    output [CLOG2L-1:0] arv_L3,
	    output [CLOG2L-1:0] arv_L4);
   
   reg [CLOG2K-1:0] 		int_arv_KSI  = '0; // default size is 32: truncated unsigned vector   
   reg [CLOG2W-1:0] 		int_arv_CKG  = '0;
   reg [CLOG2L-1:0] 		int_arv_L0   = '0;
   reg [CLOG2L-1:0] 		int_arv_L1   = '0;
   reg [CLOG2L-1:0] 		int_arv_L2   = '0;
   reg [CLOG2L-1:0] 		int_arv_L3   = '0;
   reg [CLOG2L-1:0] 		int_arv_L4   = '0;
   
   localparam ARV_W    = W-1; // npu dim
   localparam ARV_K    = K-1; // kernel size

   // First convolution
   
   localparam ARV_CKG_0 = ARV_W - ARV_K; // (IMG_H % W) - 1 = (28%8) - 1   
   localparam ARV_L0_0  = C1_NB_IFMAPS-1; // ifmaps
   localparam ARV_L1_0  = ARV_W;
   localparam ARV_L2_0 	= C1_NB_TILE-1; // npu data block (tile) 
   localparam ARV_L3_0 	= C1_NB_TILE-1; // npu data block (tile) 
   localparam ARV_L4_0  = C1_NB_OFMAPS-1; // ofmaps

   // Second convolution
   
   localparam ARV_CKG_1 = 1; // (IMG_H % W) - 1 = (10%8) - 1   
   localparam ARV_L0_1  = C2_NB_IFMAPS-1; // ifmaps
   localparam ARV_L1_1  = ARV_W;
   localparam ARV_L2_1 	= C2_NB_TILE-1; // npu data block (tile) 
   localparam ARV_L3_1 	= C2_NB_TILE-1; // npu data block (tile) 
   localparam ARV_L4_1  = C2_NB_OFMAPS-1; // ofmaps

   // C3 (CLA 0) first classifier

   // # active PE rows - 1
   localparam ARV_CKG_2 = ARV_W-1; // 120 output neurons -> CEIL((120 % 64)/8)
   // # input word fetch 
   localparam ARV_L0_2  = 0;  // skip input rf in PE
   localparam ARV_L1_2  = 4;  // px in word I00-I04     (IMG_W)
   // # words 5x16
   localparam ARV_L2_2  = 4;  // word / ifmap I00-I40   (IMG_H)
   localparam ARV_L3_2  = 15; // ifmaps
   // how many times all input words must be fetched
   localparam ARV_L4_2  = 1;  // steps (64 output neurons/step)

   // FC1 (CLA 1) second classifier

   // # active PE rows - 1
   localparam ARV_CKG_3 = 2;   // 84 output neurons -> CEIL((84 % 64)/8)
   // # input word fetch
   localparam ARV_L0_3 	= 0;   // skip input rf in PE
   localparam ARV_L1_3 	= W-1; // px in word = 8
   // # words 15
   localparam ARV_L2_3 	= 0;    
   localparam ARV_L3_3 	= 14;   // CEIL(120/8) = 15 
   // how many times all input words must be fetched
   localparam ARV_L4_3 	= 1;   // CEIL(#output_neurons/64) 

   // FC2 (CLA 2) third classifier
   
   localparam ARV_CKG_4 = 1;   // 10 output neurons -> CEIL((10 % 64)/8)
   localparam ARV_L0_4  = 0;   // skip input rf in PE
   localparam ARV_L1_4  = W-1; // px in word = 8
   localparam ARV_L2_4  = 0;   
   localparam ARV_L3_4  = 11;  // CEIL(84/8) - 1
   localparam ARV_L4_4  = 0;   // CEIL(#output_neurons/64)

   assign arv_KSI = int_arv_KSI;
   assign arv_CKG = int_arv_CKG;
   assign arv_L0  = int_arv_L0;
   assign arv_L1  = int_arv_L1;
   assign arv_L2  = int_arv_L2;
   assign arv_L3  = int_arv_L3;
   assign arv_L4  = int_arv_L4;
 		  
   always_comb
     begin
	case(opcode)
	  3'b001 : // C2
	    begin
	       int_arv_KSI <= ARV_K;
	       int_arv_CKG <= ARV_CKG_1;
	       int_arv_L0  <= ARV_L0_1;
	       int_arv_L1  <= ARV_L1_1;
	       int_arv_L2  <= ARV_L2_1;
	       int_arv_L3  <= ARV_L3_1;
	       int_arv_L4  <= ARV_L4_1;
	    end
	  3'b100 : // C3
	    begin
	       int_arv_KSI <= '0;
	       int_arv_CKG <= ARV_CKG_2;
	       int_arv_L0  <= ARV_L0_2;
	       int_arv_L1  <= ARV_L1_2;
	       int_arv_L2  <= ARV_L2_2;
	       int_arv_L3  <= ARV_L3_2;
	       int_arv_L4  <= ARV_L4_2;
	    end
	  3'b101 : // FC1
	    begin
	       int_arv_KSI <= '0;	       
	       int_arv_CKG <= ARV_CKG_3;
	       int_arv_L0  <= ARV_L0_3;
	       int_arv_L1  <= ARV_L1_3;
	       int_arv_L2  <= ARV_L2_3;
	       int_arv_L3  <= ARV_L3_3;
	       int_arv_L4  <= ARV_L4_3;
	    end	  
	  3'b110 : // FC2
	    begin
	       int_arv_KSI <= '0;
	       int_arv_CKG <= ARV_CKG_4;
	       int_arv_L0  <= ARV_L0_4;
	       int_arv_L1  <= ARV_L1_4;
	       int_arv_L2  <= ARV_L2_4;
	       int_arv_L3  <= ARV_L3_4;
	       int_arv_L4  <= ARV_L4_4;
	    end
	  default : // C1
	    begin
	       int_arv_KSI <= ARV_K;
	       int_arv_CKG <= ARV_CKG_0;
	       int_arv_L0  <= ARV_L0_0;
	       int_arv_L1  <= ARV_L1_0;
	       int_arv_L2  <= ARV_L2_0;
	       int_arv_L3  <= ARV_L3_0;
	       int_arv_L4  <= ARV_L4_0;
	    end
	endcase
     end // always_comb

endmodule // cfg

   
		     
