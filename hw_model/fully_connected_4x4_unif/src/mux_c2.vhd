library ieee; 
use ieee.std_logic_1164.all; 
use ieee.numeric_std.all;

entity mux_c2 is                                          -- mux2 in input at the comparator2, if sel = 1 the counter will stop to 2, if sel = 0 to 6
 
    port ( 
	       sel : in  std_logic;
           o   : out unsigned (2 downto 0)
		   
		  );
		  
end mux_c2;

architecture beh of mux_c2 is

begin

    o <= "110" when (sel = '0') else "010";
	
end beh;