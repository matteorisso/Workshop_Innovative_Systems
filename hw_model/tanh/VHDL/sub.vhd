library ieee;
use ieee.std_logic_1164.all;
use work.fixed_pkg.all;

entity sub is
generic ( 	qi : natural:= 8;
				qf : natural:= 8 );
				
  port (
        
		  A,B : in sfixed(qi-1 downto -qf);   
        Y :   out sfixed(qi-1 downto -qf);
		  cout : out std_logic
        );
end entity;

architecture behavioral of sub is

 signal tmp : sfixed(qi downto -qf);
	
	begin
	
        tmp <= B-A;   
        Y  <= tmp(qi-1 downto -qf);
        cout <= tmp(qi);  
		  
end architecture;