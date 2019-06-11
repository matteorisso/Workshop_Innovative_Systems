library ieee;
use ieee.std_logic_1164.all;
use work.fixed_pkg.all;
use work.param.all;

entity sub is
generic ( 	qi : natural:= 8;
				qf : natural:= 8 );
				
  port (
        
		  A,B : in sfixed(qi-1 downto -qf);   
        Y :   out sfixed(qi-1 downto -qf)
        );
end entity;

architecture behavioral of sub is
	begin
	
        Y<= B-A;     
		  
end architecture;