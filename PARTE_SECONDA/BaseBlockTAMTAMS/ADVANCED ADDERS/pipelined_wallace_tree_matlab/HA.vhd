
library IEEE;

use IEEE.STD_LOGIC_1164.all;

use IEEE.numeric_std.all;



entity HA is
       
port( x,y :in std_logic;
 
      s,c :out std_logic); 

end HA;




architecture beh of HA is

begin

	s<= x XOR y;
        
c<= x AND y;


end beh;


