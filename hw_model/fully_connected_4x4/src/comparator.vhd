library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity comparator is                 

generic( n : natural ); 

   port(
 	     d1     : in std_logic_vector(n-1 downto 0);
 	     d2     : in std_logic_vector(n-1 downto 0);	
	     eq     : out std_logic			 
		
		);
		
end entity;
 
architecture beh of comparator is
   
begin   

    eq <= '1' when d1 = d2 else '0';
   
end beh;