-- Fully connected execution unit, it realizes the 
-- operative unit of a 120-->84 fully connected 
-- layer. The operations are performed by 5 cu_2d,
-- which can process 125 input, the 5 not necessary
-- input are in a configuration that lead to 0 output.
-- A 128 bit bus is used.

library ieee;
	use ieee.std_logic_1164.all;
	use ieee.numeric_std.all;

entity fc_eu is

	port(
		en_clk		: 	in	std_logic;
		clk			: 	in 	std_logic;
		rst_l 		: 	in 	std_logic;
		
		en_pipe_h	: 	in	std_logic;
		
		en_sp_0_h	: 	in	std_logic;
		en_sp_1_h	: 	in	std_logic;
		en_sp_2_h	: 	in	std_logic;
		en_sp_3_h	: 	in	std_logic;
		en_sp_4_h	: 	in	std_logic;
		
		sign_a 		: 	in 	std_logic;
		sign_b		: 	in 	std_logic;
		coefficient	: 	in 	std_logic_vector(9 		downto 0);
		
		act_in 		:	in std_logic_vector(119 	downto 0);
		weights		: 	in 	std_logic_vector(119	downto 0);
		act_out		: 	out std_logic
	);
	
end fc_eu;

architecture structure of fc_eu is
	
	component act_scratchpad is
		port(
			en_clk	: in	std_logic;
			clk		: in 	std_logic;
			en_h	: in 	std_logic;
			rst_l 	: in 	std_logic;
			w_in 	: in 	std_logic_vector(24 downto 0);
			w_out	: out 	std_logic_vector(24 downto 0)
		);
	end component;
	
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
	
	component cu_2d is
		port(
			ifmap_0		: in 	std_logic_vector(4 downto 0);
			ifmap_1		: in 	std_logic_vector(4 downto 0);
			ifmap_2		: in 	std_logic_vector(4 downto 0);
			ifmap_3		: in 	std_logic_vector(4 downto 0);
			ifmap_4 	: in 	std_logic_vector(4 downto 0);
			weights_0	: in 	std_logic_vector(4 downto 0);
			weights_1	: in 	std_logic_vector(4 downto 0);
			weights_2	: in 	std_logic_vector(4 downto 0);
			weights_3	: in 	std_logic_vector(4 downto 0);
			weights_4	: in 	std_logic_vector(4 downto 0);
			ofmap 		: out 	std_logic_vector(5 downto 0)
		);
	end component;
	
	component generic_adder is	
		generic(n : integer := 8);
		port(
			a			:	in 	std_logic_vector((n-1) downto 0);
			b 			:	in 	std_logic_vector((n-1) downto 0);
			res			: 	out std_logic_vector((n-1) downto 0)
			);	
	end component;
	
	component bn_unit is
		port(
			en_clk		: 	in	std_logic;
			clk			:	in	std_logic;
			rst_l		:	in	std_logic;
			sign_a 		: 	in 	std_logic;
			sign_b		: 	in 	std_logic;
			conv_out	: 	in 	std_logic_vector(9 downto 0);
			coefficient	: 	in 	std_logic_vector(9 downto 0);
			bn_out 		: 	out std_logic
		);
	end component;
	
	signal act_0_24		:	std_logic_vector(24	downto	0);
	signal act_25_49	:	std_logic_vector(24	downto	0);
	signal act_50_74	:	std_logic_vector(24	downto	0);
	signal act_75_99	:	std_logic_vector(24	downto	0);
	signal act_100_119	:	std_logic_vector(24	downto	0);
	
	signal sp_4_in		:	std_logic_vector(24	downto	0);
	
	signal ofmap_0		:	std_logic_vector(5 	downto 	0);
	signal ofmap_1		:	std_logic_vector(5 	downto 	0);
	signal ofmap_2		:	std_logic_vector(5 	downto 	0);
	signal ofmap_3		:	std_logic_vector(5 	downto 	0);
	signal ofmap_4		:	std_logic_vector(5 	downto 	0);
	
	signal ext_ofmap_0	:	std_logic_vector(6 	downto 	0);
	signal ext_ofmap_1	:	std_logic_vector(6 	downto 	0);
	signal ext_ofmap_2	:	std_logic_vector(6 	downto 	0);
	signal ext_ofmap_3	:	std_logic_vector(6 	downto 	0);
	signal ext_ofmap_4	:	std_logic_vector(6 	downto 	0);
	
	signal out_reg_00	:	std_logic_vector(6 	downto 	0);
	signal out_reg_01	:	std_logic_vector(6 	downto 	0);
	signal out_reg_02	:	std_logic_vector(6 	downto 	0);
	signal out_reg_03	:	std_logic_vector(6 	downto 	0);
	signal out_reg_04	:	std_logic_vector(6 	downto 	0);
	
	signal out_sum_00	:	std_logic_vector(6 	downto 	0);
	signal out_sum_01	:	std_logic_vector(6 	downto 	0);
	
	signal lev_1_ext_0	:	std_logic_vector(7	downto	0);
	signal lev_1_ext_1	:	std_logic_vector(7	downto	0);
	signal lev_1_ext_2	:	std_logic_vector(7	downto	0);
	signal out_reg_10	:	std_logic_vector(7	downto	0);
	signal out_reg_11	:	std_logic_vector(7	downto	0);
	signal out_reg_12	:	std_logic_vector(7	downto	0);
	
	signal out_sum_10	:	std_logic_vector(7	downto	0);
	
	signal lev_2_ext_0	:	std_logic_vector(8	downto	0);
	signal lev_2_ext_1	:	std_logic_vector(8	downto	0);
	signal out_reg_20	:	std_logic_vector(8	downto	0);
	signal out_reg_21	:	std_logic_vector(8	downto	0);
	
	signal out_sum_20	:	std_logic_vector(8	downto	0);
	
	signal fc_out		:	std_logic_vector(9	downto	0);

	
begin
	
	sp_0	:	act_scratchpad		port map(
										en_clk	=>	en_clk,
										clk		=>	clk,
										en_h	=>	en_sp_0_h,
										rst_l 	=>	rst_l,
										w_in 	=>	act_in(24	downto	0),
										w_out	=>	act_0_24
									);
	
	sp_1	:	act_scratchpad		port map(
										en_clk	=>	en_clk,
										clk		=>	clk,
										en_h	=>	en_sp_1_h,
										rst_l 	=>	rst_l,
										w_in 	=>	act_in(49	downto	25),
										w_out	=>	act_25_49
									);
								
	sp_2	:	act_scratchpad		port map(
										en_clk	=>	en_clk,
										clk		=>	clk,
										en_h	=>	en_sp_2_h,
										rst_l 	=>	rst_l,
										w_in 	=>	act_in(74	downto	50),
										w_out	=>	act_50_74
									);							
								
	sp_3	:	act_scratchpad		port map(
										en_clk	=>	en_clk,
										clk		=>	clk,
										en_h	=>	en_sp_3_h,
										rst_l 	=>	rst_l,
										w_in 	=>	act_in(99	downto	75),
										w_out	=>	act_75_99
									);							
								
	sp_4	:	act_scratchpad		port map(
										en_clk	=>	en_clk,
										clk		=>	clk,
										en_h	=>	en_sp_4_h,
										rst_l 	=>	rst_l,
										w_in 	=>	sp_4_in,
										w_out	=>	act_100_119
									);							
								
	sp_4_in(24 downto 20)	<=	(24 downto 20 => '0');							
	sp_4_in(19 downto 0)	<=	act_in(119	downto	100);								
								
	cu_0	:	cu_2d				port map(
										ifmap_0		=>	act_0_24(4	downto	0),
										ifmap_1		=>	act_0_24(9	downto	5),
										ifmap_2		=>	act_0_24(14	downto	10),
										ifmap_3		=>	act_0_24(19	downto	15),
										ifmap_4 	=>	act_0_24(24	downto	20),
										weights_0	=>	weights(4	downto	0),
										weights_1	=>	weights(9	downto	5),
										weights_2	=>	weights(14	downto	10),
										weights_3	=>	weights(19	downto	15),
										weights_4	=>	weights(24	downto	20),
										ofmap 		=>	ofmap_0
									);							
								
	cu_1	:	cu_2d				port map(
										ifmap_0		=>	act_25_49(4		downto	0),
										ifmap_1		=>	act_25_49(9		downto	5),
										ifmap_2		=>	act_25_49(14	downto	10),
										ifmap_3		=>	act_25_49(19	downto	15),
										ifmap_4 	=>	act_25_49(24	downto	20),
										weights_0	=>	weights(29		downto	25),
										weights_1	=>	weights(34		downto	30),
										weights_2	=>	weights(39		downto	35),
										weights_3	=>	weights(44		downto	40),
										weights_4	=>	weights(49		downto	45),
										ofmap 		=>	ofmap_1
									);							
	
	cu_2	:	cu_2d				port map(
										ifmap_0		=>	act_50_74(4		downto	0),
										ifmap_1		=>	act_50_74(9		downto	5),
										ifmap_2		=>	act_50_74(14	downto	10),
										ifmap_3		=>	act_50_74(19	downto	15),
										ifmap_4 	=>	act_50_74(24	downto	20),
										weights_0	=>	weights(54		downto	50),
										weights_1	=>	weights(59		downto	55),
										weights_2	=>	weights(64		downto	60),
										weights_3	=>	weights(69		downto	65),
										weights_4	=>	weights(74		downto	70),
										ofmap 		=>	ofmap_2
									);
	
	cu_3	:	cu_2d				port map(
										ifmap_0		=>	act_75_99(4		downto	0),
										ifmap_1		=>	act_75_99(9		downto	5),
										ifmap_2		=>	act_75_99(14	downto	10),
										ifmap_3		=>	act_75_99(19	downto	15),
										ifmap_4 	=>	act_75_99(24	downto	20),
										weights_0	=>	weights(79		downto	75),
										weights_1	=>	weights(84		downto	80),
										weights_2	=>	weights(89		downto	85),
										weights_3	=>	weights(94		downto	90),
										weights_4	=>	weights(99		downto	95),
										ofmap 		=>	ofmap_3
									);
								
	cu_4	:	cu_2d				port map(
										ifmap_0		=>	act_100_119(4	downto	0),
										ifmap_1		=>	act_100_119(9	downto	5),
										ifmap_2		=>	act_100_119(14	downto	10),
										ifmap_3		=>	act_100_119(19	downto	15),
										ifmap_4 	=>	act_100_119(24	downto	20),
										weights_0	=>	weights(104		downto	100),
										weights_1	=>	weights(109		downto	105),
										weights_2	=>	weights(114		downto	110),
										weights_3	=>	weights(119		downto	115),
										weights_4	=>	"11111",
										ofmap 		=>	ofmap_4
									);							
	
	ext_ofmap_0	<=	'0'&ofmap_0;
	
	reg_00	:	generic_register	generic map(
										n	=>	7
									)	
									port map(
										en_clk	=>	en_clk,
										clk		=>	clk,
										en_h	=>	en_pipe_h,
										rst_l 	=>	rst_l,
										d_in 	=>	ext_ofmap_0,
										d_out 	=>	out_reg_00
									);
	
	ext_ofmap_1	<=	'0'&ofmap_1;
	
	reg_01	:	generic_register	generic map(
										n	=>	7
									)	
									port map(
										en_clk	=>	en_clk,
										clk		=>	clk,
										en_h	=>	en_pipe_h,
										rst_l 	=>	rst_l,
										d_in 	=>	ext_ofmap_1,
										d_out 	=>	out_reg_01
									);

	ext_ofmap_2	<=	'0'&ofmap_2;
	
	reg_02	:	generic_register	generic map(
										n	=>	7
									)	
									port map(
										en_clk	=>	en_clk,
										clk		=>	clk,
										en_h	=>	en_pipe_h,
										rst_l 	=>	rst_l,
										d_in 	=>	ext_ofmap_2,
										d_out 	=>	out_reg_02
									);

	ext_ofmap_3	<=	'0'&ofmap_3;
	
	reg_03	:	generic_register	generic map(
										n	=>	7
									)	
									port map(
										en_clk	=>	en_clk,
										clk		=>	clk,
										en_h	=>	en_pipe_h,
										rst_l 	=>	rst_l,
										d_in 	=>	ext_ofmap_3,
										d_out 	=>	out_reg_03
									);

	ext_ofmap_4	<=	'0'&ofmap_4;
	
	reg_04	:	generic_register	generic map(
										n	=>	7
									)	
									port map(
										en_clk	=>	en_clk,
										clk		=>	clk,
										en_h	=>	en_pipe_h,
										rst_l 	=>	rst_l,
										d_in 	=>	ext_ofmap_4,
										d_out 	=>	out_reg_04
									);

	add_00	:	generic_adder		generic map(
										n	=>	7
									)
									port map(
										a		=>	out_reg_00,
										b 		=>	out_reg_01,
										res		=>	out_sum_00
									);

	add_01	:	generic_adder		generic map(
										n	=>	7
									)
									port map(
										a		=>	out_reg_02,
										b 		=>	out_reg_03,
										res		=>	out_sum_01
									);
	
	lev_1_ext_0	<=	'0'&out_sum_00;
	
	reg_10	:	generic_register	generic map(
										n	=>	8
									)	
									port map(
										en_clk	=>	en_clk,
										clk		=>	clk,
										en_h	=>	en_pipe_h,
										rst_l 	=>	rst_l,
										d_in 	=>	lev_1_ext_0,
										d_out 	=>	out_reg_10
									);

	lev_1_ext_1	<=	'0'&out_sum_01;
	
	reg_11	:	generic_register	generic map(
										n	=>	8
									)	
									port map(
										en_clk	=>	en_clk,
										clk		=>	clk,
										en_h	=>	en_pipe_h,
										rst_l 	=>	rst_l,
										d_in 	=>	lev_1_ext_1,
										d_out 	=>	out_reg_11
									);

	lev_1_ext_2	<=	'0'&out_reg_04;
	
	reg_12	:	generic_register	generic map(
										n	=>	8
									)	
									port map(
										en_clk	=>	en_clk,
										clk		=>	clk,
										en_h	=>	en_pipe_h,
										rst_l 	=>	rst_l,
										d_in 	=>	lev_1_ext_2,
										d_out 	=>	out_reg_12
									);

	add_10	:	generic_adder		generic map(
										n	=>	8
									)
									port map(
										a		=>	out_reg_10,
										b 		=>	out_reg_11,
										res		=>	out_sum_10
									);

	lev_2_ext_0	<=	'0'&out_sum_10;
	
	reg_20	:	generic_register	generic map(
										n	=>	9
									)	
									port map(
										en_clk	=>	en_clk,
										clk		=>	clk,
										en_h	=>	en_pipe_h,
										rst_l 	=>	rst_l,
										d_in 	=>	lev_2_ext_0,
										d_out 	=>	out_reg_20
									);

	lev_2_ext_1	<=	'0'&out_reg_12;
	
	reg_21	:	generic_register	generic map(
										n	=>	9
									)	
									port map(
										en_clk	=>	en_clk,
										clk		=>	clk,
										en_h	=>	en_pipe_h,
										rst_l 	=>	rst_l,
										d_in 	=>	lev_2_ext_1,
										d_out 	=>	out_reg_21
									);
	
	add_20	:	generic_adder		generic map(
										n	=>	9
									)
									port map(
										a		=>	out_reg_20,
										b 		=>	out_reg_21,
										res		=>	out_sum_20
									);
	
	fc_out	<=	'0'&out_sum_20;
	
	bn		:	bn_unit				port map(
										en_clk		=>	en_clk,
										clk			=>	clk,
										rst_l		=>	rst_l,
										sign_a 		=>	sign_a,
										sign_b		=>	sign_b,
										conv_out	=>	fc_out,
										coefficient	=>	coefficient,
										bn_out 		=>	act_out
									);
	
end structure;