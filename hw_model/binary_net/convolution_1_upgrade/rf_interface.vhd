-- Interface between the cu_2d and the register file
-- containing input feature map.
-- The interface is made of 5 sipo register and 5
-- mux 5 to 1.
-- The purpose of mux is to have data reuse of input 
-- rows.

library ieee;
	use ieee.std_logic_1164.all;
	use ieee.numeric_std.all;

entity rf_interface is

	port(
		en_clk	: in	std_logic;
		clk		: in 	std_logic;
		en_h	: in 	std_logic;
		rst_l 	: in 	std_logic;
		mux0_sel: in	std_logic_vector(2 downto 0);
		mux1_sel: in	std_logic_vector(2 downto 0);
		mux2_sel: in	std_logic_vector(2 downto 0);
		mux3_sel: in	std_logic_vector(2 downto 0);
		mux4_sel: in	std_logic_vector(2 downto 0);
		d_in 	: in 	std_logic_vector(4 downto 0);
		d_out_0	: out 	std_logic_vector(4 downto 0);
		d_out_1	: out 	std_logic_vector(4 downto 0);
		d_out_2	: out 	std_logic_vector(4 downto 0);
		d_out_3	: out 	std_logic_vector(4 downto 0);
		d_out_4	: out 	std_logic_vector(4 downto 0)
	);
	
end rf_interface;

architecture structure of rf_interface is
	
	component sipo_reg is
		port(
			en_clk	: in	std_logic;
			clk		: in 	std_logic;
			en_h	: in 	std_logic;
			rst_l 	: in 	std_logic;
			d_in 	: in 	std_logic;
			d_out 	: out 	std_logic_vector(4 downto 0)
		);
	end component;
	
	component generic_mux5to1 is
		generic(n : integer := 4);
		port(
			sel 	: in 	std_logic_vector(2		downto	0);
			d_0 	: in 	std_logic_vector((n-1)	downto	0);
			d_1 	: in 	std_logic_vector((n-1)	downto	0);
			d_2 	: in 	std_logic_vector((n-1)	downto	0);
			d_3 	: in 	std_logic_vector((n-1)	downto	0);
			d_4 	: in 	std_logic_vector((n-1)	downto	0);
			d_out	: out 	std_logic_vector((n-1)	downto	0)
		);
	end component;
	
	signal o_sipo_0	:	std_logic_vector(4 downto 0);
	signal o_sipo_1	:	std_logic_vector(4 downto 0);
	signal o_sipo_2	:	std_logic_vector(4 downto 0);
	signal o_sipo_3	:	std_logic_vector(4 downto 0);
	signal o_sipo_4	:	std_logic_vector(4 downto 0);
	
begin
	
	sipo_0	:	sipo_reg	port map(
								en_clk	=>	en_clk,
								clk		=>	clk,
								en_h	=>	en_h,
								rst_l 	=>	rst_l,
								d_in 	=>	d_in(0),
								d_out 	=>	o_sipo_0
							);
	
	sipo_1	:	sipo_reg	port map(
								en_clk	=>	en_clk,
								clk		=>	clk,
								en_h	=>	en_h,
								rst_l 	=>	rst_l,
								d_in 	=>	d_in(1),
								d_out 	=>	o_sipo_1
							);
	
	sipo_2	:	sipo_reg	port map(
								en_clk	=>	en_clk,
								clk		=>	clk,
								en_h	=>	en_h,
								rst_l 	=>	rst_l,
								d_in 	=>	d_in(2),
								d_out 	=>	o_sipo_2
							);
	
	sipo_3	:	sipo_reg	port map(
								en_clk	=>	en_clk,
								clk		=>	clk,
								en_h	=>	en_h,
								rst_l 	=>	rst_l,
								d_in 	=>	d_in(3),
								d_out 	=>	o_sipo_3
							);
	
	sipo_4	:	sipo_reg	port map(
								en_clk	=>	en_clk,
								clk		=>	clk,
								en_h	=>	en_h,
								rst_l 	=>	rst_l,
								d_in 	=>	d_in(4),
								d_out 	=>	o_sipo_4
							);
	
	mux_0	:	generic_mux5to1	generic map(
									n	=>	5
								)
								port map(
									sel 	=>	mux0_sel,
									d_0 	=>	o_sipo_0,
									d_1 	=>	o_sipo_1,
									d_2 	=>	o_sipo_2,
									d_3 	=>	o_sipo_3,
									d_4 	=>	o_sipo_4,
									d_out	=>	d_out_0
								);
	
	mux_1	:	generic_mux5to1	generic map(
									n	=>	5
								)
								port map(
									sel 	=>	mux1_sel,
									d_0 	=>	o_sipo_0,
									d_1 	=>	o_sipo_1,
									d_2 	=>	o_sipo_2,
									d_3 	=>	o_sipo_3,
									d_4 	=>	o_sipo_4,
									d_out	=>	d_out_1
								);
	
	mux_2	:	generic_mux5to1	generic map(
									n	=>	5
								)
								port map(
									sel 	=>	mux2_sel,
									d_0 	=>	o_sipo_0,
									d_1 	=>	o_sipo_1,
									d_2 	=>	o_sipo_2,
									d_3 	=>	o_sipo_3,
									d_4 	=>	o_sipo_4,
									d_out	=>	d_out_2
								);
	
	mux_3	:	generic_mux5to1	generic map(
									n	=>	5
								)
								port map(
									sel 	=>	mux3_sel,
									d_0 	=>	o_sipo_0,
									d_1 	=>	o_sipo_1,
									d_2 	=>	o_sipo_2,
									d_3 	=>	o_sipo_3,
									d_4 	=>	o_sipo_4,
									d_out	=>	d_out_3
								);
	
	mux_4	:	generic_mux5to1	generic map(
									n	=>	5
								)
								port map(
									sel 	=>	mux4_sel,
									d_0 	=>	o_sipo_0,
									d_1 	=>	o_sipo_1,
									d_2 	=>	o_sipo_2,
									d_3 	=>	o_sipo_3,
									d_4 	=>	o_sipo_4,
									d_out	=>	d_out_4
								);
	
end structure;