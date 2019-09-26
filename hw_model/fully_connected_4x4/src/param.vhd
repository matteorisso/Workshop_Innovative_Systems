library ieee;
use ieee.numeric_std.all ;

package param is

	constant pe_number	: natural := 16; 
	constant b			: natural := 4;   -- number of bits for the imap
	constant k          : natural := 2;   -- number of bits for the weigths 
	constant bg         : natural := 11;  -- required parallelism evaluating the bit growth (DATO INCERTO)
	
	constant cnt_b      : natural := 7;   -- 7 bit counter in order to load the 120 activations in the first layer and the 84 activations in the second 
	constant cnt_b2     : natural := 3;   -- 3 bit counter in order to load 6 times the 120 activations in the first layer and 2 times the 84 activations in the second 	
	
	type ifmap_type   is array(0 to pe_number-1) of signed(b-1 downto 0);
	type weights_type is array(0 to pe_number-1) of signed(k-1 downto 0);	
	type ofmap_type   is array(0 to pe_number-1) of signed(bg-1 downto 0);
	
end package param;