library ieee; 
use ieee.std_logic_1164.all; 
use ieee.numeric_std.all;

entity mux_c is                                          -- mux in input at the comparator, if sel = 1 the counter will stop to 84, if sel = 0 to 120
 
    port ( 
	       sel : in  std_logic;
           o   : out unsigned (6 downto 0)
		   
		  );
		  
end mux_c;

architecture beh of mux_c is

begin

    o <= "1111000" when (sel = '0') else "1010100";
	
end beh;