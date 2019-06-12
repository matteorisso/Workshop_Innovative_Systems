library ieee;
use ieee.std_logic_1164.all;
use work.fixed_pkg.all;

entity comp is
generic ( 	qi : natural:= 8;
				qf : natural:= 8 );				
port (  

        A : in sfixed(qi-1 downto -qf);  
        O : out sfixed(qi-1 downto -qf)
       );   
end entity;

architecture behavioral of comp is

begin
   process(A)
	begin
	  
	  if(A < "0000000100000000") then   -- if the input is < 1 linear approximation is employed y = x    
	    O <= A;
	  
	  else
	    O <= "0000000100000000";       -- if the input is > 1 y = 1 approximation is employed  
	  end if;
   end process;	
	  
end architecture; 