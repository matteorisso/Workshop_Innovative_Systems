library ieee;
use ieee.std_logic_1164.all;

use work.dadda_func.all;

entity tb_dadda_and_matrix is

end tb_dadda_and_matrix;

architecture test of tb_dadda_and_matrix is

component dadda_and_matrix is
	port(
		a		:	in	std_logic_vector(7 downto 0);
		b		:	in	std_logic_vector(7 downto 0);
		o		:	out	and_matrix;
		xor_msb	:	out	std_logic;
		and_msb	:	out	std_logic
	);
end component;

signal tb_a 		: std_logic_vector(7 downto 0);
signal tb_b 		: std_logic_vector(7 downto 0);
signal tb_o 		: and_matrix;
signal tb_xor_msb	: std_logic;
signal tb_and_msb	: std_logic;

begin

	DUT : dadda_and_matrix 
		port map(
			a 		=> tb_a,
			b 		=> tb_b,
			o 		=> tb_o,
			xor_msb => tb_xor_msb,
			and_msb	=> tb_and_msb
		);
	
	process 
	begin
		tb_a <= "11000110";
		tb_b <= "00100010";
		wait;
	end process;
end test;








