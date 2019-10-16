-- ALU for the generation of even and odd
-- adresses.

library ieee;
	use ieee.std_logic_1164.all;
	use ieee.numeric_std.all;

entity adress_alu is

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
	
end adress_alu;

architecture structure of adress_alu is
	
	component generic_register_0 is
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
	
	component generic_register_1 is
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
	
	component adder is
		port(
			a	:	in 	std_logic_vector(9 downto 0);
			b 	:	in 	std_logic_vector(9 downto 0);
			res	: 	out std_logic_vector(9 downto 0)
			);		
	end component;
	
	constant	plus_2		:	std_logic_vector(9	downto	0)	:=	"0000000010";
	constant	plus_4		:	std_logic_vector(9	downto	0)	:=	"0000000100";
	constant	minus_2		:	std_logic_vector(9	downto	0)	:=	"1111111110";
	constant	plus_0		:	std_logic_vector(9	downto	0)	:=	"0000000000";
	
	signal		mux_inc0_out:	std_logic_vector(9	downto	0);
	signal		mux_inc1_out:	std_logic_vector(9	downto	0);
	signal		mux_inc_out	:	std_logic_vector(9	downto	0);
	
	signal		mux_eo_out	:	std_logic_vector(9	downto	0);
	signal		mux_eo_in_i	:	std_logic_vector(9	downto	0);
	signal		mux_eo_in_k	:	std_logic_vector(9	downto	0);
	
	signal		sum_out		:	std_logic_vector(9	downto	0);
	
begin
	
	
	mux_inc0	:	generic_mux2to1		generic map(
											n	=>	10
										)
										port map(
											sel 	=>	inc(0),
											d_0 	=>	plus_2,
											d_1 	=>	minus_2,
											d_out	=>	mux_inc0_out
										);								
									
	mux_inc1	:	generic_mux2to1		generic map(
											n	=>	10
										)
										port map(
											sel 	=>	inc(0),
											d_0 	=>	plus_4,
											d_1 	=>	plus_0,
											d_out	=>	mux_inc1_out
										);								
									
	mux_inc2	:	generic_mux2to1		generic map(
											n	=>	10
										)
										port map(
											sel 	=>	inc(1),
											d_0 	=>	mux_inc0_out,
											d_1 	=>	mux_inc1_out,
											d_out	=>	mux_inc_out
										);									
	
	mux_eo_in_i	<=	i;
	mux_eo_in_k	<=	k;
	
	mux_eo	:	generic_mux2to1			generic map(
											n	=>	10
										)
										port map(
											sel 	=>	evenl_oddh,
											d_0 	=>	mux_eo_in_i,
											d_1 	=>	mux_eo_in_k,
											d_out	=>	mux_eo_out
										);	
									
	sum		:	adder					port map(
											a	=>	mux_eo_out,
											b 	=>	mux_inc_out,
											res	=>	sum_out
										);								
	
	reg_i		:	generic_register_0	generic map(
											n	=>	10
										)	
										port map(
											en_clk	=>	en_clk,
											clk		=>	clk,
											en_h	=>	en_i_h,
											rst_l 	=>	rst_l,
											d_in 	=>	sum_out,
											d_out 	=>	i
										);
	
	reg_k		:	generic_register_1	generic map(
											n	=>	10
										)	
										port map(
											en_clk	=>	en_clk,
											clk		=>	clk,
											en_h	=>	en_k_h,
											rst_l 	=>	rst_l,
											d_in 	=>	sum_out,
											d_out 	=>	k
										);
	
end structure;