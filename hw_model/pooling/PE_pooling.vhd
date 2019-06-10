library ieee;
use ieee.std_logic_1164.all;
use work.fixed_pkg.all;

entity PE_pooling is
	generic( 	qi : natural:= 8;
					qf : natural:= 8
			);
	port(	
			a, b, c, d 	: in 	sfixed(qi-1 downto -qf);
			clk, en, rstn : in std_logic;
			res	: out sfixed(qi-1 downto -qf)
		);
end entity;

architecture behavior of PE_pooling is

	component regn
		generic( 
			qi : natural:= 8; 
			qf : natural:= 8 
		);	
		port(
		d 	:	in sfixed(qi-1 downto -qf);
		ck, rstn, en	:	in std_logic;
		q  :  out sfixed(qi-1 downto -qf)
		);
	end component;
	
	component adder
		generic( 	
			qi : natural:= 8;
			qf : natural:= 8 
		);
		port(
			a, b 	: in 	sfixed(qi-1 downto -qf);
			res	: out sfixed(qi-1 downto -qf);
			cout : out std_logic
		);
	end component;
	
	signal a_reg, b_reg, c_reg, d_reg, psum_1, psum_2, psum_3 : sfixed(qi-1 downto -qf);

begin

	reg_a : regn generic map (
					qi => 8,
					qf => 8
				 )
				 port map(
					d => "00"&a(qi-1 downto -qf+2),	
					ck => clk, 
					rstn => rstn, 
					en => en,
					q => a_reg
				 );
	reg_b : regn generic map (
					qi =>8,
					qf => 8
				 )
				 port map(
					d => "00"&b(qi-1 downto -qf+2),	
					ck => clk, 
					rstn => rstn, 
					en => en,
					q => b_reg
				 );
	reg_c : regn generic map (
					qi => 8,
					qf => 8
				 )
				 port map(
					d => "00"&c(qi-1 downto -qf+2),	
					ck => clk, 
					rstn => rstn, 
					en => en,
					q => c_reg
				 );
	reg_d : regn generic map (
					qi => 8,
					qf => 8
				 )
				 port map(
					d => "00"&d(qi-1 downto -qf+2),	
					ck => clk, 
					rstn => rstn, 
					en => en,
					q => d_reg
				 );
	reg_out : regn generic map (
					qi => 8,
					qf => 8
				 )
				 port map(
					d => psum_3,	
					ck => clk, 
					rstn => rstn, 
					en => en,
					q => res
				 );
				 
	adder_1 : adder generic map (
					qi => 8,
					qf => 8
				 )
				 port map(
					a => a_reg, 
					b => b_reg,
					res	=> psum_1
				 );
	adder_2 : adder generic map (
					qi => 8,
					qf => 8
				 )
				 port map(
					a => c_reg, 
					b => d_reg,
					res	=> psum_2
				 );
	adder_3 : adder generic map (
					qi => 8,
					qf => 8
				 )
				 port map(
					a => psum_1, 
					b => psum_2,
					res	=> psum_3
				 );

end architecture behavior; 