library ieee;

use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;

package globals is

  constant W  : natural := 8;
  constant K  : natural := 5;
  constant KK : real    := real(K**2);

  constant N           : natural := 2;
  constant BG          : natural := 6;
  constant N_WEIGHT    : natural := 2;

  constant IMG1_H : natural := 32;
  constant IMG1_W : natural := IMG1_H;
  constant IMG2_H : natural := 14;
  constant IMG2_W : natural := IMG2_H;

  constant C1_NB_TILE   : natural := natural(CEIL(real(IMG1_H)/real(W)));
  constant C1_NB_IFMAPS : natural := 1;
  constant C1_NB_OFMAPS : natural := 6;
  constant C2_NB_TILE   : natural := natural(CEIL(real(IMG2_H)/real(W)));
  constant C2_NB_IFMAPS : natural := C1_NB_OFMAPS;
  constant C2_NB_OFMAPS : natural := 16;

  -- input mem 
  constant C1_MEM_WIDTH : natural := C1_NB_TILE*(C1_NB_TILE/2)*C1_NB_IFMAPS*W;
  constant C2_MEM_WIDTH : natural := C2_NB_TILE*(C2_NB_TILE/2)*C2_NB_IFMAPS*W;

  constant NB_TILE   : natural := natural(REALMAX(real(C1_NB_TILE), real(C2_NB_TILE)));
  constant NB_IFMAPS : natural := natural(REALMAX(real(C1_NB_IFMAPS), real(C2_NB_IFMAPS)));
  constant NB_OFMAPS : natural := natural(REALMAX(real(C1_NB_OFMAPS), real(C2_NB_OFMAPS)));

  -- max layer tile mapping 
  constant CL_MEM_WIDTH : natural := natural(REALMAX(real(C1_MEM_WIDTH), real(C2_MEM_WIDTH)));

  -- ckg mask X = Y*N + MOD => LT_CKG = MOD = X - N*Y
  constant C1_CKG : natural := natural(real(IMG1_H-K+1) - FLOOR(real(IMG1_H-K+1)/real(W))*real(W));
  constant C2_CKG : natural := natural(real(IMG2_H-K+1) - FLOOR(real(IMG2_H-K+1)/real(W))*real(W));

  -- loop counters
  constant CLOG2W  : natural := natural(CEIL(LOG2(real(W))));
  constant CLOG2K  : natural := natural(CEIL(LOG2(real(K))));
  constant CLOG2T  : natural := natural(CEIL(LOG2(real(NB_TILE))));
  constant CLOG2B  : natural := natural(CEIL(LOG2(real(NB_IFMAPS))));
  constant CLOG2C  : natural := natural(CEIL(LOG2(real(NB_OFMAPS))));
  
  constant CLOG2L  : natural := natural(REALMAX(real(CLOG2T), real(CLOG2C)));

  -- address gen
  constant CLOG2M  : natural := natural(CEIL(LOG2(real(CL_MEM_WIDTH))));
  constant CLOG2MW : natural := natural(CEIL(LOG2(real(KK)*real(NB_OFMAPS))));
                                
end package;
