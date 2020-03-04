
library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity fa is
port( Cin, x, y: in std_logic;
      s, Cout: out std_logic);
end fa;



architecture beh of fa is
  signal xy:std_logic;

  


begin
  xy<=x xor y;
s<= xy XOR Cin;
Cout<= (xy AND Cin) OR (x AND y); 


end beh;