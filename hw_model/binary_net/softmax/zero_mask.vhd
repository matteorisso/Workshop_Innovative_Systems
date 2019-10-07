-- In order to reduce computanional strength and
-- nit width negative values are set to zero.
-- Input values are on 8 bit CA2, output values
-- are on 7 bit unsigned.

library ieee;
	use ieee.std_logic_1164.all;
	use ieee.numeric_std.all;

entity zero_mask is

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
	
end zero_mask;

architecture structure of zero_mask is
	
	component generic_mux2to1 is
		generic(n : integer := 4);
		port(
			sel 	: in 	std_logic;
			d_0 	: in 	std_logic_vector((n-1) downto 0);
			d_1 	: in 	std_logic_vector((n-1) downto 0);
			d_out	: out 	std_logic_vector((n-1) downto 0)
		);
	end component;
	
	signal	sel_0	:	std_logic;
	signal	sel_1	:	std_logic;
	signal	sel_2	:	std_logic;
	signal	sel_3	:	std_logic;
	signal	sel_4	:	std_logic;
	signal	sel_5	:	std_logic;
	signal	sel_6	:	std_logic;
	signal	sel_7	:	std_logic;
	signal	sel_8	:	std_logic;
	signal	sel_9	:	std_logic;
	
begin
	
	sel_0	<=	d_in_0(7)	and	'1';
	sel_1	<=	d_in_1(7)	and	'1';
	sel_2	<=	d_in_2(7)	and	'1';
	sel_3	<=	d_in_3(7)	and	'1';
	sel_4	<=	d_in_4(7)	and	'1';
	sel_5	<=	d_in_5(7)	and	'1';
	sel_6	<=	d_in_6(7)	and	'1';
	sel_7	<=	d_in_7(7)	and	'1';
	sel_8	<=	d_in_8(7)	and	'1';
	sel_9	<=	d_in_9(7)	and	'1';
	
	mux0	:	generic_mux2to1	generic map(
									n	=>	7
								)
								port map(
									sel 	=>	sel_0,
									d_0 	=>	d_in_0(6 downto 0),
									d_1 	=>	"0000000",
									d_out	=>	d_out_0
								);
	
	mux1	:	generic_mux2to1	generic map(
									n	=>	7
								)
								port map(
									sel 	=>	sel_1,
									d_0 	=>	d_in_1(6 downto 0),
									d_1 	=>	"0000000",
									d_out	=>	d_out_1
								);
	
	mux2	:	generic_mux2to1	generic map(
									n	=>	7
								)
								port map(
									sel 	=>	sel_2,
									d_0 	=>	d_in_2(6 downto 0),
									d_1 	=>	"0000000",
									d_out	=>	d_out_2
								);
	
	mux3	:	generic_mux2to1	generic map(
									n	=>	7
								)
								port map(
									sel 	=>	sel_3,
									d_0 	=>	d_in_3(6 downto 0),
									d_1 	=>	"0000000",
									d_out	=>	d_out_3
								);
	
	mux4	:	generic_mux2to1	generic map(
									n	=>	7
								)
								port map(
									sel 	=>	sel_4,
									d_0 	=>	d_in_4(6 downto 0),
									d_1 	=>	"0000000",
									d_out	=>	d_out_4
								);
	
	mux5	:	generic_mux2to1	generic map(
									n	=>	7
								)
								port map(
									sel 	=>	sel_5,
									d_0 	=>	d_in_5(6 downto 0),
									d_1 	=>	"0000000",
									d_out	=>	d_out_5
								);
	
	mux6	:	generic_mux2to1	generic map(
									n	=>	7
								)
								port map(
									sel 	=>	sel_6,
									d_0 	=>	d_in_6(6 downto 0),
									d_1 	=>	"0000000",
									d_out	=>	d_out_6
								);
	
	mux7	:	generic_mux2to1	generic map(
									n	=>	7
								)
								port map(
									sel 	=>	sel_7,
									d_0 	=>	d_in_7(6 downto 0),
									d_1 	=>	"0000000",
									d_out	=>	d_out_7
								);
	
	mux8	:	generic_mux2to1	generic map(
									n	=>	7
								)
								port map(
									sel 	=>	sel_8,
									d_0 	=>	d_in_8(6 downto 0),
									d_1 	=>	"0000000",
									d_out	=>	d_out_8
								);
	
	mux9	:	generic_mux2to1	generic map(
									n	=>	7
								)
								port map(
									sel 	=>	sel_9,
									d_0 	=>	d_in_9(6 downto 0),
									d_1 	=>	"0000000",
									d_out	=>	d_out_9
								);

end structure;