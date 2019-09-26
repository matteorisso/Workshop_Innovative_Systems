library ieee; 
use ieee.std_logic_1164.all; 

entity fa is 
		
port  (	
        a   :	in	std_logic;
        b   :	in	std_logic;
        ci  :	in	std_logic;
        sum :	out	std_logic;
        co  :	out	std_logic
		
        );
		
end entity; 

architecture structural of fa is

begin

  sum   <= a xor b xor ci;
  --co  <= (a and b) or (b and ci) or (a and ci);
  co <= ((a xor b) and ci) or (a and b);
  
end structural;