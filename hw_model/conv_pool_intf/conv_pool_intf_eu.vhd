library ieee;
	use ieee.std_logic_1164.all;
	use ieee.numeric_std.all;

entity conv_pool_intf_eu is

	port(
		d_in 		: in 	std_logic_vector(63 downto 0);
		en_clk		: in	std_logic;
		clk			: in 	std_logic;
		en_cnt_h	: in 	std_logic;
		en_tff_h	: in 	std_logic;
		en_i_h		: in 	std_logic;
		en_k_h		: in 	std_logic;
		rst_l 		: in 	std_logic;
		evenl_oddh 	: in 	std_logic;
		toggle		: in	std_logic;
		mux_sel		: in	std_logic;
		inc			: in 	std_logic_vector(1 	downto 0);
		d_out 		: out 	std_logic_vector(31 downto 0);
		i 			: out 	std_logic_vector(9 	downto 0);
		k	 		: out 	std_logic_vector(9 	downto 0);
		pl_nh		: out	std_logic;
		tc_6		: out	std_logic
	);
	
end conv_pool_intf_eu;

architecture structure of conv_pool_intf_eu is
	
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

	component counter3b is
		port(
			en_clk	: in	std_logic;
			clk		: in 	std_logic;
			en_h	: in 	std_logic;
			rst_l 	: in 	std_logic;
			tc_6	: out	std_logic
		);
	end component;
	
	component adress_alu is
		port(
			en_clk		: in	std_logic;
			clk			: in 	std_logic;
			en_i_h		: in 	std_logic;
			en_k_h		: in 	std_logic;
			rst_l 		: in 	std_logic;
			evenl_oddh 	: in 	std_logic;
			inc			: in 	std_logic_vector(1 downto 0);
			i 			: inout std_logic_vector(9 downto 0);
			k	 		: inout std_logic_vector(9 downto 0)
		);
	end component;
	
	signal	in_00	:	std_logic_vector(3	downto	0);
	signal	in_01	:	std_logic_vector(3	downto	0);
	signal	in_02	:	std_logic_vector(3	downto	0);
	signal	in_03	:	std_logic_vector(3	downto	0);
	signal	in_10	:	std_logic_vector(3	downto	0);
	signal	in_11	:	std_logic_vector(3	downto	0);
	signal	in_12	:	std_logic_vector(3	downto	0);
	signal	in_13	:	std_logic_vector(3	downto	0);
	signal	in_20	:	std_logic_vector(3	downto	0);
	signal	in_21	:	std_logic_vector(3	downto	0);
	signal	in_22	:	std_logic_vector(3	downto	0);
	signal	in_23	:	std_logic_vector(3	downto	0);
	signal	in_30	:	std_logic_vector(3	downto	0);
	signal	in_31	:	std_logic_vector(3	downto	0);
	signal	in_32	:	std_logic_vector(3	downto	0);
	signal	in_33	:	std_logic_vector(3	downto	0);
	
	
	signal	in_a0	:	std_logic_vector(7	downto	0);
	signal	in_b0	:	std_logic_vector(7	downto	0);
	signal	in_c0	:	std_logic_vector(7	downto	0);
	signal	in_d0	:	std_logic_vector(7	downto	0);
	signal	in_a1	:	std_logic_vector(7	downto	0);
	signal	in_b1	:	std_logic_vector(7	downto	0);
	signal	in_c1	:	std_logic_vector(7	downto	0);
	signal	in_d1	:	std_logic_vector(7	downto	0);	
	signal	in_a	:	std_logic_vector(7	downto	0);
	signal	in_b	:	std_logic_vector(7	downto	0);
	signal	in_c	:	std_logic_vector(7	downto	0);
	signal	in_d	:	std_logic_vector(7	downto	0);
	
	signal xor_out	:	std_logic_vector(0	downto	0);
	signal t_ff_out	:	std_logic_vector(0	downto	0);
	
	signal pnt_i	:	std_logic;
	signal pnt_k	:	std_logic;
	
begin
	
	in_00	<=	d_in(3	downto	0);
	in_01	<=	d_in(7	downto	4);
	in_02	<=	d_in(11	downto	8);
	in_03	<=	d_in(15	downto	12);
	in_10	<=	d_in(19	downto	16);
	in_11	<=	d_in(23	downto	20);
	in_12	<=	d_in(27	downto	24);
	in_13	<=	d_in(31	downto	28);
	in_20	<=	d_in(35	downto	32);
	in_21	<=	d_in(39	downto	36);
	in_22	<=	d_in(43	downto	40);
	in_23	<=	d_in(47	downto	44);
	in_30	<=	d_in(51	downto	48);
	in_31	<=	d_in(55	downto	52);
	in_32	<=	d_in(59	downto	56);
	in_33	<=	d_in(63	downto	60);
	
	in_a0	<=	in_00&in_02;
	in_b0	<=	in_01&in_03;
	in_c0	<=	in_20&in_22;
	in_d0	<=	in_21&in_23;
	in_a1	<=	in_10&in_12;
	in_b1	<=	in_11&in_13;
	in_c1	<=	in_30&in_32;
	in_d1	<=	in_31&in_33;
	
	mux_a	:	generic_mux2to1		generic map(
										n	=>	8	
									)
									port map(
										sel 	=>	mux_sel,
										d_0 	=>	in_a0,
										d_1 	=>	in_a1,
										d_out	=>	in_a
									);
									
	mux_b	:	generic_mux2to1		generic map(
										n	=>	8	
									)
									port map(
										sel 	=>	mux_sel,
										d_0 	=>	in_b0,
										d_1 	=>	in_b1,
										d_out	=>	in_b
									);
										
	mux_c	:	generic_mux2to1		generic map(
										n	=>	8	
									)
									port map(
										sel 	=>	mux_sel,
										d_0 	=>	in_c0,
										d_1 	=>	in_c1,
										d_out	=>	in_c
									);									
										
	mux_d	:	generic_mux2to1		generic map(
										n	=>	8	
									)
									port map(
										sel 	=>	mux_sel,
										d_0 	=>	in_d0,
										d_1 	=>	in_d1,
										d_out	=>	in_d
									);									
	
	d_out	<=	in_a&in_b&in_c&in_d;
	
	xor_out	<=	toggle	xor	t_ff_out;
	pl_nh	<=	t_ff_out;
	
	t_ff	:	generic_register	generic map(
										n	=>	1
									)
									port map(
										en_clk	=>	en_clk,
										clk		=>	clk,
										en_h	=>	en_tff_h,
										rst_l 	=>	rst_l,
										d_in 	=>	xor_out,
										d_out 	=>	t_ff_out
									);
		
	i	<=	pnt_i;
	k	<=	pnt_k;
	
	alu		:	adress_alu			port map(
										en_clk		=>	en_clk,
										clk			=>	clk,
										en_i_h		=>	en_i_h,
										en_k_h		=>	en_k_h,
										rst_l 		=>	rst_l,
										evenl_oddh 	=>	evenl_oddh,
										inc			=>	inc,
										i 			=>	pnt_i,
										k	 		=>	pnt_k
									);									
	
	cnt		:	counter3b			port map(
										en_clk	=>	en_clk,
										clk		=>	clk,
										en_h	=>	en_cnt_h,
										rst_l 	=>	rst_l,
										tc_6	=>	tc_6
									);
	
end structure;