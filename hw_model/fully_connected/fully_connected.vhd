library ieee;
use ieee.std_logic_1164.all;
use work.fixed_pkg.all; 
use work.param.all;

entity fully_connected is

	port(	
		clk		: in std_logic;
		rst_n	: in std_logic;
		ifmap	: in ifmap_type;
		weights : in ifmap_type;
		ofmap 	: out ifmap_type
    );
	
end entity;

architecture behavior of fully_connected is
	
	component pe
		generic( 	
			qi : natural := 8; 
			qf : natural := 8 
		);
		port(	
			ck		: in 	std_logic;  
			rstn	: in 	std_logic; 	
			im		: in  sfixed( qi-1 downto -qf ); 
			k  		: in  sfixed( qi-1 downto -qf );
			psum	: out sfixed( qi-1 downto -qf )
		);
	end component;
	
begin

	mac_1_to_20 : for i in 0 to pe_number-1 generate 
		mac : pe generic map( 
							qi => qi, 
							qf => qf 
							) 
				 port map( 
						ck		=> clk, 
				        rstn	=> rst_n,
						im 		=> ifmap(i),
						k 		=> weights(i), 
						psum 	=> ofmap(i)
						);
	end generate mac_1_to_20;

end behavior;
