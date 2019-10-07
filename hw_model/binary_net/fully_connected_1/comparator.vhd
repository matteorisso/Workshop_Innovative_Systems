--

library ieee;
	use ieee.std_logic_1164.all;
	use ieee.numeric_std.all;

entity comparator is

	port(
		en_clk		: 	in	std_logic;
		clk			:	in	std_logic;
		en_h		:	in	std_logic;
		rst_l		:	in	std_logic;
		conv_out	: 	in 	std_logic_vector(9 downto 0);
		coefficient	: 	in 	std_logic_vector(9 downto 0);
		x	 		: 	out std_logic
	);
	
end comparator;

architecture structure of comparator is
	
	component	generic_register is
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
	
	signal msbs_in	:	std_logic_vector(1	downto	0);
	signal msbs_out	:	std_logic_vector(1	downto	0);
	
	signal en_reg_2	:	std_logic;
	signal lsbs_in	:	std_logic_vector(17	downto	0);
	signal lsbs_out	:	std_logic_vector(17	downto	0);
	
begin
	
	reg1	:	generic_register	generic map(
										n	=>	2
									)
									port map(
										en_clk	=>	en_clk,
										clk		=>	clk,
										en_h	=>	en_h,
										rst_l 	=>	rst_l,
										d_in 	=>	msbs_in,
										d_out 	=>	msbs_out
									);
	
	msbs_in	<=	conv_out(9)&coefficient(9);
	
	reg2	:	generic_register	generic map(
										n	=>	18
									)
									port map(
										en_clk	=>	en_clk,
										clk		=>	clk,
										en_h	=>	en_reg_2,
										rst_l 	=>	rst_l,
										d_in 	=>	lsbs_in,
										d_out 	=>	lsbs_out
									);
	
	en_reg_2	<=	not	coefficient(9);
	lsbs_in		<=	conv_out(8 downto 0)&coefficient(8 downto 0);
	
	comp	:	process(msbs_out,lsbs_out)
	begin
		if (msbs_out(1)&lsbs_in(17 downto 9)) < (msbs_out(0)&lsbs_in(8 downto 0)) then
			x	<=	'0';
		else
			x	<=	'1';
		end if;
	end process;
	
end structure;