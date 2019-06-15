library ieee;
use ieee.std_logic_1164.all;
use work.fixed_pkg.all;

entity PE_pooling is
	generic( 	
			qi : natural := 8;
			qf : natural := 8
			);
	port(	
		a	: in 	sfixed(qi-1 downto -qf);
		b	: in 	sfixed(qi-1 downto -qf);
		c	: in 	sfixed(qi-1 downto -qf);
		d 	: in 	sfixed(qi-1 downto -qf);
		clk	: in 	std_logic;
		en	: in 	std_logic;
		rstn: in 	std_logic;
		res	: out 	sfixed(qi-1 downto -qf)
		);
		
end entity;

architecture behavior of PE_pooling is

	component regn
		generic( 
				qi : natural := 8; 
				qf : natural := 8 
				);	
		port(
			d 	:	in 	sfixed(qi-1 downto -qf);
			ck 	:	in 	std_logic;
			rstn:	in 	std_logic;
			en	:	in 	std_logic;
			q	:  	out sfixed(qi-1 downto -qf)
			);
	end component;
	
	component adder
		generic( 	
				qi : natural := 8;
				qf : natural := 8 
				);
		port(
			a	: in 	sfixed(qi-1 downto -qf);
			b 	: in 	sfixed(qi-1 downto -qf);
			res	: out 	sfixed(qi-1 downto -qf);
			cout: out 	std_logic
			);
	end component;
	
	signal a_reg		: sfixed(qi-1 downto -qf); 
	signal b_reg 		: sfixed(qi-1 downto -qf); 
	signal c_reg 		: sfixed(qi-1 downto -qf); 
	signal d_reg 		: sfixed(qi-1 downto -qf);
	signal a_shifted	: sfixed(qi-1 downto -qf); 
	signal b_shifted	: sfixed(qi-1 downto -qf); 
	signal c_shifted 	: sfixed(qi-1 downto -qf); 
	signal d_shifted 	: sfixed(qi-1 downto -qf);	
	signal psum_1 		: sfixed(qi-1 downto -qf);
	signal psum_2 		: sfixed(qi-1 downto -qf); 
	signal psum_3 		: sfixed(qi-1 downto -qf);

begin

	a_shifted <= "00"&a(qi-1 downto -qf+2);
	b_shifted <= "00"&b(qi-1 downto -qf+2);
	c_shifted <= "00"&c(qi-1 downto -qf+2);
	d_shifted <= "00"&d(qi-1 downto -qf+2);
	

	reg_a : regn generic map(
					qi => 8,
					qf => 8
					)
				 port map(
					d		=> a_shifted,	
					ck 		=> clk, 
					rstn	=> rstn, 
					en 		=> en,
					q 		=> a_reg
					);
	reg_b : regn generic map(
					qi =>8,
					qf => 8
					)	
				 port map(
					d		=> b_shifted,	
					ck	 	=> clk, 
					rstn	=> rstn, 
					en 		=> en,
					q		=> b_reg
					);
	reg_c : regn generic map(
					qi => 8,
					qf => 8
					)
				 port map(
					d		=> c_shifted,	
					ck		=> clk, 
					rstn	=> rstn, 
					en		=> en,
					q 		=> c_reg
					);
	reg_d : regn generic map(
					qi => 8,
					qf => 8
					)
				 port map(
					d		=> d_shifted,	
					ck		=> clk, 
					rstn	=> rstn, 
					en 		=> en,
					q		=> d_reg
				 );
	reg_out : regn generic map(
					qi => 8,
					qf => 8
					)
				 port map(
					d 		=> psum_3,	
					ck		=> clk, 
					rstn	=> rstn, 
					en 		=> en,
					q 		=> res
					);
				 
	adder_1 : adder generic map(
					qi => 8,
					qf => 8
					)
				 port map(
					a 	=> a_reg, 
					b 	=> b_reg,
					res	=> psum_1
					);
	adder_2 : adder generic map(
					qi => 8,
					qf => 8
					)
				 port map(
					a 	=> c_reg, 
					b 	=> d_reg,
					res	=> psum_2
					);
	adder_3 : adder generic map(
					qi => 8,
					qf => 8
					)
				 port map(
					a 	=> psum_1, 
					b 	=> psum_2,
					res	=> psum_3
					);

end architecture behavior; 