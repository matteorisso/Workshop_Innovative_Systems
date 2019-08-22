library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ppa_sk is

generic ( n: integer := 16; m: integer := 4 );

port (
       g0,p0 : in  signed(n-1 downto 0);
       gm    : out signed(n-1 downto 0)
	  );  
end ppa_sk;


architecture structural of ppa_sk is

signal g,p : signed(0 to (m+1)*n - 1);

begin
input: for i in 0 to n-1 generate
       
	   p(i) <= p0(i);
       g(i) <= g0(i);
	   
end generate input;

stage: for st in 1 to m generate

grou: for gr in 0 to 2**(m-st) - 1 generate

white_cells:

for w in 0 to 2**(st-1) - 1 generate

white_cell: if gr*2**st + w < n generate

           g(st*n + gr*2**st + w) <= g((st-1)*n + gr*2**st + w);

           p(st*n + gr*2**st + w) <= p((st-1)*n + gr*2**st + w);
		   
end generate white_cell;

end generate white_cells;

colored_cells:

for c in 2**(st-1) to 2**st - 1 generate

colored_cell: if gr*2**st + c < n generate

grey_or_black_cell:

                    g(st*n + gr*2**st + c) <= g((st-1)*n + gr*2**st + c) or (p((st-1)*n + gr*2**st + c) and g((st-1)*n + gr*2**st + 2**(st-1) - 1));

grey_cell: if gr = 0 generate

           p(st*n + c) <= p((st-1)*n + c);

end generate grey_cell;

black_cell: if gr > 0 generate

           p(st*n + gr*2**st + c) <= p((st-1)*n + gr*2**st + c) and p((st-1)*n + gr*2**st + 2**(st-1) - 1);

end generate black_cell;

end generate colored_cell;

end generate colored_cells;

end generate grou;

end generate stage;

output: for o in 0 to n-1 generate

        gm(o) <= g(n*m + o);
		
end generate output;

end structural;
