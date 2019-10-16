library ieee;

use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;

package globals is

constant W 					: natural 	:= 4; 																	
constant K 					: natural	:= 5; 									
constant KK 				: real 	 	:= real(K**2);

constant N 					: natural := 4; 										
constant N_PE_ROW 		: natural := W*N;
constant N_REG_FIFO 		: natural :=(W+K-1)*N; 							
constant BG 				: natural := natural(CEIL(LOG2(KK)));			
constant N_WEIGHT			: natural := 2; 								

constant IMG1_H 			: natural := 32;			
constant IMG1_W 			: natural := IMG1_H;	
constant IMG2_H 			: natural := 14;  		
constant IMG2_W 			: natural := IMG1_H;	

constant C1_NB_TILEV 	: natural := natural(CEIL(real(IMG1_H)/real(W)));	
constant C1_NB_TILEH 	: natural := C1_NB_TILEV-1; 									
constant C1_NB_TILEB		: natural := 1;												
constant C1_NB_TILEC	 	: natural := 6; 												
constant C2_NB_TILEV 	: natural := natural(CEIL(real(IMG2_H)/real(W)));	 			
constant C2_NB_TILEH 	: natural := C2_NB_TILEV-1;  								
constant C2_NB_TILEB		: natural := C1_NB_TILEC;									
constant C2_NB_TILEC 	: natural := 16; 												

constant C1_MEM_WIDTH 	: natural := C1_NB_TILEV*(C1_NB_TILEV/2)*C1_NB_TILEB;
constant C2_MEM_WIDTH 	: natural := C2_NB_TILEV*(C2_NB_TILEV/2)*C2_NB_TILEB;

constant NB_TILEV 		: natural := natural(REALMAX(real(C1_NB_TILEV),real(C2_NB_TILEV)));
constant NB_TILEH 		: natural := natural(REALMAX(real(C1_NB_TILEH),real(C2_NB_TILEH)));
constant NB_TILEB 		: natural := natural(REALMAX(real(C1_NB_TILEB),real(C2_NB_TILEB)));
constant NB_TILEC 		: natural := natural(REALMAX(real(C1_NB_TILEC),real(C2_NB_TILEC)));

constant CL_MEM_WIDTH	: natural := natural(REALMAX(real(C1_MEM_WIDTH),real(C2_MEM_WIDTH)));

-- ckg mask X = Y*N + MOD => LT_CKG = MOD = X - N*Y

constant C1_CKG 	: natural := natural(real(IMG1_H-K+1) - FLOOR(real(IMG1_H-K+1)/real(W))*real(W));   
constant C2_CKG 	: natural := natural(real(IMG2_H-K+1) - FLOOR(real(IMG2_H-K+1)/real(W))*real(W)); 

constant clog2W 	: natural := natural(CEIL(LOG2(real(W))));
constant clog2K 	: natural := natural(CEIL(LOG2(real(K))));
constant clog2V 	: natural := natural(CEIL(LOG2(real(NB_TILEV))));
constant clog2H 	: natural := natural(CEIL(LOG2(real(NB_TILEH))));
constant clog2B 	: natural := natural(CEIL(LOG2(real(NB_TILEB))));
constant clog2C 	: natural := natural(CEIL(LOG2(real(NB_TILEC))));
constant clog2M	: natural := natural(CEIL(LOG2(real(CL_MEM_WIDTH))));
 	 
subtype RFWord 		is signed(N_PE_ROW	- 1 downto 0);
subtype FIFORowData 	is signed(N_REG_FIFO	- 1 downto 0);
subtype PERowData 	is signed(N_PE_ROW	- 1 downto 0); 			
subtype PEResData 	is signed(W*(N+BG)	- 1 downto 0);

type 	DualPortRF 		is array (0 to CL_MEM_WIDTH-1) of RFWord; 
type 	MemDataOut 		is array (0 to W-1) of RFWord;

type 	FIFOBlockData 	is array (0 to W-1) of FIFORowData;	
type 	PEBlockData 	is array (0 to W-1) of PERowData;	
type 	PEBlockDataRes is array (0 to W-1) of PEResData;	

type  PERowData2 		is array (0 to W-1) of signed(N-1 downto 0);
type  PEResData2 		is array (0 to W-1) of signed(N+BG-1 downto 0);

type layer_t is (
	C1, 
	C2
	); 


end package;
