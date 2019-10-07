-- Popcountig unit : takes the 25 outputs of the 5 cu_1d and counts 
-- how many '1' bit are present.
-- The popcount is realized with a compressor tree with 6 levels of 
-- full-adders and half-adders.

library ieee;
	use ieee.std_logic_1164.all;
	use ieee.numeric_std.all;

entity popcount is

	port(
		d_in 	: in 	std_logic_vector(24 downto 0);
		d_out 	: out 	std_logic_vector(4 downto 0)
	);
	
end popcount;

architecture structure of popcount is

	component half_adder is
		port(
			a	:	in	std_logic;
			b	:	in	std_logic;
			s	:	out	std_logic;
			c	:	out std_logic
		);
	end component;
	
	component full_adder is
		port(
			a	:	in	std_logic;
			b	:	in	std_logic;
			cin	:	in	std_logic;
			s	:	out	std_logic;
			c	:	out std_logic
		);
	end component;
	
	signal s1_s	:	std_logic_vector(7 downto 0);
	signal s1_c :	std_logic_vector(7 downto 0);
	
	signal s2_s	:	std_logic_vector(5 downto 0);
	signal s2_c	:	std_logic_vector(5 downto 0);
	
	signal s3_s	:	std_logic_vector(3 downto 0);
	signal s3_c	:	std_logic_vector(3 downto 0);
	
	signal s4_s	:	std_logic_vector(1 downto 0);
	signal s4_c	:	std_logic_vector(1 downto 0);
	
	signal s5_s	:	std_logic;
	signal s5_c	:	std_logic;
	
	signal s6_s	:	std_logic;
	signal s6_c	:	std_logic;
	

	
begin
	
	-- first stage
	fa_1_0	:	full_adder port map(d_in(0),	d_in(1),	d_in(2),	s1_s(0), s1_c(0));
	fa_1_1	:	full_adder port map(d_in(3),	d_in(4),	d_in(5),	s1_s(1), s1_c(1));
	fa_1_2	:	full_adder port map(d_in(6),	d_in(7),	d_in(8),	s1_s(2), s1_c(2));
	fa_1_3	:	full_adder port map(d_in(9),	d_in(10),	d_in(11),	s1_s(3), s1_c(3));
	fa_1_4	:	full_adder port map(d_in(12),	d_in(13),	d_in(14),	s1_s(4), s1_c(4));
	fa_1_5	:	full_adder port map(d_in(15),	d_in(16),	d_in(17),	s1_s(5), s1_c(5));
	fa_1_6	:	full_adder port map(d_in(18),	d_in(19),	d_in(20),	s1_s(6), s1_c(6));
	fa_1_7	:	full_adder port map(d_in(21),	d_in(22),	d_in(23),	s1_s(7), s1_c(7));
	
	-- second stage
	
	fa_2_0	:	full_adder port map(s1_s(0),	s1_s(1),	s1_s(2),	s2_s(0), s2_c(0));
	fa_2_1	:	full_adder port map(s1_c(0),	s1_c(1),	s1_c(2),	s2_s(1), s2_c(1));
	fa_2_2	:	full_adder port map(s1_s(3),	s1_s(4),	s1_s(5),	s2_s(2), s2_c(2));
	fa_2_3	:	full_adder port map(s1_c(3),	s1_c(4),	s1_c(5),	s2_s(3), s2_c(3));
	fa_2_4	:	full_adder port map(s1_s(6),	s1_s(7),	d_in(24),	s2_s(4), s2_c(4));
	ha_2_5	:	half_adder port map(s1_c(6),	s1_c(7),				s2_s(5), s2_c(5));
	
	-- third stage
	
	fa_3_0	:	full_adder port map(s2_s(0),	s2_s(2),	s2_s(4),	s3_s(0), s3_c(0));
	fa_3_1	:	full_adder port map(s2_c(0),	s2_c(2),	s2_c(4),	s3_s(1), s3_c(1));
	fa_3_2	:	full_adder port map(s2_s(1),	s2_s(3),	s2_s(5),	s3_s(2), s3_c(2));
	fa_3_3	:	full_adder port map(s2_c(1),	s2_c(3),	s2_c(5),	s3_s(3), s3_c(3));
	
	-- fourth stage
	
	fa_4_0	:	full_adder port map(s3_c(0),	s3_s(1),	s3_s(2),	s4_s(0), s4_c(0));
	fa_4_1	:	full_adder port map(s3_c(1),	s3_c(2),	s3_s(3),	s4_s(1), s4_c(1));
	
	-- fifth stage
	
	ha_5_0	:	half_adder port map(s4_c(0),	s4_s(1),				s5_s, s5_c);
	
	-- sid_inth stage
	
	fa_6_0	:	full_adder port map(s5_c,	s4_c(1),	s3_c(3),	s6_s, s6_c);
	
	-- last stage : bit concatenation 
	
	d_out	<=	s6_c&s6_s&s5_s&s4_s(0)&s3_s(0);
	
	
end structure;