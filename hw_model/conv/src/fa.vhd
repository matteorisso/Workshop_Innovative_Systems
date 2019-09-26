library ieee;
use ieee.std_logic_1164.all;

entity fa is 
port(
		a 		: in	std_logic; 
		b 		: in 	std_logic;
		c_in 	: in 	std_logic;
		sum 	: out 	std_logic;
		c_out 	: out 	std_logic);
end entity;

architecture dataflow of fa is

begin
sum 	<= a xor b xor c_in;
c_out	<= ((a xnor b) and b)or((a xor b) and c_in);  		
end architecture; 


