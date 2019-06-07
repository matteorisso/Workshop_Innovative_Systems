library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity comp is
port (  A : in std_logic_vector (7 downto -8);  
        O: out std_logic_vector (7 downto -8);
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