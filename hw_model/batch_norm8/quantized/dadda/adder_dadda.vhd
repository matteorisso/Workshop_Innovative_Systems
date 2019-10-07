library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.dadda_func.all;

entity adder_dadda is

	port(
		a	:	in 	std_logic_vector(15 downto 0);
		b 	:	in 	std_logic_vector(15 downto 0);
		res	: 	out std_logic_vector(15 downto 0)
		);
		
end entity;

architecture behavior of adder_dadda is
begin

	res  <= std_logic_vector(signed(a)+signed(b)); 	

end architecture behavior; 
