library ieee;
use ieee.std_logic_1164.all;
use work.fixed_pkg.all;

entity adder is

	generic( 	
			qi : natural := 8;
			qf : natural := 8 
			);
	port(	
		a		: in 	sfixed(qi-1 downto -qf);  
		b 		: in 	sfixed(qi-1 downto -qf);
	--	cin 	: in  std_logic;
		res		: out sfixed(qi-1 downto -qf);
		cout	: out std_logic
	);
	
end entity;

architecture behavior of adder is

	signal tmp : sfixed(qi downto -qf); 

begin

	tmp  <= a + b; 	
	res  <= tmp(qi-1 downto -qf);
	cout <= tmp(qi);

end architecture behavior; 
