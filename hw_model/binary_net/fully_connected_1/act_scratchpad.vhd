-- Scratchpad where activations are stored, each cu_2d 
-- has a act_sp, which is composed of five register 
-- of five elements each.

library ieee;
	use ieee.std_logic_1164.all;
	use ieee.numeric_std.all;

entity act_scratchpad is

	port(
		en_clk	: in	std_logic;
		clk		: in 	std_logic;
		en_h	: in 	std_logic;
		rst_l 	: in 	std_logic;
		w_in 	: in 	std_logic_vector(24 downto 0);
		w_out	: out 	std_logic_vector(24 downto 0)
	);
	
end act_scratchpad;

architecture structure of act_scratchpad is
	
	component generic_register is
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
	
begin

	reg_0	:	generic_register	generic map(
										n	=>	25
									)
									port map(
										en_clk	=>	en_clk,
										clk		=>	clk,
										en_h	=>	en_h,
										rst_l 	=>	rst_l,
										d_in 	=>	w_in,
										d_out 	=>	w_out
									);
									
end structure;