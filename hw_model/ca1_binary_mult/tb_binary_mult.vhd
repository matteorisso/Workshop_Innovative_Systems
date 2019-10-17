library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity tb_binary_mult is

end tb_binary_mult;

architecture test of tb_binary_mult is

component binary_mult is

	generic(
		n	:	integer	:=	4
		);
	port(
		act 	:	in	signed(n-1	downto	0);
		weight	:	in 	std_logic;
		d_out	: 	out signed(n	downto 	0)
	);
	
end component;

signal tb_act 		: signed(3 	downto 0);
signal tb_d_out 	: signed(3	downto 0);
signal tb_weight	: std_logic;

begin

	DUT : binary_mult
		generic map(
			n	=> 4
		)
		port map(
			act 	=> tb_act,
			weight	=> tb_weight,
			d_out 	=> tb_d_out
		);
	
	process 
	begin
		tb_act		<= "1100";
		tb_weight	<= '0';
		wait for 2ns;
		tb_act		<= "1100";
		tb_weight	<= '1';
		wait;
	end process;
	
end test;







