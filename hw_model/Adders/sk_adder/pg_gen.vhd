library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all; 

entity pg_gen is

generic ( n: integer );

port (
       a,b: in  signed(n-1 downto 0);
       ci : in  std_logic;
       g,p: out signed(n-1 downto 0)
	  );	  
end pg_gen;


architecture structural of pg_gen is

begin

square_cell0 :
              g(0) <= (ci and a(0)) or (ci and b(0)) or (a(0) and b(0));
              p(0) <= a(0) xor b(0);

square_cells : for sc in 1 to n-1 generate
               
			   g(sc) <= a(sc) and b(sc);
               p(sc) <= a(sc) xor b(sc);

end generate square_cells;

end structural;
