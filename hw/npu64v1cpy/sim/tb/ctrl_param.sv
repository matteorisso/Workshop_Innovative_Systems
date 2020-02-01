import globals_sv::*;

module ctrl_param (
		     input 		 c1_c2_n,
		     output 		 opcode,
		     output [CLOG2K-1:0] arv_KSI,
		     output [CLOG2W-1:0] arv_CKG,
		     output [CLOG2L-1:0] arv_L0,
		     output [CLOG2L-1:0] arv_L1,
		     output [CLOG2L-1:0] arv_L2,
		     output [CLOG2L-1:0] arv_L3,
		     output [CLOG2L-1:0] arv_L4);
   
   reg [CLOG2K-1:0] 			 int_arv_KSI  = '0; // default size is 32: truncated unsigned vector   
   reg [CLOG2W-1:0] 			 int_arv_CKG  = '0;
   reg [CLOG2L-1:0] 			 int_arv_L0   = '0;
   reg [CLOG2L-1:0] 			 int_arv_L1   = '0;
   reg [CLOG2L-1:0] 			 int_arv_L2   = '0;
   reg [CLOG2L-1:0] 			 int_arv_L3   = '0;
   reg [CLOG2L-1:0] 			 int_arv_L4   = '0;

   localparam ARV_W    = W-1;
   localparam ARV_K    = K-1;
   
   localparam ARV_CKG1 = ARV_W - ARV_K;
   localparam ARV_T1   = C1_NB_TILE-1;     
   localparam ARV_TB1  = C1_NB_TILEB-1;
   localparam ARV_TC1  = C1_NB_TILEC-1;
   
   localparam ARV_CKG2 = 1;
   localparam ARV_T2   = C2_NB_TILE-1;     
   localparam ARV_TB2  = C2_NB_TILEB-1;
   localparam ARV_TC2  = C2_NB_TILEC-1;
   
   assign arv_KSI = int_arv_KSI + ARV_K;	
   assign arv_CKG = (c1_c2_n == 1'b0) ? int_arv_CKG + ARV_CKG1 : int_arv_CKG + ARV_CKG2;
   assign arv_L0  = (c1_c2_n == 1'b0) ? int_arv_L0  + ARV_TB1  : int_arv_L0 + ARV_TB2;
   assign arv_L1  = ARV_W;
   assign arv_L2  = (c1_c2_n == 1'b0) ? int_arv_L2 + ARV_T1   : int_arv_L2   + ARV_T2;
   assign arv_L3  = (c1_c2_n == 1'b0) ? int_arv_L3 + ARV_T1   : int_arv_L3   + ARV_T2;  
   assign arv_L4  = (c1_c2_n == 1'b0) ? int_arv_L4 + ARV_TC1  : int_arv_L0 + ARV_TC2;
   
endmodule // ctrl_param

   
		     
