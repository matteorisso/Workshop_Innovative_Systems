-- Scratchpad where weigths are stored, each cu_2d 
-- has a w_sp, which is composed of five register 
-- of five elements each.

library ieee;
	use ieee.std_logic_1164.all;
	use ieee.numeric_std.all;

entity w_scratchpad is

	port(
		en_clk	: in	std_logic;
		clk		: in 	std_logic;
		en_0_h	: in 	std_logic;
		en_1_h	: in 	std_logic;
		en_2_h	: in 	std_logic;
		en_3_h	: in 	std_logic;
		en_4_h	: in 	std_logic;
		rst_l 	: in 	std_logic;
		w_in 	: in 	std_logic_vector(4 downto 0);
		w_out_0 : out 	std_logic_vector(4 downto 0);
		w_out_1 : out 	std_logic_vector(4 downto 0);
		w_out_2 : out 	std_logic_vector(4 downto 0);
		w_out_3 : out 	std_logic_vector(4 downto 0);
		w_out_4 : out 	std_logic_vector(4 downto 0)
	);
	
end w_scratchpad;

architecture structure of w_scratchpad is
	
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
										n	=>	5
									)
									port map(
										en_clk	=>	en_clk,
										clk		=>	clk,
										en_h	=>	en_0_h,
										rst_l 	=>	rst_l,
										d_in 	=>	w_in,
										d_out 	=>	w_out_0
									);
	
	reg_1	:	generic_register	generic map(
										n	=>	5
									)
									port map(
										en_clk	=>	en_clk,
										clk		=>	clk,
										en_h	=>	en_1_h,
										rst_l 	=>	rst_l,
										d_in 	=>	w_in,
										d_out 	=>	w_out_1
									);
								
	reg_2	:	generic_register	generic map(
										n	=>	5
									)
									port map(
										en_clk	=>	en_clk,
										clk		=>	clk,
										en_h	=>	en_2_h,
										rst_l 	=>	rst_l,
										d_in 	=>	w_in,
										d_out 	=>	w_out_2
									);
	
	reg_3	:	generic_register	generic map(
										n	=>	5
									)
									port map(
										en_clk	=>	en_clk,
										clk		=>	clk,
										en_h	=>	en_3_h,
										rst_l 	=>	rst_l,
										d_in 	=>	w_in,
										d_out 	=>	w_out_3
									);
	
	reg_4	:	generic_register	generic map(
										n	=>	5
									)
									port map(
										en_clk	=>	en_clk,
										clk		=>	clk,
										en_h	=>	en_4_h,
										rst_l 	=>	rst_l,
										d_in 	=>	w_in,
										d_out 	=>	w_out_4
									);
									
end structure;