
library IEEE;

use IEEE.STD_LOGIC_1164.all;

use IEEE.numeric_std.all;



entity HAff is
       
port( x,y,clock,reset :in std_logic;
 
      s,c :out std_logic); 

end HAff;




architecture beh of HAff is
  signal sum:std_logic;
  signal Carryout:std_logic;
 component FF 
	port( D,clock,reset: in std_logic;
      	Q: out std_logic);
end component;

begin

	sum <= x XOR y;
        
Carryout <= x AND y;


ffs: FF port map(sum,clock,reset,s);
ffc: FF port map(Carryout,clock,reset,c);
end beh;


