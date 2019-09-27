-- Register file where activations values are
-- stored.It is composed of 5 row of 84 bit 
-- each. Each row is divided in three row of
-- 28 elements.
-- Every clock cycle a single bit is read from
-- each row.
 
library ieee;
	use ieee.std_logic_1164.all;
	use ieee.numeric_std.all;

entity register_file is

	port(
		en_clk		:	in	std_logic;
		clk			: 	in 	std_logic;
		en_0_h		: 	in 	std_logic;
		en_1_h		: 	in 	std_logic;
		en_2_h		: 	in 	std_logic;
		en_3_h		: 	in 	std_logic;
		en_4_h		: 	in 	std_logic;
		rst_l 		: 	in 	std_logic;
		bit_sel		:	in	std_logic_vector(4	downto	0);
		d_in		:	in	std_logic_vector(83 downto	0);
		d_out0_0	:	out	std_logic;
		d_out0_1	:	out	std_logic;
		d_out0_2	:	out	std_logic;
		d_out1_0	:	out	std_logic;
		d_out1_1	:	out	std_logic;
		d_out1_2	:	out	std_logic;
		d_out2_0	:	out	std_logic;
		d_out2_1	:	out	std_logic;
		d_out2_2	:	out	std_logic;
		d_out3_0	:	out	std_logic;
		d_out3_1	:	out	std_logic;
		d_out3_2	:	out	std_logic;
		d_out4_0	:	out	std_logic;
		d_out4_1	:	out	std_logic
	);
	
end register_file;

architecture structure of register_file is

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
	
	component mux28to1 is
		port(
			sel 	: in 	std_logic_vector(4	downto	0);
			d_in 	: in 	std_logic_vector(27 downto 	0);
			d_out	: out 	std_logic
		);
	end component;
	
	signal reg_0_out	:	std_logic_vector(83 downto	0);
	signal reg_1_out	:	std_logic_vector(83 downto	0);
	signal reg_2_out	:	std_logic_vector(83 downto	0);
	signal reg_3_out	:	std_logic_vector(83 downto	0);
	signal reg_4_out	:	std_logic_vector(83 downto	0);
	
begin
	
	reg_0	:	generic_register	generic map(
										n => 84
									)
									port map(
										en_clk	=>	en_clk,
										clk		=>	clk,
										en_h	=>	en_0_h,
										rst_l 	=>	rst_l,
										d_in 	=>	d_in,
										d_out 	=>	reg_0_out
									);
									
	reg_1	:	generic_register	generic map(
										n => 84
									)
									port map(
										en_clk	=>	en_clk,
										clk		=>	clk,
										en_h	=>	en_1_h,
										rst_l 	=>	rst_l,
										d_in 	=>	d_in,
										d_out 	=>	reg_1_out
									);								
									
	reg_2	:	generic_register	generic map(
										n => 84
									)
									port map(
										en_clk	=>	en_clk,
										clk		=>	clk,
										en_h	=>	en_2_h,
										rst_l 	=>	rst_l,
										d_in 	=>	d_in,
										d_out 	=>	reg_2_out
									);								
									
	reg_3	:	generic_register	generic map(
										n => 84
									)
									port map(
										en_clk	=>	en_clk,
										clk		=>	clk,
										en_h	=>	en_3_h,
										rst_l 	=>	rst_l,
										d_in 	=>	d_in,
										d_out 	=>	reg_3_out
									);								
									
	reg_4	:	generic_register	generic map(
										n => 84
									)
									port map(
										en_clk	=>	en_clk,
										clk		=>	clk,
										en_h	=>	en_4_h,
										rst_l 	=>	rst_l,
										d_in 	=>	d_in,
										d_out 	=>	reg_4_out
									);								
	
	mux0_0	:	mux28to1			port map(
										sel 	=>	bit_sel,
										d_in 	=>	reg_0_out(27 downto 0),
										d_out	=>	d_out0_0
									);
	
	mux0_1	:	mux28to1			port map(
										sel 	=>	bit_sel,
										d_in 	=>	reg_0_out(55 downto 28),
										d_out	=>	d_out0_1
									);
								
	mux0_2	:	mux28to1			port map(
										sel 	=>	bit_sel,
										d_in 	=>	reg_0_out(83 downto 56),
										d_out	=>	d_out0_2
									);
									
	mux1_0	:	mux28to1			port map(
										sel 	=>	bit_sel,
										d_in 	=>	reg_1_out(27 downto 0),
										d_out	=>	d_out1_0
									);
	
	mux1_1	:	mux28to1			port map(
										sel 	=>	bit_sel,
										d_in 	=>	reg_1_out(55 downto 28),
										d_out	=>	d_out1_1
									);
								
	mux1_2	:	mux28to1			port map(
										sel 	=>	bit_sel,
										d_in 	=>	reg_1_out(83 downto 56),
										d_out	=>	d_out1_2
									);								
									
	mux2_0	:	mux28to1			port map(
										sel 	=>	bit_sel,
										d_in 	=>	reg_2_out(27 downto 0),
										d_out	=>	d_out2_0
									);
	
	mux2_1	:	mux28to1			port map(
										sel 	=>	bit_sel,
										d_in 	=>	reg_2_out(55 downto 28),
										d_out	=>	d_out2_1
									);
								
	mux2_2	:	mux28to1			port map(
										sel 	=>	bit_sel,
										d_in 	=>	reg_2_out(83 downto 56),
										d_out	=>	d_out2_2
									);								
									
	mux3_0	:	mux28to1			port map(
										sel 	=>	bit_sel,
										d_in 	=>	reg_3_out(27 downto 0),
										d_out	=>	d_out3_0
									);
	
	mux3_1	:	mux28to1			port map(
										sel 	=>	bit_sel,
										d_in 	=>	reg_3_out(55 downto 28),
										d_out	=>	d_out3_1
									);
								
	mux3_2	:	mux28to1			port map(
										sel 	=>	bit_sel,
										d_in 	=>	reg_3_out(83 downto 56),
										d_out	=>	d_out3_2
									);								
									
	mux4_0	:	mux28to1			port map(
										sel 	=>	bit_sel,
										d_in 	=>	reg_4_out(27 downto 0),
										d_out	=>	d_out4_0
									);
	
	mux4_1	:	mux28to1			port map(
										sel 	=>	bit_sel,
										d_in 	=>	reg_4_out(55 downto 28),
										d_out	=>	d_out4_1
									);
	
end structure;