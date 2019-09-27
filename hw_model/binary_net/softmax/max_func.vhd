-- Find maximum from the given inputs.
-- Inputs are provided sequentially.

library ieee;
	use ieee.std_logic_1164.all;
	use ieee.numeric_std.all;

entity max_func is

	port(
		en_clk	: 	in	std_logic;
		clk		:	in	std_logic;
		rst_l	:	in	std_logic;
		d_in 	: 	in 	std_logic_vector(6 downto 0);
		max_val	:	out	std_logic_vector(6 downto 0)
	);
	
end max_func;

architecture structure of max_func is
	
	component	generic_register is
		generic(n : integer := 8);
		port(
			en_clk	: in	std_logic;
			clk		: in 	std_logic;
			en_h	: in 	std_logic;
			rst_l 	: in 	std_logic;
			d_in 	: in 	std_logic_vector((n-1) downto 0);
			d_out 	: out 	std_logic_vector((n-1) downto 0)
		);
	end component;
	
	signal	en_reg_in	:	std_logic;
	signal	reg_in_out	:	std_logic_vector(6 downto 0);
	signal	reg_max_out	:	std_logic_vector(6 downto 0);
	signal	comp_out	:	std_logic;
	
begin
	
	en_reg_in	<=	d_in(6) or d_in(5) or d_in(4) or d_in(3) or d_in(2) or d_in(1) or d_in(0);
	
	reg_in	:	generic_register	generic map(
										n	=>	7
									)
									port map(
										en_clk	=>	en_clk,
										clk		=>	clk,
										en_h	=>	en_reg_in,
										rst_l 	=>	rst_l,
										d_in 	=>	d_in,
										d_out 	=>	reg_in_out
									);
	
	reg_max	:	generic_register	generic map(
										n	=>	7
									)
									port map(
										en_clk	=>	en_clk,
										clk		=>	clk,
										en_h	=>	comp_out,
										rst_l 	=>	rst_l,
										d_in 	=>	reg_in_out,
										d_out 	=>	reg_max_out
									);
									
	comp	:	process(reg_in_out,reg_max_out)
	begin
		if (reg_in_out) > (reg_max_out) then
			comp_out	<=	'1';
		else
			comp_out	<=	'0';
		end if;
	end process;
	
	max_val	<=	reg_max_out;
	
end structure;