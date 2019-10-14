library ieee;
	use ieee.std_logic_1164.all;
	use ieee.numeric_std.all;

entity conv_pool_intf is

	port(
		d_in 		: 	in 	std_logic_vector(63 downto 0);
		en_clk		: 	in	std_logic;
		clk			: 	in 	std_logic;
		reset		:	in	std_logic;
		load		:	in	std_logic;
		start		:	in	std_logic;
		done		:	in	std_logic;
		
		d_out 		: 	out std_logic_vector(31 downto 0);
		pointer		: 	out std_logic_vector(9 	downto 0)
	);
	
end conv_pool_intf;

architecture structure of conv_pool_intf is

	component conv_pool_intf_eu is
		port(
			d_in 		: in 	std_logic_vector(63 downto 0);
			en_clk		: in	std_logic;
			clk			: in 	std_logic;
			en_cnt_h	: in 	std_logic;
			en_tff_h	: in 	std_logic;
			en_i_h		: in 	std_logic;
			en_k_h		: in 	std_logic;
			rst_l 		: in 	std_logic;
			rst_cnt_l 	: in 	std_logic;
			evenl_oddh 	: in 	std_logic;
			toggle		: in	std_logic;
			mux_sel		: in	std_logic;
			out_sel		: in	std_logic;
			inc			: in 	std_logic_vector(1 	downto 0);
			d_out 		: out 	std_logic_vector(31 downto 0);
			pointer		: out 	std_logic_vector(9 	downto 0);
			pl_nh		: out	std_logic;
			tc_6		: out	std_logic
		);
	end component;
	
	component conv_pool_intf_fsm is
		port(
			reset			:	in		std_logic;
			clk				:	in		std_logic;
			start			:	in		std_logic;
			load			:	in		std_logic;
			done			:	in		std_logic;
			
			pl_nh			: 	in		std_logic;
			tc_6			:	in		std_logic;
			
			en_cnt_h		: 	out 	std_logic;
			en_tff_h		: 	out 	std_logic;
			en_i_h			: 	out 	std_logic;
			en_k_h			: 	out 	std_logic;
			rst_l 			: 	out 	std_logic;
			rst_cnt_l 		:	out 	std_logic;
			evenl_oddh 		: 	out 	std_logic;
			toggle			: 	out		std_logic;
			mux_sel			: 	out		std_logic;
			out_sel			: 	out		std_logic;
			inc				: 	out 	std_logic_vector(1 	downto 0)
		);		
	end component;
	
	signal	en_cnt_h	:  	std_logic;
	signal	en_tff_h	:  	std_logic;
	signal	en_i_h		:  	std_logic;
	signal	en_k_h		:  	std_logic;
	signal	rst_l 		:  	std_logic;
	signal	evenl_oddh 	:  	std_logic;
	signal	toggle		: 	std_logic;
	signal	mux_sel		: 	std_logic;
	signal	out_sel		: 	std_logic;
	signal	inc			:  	std_logic_vector(1 	downto 0);
	signal	pl_nh		: 	std_logic;
	signal	tc_6		: 	std_logic;
	signal	rst_cnt_l	:	std_logic;

begin

	eu	:	conv_pool_intf_eu	port map(
									d_in 		=>	d_in,
									en_clk		=>	en_clk,
									clk			=>	clk,
									en_cnt_h	=>	en_cnt_h,
									en_tff_h	=>	en_tff_h,
									en_i_h		=>	en_i_h,
									en_k_h		=>	en_k_h,
									rst_l 		=>	rst_l,
									rst_cnt_l	=>	rst_cnt_l,
									evenl_oddh 	=>	evenl_oddh,
									toggle		=>	toggle,
									mux_sel		=>	mux_sel,
									out_sel		=>	out_sel,
									inc			=>	inc,
									d_out 		=>	d_out,
									pointer		=>	pointer,
									pl_nh		=>	pl_nh,
									tc_6		=>	tc_6
								);
	
	fsm	:	conv_pool_intf_fsm	port map(
									reset		=>	reset,
									clk			=>	clk,
									start		=>	start,
									load		=>	load,
									done		=>	done,
									pl_nh		=>	pl_nh,
									tc_6		=>	tc_6,
									en_cnt_h	=>	en_cnt_h,
									en_tff_h	=>	en_tff_h,
									en_i_h		=>	en_i_h,
									en_k_h		=>	en_k_h,
									rst_l 		=>	rst_l,
									rst_cnt_l	=>	rst_cnt_l,
									evenl_oddh 	=>	evenl_oddh,
									toggle		=>	toggle,
									mux_sel		=>	mux_sel,
									out_sel		=>	out_sel,
									inc			=>	inc
								);
	
end structure;