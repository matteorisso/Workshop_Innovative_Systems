-- Execution unit of Convolutional unit that performs 
-- the convolution on an ifmap of size 32x32 with 6 
-- different filters therefore 6 cu_2d are used.

library ieee;
	use ieee.std_logic_1164.all;
	use ieee.numeric_std.all;

entity conv_unit_eu is

	port(
		en_clk			:	in	std_logic;
		clk				:	in 	std_logic;
		rst_l 			: 	in 	std_logic;
		
		cnt5_en_h		:	in	std_logic;
		
		sbpg_ctrl_inc	:	in	std_logic;
		sbpg_tgl_en		:	in	std_logic;
		
		rf_ctrl_inc_h	:	in	std_logic;
		
		rf_in 			: 	in 	std_logic_vector(83	downto 0);
		
		spw0_en_0_h		: 	in 	std_logic;
		spw0_en_1_h		: 	in 	std_logic;
		spw0_en_2_h		: 	in 	std_logic;
		spw0_en_3_h		: 	in 	std_logic;
		spw0_en_4_h		: 	in 	std_logic;
		spw0_in			: 	in 	std_logic_vector(4	downto 0);
		
		spw1_en_0_h		: 	in 	std_logic;
		spw1_en_1_h		: 	in 	std_logic;
		spw1_en_2_h		: 	in 	std_logic;
		spw1_en_3_h		: 	in 	std_logic;
		spw1_en_4_h		: 	in 	std_logic;
		spw1_in			: 	in 	std_logic_vector(4	downto 0);
		
		spw2_en_0_h		: 	in 	std_logic;
		spw2_en_1_h		: 	in 	std_logic;
		spw2_en_2_h		: 	in 	std_logic;
		spw2_en_3_h		: 	in 	std_logic;
		spw2_en_4_h		: 	in 	std_logic;
		spw2_in			: 	in 	std_logic_vector(4	downto 0);
		
		spw3_en_0_h		: 	in 	std_logic;
		spw3_en_1_h		: 	in 	std_logic;
		spw3_en_2_h		: 	in 	std_logic;
		spw3_en_3_h		: 	in 	std_logic;
		spw3_en_4_h		: 	in 	std_logic;
		spw3_in			: 	in 	std_logic_vector(4	downto 0);
		
		spw4_en_0_h		: 	in 	std_logic;
		spw4_en_1_h		: 	in 	std_logic;
		spw4_en_2_h		: 	in 	std_logic;
		spw4_en_3_h		: 	in 	std_logic;
		spw4_en_4_h		: 	in 	std_logic;
		spw4_in			: 	in 	std_logic_vector(4	downto 0);
		
		spw5_en_0_h		: 	in 	std_logic;
		spw5_en_1_h		: 	in 	std_logic;
		spw5_en_2_h		: 	in 	std_logic;
		spw5_en_3_h		: 	in 	std_logic;
		spw5_en_4_h		: 	in 	std_logic;
		spw5_in			: 	in 	std_logic_vector(4	downto 0);
		
		rfint_ctrl_sh_h	:	in	std_logic;
		
		rfint_en_h		:	in	std_logic;
		
		sbpg_ctrl_uphdnl:	out	std_logic;
		
		cnt5_tc_4		:	out	std_logic;
		cnt5_tc_31		:	out	std_logic;
		
		ofmap_0			: 	out std_logic_vector(5	downto 0);
		ofmap_1			: 	out std_logic_vector(5	downto 0);
		ofmap_2			: 	out	std_logic_vector(5	downto 0);
		ofmap_3			: 	out	std_logic_vector(5	downto 0);
		ofmap_4			: 	out std_logic_vector(5	downto 0);
		ofmap_5			: 	out std_logic_vector(5	downto 0)
		);
	
end conv_unit_eu;

architecture structure of conv_unit_eu is

	component rf_controller is
		port(
			en_clk	: in	std_logic;
			clk		: in 	std_logic;
			en_h	: in 	std_logic;
			rst_l 	: in 	std_logic;
			d_out 	: out 	std_logic_vector(4 downto 0)
		);
	end component;
	
	component register_file is
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
	end component;
	
	component w_scratchpad is
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
	end component;
	
	component rfint_mux_controller is
		port(
			en_clk	: in	std_logic;
			clk		: in 	std_logic;
			en_h	: in 	std_logic;
			rst_l 	: in 	std_logic;
			d_out 	: inout 	std_logic_vector(14 downto 0)
		);	
	end component;
		
	component rf_interface is
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
	
	component counter5b is
		port(
			en_clk	: in	std_logic;
			clk		: in 	std_logic;
			en_h	: in 	std_logic;
			rst_l 	: in 	std_logic;
			d_out 	: inout std_logic_vector(4 downto 0);
			tc_4	: out	std_logic;
			tc_31	: out	std_logic
		);
	end component;
	
	component subpage_controller is
		port(
			en_clk	: in	std_logic;
			clk		: in 	std_logic;
			inc		: in 	std_logic;
			tgle_ok	: in	std_logic;
			rst_l 	: in 	std_logic;
			uph_dnl	: inout	std_logic;
			d_out 	: out 	std_logic_vector(4 downto 0)
		);
	end component;
	
	signal rf_out_0				:	std_logic;
	signal rf_out_1				:	std_logic;
	signal rf_out_2				:	std_logic;
	signal rf_out_3				:	std_logic;
	signal rf_out_4				:	std_logic;
	
	signal cnt5_out				:	std_logic_vector(4	downto	0);
	
	signal sbpg_ctrl_uphdnl_i	:	std_logic;
	signal sbpg_ctrl_out		:	std_logic_vector(4	downto	0);
	
	signal rf_ctrl_out			:	std_logic_vector(4	downto	0);
	
	signal spw0_out_0			:	std_logic_vector(4	downto	0);
	signal spw0_out_1			:	std_logic_vector(4	downto	0);
	signal spw0_out_2			:	std_logic_vector(4	downto	0);
	signal spw0_out_3			:	std_logic_vector(4	downto	0);
	signal spw0_out_4			:	std_logic_vector(4	downto	0);
	
	signal spw1_out_0			:	std_logic_vector(4	downto	0);
	signal spw1_out_1			:	std_logic_vector(4	downto	0);
	signal spw1_out_2			:	std_logic_vector(4	downto	0);
	signal spw1_out_3			:	std_logic_vector(4	downto	0);
	signal spw1_out_4			:	std_logic_vector(4	downto	0);
	
	signal spw2_out_0			:	std_logic_vector(4	downto	0);
	signal spw2_out_1			:	std_logic_vector(4	downto	0);
	signal spw2_out_2			:	std_logic_vector(4	downto	0);
	signal spw2_out_3			:	std_logic_vector(4	downto	0);
	signal spw2_out_4			:	std_logic_vector(4	downto	0);
	
	signal spw3_out_0			:	std_logic_vector(4	downto	0);
	signal spw3_out_1			:	std_logic_vector(4	downto	0);
	signal spw3_out_2			:	std_logic_vector(4	downto	0);
	signal spw3_out_3			:	std_logic_vector(4	downto	0);
	signal spw3_out_4			:	std_logic_vector(4	downto	0);
	
	signal spw4_out_0			:	std_logic_vector(4	downto	0);
	signal spw4_out_1			:	std_logic_vector(4	downto	0);
	signal spw4_out_2			:	std_logic_vector(4	downto	0);
	signal spw4_out_3			:	std_logic_vector(4	downto	0);
	signal spw4_out_4			:	std_logic_vector(4	downto	0);
	
	signal spw5_out_0			:	std_logic_vector(4	downto	0);
	signal spw5_out_1			:	std_logic_vector(4	downto	0);
	signal spw5_out_2			:	std_logic_vector(4	downto	0);
	signal spw5_out_3			:	std_logic_vector(4	downto	0);
	signal spw5_out_4			:	std_logic_vector(4	downto	0);
	
	signal rfint_crl_out		:	std_logic_vector(14	downto	0);
	
	signal rfint_in				:	std_logic_vector(4 downto	0);
	signal rfint_out_0			:	std_logic_vector(4 downto	0);
	signal rfint_out_1			:	std_logic_vector(4 downto	0);
	signal rfint_out_2			:	std_logic_vector(4 downto	0);
	signal rfint_out_3			:	std_logic_vector(4 downto	0);
	signal rfint_out_4			:	std_logic_vector(4 downto	0);
	
begin

	cnt	:	counter5b		port map(
								en_clk	=>	en_clk,
								clk		=>	clk,
								en_h	=>	cnt5_en_h,
								rst_l 	=>	rst_l,
								d_out 	=>	cnt5_out,
								tc_31	=>	cnt5_tc_31,
								tc_4	=>	cnt5_tc_4
							);
							
	sbpg:	subpage_controller	port map(
									en_clk	=>	en_clk,
									clk		=>	clk,
									inc		=>	sbpg_ctrl_inc,
									rst_l 	=>	rst_l,
									tgle_ok	=>	sbpg_tgl_en,
									uph_dnl	=>	sbpg_ctrl_uphdnl_i,
									d_out 	=>	sbpg_ctrl_out
								);
	
	sbpg_ctrl_uphdnl	<=	sbpg_ctrl_uphdnl_i;
						
	rfcr:	rf_controller		port map(
									en_clk	=>	en_clk,
									clk		=>	clk,
									en_h	=>	rf_ctrl_inc_h,
									rst_l 	=>	rst_l,
									d_out 	=>	rf_ctrl_out
								);

	rf	:	register_file	port map(
								en_clk	=>	en_clk,
								clk		=>	clk,
								en_0_h	=>	rf_ctrl_out(0), 
								en_1_h	=>	rf_ctrl_out(1),
								en_2_h	=>	rf_ctrl_out(2),
								en_3_h	=>	rf_ctrl_out(3),
								en_4_h	=>	rf_ctrl_out(4),
								rst_l 	=>	rst_l,
								subpage0=>	sbpg_ctrl_out(4), 
								subpage1=>	sbpg_ctrl_out(3),
								subpage2=>	sbpg_ctrl_out(2),
								subpage3=>	sbpg_ctrl_out(1),
								subpage4=>	sbpg_ctrl_out(0),
								bit_sel	=>	cnt5_out, 
								d_in	=>	rf_in,
								d_out_0	=>	rf_out_0,
								d_out_1	=>	rf_out_1,
								d_out_2	=>	rf_out_2,
								d_out_3	=>	rf_out_3,
								d_out_4	=>	rf_out_4
							);
	
	spw0:	w_scratchpad	port map(
								en_clk	=>	en_clk,
								clk		=>	clk,
								en_0_h	=>	spw0_en_0_h,
								en_1_h	=>	spw0_en_1_h,
								en_2_h	=>	spw0_en_2_h,
								en_3_h	=>	spw0_en_3_h,
								en_4_h	=>	spw0_en_4_h,
								rst_l 	=>	rst_l,
								w_in 	=>	spw0_in,
								w_out_0 =>	spw0_out_0,
								w_out_1 =>	spw0_out_1,
								w_out_2 =>	spw0_out_2,
								w_out_3 =>	spw0_out_3,
								w_out_4 =>	spw0_out_4
							);
							
	spw1:	w_scratchpad	port map(
								en_clk	=>	en_clk,
								clk		=>	clk,
								en_0_h	=>	spw1_en_0_h,
								en_1_h	=>	spw1_en_1_h,
								en_2_h	=>	spw1_en_2_h,
								en_3_h	=>	spw1_en_3_h,
								en_4_h	=>	spw1_en_4_h,
								rst_l 	=>	rst_l,
								w_in 	=>	spw1_in,
								w_out_0 =>	spw1_out_0,
								w_out_1 =>	spw1_out_1,
								w_out_2 =>	spw1_out_2,
								w_out_3 =>	spw1_out_3,
								w_out_4 =>	spw1_out_4
							);
	
	spw2:	w_scratchpad	port map(
								en_clk	=>	en_clk,
								clk		=>	clk,
								en_0_h	=>	spw2_en_0_h,
								en_1_h	=>	spw2_en_1_h,
								en_2_h	=>	spw2_en_2_h,
								en_3_h	=>	spw2_en_3_h,
								en_4_h	=>	spw2_en_4_h,
								rst_l 	=>	rst_l,
								w_in 	=>	spw2_in,
								w_out_0 =>	spw2_out_0,
								w_out_1 =>	spw2_out_1,
								w_out_2 =>	spw2_out_2,
								w_out_3 =>	spw2_out_3,
								w_out_4 =>	spw2_out_4
							);
							
	spw3:	w_scratchpad	port map(
								en_clk	=>	en_clk,
								clk		=>	clk,
								en_0_h	=>	spw3_en_0_h,
								en_1_h	=>	spw3_en_1_h,
								en_2_h	=>	spw3_en_2_h,
								en_3_h	=>	spw3_en_3_h,
								en_4_h	=>	spw3_en_4_h,
								rst_l 	=>	rst_l,
								w_in 	=>	spw3_in,
								w_out_0 =>	spw3_out_0,
								w_out_1 =>	spw3_out_1,
								w_out_2 =>	spw3_out_2,
								w_out_3 =>	spw3_out_3,
								w_out_4 =>	spw3_out_4
							);
							
	spw4:	w_scratchpad	port map(
								en_clk	=>	en_clk,
								clk		=>	clk,
								en_0_h	=>	spw4_en_0_h,
								en_1_h	=>	spw4_en_1_h,
								en_2_h	=>	spw4_en_2_h,
								en_3_h	=>	spw4_en_3_h,
								en_4_h	=>	spw4_en_4_h,
								rst_l 	=>	rst_l,
								w_in 	=>	spw4_in,
								w_out_0 =>	spw4_out_0,
								w_out_1 =>	spw4_out_1,
								w_out_2 =>	spw4_out_2,
								w_out_3 =>	spw4_out_3,
								w_out_4 =>	spw4_out_4
							);
							
	spw5:	w_scratchpad	port map(
								en_clk	=>	en_clk,
								clk		=>	clk,
								en_0_h	=>	spw5_en_0_h,
								en_1_h	=>	spw5_en_1_h,
								en_2_h	=>	spw5_en_2_h,
								en_3_h	=>	spw5_en_3_h,
								en_4_h	=>	spw5_en_4_h,
								rst_l 	=>	rst_l,
								w_in 	=>	spw5_in,
								w_out_0 =>	spw5_out_0,
								w_out_1 =>	spw5_out_1,
								w_out_2 =>	spw5_out_2,
								w_out_3 =>	spw5_out_3,
								w_out_4 =>	spw5_out_4
							);
	
	rfic:	rfint_mux_controller	port map(
										en_clk	=>	en_clk,
										clk		=>	clk,
										en_h	=>	rfint_ctrl_sh_h,
										rst_l 	=>	rst_l,
										d_out 	=>	rfint_crl_out
									);	
	
	intf:	rf_interface	port map(
								en_clk	=>	en_clk,
								clk		=>	clk,
								en_h	=>	rfint_en_h,
								rst_l 	=>	rst_l,
								mux0_sel=>	rfint_crl_out(14 downto	12),
								mux1_sel=>	rfint_crl_out(11 downto	9),
								mux2_sel=>	rfint_crl_out(8  downto	6),
								mux3_sel=>	rfint_crl_out(5  downto	3),
								mux4_sel=>	rfint_crl_out(2  downto	0),
								d_in 	=>	rfint_in,
								d_out_0	=>	rfint_out_0,
								d_out_1	=>	rfint_out_1,
								d_out_2	=>	rfint_out_2,
								d_out_3	=>	rfint_out_3,
								d_out_4	=>	rfint_out_4
							);
	
	cu_0:	cu_2d			port map(
								ifmap_0		=>	rfint_out_0,
								ifmap_1		=>	rfint_out_1,
								ifmap_2		=>	rfint_out_2,
								ifmap_3		=>	rfint_out_3,
								ifmap_4 	=>	rfint_out_4,
								weights_0	=>	spw0_out_0,
								weights_1	=>	spw0_out_1,
								weights_2	=>	spw0_out_2,
								weights_3	=>	spw0_out_3,
								weights_4	=>	spw0_out_4,
								ofmap 		=>	ofmap_0
							);
	
	cu_1:	cu_2d			port map(
								ifmap_0		=>	rfint_out_0,
								ifmap_1		=>	rfint_out_1,
								ifmap_2		=>	rfint_out_2,
								ifmap_3		=>	rfint_out_3,
								ifmap_4 	=>	rfint_out_4,
								weights_0	=>	spw1_out_0,
								weights_1	=>	spw1_out_1,
								weights_2	=>	spw1_out_2,
								weights_3	=>	spw1_out_3,
								weights_4	=>	spw1_out_4,
								ofmap 		=>	ofmap_1
							);

	cu_2:	cu_2d			port map(
								ifmap_0		=>	rfint_out_0,
								ifmap_1		=>	rfint_out_1,
								ifmap_2		=>	rfint_out_2,
								ifmap_3		=>	rfint_out_3,
								ifmap_4 	=>	rfint_out_4,
								weights_0	=>	spw2_out_0,
								weights_1	=>	spw2_out_1,
								weights_2	=>	spw2_out_2,
								weights_3	=>	spw2_out_3,
								weights_4	=>	spw2_out_4,
								ofmap 		=>	ofmap_2
							);
							
	cu_3:	cu_2d			port map(
								ifmap_0		=>	rfint_out_0,
								ifmap_1		=>	rfint_out_1,
								ifmap_2		=>	rfint_out_2,
								ifmap_3		=>	rfint_out_3,
								ifmap_4 	=>	rfint_out_4,
								weights_0	=>	spw3_out_0,
								weights_1	=>	spw3_out_1,
								weights_2	=>	spw3_out_2,
								weights_3	=>	spw3_out_3,
								weights_4	=>	spw3_out_4,
								ofmap 		=>	ofmap_3
							);
							
	cu_4:	cu_2d			port map(
								ifmap_0		=>	rfint_out_0,
								ifmap_1		=>	rfint_out_1,
								ifmap_2		=>	rfint_out_2,
								ifmap_3		=>	rfint_out_3,
								ifmap_4 	=>	rfint_out_4,
								weights_0	=>	spw4_out_0,
								weights_1	=>	spw4_out_1,
								weights_2	=>	spw4_out_2,
								weights_3	=>	spw4_out_3,
								weights_4	=>	spw4_out_4,
								ofmap 		=>	ofmap_4
							);
	
	cu_5:	cu_2d			port map(
								ifmap_0		=>	rfint_out_0,
								ifmap_1		=>	rfint_out_1,
								ifmap_2		=>	rfint_out_2,
								ifmap_3		=>	rfint_out_3,
								ifmap_4 	=>	rfint_out_4,
								weights_0	=>	spw5_out_0,
								weights_1	=>	spw5_out_1,
								weights_2	=>	spw5_out_2,
								weights_3	=>	spw5_out_3,
								weights_4	=>	spw5_out_4,
								ofmap 		=>	ofmap_5
							);
	
	
	rfint_in	<=	rf_out_4&rf_out_3&rf_out_2&rf_out_1&rf_out_0;
	
end structure;