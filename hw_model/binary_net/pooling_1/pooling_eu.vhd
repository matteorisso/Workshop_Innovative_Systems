-- Pooling execution unit

library ieee;
	use ieee.std_logic_1164.all;
	use ieee.numeric_std.all;

entity pooling_eu is

	port(
		en_clk		:	in	std_logic;
		clk			:  	in 	std_logic;
		rst_l 		:  	in 	std_logic;
		
		en_cnt5_h	: 	in	std_logic;
		
		en_rfint_h	:	in 	std_logic;
		
		rf_en_0_h	: 	in 	std_logic;
		rf_en_1_h	: 	in 	std_logic;
		rf_en_2_h	: 	in 	std_logic;
		rf_en_3_h	: 	in 	std_logic;
		rf_en_4_h	: 	in 	std_logic;
		rf_in		:	in	std_logic_vector(83 downto	0);
		
		tc_27		:  	out	std_logic;
		d_out 		:  	out	std_logic_vector(6	downto 	0)
	);
	
end pooling_eu;

architecture structure of pooling_eu is
	
	component pooling_unit is
		port(
			x 		: in 	std_logic_vector(6 downto 0);
			y		: in 	std_logic_vector(6 downto 0);
			z 		: in 	std_logic_vector(6 downto 0);
			w		: in 	std_logic_vector(6 downto 0);
			d_out 	: out 	std_logic_vector(6 downto 0)
		);	
	end component;
	
	component register_file is
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
	end component;
	
	component rf_interface is
		port(
			en_clk		: in	std_logic;
			clk			: in 	std_logic;
			en_h		: in 	std_logic;
			rst_l 		: in 	std_logic;
			
			d_in0_0		: in 	std_logic;
			d_in0_1		: in 	std_logic;
			d_in1_0		: in 	std_logic;
			d_in1_1		: in 	std_logic;
			d_in2_0		: in 	std_logic;
			d_in2_1		: in 	std_logic;
			d_in3_0		: in 	std_logic;
			d_in3_1		: in 	std_logic;
			d_in4_0		: in 	std_logic;
			d_in4_1		: in 	std_logic;
			d_in5_0		: in 	std_logic;
			d_in5_1		: in 	std_logic;
			d_in6_0		: in 	std_logic;
			d_in6_1		: in 	std_logic;
			d_out0_0	: out 	std_logic_vector(1	downto	0);
			d_out0_1	: out 	std_logic_vector(1	downto	0);
			d_out1_0	: out 	std_logic_vector(1	downto	0);
			d_out1_1	: out 	std_logic_vector(1	downto	0);
			d_out2_0	: out 	std_logic_vector(1	downto	0);
			d_out2_1	: out 	std_logic_vector(1	downto	0);
			d_out3_0	: out 	std_logic_vector(1	downto	0);
			d_out3_1	: out 	std_logic_vector(1	downto	0);
			d_out4_0	: out 	std_logic_vector(1	downto	0);
			d_out4_1	: out 	std_logic_vector(1	downto	0);
			d_out5_0	: out 	std_logic_vector(1	downto	0);
			d_out5_1	: out 	std_logic_vector(1	downto	0);
			d_out6_0	: out 	std_logic_vector(1	downto	0);
			d_out6_1	: out 	std_logic_vector(1	downto	0)
		);
	end component;
	
	component counter5b is
		port(
			en_clk	: in	std_logic;
			clk		: in 	std_logic;
			en_h	: in 	std_logic;
			rst_l 	: in 	std_logic;
			d_out 	: inout std_logic_vector(4 downto 0);
			tc_27	: out	std_logic
		);
	end component;
	
	signal cnt5_out		:	std_logic_vector(4 downto 0);
	
	signal	d_out0_0	:	std_logic;
	signal	d_out0_1	:	std_logic;
	signal	d_out0_2	:	std_logic;
	signal	d_out1_0	:	std_logic;
	signal	d_out1_1	:	std_logic;
	signal	d_out1_2	:	std_logic;
	signal	d_out2_0	:	std_logic;
	signal	d_out2_1	:	std_logic;
	signal	d_out2_2	:	std_logic;
	signal	d_out3_0	:	std_logic;
	signal	d_out3_1	:	std_logic;
	signal	d_out3_2	:	std_logic;
	signal	d_out4_0	:	std_logic;
	signal	d_out4_1	:	std_logic;
	
	signal	d_outntf0_0	:	std_logic_vector(1	downto	0);
	signal	d_outntf0_1	:	std_logic_vector(1	downto	0);
	signal	d_outntf1_0	:	std_logic_vector(1	downto	0);
	signal	d_outntf1_1	:	std_logic_vector(1	downto	0);
	signal	d_outntf2_0	:	std_logic_vector(1	downto	0);
	signal	d_outntf2_1	:	std_logic_vector(1	downto	0);
	signal	d_outntf3_0	:	std_logic_vector(1	downto	0);
	signal	d_outntf3_1	:	std_logic_vector(1	downto	0);
	signal	d_outntf4_0	:	std_logic_vector(1	downto	0);
	signal	d_outntf4_1	:	std_logic_vector(1	downto	0);
	signal	d_outntf5_0	:	std_logic_vector(1	downto	0);
	signal	d_outntf5_1	:	std_logic_vector(1	downto	0);
	signal	d_outntf6_0	:	std_logic_vector(1	downto	0);
	signal	d_outntf6_1	:	std_logic_vector(1	downto	0);
	
	signal x_in			:	std_logic_vector(6	downto	0);
	signal y_in			:	std_logic_vector(6	downto	0);
	signal z_in			:	std_logic_vector(6	downto	0);
	signal w_in			:	std_logic_vector(6	downto	0);
	
begin
	
	rf		:	register_file	port map(
									en_clk		=>	en_clk,
									clk			=>	clk,
									en_0_h		=>	rf_en_0_h,
									en_1_h		=>	rf_en_1_h,
									en_2_h		=>	rf_en_2_h,
									en_3_h		=>	rf_en_3_h,
									en_4_h		=>	rf_en_4_h,
									rst_l 		=>	rst_l,
									bit_sel		=>	cnt5_out,
									d_in		=>	rf_in,
									d_out0_0	=>	d_out0_0,
									d_out0_1	=>	d_out0_1,
									d_out0_2	=>	d_out0_2,
									d_out1_0	=>	d_out1_0,
									d_out1_1	=>	d_out1_1,
									d_out1_2	=>	d_out1_2,
									d_out2_0	=>	d_out2_0,
									d_out2_1	=>	d_out2_1,
									d_out2_2	=>	d_out2_2,
									d_out3_0	=>	d_out3_0,
									d_out3_1	=>	d_out3_1,
									d_out3_2	=>	d_out3_2,
									d_out4_0	=>	d_out4_0,
									d_out4_1	=>	d_out4_1
								);
	
	cnt		:	counter5b		port map(
									en_clk	=>	en_clk,
									clk		=>	clk,
									en_h	=>	en_cnt5_h,
									rst_l 	=>	rst_l,
									d_out 	=>	cnt5_out,
									tc_27	=>	tc_27
								);
	
	rf_int	:	rf_interface	port map(
									en_clk		=>	en_clk,
									clk			=>	clk,
									en_h		=>	en_rfint_h,
									rst_l 		=>	rst_l,
									d_in0_0		=>	d_out0_0,
									d_in0_1		=>	d_out0_1,
									d_in1_0		=>	d_out1_0,
									d_in1_1		=>	d_out1_1,
									d_in2_0		=>	d_out2_0,
									d_in2_1		=>	d_out2_1,
									d_in3_0		=>	d_out3_0,
									d_in3_1		=>	d_out3_1,
									d_in4_0		=>	d_out4_0,
									d_in4_1		=>	d_out4_1,
									d_in5_0		=>	d_out0_2,
									d_in5_1		=>	d_out1_2,
									d_in6_0		=>	d_out2_2,
									d_in6_1		=>	d_out3_2,
									d_out0_0	=>	d_outntf0_0,
									d_out0_1	=>	d_outntf0_1,
									d_out1_0	=>	d_outntf1_0,
									d_out1_1	=>	d_outntf1_1,
									d_out2_0	=>	d_outntf2_0,
									d_out2_1	=>	d_outntf2_1,
									d_out3_0	=>	d_outntf3_0,
									d_out3_1	=>	d_outntf3_1,
									d_out4_0	=>	d_outntf4_0,
									d_out4_1	=>	d_outntf4_1,
									d_out5_0	=>	d_outntf5_0,
									d_out5_1	=>	d_outntf5_1,
									d_out6_0	=>	d_outntf6_0,
									d_out6_1	=>	d_outntf6_1
								);
	
	x_in	<=	d_outntf0_0(1)&d_outntf1_0(1)&d_outntf2_0(1)&d_outntf3_0(1)&d_outntf4_0(1)&d_outntf5_0(1)&d_outntf6_0(1);
	y_in	<=	d_outntf0_0(0)&d_outntf1_0(0)&d_outntf2_0(0)&d_outntf3_0(0)&d_outntf4_0(0)&d_outntf5_0(0)&d_outntf6_0(0);
	z_in	<=	d_outntf0_1(1)&d_outntf1_1(1)&d_outntf2_1(1)&d_outntf3_1(1)&d_outntf4_1(1)&d_outntf5_1(1)&d_outntf6_1(1);
	w_in	<=	d_outntf0_1(0)&d_outntf1_1(0)&d_outntf2_1(0)&d_outntf3_1(0)&d_outntf4_1(0)&d_outntf5_1(0)&d_outntf6_1(0);
	
	pool	:	pooling_unit	port map(
									x 		=>	x_in,
									y		=>	y_in,
									z 		=>	z_in,
									w		=>	w_in,
									d_out 	=>	d_out
								);

end structure;