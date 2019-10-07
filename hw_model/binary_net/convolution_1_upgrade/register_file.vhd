-- Register file where activations values are
-- stored.It is composed of 5 row of 84 bit 
-- each, subdivided in a different number of
-- subpages depending on the conv layer.
-- Every clock cycle a single bit is read from
-- each row.
 
library ieee;
	use ieee.std_logic_1164.all;
	use ieee.numeric_std.all;

entity register_file is

	port(
		en_clk	:	in	std_logic;
		clk		: 	in 	std_logic;
		en_0_h	: 	in 	std_logic;
		en_1_h	: 	in 	std_logic;
		en_2_h	: 	in 	std_logic;
		en_3_h	: 	in 	std_logic;
		en_4_h	: 	in 	std_logic;
		rst_l 	: 	in 	std_logic;
		subpage0:	in	std_logic;
		subpage1:	in	std_logic;
		subpage2:	in	std_logic;
		subpage3:	in	std_logic;
		subpage4:	in	std_logic;
		bit_sel	:	in	std_logic_vector(4	downto	0);
		d_in	:	in	std_logic_vector(83 downto	0);
		d_out_0	:	out	std_logic;
		d_out_1	:	out	std_logic;
		d_out_2	:	out	std_logic;
		d_out_3	:	out	std_logic;
		d_out_4	:	out	std_logic
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
	
	component generic_mux2to1 is
		generic(n : integer := 4);
		port(
			sel 	: in 	std_logic;
			d_0 	: in 	std_logic_vector((n-1) downto 0);
			d_1 	: in 	std_logic_vector((n-1) downto 0);
			d_out	: out 	std_logic_vector((n-1) downto 0)
		);
	end component;
	
	component mux32to1 is
		port(
			sel 	: in 	std_logic_vector(4	downto	0);
			d_in 	: in 	std_logic_vector(31 downto 0);
			d_out	: out 	std_logic
		);
	end component;
	
	signal reg_0_out	:	std_logic_vector(83 downto	0);
	signal reg_1_out	:	std_logic_vector(83 downto	0);
	signal reg_2_out	:	std_logic_vector(83 downto	0);
	signal reg_3_out	:	std_logic_vector(83 downto	0);
	signal reg_4_out	:	std_logic_vector(83 downto	0);
	
	signal pg0			:	std_logic_vector(31	downto	0);
	signal pg1			:	std_logic_vector(31	downto	0);
	signal pg2			:	std_logic_vector(31	downto	0);
	signal pg3			:	std_logic_vector(31	downto	0);
	signal pg4			:	std_logic_vector(31	downto	0);
	
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
	
	mux_pg0	:	generic_mux2to1		generic map(
										n => 32
									)
									port map(
										sel 	=>	subpage0,
										d_0 	=>	reg_0_out(31 downto 0),
										d_1 	=>	reg_0_out(63 downto 32),
										d_out	=>	pg0
									);
	
	mux_pg1	:	generic_mux2to1		generic map(
										n => 32
									)
									port map(
										sel 	=>	subpage1,
										d_0 	=>	reg_1_out(31 downto 0),
										d_1 	=>	reg_1_out(63 downto 32),
										d_out	=>	pg1
									);	
	
	mux_pg2	:	generic_mux2to1		generic map(
										n => 32
									)
									port map(
										sel 	=>	subpage2,
										d_0 	=>	reg_2_out(31 downto 0),
										d_1 	=>	reg_2_out(63 downto 32),
										d_out	=>	pg2
									);
									
	mux_pg3	:	generic_mux2to1		generic map(
										n => 32
									)
									port map(
										sel 	=>	subpage3,
										d_0 	=>	reg_3_out(31 downto 0),
										d_1 	=>	reg_3_out(63 downto 32),
										d_out	=>	pg3
									);
	
	mux_pg4	:	generic_mux2to1		generic map(
										n => 32
									)
									port map(
										sel 	=>	subpage4,
										d_0 	=>	reg_4_out(31 downto 0),
										d_1 	=>	reg_4_out(63 downto 32),
										d_out	=>	pg4
									);
									
	mux_bit0:	mux32to1			port map(
										sel 	=>	bit_sel,
										d_in 	=>	pg0,
										d_out	=>	d_out_0
									);
									
	mux_bit1:	mux32to1			port map(
										sel 	=>	bit_sel,
										d_in 	=>	pg1,
										d_out	=>	d_out_1
									);

	mux_bit2:	mux32to1			port map(
										sel 	=>	bit_sel,
										d_in 	=>	pg2,
										d_out	=>	d_out_2
									);

	mux_bit3:	mux32to1			port map(
										sel 	=>	bit_sel,
										d_in 	=>	pg3,
										d_out	=>	d_out_3
									);

	mux_bit4:	mux32to1			port map(
										sel 	=>	bit_sel,
										d_in 	=>	pg4,
										d_out	=>	d_out_4
									);
									
end structure;