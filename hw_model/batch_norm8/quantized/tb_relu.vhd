library ieee;
	use ieee.std_logic_1164.all;
	use ieee.numeric_std.all;

entity tb_relu is

end tb_relu;

architecture test of tb_relu is

component relu_4bit is
	port(
		d_in 	: in 	std_logic_vector(16 downto 0);
		d_out 	: out 	std_logic_vector(2 	downto 0)
		);
end component;

signal	tb_d_in		: 	std_logic_vector(16 downto 0);
signal	tb_d_out	:	std_logic_vector(2 downto 0);

begin

	dut : relu_4bit
		port map(
			d_in	=>	tb_d_in,
			d_out	=>	tb_d_out
		);
	
	process 
	begin
		tb_d_in		<=	"11111110001101000";
		wait for 2 ns;
		tb_d_in		<=	"00000000100110100";
		wait for 2 ns;
		tb_d_in		<=	"00001000100110100";
		wait;
	end process;
	
end test;








