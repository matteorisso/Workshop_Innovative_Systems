library ieee;
use ieee.std_logic_1164.all;
use work.fixed_pkg.all; 

package ifmap_ofmap_type is

	--constant ifmap_size : natural := 400;
	--constant ofmap_size : natural := 120;
	constant pe_number	: natural := 20;
	constant qi			: natural := 8;
	constant qf			: natural := 8;
	
	type ifmap_type is array(0 to pe_number-1) of sfixed(qi-1 downto -qf);
	
end package ifmap_ofmap_type;

library ieee;
use ieee.std_logic_1164.all;
use work.fixed_pkg.all; 

use work.ifmap_ofmap_type.all;

entity fully_connected is

  --generic(
    --ifmap_size : integer;
    --ofmap_size : integer
    --);
  
	port(	
		clk, rst_n : in std_logic;
		ifmap, weights : in ifmap_type;
		ofmap : out ifmap_type
    );
	
end entity;

architecture behavior of fully_connected is
	
	component pe
		generic ( 	
			qi : natural := 8; 
			qf : natural := 8 
		);
		port (	
			ck, rstn : in 	std_logic; 	
			im, k  	: in  sfixed( qi-1 downto -qf );
			psum	 	: out sfixed( qi-1 downto -qf )
		);
	end component;
	
begin

	mac_1_to_20 : for i in 0 to 19 generate 
		mac : pe generic map ( qi => qi, 
							   qf => qf 
							 ) 
				 port map ( ck => clk, 
				            rstn => rst_n,
							im => ifmap(i),
							k => weights(i), 
							psum => ofmap(i)
							);
	end generate mac_1_to_20;

end behavior;
