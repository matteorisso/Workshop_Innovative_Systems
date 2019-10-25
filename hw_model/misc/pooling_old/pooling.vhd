library ieee;
use ieee.std_logic_1164.all;
use work.fixed_pkg.all; 

entity pooling is

	port(	
		clk		: in std_logic;
		rst_n	: in std_logic;
		en 		: in std_logic;
		ifmap_a : in ifmap_type;
		ifmap_b : in ifmap_type;
		ifmap_c : in ifmap_type; 
		ifmap_d : in ifmap_type;
		ofmap	: out ifmap_type
		);
	
end entity;

architecture behavior of pooling is
	
	component pe_pooling
		generic( 	
			qi : natural := 8; 
			qf : natural := 8 
			);
		port(	
			a 		: in 	sfixed(qi-1 downto -qf); 
			b 		: in 	sfixed(qi-1 downto -qf); 
			c 		: in 	sfixed(qi-1 downto -qf); 
			d 		: in 	sfixed(qi-1 downto -qf);
			clk 	: in 	std_logic; 
			en 		: in 	std_logic; 
			rstn	: in 	std_logic;
			res		: out 	sfixed(qi-1 downto -qf)
		);
	end component;
	
begin

	pe_1_to_14 : for i in 0 to pe_number-1 generate 
		adder_tree : pe_pooling generic map( 
									qi => qi, 
									qf => qf 
									) 
								port map ( 
									a 		=> ifmap_a(i), 
									b 		=> ifmap_b(i), 
									c 		=> ifmap_c(i), 
									d 		=> ifmap_d(i), 	
									clk 	=> clk, 
									en 		=> en, 
									rstn 	=> rst_n,
									res		=> ofmap(i)
									);
	end generate pe_1_to_14;

end behavior;
