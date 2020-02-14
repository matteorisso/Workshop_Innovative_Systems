//                              -*- Mode: Verilog -*-

// Filename        : globals.pkg.sv
// Description     : global parameters for testbench, mirroring globals.pkg.vhd
// Requirements    : Verilog-2005 $clog2

package globals_sv;
   
   localparam W = 8; // npu dim
   localparam K = 5; // kernel size
   localparam KK = K*K;     

   localparam N = 4; // activation bits
   localparam BG = 4; // bit-growth

   // 2d layers
   
   localparam IMG1_H = 32; // height
   localparam IMG1_W = IMG1_H; // width
   localparam IMG2_H = 14;
   localparam IMG2_W = IMG2_H;
   localparam IMG3_H = 5;
   localparam IMG3_W = IMG3_H;
   
   // convolution
   
   localparam C1_NB_TILE   = 4; 
   localparam C1_NB_IFMAPS = 1;
   localparam C1_NB_OFMAPS = 6;
   localparam C2_NB_TILE   = 2;
   localparam C2_NB_IFMAPS = C1_NB_OFMAPS;
   localparam C2_NB_OFMAPS = 16;

   // classifier

   localparam C3_NB_IFMAPS = IMG3_H * IMG3_W * C2_NB_OFMAPS; // flatten
   localparam C3_NB_OFMAPS = 120;
   localparam C3_L1 = IMG3_H;  // px per word 
   localparam C3_L2 = IMG3_W;
   localparam C3_L3 = C2_NB_OFMAPS;
   localparam C3_L4 = $ceil(C3_NB_OFMAPS/(W*W));
   localparam FC1_NB_IFMAPS = C3_NB_OFMAPS;
   localparam FC1_NB_OFMAPS = 84;
   localparam FC1_L1 = W;       // px / word
   localparam FC1_L2 = 0;
   localparam FC1_L3 = $ceil(FC1_NB_IFMAPS/W);
   localparam FC1_L4 = $ceil(FC1_NB_OFMAPS/(W*W));
   localparam FC2_NB_IFMAPS = FC1_NB_OFMAPS;
   localparam FC2_NB_OFMAPS = 10;
   localparam FC2_L1 = W;       // px / word
   localparam FC2_L2 = 0;
   localparam FC2_L3 = $ceil(FC1_NB_IFMAPS/W);
   localparam FC2_L4 = $ceil(FC1_NB_OFMAPS/(W*W));
    
   localparam C1_MEM_WIDTH = C1_NB_TILE*(C1_NB_TILE/2)*C1_NB_IFMAPS*W;
   localparam C2_MEM_WIDTH = C2_NB_TILE*(C2_NB_TILE/2)*C2_NB_IFMAPS*W;
   
   localparam NB_TILE  = (C1_NB_TILE > C2_NB_TILE) ? C1_NB_TILE : C2_NB_TILE;
   localparam NB_IFMAPS = (C1_NB_IFMAPS > C2_NB_IFMAPS) ? C1_NB_IFMAPS : C2_NB_IFMAPS;
   localparam NB_OFMAPS = (C1_NB_OFMAPS > C2_NB_OFMAPS) ? C1_NB_OFMAPS : C2_NB_OFMAPS;
   localparam CL_MEM_WIDTH = (C1_MEM_WIDTH > C2_MEM_WIDTH) ? C1_MEM_WIDTH : C2_MEM_WIDTH;
   
   localparam CLOG2W  = $clog2(W);
   localparam CLOG2K  = $clog2(K);
   localparam CLOG2T  = $clog2(int'(NB_TILE));
   localparam CLOG2B  = $clog2(int'(NB_IFMAPS));
   localparam CLOG2C  = $clog2(int'(NB_OFMAPS));

   localparam CLOG2L  = 4;
//NB_TILE > NB_OFMAPS ? $clog2(int'(NB_TILE)) : $clog2(int'(NB_OFMAPS)); 
   localparam CLOG2M  = $clog2(int'(CL_MEM_WIDTH));
   localparam CLOG2MW = $clog2(int'(KK*NB_OFMAPS*NB_IFMAPS));
     
endpackage // globals
   
