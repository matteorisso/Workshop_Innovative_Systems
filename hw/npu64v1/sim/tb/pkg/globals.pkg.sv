//                              -*- Mode: Verilog -*-

// Filename        : globals.pkg.sv
// Description     :
// Requirements    : Verilog-2005 $clog2

package globals_sv;
   
   /* --------------------------------------------
    NPU dim and kernel size
    ----------------------------------------------*/
   
   localparam W = 8;
   localparam K = 5;
   localparam KK = K*K;
      
   /* -----------------------------------------------
    Activation Word-length
      ----------------------------------------------- */

   localparam N = 2;
   localparam BG = 6;
  
   /* -----------------------------------------------
    Layers
    ----------------------------------------------- */
   
   localparam IMG1_H = 32; // height
   localparam IMG1_W = IMG1_H; // width
   localparam IMG2_H = 14;
   localparam IMG2_W = IMG2_H;
   localparam C1_NB_TILE = 4; 
//$ceil(IMG1_H/W);  
   localparam C1_NB_TILEB = 1;
   localparam C1_NB_TILEC = 6;
   
   localparam C2_NB_TILE = 2;
//$ceil(IMG2_H/W);
   localparam C2_NB_TILEB = C1_NB_TILEC;
   localparam C2_NB_TILEC = 16;

   /* -----------------------------------------------
    Memory width
      ----------------------------------------------- */
   
   localparam C1_MEM_WIDTH = C1_NB_TILE*(C1_NB_TILE/2)*C1_NB_TILEB*W;
   localparam C2_MEM_WIDTH = C2_NB_TILE*(C2_NB_TILE/2)*C2_NB_TILEB*W;

   /* -----------------------------------------------
    Max localparams between layers
      ----------------------------------------------- */
   
   localparam NB_TILE = (C1_NB_TILE > C2_NB_TILE) ? C1_NB_TILE : C2_NB_TILE;
   localparam NB_TILEB = (C1_NB_TILEB > C2_NB_TILEB) ? C1_NB_TILEB : C2_NB_TILEB;
   localparam NB_TILEC = (C1_NB_TILEC > C2_NB_TILEC) ? C1_NB_TILEC : C2_NB_TILEC;
   localparam CL_MEM_WIDTH = (C1_MEM_WIDTH > C2_MEM_WIDTH) ? C1_MEM_WIDTH : C2_MEM_WIDTH;

   /* -----------------------------------------------
    Tile counters and address
      ----------------------------------------------- */
   
   localparam CLOG2W = $clog2(W);
   localparam CLOG2K = $clog2(K);
   localparam CLOG2T = $clog2(int'(NB_TILE));
   localparam CLOG2B = $clog2(int'(NB_TILEB));
   localparam CLOG2C = $clog2(int'(NB_TILEC));
   localparam CLOG2M = $clog2(int'(CL_MEM_WIDTH));  
     
endpackage // globals
   
