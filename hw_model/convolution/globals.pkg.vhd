library ieee;

use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;

package globals is

  constant W  : natural := 4;
  constant K  : natural := 5;
  constant KK : real    := real(K**2);

  constant N        : natural := 4;
  constant BG       : natural := natural(CEIL(LOG2(KK)));
  constant BG2      : natural := BG + 3;-- natural(CEIL(LOG2(C2_NB_TILEB))); --
                                        -- natural(CEIL(LOG2(6))); --
  constant N_WEIGHT : natural := 2;

  constant IMG1_H : natural := 32;
  constant IMG1_W : natural := IMG1_H;
  constant IMG2_H : natural := 14;
  constant IMG2_W : natural := IMG1_H;

  constant C1_NB_TILEV : natural := natural(CEIL(real(IMG1_H)/real(W)));
  constant C1_NB_TILEH : natural := C1_NB_TILEV-1;
  constant C1_NB_TILEB : natural := 1;
  constant C1_NB_TILEC : natural := 6;
  constant C2_NB_TILEV : natural := natural(CEIL(real(IMG2_H)/real(W)));
  constant C2_NB_TILEH : natural := C2_NB_TILEV-1;
  constant C2_NB_TILEB : natural := C1_NB_TILEC;
  constant C2_NB_TILEC : natural := 16;

  -- input mem and SP(scratch)
  constant C1_MEM_WIDTH     : natural := C1_NB_TILEV*(C1_NB_TILEV/2)*C1_NB_TILEB;
  constant C2_MEM_WIDTH     : natural := C2_NB_TILEV*(C2_NB_TILEV/2)*C2_NB_TILEB;
  constant C1_MEM_WIDTH_SP  : natural := (C1_NB_TILEV-1)*(C1_NB_TILEV-1)*C1_NB_TILEC;
  constant C2_MEM_WIDTH_SP  : natural := (C2_NB_TILEV-1)*(C2_NB_TILEV-1)*C2_NB_TILEC;

  constant NB_TILEV : natural := natural(REALMAX(real(C1_NB_TILEV), real(C2_NB_TILEV)));
  constant NB_TILEH : natural := natural(REALMAX(real(C1_NB_TILEH), real(C2_NB_TILEH)));
  constant NB_TILEB : natural := natural(REALMAX(real(C1_NB_TILEB), real(C2_NB_TILEB)));
  constant NB_TILEC : natural := natural(REALMAX(real(C1_NB_TILEC), real(C2_NB_TILEC)));

  -- max layer tile mapping 
  constant CL_MEM_WIDTH    : natural := natural(REALMAX(real(C1_MEM_WIDTH), real(C2_MEM_WIDTH)));
  constant CL_MEM_WIDTH_SP : natural := natural(REALMAX(real(C1_MEM_WIDTH_SP), real(C2_MEM_WIDTH_SP)));
  
-- ckg mask X = Y*N + MOD => LT_CKG = MOD = X - N*Y

  constant C1_CKG : natural := natural(real(IMG1_H-K+1) - FLOOR(real(IMG1_H-K+1)/real(W))*real(W));
  constant C2_CKG : natural := natural(real(IMG2_H-K+1) - FLOOR(real(IMG2_H-K+1)/real(W))*real(W));

  constant CLOG2W    : natural := natural(CEIL(LOG2(real(W))));
  constant CLOG2K    : natural := natural(CEIL(LOG2(real(K))));
  constant CLOG2V    : natural := natural(CEIL(LOG2(real(NB_TILEV))));
  constant CLOG2H    : natural := natural(CEIL(LOG2(real(NB_TILEH))));
  constant CLOG2B    : natural := natural(CEIL(LOG2(real(NB_TILEB))));
  constant CLOG2C    : natural := natural(CEIL(LOG2(real(NB_TILEC))));
  constant CLOG2M    : natural := natural(CEIL(LOG2(real(CL_MEM_WIDTH))));
  constant CLOG2M_SP : natural := natural(CEIL(LOG2(real(CL_MEM_WIDTH_SP))));

  type pe_array_t is array (0 to W-1) of signed(N*W-1 downto 0);
  type res_pe_array_t is array (0 to W-1) of signed((N+BG)*W-1 downto 0);
  type i_pe_array_t is array (0 to W-1) of signed(N-1 downto 0);
  type o_pe_array_t is array (0 to W-1) of signed(N+BG-1 downto 0);

  type mem_data_t is array (0 to W-1) of signed(N*W-1 downto 0);
  type spad_data_t is array (0 to W-1) of signed((N+BG2)*W-1 downto 0);
  type layer_t is (C1, C2);


end package;
