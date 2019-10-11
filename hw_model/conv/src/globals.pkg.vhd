library ieee;

use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;

package globals is

-------------------------------------------------

-- globals

constant W 	: natural 	:= 4; 									-- PE block height/width								
constant K 	: natural	:= 5; 									-- kernel size
constant KK : real 	 	:= real(K**2);

-- datapath

constant N 	: natural := 4; 										-- data wordlength(activation)
constant WL : natural := (W+K-1)*N; 							-- regfile word length
constant G 	: natural := natural(CEIL(LOG2(KK)));			-- system gain , bit-growth							

subtype PERowData is signed(W*N -1 		downto 0); 			-- PE row IN  : PE i_data width * #PEs
subtype PEResData is signed(W*(N+G)-1 	downto 0);	 		-- PE row OUT : PE o_data width * #PEs
subtype RFRowData is signed(WL -1 		downto 0); 			-- FIFO IN  

type 	PEBlockData 	is array (0 to W-1) of PERowData;	-- PE rows IN  (W* PEs row IN)
type 	PEBlockDataRes is array (0 to W-1) of PEResData;	-- PE rows OUT (W* PEs row OUT)
type 	RFBlockData 	is array (0 to W-1) of RFRowData;	-- RF OUT      (W* FIFO IN)

-- conv input size

constant IMG1_H : natural := 32;			-- C1 input img height
constant IMG1_W : natural := IMG1_H;	-- C1 input img width
constant IMG2_H : natural := 14;  		-- C2 input img height
constant IMG2_W : natural := IMG1_H;	-- C2 input img width

-- conv layers size in urom

constant C1_NB_TILEV : natural := natural(CEIL(real(IMG1_H)/real(W)));	-- #input vertical-tile
constant C1_NB_TILEH : natural := C1_NB_TILEV-1; 									-- #input horizontal-tile
constant C1_NB_TILEB	: natural := 1;												-- #input channels
constant C1_NB_TILEC : natural := 6; 												-- #output channels

constant C2_NB_TILEV : natural := natural(CEIL(real(IMG2_H)/real(W)));	-- natural(CEIL(real(IMG2_H-K+1)/real(W))); 			-- #input v-tile
constant C2_NB_TILEH : natural := C2_NB_TILEV-1;  								-- #input h-tile
constant C2_NB_TILEB	: natural := C1_NB_TILEC;									-- #input channels
constant C2_NB_TILEC : natural := 16; 												-- #output channels

-- ckg mask X = Y*N + MOD => LT_CKG = MOD = X - N*Y

constant C1_LT_CKG : natural := natural(real(IMG1_H-K+1) - FLOOR(real(IMG1_H-K+1)/real(W))*real(W));   
constant C2_LT_CKG : natural := natural(real(IMG2_H-K+1) - FLOOR(real(IMG2_H-K+1)/real(W))*real(W)); 

-- address gen.

constant clog2W  : natural := natural(CEIL(LOG2(real(W))));
constant clog2K  : natural := natural(CEIL(LOG2(real(K))));

constant clog2v1 : natural := natural(CEIL(LOG2(real(C1_NB_TILEV)))); 
constant clog2h1 : natural := natural(CEIL(LOG2(real(C1_NB_TILEH)))); 
constant clog2b1 : natural := natural(CEIL(LOG2(real(C1_NB_TILEB))));
constant clog2c1 : natural := natural(CEIL(LOG2(real(C1_NB_TILEC))));
 
constant clog2v2 : natural := natural(CEIL(LOG2(real(C2_NB_TILEV))));
constant clog2h2 : natural := natural(CEIL(LOG2(real(C2_NB_TILEH))));
constant clog2b2 : natural := natural(CEIL(LOG2(real(C2_NB_TILEB)))); 
constant clog2c2 : natural := natural(CEIL(LOG2(real(C2_NB_TILEC)))); 

constant clog2v : natural := natural(REALMAX(real(clog2v1),real(clog2v2)));
constant clog2h : natural := natural(REALMAX(real(clog2h1),real(clog2h2)));
constant clog2b : natural := natural(REALMAX(real(clog2b1),real(clog2b2)));
constant clog2c : natural := natural(REALMAX(real(clog2c1),real(clog2c2)));

-------------------------------------------------

-- tmp mem

constant clog2X : natural := 6; 
constant X : natural := 48; -- NB LINES
type int_mem_t is array (0 to W-1) of signed(N*W-1 downto 0);

-- tmp task 

type layer_t is (C1, C2); 

-------------------------------------------------
end package;
