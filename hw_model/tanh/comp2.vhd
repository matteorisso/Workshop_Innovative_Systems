library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use work.fixed_pkg.all;

entity comp2 is
generic ( 	qi : natural:= 8; qf : natural:= 8 );		
		
port (  
        A : in sfixed(qi-1 downto -qf); 
        aeqb, altb, agtb  : in std_logic;  
        O : out sfixed(qi-1 downto -qf)
       );   
end entity;

architecture behavioral of comp2 is

begin

  O(qi-2 downto -qf) <=     A(qi-2 downto -qf)  when (aeqb = '0') and (altb = '1') and (agtb = '0') else 
                            "000000100000000"   when (aeqb = '1') and (altb = '0') and (agtb = '0') else 
                            "000000100000000" when (aeqb = '0') and (altb = '0') and (agtb = '1') else 
                            "000000000000000";
							
  O(qi-1) <=  A(qi-1);							
	  
end architecture; 