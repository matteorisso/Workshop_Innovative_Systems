library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all; 

entity ppsum is

generic ( n: integer );

port (
       g,p : in  signed(n-1 downto 0);
       s   : out signed(n-1 downto 0)
	  );
	  
end ppsum;


architecture structural of ppsum is

begin

     sum : for i in n-1 downto 0 generate

     s(i) <= g(i) xor p(i);
	 
end generate sum;

end structural;
