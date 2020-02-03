library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;

package globals is

  constant W  : natural := 8;           --// npu dim
  constant K  : natural := 5;           --// kernel size
  constant KK : real    := real(K**2);

  constant N  : natural := 2;           --// activation bits
  constant BG : natural := 6;           --// bit-growth

  --// 2d layers

  constant IMG1_H : natural := 32;
  constant IMG1_W : natural := IMG1_H;
  constant IMG2_H : natural := 14;
  constant IMG2_W : natural := IMG2_H;
  constant IMG3_H : natural := 5;
  constant IMG3_W : natural := IMG3_H;

  --// convolution

  constant C1_NB_TILE   : natural := natural(CEIL(real(IMG1_H)/real(W)));
  constant C1_NB_IFMAPS : natural := 1;
  constant C1_NB_OFMAPS : natural := 6;
  constant C2_NB_TILE   : natural := natural(CEIL(real(IMG2_H)/real(W)));
  constant C2_NB_IFMAPS : natural := C1_NB_OFMAPS;
  constant C2_NB_OFMAPS : natural := 16;

  --// classifier

  constant C3_NB_IFMAPS  : natural := IMG3_H * IMG3_W *C2_NB_OFMAPS;  --// flatten
  constant C3_NB_OFMAPS  : natural := 120;
  constant C3_L1         : natural := IMG3_H;  --// px per word 
  constant C3_L2         : natural := IMG3_W;
  constant C3_L3         : natural := C2_NB_OFMAPS;
  constant C3_L4         : natural := natural(CEIL(real(C3_NB_OFMAPS)/real(W*W)));
  constant FC1_NB_IFMAPS : natural := C3_NB_OFMAPS;
  constant FC1_NB_OFMAPS : natural := 84;
  constant FC1_L1        : natural := W;       --// px / word
  constant FC1_L2        : natural := 0;
  constant FC1_L3        : natural := natural(CEIL(real(FC1_NB_IFMAPS)/real(W)));
  constant FC1_L4        : natural := natural(CEIL(real(FC1_NB_OFMAPS)/real(W*W)));
  constant FC2_NB_IFMAPS : natural := FC1_NB_OFMAPS;
  constant FC2_NB_OFMAPS : natural := 10;
  constant FC2_L1        : natural := W;       --// px / word
  constant FC2_L2        : natural := 0;
  constant FC2_L3        : natural := natural(CEIL(real(FC1_NB_IFMAPS)/real(W)));
  constant FC2_L4        : natural := natural(CEIL(real(FC1_NB_OFMAPS)/real(W*W)));

  --// input mem 
  constant C1_MEM_WIDTH : natural := C1_NB_TILE*(C1_NB_TILE/2)*C1_NB_IFMAPS*W;
  constant C2_MEM_WIDTH : natural := C2_NB_TILE*(C2_NB_TILE/2)*C2_NB_IFMAPS*W;

  --// max values conv.
  constant NB_TILE   : natural := natural(REALMAX(real(C1_NB_TILE), real(C2_NB_TILE)));
  constant NB_IFMAPS : natural := natural(REALMAX(real(C1_NB_IFMAPS), real(C2_NB_IFMAPS)));
  constant NB_OFMAPS : natural := natural(REALMAX(real(C1_NB_OFMAPS), real(C2_NB_OFMAPS)));

  --// max layer tile mapping 
  constant CL_MEM_WIDTH : natural := natural(REALMAX(real(C1_MEM_WIDTH), real(C2_MEM_WIDTH)));

  --// ckg mask X = Y*N + MOD => LT_CKG = MOD = X - N*Y

  --// (IMG_H-K+1)%W
  
  constant C1_CKG : natural := natural(real(IMG1_H-K+1) - FLOOR(real(IMG1_H-K+1)/real(W))*real(W));
  constant C2_CKG : natural := natural(real(IMG2_H-K+1) - FLOOR(real(IMG2_H-K+1)/real(W))*real(W));

  --// loop counters
  constant CLOG2W : natural := natural(CEIL(LOG2(real(W))));
  constant CLOG2K : natural := natural(CEIL(LOG2(real(K))));
  constant CLOG2T : natural := natural(CEIL(LOG2(real(NB_TILE))));
  constant CLOG2B : natural := natural(CEIL(LOG2(real(NB_IFMAPS))));
  constant CLOG2C : natural := natural(CEIL(LOG2(real(NB_OFMAPS))));

  constant CLOG2L : natural := natural(REALMAX(real(CLOG2T), real(CLOG2C)));
  --// 4bit

  --// address gen
  constant CLOG2M  : natural := natural(CEIL(LOG2(real(CL_MEM_WIDTH))));
  constant CLOG2MW : natural := natural(CEIL(LOG2(real(KK)*real(NB_OFMAPS)*real(NB_IFMAPS))));
  
end package;
