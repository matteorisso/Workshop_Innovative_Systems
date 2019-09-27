library ieee;
	use ieee.std_logic_1164.all;
	use ieee.numeric_std.all;
	
entity tb_popcount is

end tb_popcount;

architecture test of tb_popcount is

component popcount is
	port(
		d_in 	: in 	std_logic_vector(24 downto 0);
		d_out 	: out 	std_logic_vector(5 downto 0)
	);
end component;


signal	tb_d_in		:	std_logic_vector(24	downto 0);
signal	tb_d_out	:	std_logic_vector(5	downto 0);

begin

	dut : popcount
		port map(
			d_in  => tb_d_in,
			d_out => tb_d_out
		);
	
	
	process 
	begin
		for i in 0 to 33554431 loop
			tb_d_in	<= std_logic_vector(to_signed(i, tb_d_in'length));
		wait for 1 ps;
		end loop;
		wait;
	end process;
	
end test;