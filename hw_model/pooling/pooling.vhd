library ieee;
use ieee.std_logic_1164.all;
use work.fixed_pkg.all; 

package IFMAP_OFMAP_type is

	--constant IFMAP_size : natural := 400;
	--constant OFMAP_size : natural := 120;
	constant PE_number : natural := 14;
	constant qi : natural := 8;
	constant qf : natural := 8;
	
	type IFMAP_type is array(0 to PE_number-1) of sfixed(qi-1 downto -qf);
	
end package IFMAP_OFMAP_type;

library ieee;
use ieee.std_logic_1164.all;
use work.fixed_pkg.all; 

use work.IFMAP_OFMAP_type.all;

entity pooling is

  --generic(
    --IFMAP_size : integer;
    --OFMAP_size : integer
    --);
  
	port(	
		CLK, RST_N, EN : in std_logic;
		IFMAP_a, IFMAP_b, IFMAP_c, IFMAP_d : in IFMAP_type;
		OFMAP : out IFMAP_type
    );
	
end entity;

architecture behavior of pooling is
	
	component PE_pooling
		generic ( 	
			qi : natural := 8; 
			qf : natural := 8 
		);
		port(	
			a, b, c, d 	: in 	sfixed(qi-1 downto -qf);
			clk, en, rstn : in std_logic;
			res	: out sfixed(qi-1 downto -qf)
		);
	end component;
	
begin

	PE_1_to_14 : for i in 0 to PE_number-1 generate 
		adder_tree : PE_pooling generic map ( qi => qi, 
							   qf => qf 
							 ) 
				 port map ( 
						a => IFMAP_a(i), 
						b => IFMAP_b(i), 
						c => IFMAP_c(i), 
						d => IFMAP_d(i), 	
						clk => CLK, 
						en => EN, 
						rstn => RST_N,
						res	=> OFMAP(i)
						);
	end generate PE_1_to_14;

end behavior;
