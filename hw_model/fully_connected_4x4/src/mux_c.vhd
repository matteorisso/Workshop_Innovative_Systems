library ieee; 
use ieee.std_logic_1164.all; 

entity mux_c is                                          -- mux in input at the comparator, if sel = 1 the counter will stop to 83, if sel = 0 to 119
 
    port ( 
	       sel : in  std_logic;
           o   : out std_logic_vector (6 downto 0)
		   
		  );
		  
end mux_c;

architecture beh of mux_c is

begin

    o <= "1110111" when (sel = '0') else "1010011";
	
end beh;