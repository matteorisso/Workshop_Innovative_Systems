library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all; 

entity ppshl is

generic ( n: integer );

port (
       gi : in  signed(n-1 downto 0);
       ci : in  std_logic;
       go : out signed(n-1 downto 0);
       co : out std_logic
	  );
	  
end ppshl;

architecture structural of ppshl is

begin

msb : co <= gi(n-1);

shl : for s in n-1 downto 1 generate

      go(s) <= gi(s-1);
	  
end generate shl;

lsb : go(0) <= ci;

end structural;
