-- Softmax execution unit.

library ieee;
	use ieee.std_logic_1164.all;
	use ieee.numeric_std.all;

entity softmax_eu is

	port(
		en_clk	: 	in	std_logic;
		clk		:	in	std_logic;
		rst_l	:	in	std_logic;
		en_h	:	in	std_logic;
		
		en_cnt	:	in	std_logic;
		
		d_in_0 	: 	in 	std_logic_vector(7 downto 0);
		d_in_1 	: 	in 	std_logic_vector(7 downto 0);
		d_in_2 	: 	in 	std_logic_vector(7 downto 0);
		d_in_3 	: 	in 	std_logic_vector(7 downto 0);
		d_in_4 	: 	in 	std_logic_vector(7 downto 0);
		d_in_5 	: 	in 	std_logic_vector(7 downto 0);
		d_in_6 	: 	in 	std_logic_vector(7 downto 0);
		d_in_7 	: 	in 	std_logic_vector(7 downto 0);
		d_in_8 	: 	in 	std_logic_vector(7 downto 0);
		d_in_9 	: 	in 	std_logic_vector(7 downto 0);
		
		tc_9	:	out	std_logic;
		two_pow	: 	out std_logic_vector(7 downto 0)
	);
	
end softmax_eu;

architecture structure of softmax_eu is
	
	component zero_mask is
		port(
			d_in_0 	: in 	std_logic_vector(7 downto 0);
			d_in_1 	: in 	std_logic_vector(7 downto 0);
			d_in_2 	: in 	std_logic_vector(7 downto 0);
			d_in_3 	: in 	std_logic_vector(7 downto 0);
			d_in_4 	: in 	std_logic_vector(7 downto 0);
			d_in_5 	: in 	std_logic_vector(7 downto 0);
			d_in_6 	: in 	std_logic_vector(7 downto 0);
			d_in_7 	: in 	std_logic_vector(7 downto 0);
			d_in_8 	: in 	std_logic_vector(7 downto 0);
			d_in_9 	: in 	std_logic_vector(7 downto 0);
			d_out_0	: out 	std_logic_vector(6 downto 0);
			d_out_1	: out 	std_logic_vector(6 downto 0);
			d_out_2	: out 	std_logic_vector(6 downto 0);
			d_out_3	: out 	std_logic_vector(6 downto 0);
			d_out_4	: out 	std_logic_vector(6 downto 0);
			d_out_5	: out 	std_logic_vector(6 downto 0);
			d_out_6	: out 	std_logic_vector(6 downto 0);
			d_out_7	: out 	std_logic_vector(6 downto 0);
			d_out_8	: out 	std_logic_vector(6 downto 0);
			d_out_9	: out 	std_logic_vector(6 downto 0)
		);
	end component;
	
	component max_intf is
		port(
			d_in_0 	: in 	std_logic_vector(6 downto 0);
			d_in_1 	: in 	std_logic_vector(6 downto 0);
			d_in_2 	: in 	std_logic_vector(6 downto 0);
			d_in_3 	: in 	std_logic_vector(6 downto 0);
			d_in_4 	: in 	std_logic_vector(6 downto 0);
			d_in_5 	: in 	std_logic_vector(6 downto 0);
			d_in_6 	: in 	std_logic_vector(6 downto 0);
			d_in_7 	: in 	std_logic_vector(6 downto 0);
			d_in_8 	: in 	std_logic_vector(6 downto 0);
			d_in_9 	: in 	std_logic_vector(6 downto 0);
			
			sel		: in	std_logic_vector(3 downto 0);
			
			d_out 	: out 	std_logic_vector(6 downto 0)
		);
	end component;
	
	component max_func is
		port(
			en_clk	: 	in	std_logic;
			clk		:	in	std_logic;
			rst_l	:	in	std_logic;
			d_in 	: 	in 	std_logic_vector(6 downto 0);
			max_val	:	out	std_logic_vector(6 downto 0)
		);	
	end component;
	
	component exp_func is
		port(
			en_clk		: in	std_logic;
			clk			: in 	std_logic;
			en_h		: in 	std_logic;
			rst_l 		: in 	std_logic;
			d_in 		: in 	std_logic_vector(6 	downto 	0);
			max			: in 	std_logic_vector(6 	downto 	0);
			two_pow		: out 	std_logic_vector(7 	downto 	0)
		);	
	end component;
	
	component counter4b is
		port(
			en_clk	: in	std_logic;
			clk		: in 	std_logic;
			en_h	: in 	std_logic;
			rst_l 	: in 	std_logic;
			d_out 	: inout std_logic_vector(3 downto 0);
			tc_9	: out	std_logic
		);	
	end component;
	
	signal mask_out_0	:	std_logic_vector(6 downto 0);
	signal mask_out_1	:	std_logic_vector(6 downto 0);
	signal mask_out_2	:	std_logic_vector(6 downto 0);
	signal mask_out_3	:	std_logic_vector(6 downto 0);
	signal mask_out_4	:	std_logic_vector(6 downto 0);
	signal mask_out_5	:	std_logic_vector(6 downto 0);
	signal mask_out_6	:	std_logic_vector(6 downto 0);
	signal mask_out_7	:	std_logic_vector(6 downto 0);
	signal mask_out_8	:	std_logic_vector(6 downto 0);
	signal mask_out_9	:	std_logic_vector(6 downto 0);
	
	signal intf_sel		:	std_logic_vector(3 downto 0);
	signal intf_out		:	std_logic_vector(6 downto 0);
	
	signal max_out		:	std_logic_vector(6 downto 0);
	
begin
	
	mask	:	zero_mask	port map(
								d_in_0 	=>	d_in_0,
								d_in_1 	=>	d_in_1,
								d_in_2 	=>	d_in_2,
								d_in_3 	=>	d_in_3,
								d_in_4 	=>	d_in_4,
								d_in_5 	=>	d_in_5,
								d_in_6 	=>	d_in_6,
								d_in_7 	=>	d_in_7,
								d_in_8 	=>	d_in_8,
								d_in_9 	=>	d_in_9,
								d_out_0	=>	mask_out_0,
								d_out_1	=>	mask_out_1,
								d_out_2	=>	mask_out_2,
								d_out_3	=>	mask_out_3,
								d_out_4	=>	mask_out_4,
								d_out_5	=>	mask_out_5,
								d_out_6	=>	mask_out_6,
								d_out_7	=>	mask_out_7,
								d_out_8	=>	mask_out_8,
								d_out_9	=>	mask_out_9
							);
		
	intf_0	:	max_intf	port map(
								d_in_0 	=>	mask_out_0,
								d_in_1 	=>	mask_out_1,
								d_in_2 	=>	mask_out_2,
								d_in_3  =>	mask_out_3,
								d_in_4 	=>	mask_out_4,
								d_in_5 	=>	mask_out_5,
								d_in_6 	=>	mask_out_6,
								d_in_7 	=>	mask_out_7,
								d_in_8 	=>	mask_out_8,
								d_in_9 	=>	mask_out_9,
								sel		=>	intf_sel,
								d_out 	=>	intf_out
							);
	
	max		:	max_func	port map(
								en_clk	=>	en_clk,
								clk		=>	clk,
								rst_l	=>	rst_l,
								d_in 	=>	intf_out,
								max_val	=>	max_out
							);
	
	exp		:	exp_func	port map(
								en_clk	=>	en_clk,
								clk		=>	clk,
								en_h	=>	en_h,
								rst_l 	=>	rst_l,
								d_in 	=>	intf_out,
								max		=>	max_out,
								two_pow	=>	two_pow
							);
	
	cnt		:	counter4b	port map(
								en_clk	=>	en_clk,
								clk		=>	clk,
								en_h	=>	en_cnt,
								rst_l 	=>	rst_l,
								d_out 	=>	intf_sel,
								tc_9	=>	tc_9
							);
	
end structure;