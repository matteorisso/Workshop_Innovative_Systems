
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity interf is

	generic(n : integer := 16);
	
	port(
		sel 	: in 	std_logic;
		d_0 	: in 	signed((n-1) downto 0);
		d_1 	: in 	signed((n-1) downto 0);
		d_2 	: in 	signed((n-1) downto 0);
		d_3 	: in 	signed((n-1) downto 0);	
		d_4 	: in 	signed((n-1) downto 0);	
		d_5 	: in 	signed((n-1) downto 0);	
		d_6 	: in 	signed((n-1) downto 0);	
		d_7 	: in 	signed((n-1) downto 0);			
		d_out0	: out 	signed((n-1) downto 0);
		d_out1	: out 	signed((n-1) downto 0);
		d_out2	: out 	signed((n-1) downto 0);
		d_out3	: out 	signed((n-1) downto 0)
	);

end interf;

architecture behavior of interf is

component generic_mux2to1 is

	generic(n : integer := 4);
	
	port(
		sel 	: in 	std_logic;
		d_0 	: in 	signed((n-1) downto 0);
		d_1 	: in 	signed((n-1) downto 0);
		d_out	: out 	signed((n-1) downto 0)
	);

end component;

begin

mux_0 : generic_mux2to1 generic map (n => 16)

        port map(
		         sel   => sel,
				 d_0   => d_0,
				 d_1   => d_4,
				 d_out => d_out0
				 
		         );

mux_1 : generic_mux2to1 generic map (n => 16)

        port map(
		         sel   => sel,
				 d_0   => d_1,
				 d_1   => d_5,
				 d_out => d_out1
				 
		         );
				 
mux_2 : generic_mux2to1 generic map (n => 16)

        port map(
		         sel   => sel,
				 d_0   => d_2,
				 d_1   => d_6,
				 d_out => d_out2
				 
		         );		

mux_3 : generic_mux2to1 generic map (n => 16)

        port map(
		         sel   => sel,
				 d_0   => d_3,
				 d_1   => d_7,
				 d_out => d_out3
				 
		         );				 

end behavior;