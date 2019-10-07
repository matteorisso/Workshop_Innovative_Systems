-- Interface between the pooling unit and the register file
-- containing input feature map.
-- The interface is made of 14 sipo register.

library ieee;
	use ieee.std_logic_1164.all;
	use ieee.numeric_std.all;

entity rf_interface is

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

end rf_interface;

architecture behavior of rf_interface is
	
	component sipo_reg is
		port(
			en_clk	: in	std_logic;
			clk		: in 	std_logic;
			en_h	: in 	std_logic;
			rst_l 	: in 	std_logic;
			d_in 	: in 	std_logic;
			d_out 	: out 	std_logic_vector(1 downto 0)
		);	
	end component;
	
begin
	
	sipo0_0	:	sipo_reg	port map(
								en_clk	=>	en_clk,
								clk		=>	clk,
								en_h	=>	en_h,
								rst_l 	=>	rst_l,
								d_in 	=>	d_in0_0,
								d_out 	=>	d_out0_0
							);
	
	sipo0_1	:	sipo_reg	port map(
								en_clk	=>	en_clk,
								clk		=>	clk,
								en_h	=>	en_h,
								rst_l 	=>	rst_l,
								d_in 	=>	d_in0_1,
								d_out 	=>	d_out0_1
							);
	
	sipo1_0	:	sipo_reg	port map(
								en_clk	=>	en_clk,
								clk		=>	clk,
								en_h	=>	en_h,
								rst_l 	=>	rst_l,
								d_in 	=>	d_in1_0,
								d_out 	=>	d_out1_0
							);
	
	sipo1_1	:	sipo_reg	port map(
								en_clk	=>	en_clk,
								clk		=>	clk,
								en_h	=>	en_h,
								rst_l 	=>	rst_l,
								d_in 	=>	d_in1_1,
								d_out 	=>	d_out1_1
							);
	
	sipo2_0	:	sipo_reg	port map(
								en_clk	=>	en_clk,
								clk		=>	clk,
								en_h	=>	en_h,
								rst_l 	=>	rst_l,
								d_in 	=>	d_in2_0,
								d_out 	=>	d_out2_0
							);
	
	sipo2_1	:	sipo_reg	port map(
								en_clk	=>	en_clk,
								clk		=>	clk,
								en_h	=>	en_h,
								rst_l 	=>	rst_l,
								d_in 	=>	d_in2_1,
								d_out 	=>	d_out2_1
							);
	
	sipo3_0	:	sipo_reg	port map(
								en_clk	=>	en_clk,
								clk		=>	clk,
								en_h	=>	en_h,
								rst_l 	=>	rst_l,
								d_in 	=>	d_in3_0,
								d_out 	=>	d_out3_0
							);
	
	sipo3_1	:	sipo_reg	port map(
								en_clk	=>	en_clk,
								clk		=>	clk,
								en_h	=>	en_h,
								rst_l 	=>	rst_l,
								d_in 	=>	d_in3_1,
								d_out 	=>	d_out3_1
							);
	
	sipo4_0	:	sipo_reg	port map(
								en_clk	=>	en_clk,
								clk		=>	clk,
								en_h	=>	en_h,
								rst_l 	=>	rst_l,
								d_in 	=>	d_in4_0,
								d_out 	=>	d_out4_0
							);
	
	sipo4_1	:	sipo_reg	port map(
								en_clk	=>	en_clk,
								clk		=>	clk,
								en_h	=>	en_h,
								rst_l 	=>	rst_l,
								d_in 	=>	d_in4_1,
								d_out 	=>	d_out4_1
							);
	
	sipo5_0	:	sipo_reg	port map(
								en_clk	=>	en_clk,
								clk		=>	clk,
								en_h	=>	en_h,
								rst_l 	=>	rst_l,
								d_in 	=>	d_in5_0,
								d_out 	=>	d_out5_0
							);
	
	sipo5_1	:	sipo_reg	port map(
								en_clk	=>	en_clk,
								clk		=>	clk,
								en_h	=>	en_h,
								rst_l 	=>	rst_l,
								d_in 	=>	d_in5_1,
								d_out 	=>	d_out5_1
							);
	
	sipo6_0	:	sipo_reg	port map(
								en_clk	=>	en_clk,
								clk		=>	clk,
								en_h	=>	en_h,
								rst_l 	=>	rst_l,
								d_in 	=>	d_in6_0,
								d_out 	=>	d_out6_0
							);
	
	sipo6_1	:	sipo_reg	port map(
								en_clk	=>	en_clk,
								clk		=>	clk,
								en_h	=>	en_h,
								rst_l 	=>	rst_l,
								d_in 	=>	d_in6_1,
								d_out 	=>	d_out6_1
							);
	
end behavior;