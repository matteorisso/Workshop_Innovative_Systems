
library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity faff is
port( Cin, x, y,clock,reset: in std_logic;
      s, Cout: out std_logic);
end faff;



architecture beh of faff is
  signal xy:std_logic;
  signal sum:std_logic;
  signal Carryout:std_logic;
  
  component FF 
		port( D,clock,reset: in std_logic;
			Q: out std_logic);
end component;

begin
  xy<=x xor y;
sum <= xy XOR Cin;
Carryout <= (xy AND Cin) OR (x AND y); 

ffs: FF port map(sum,clock,reset,s);
ffc: FF port map(Carryout,clock,reset,Cout);

end beh;