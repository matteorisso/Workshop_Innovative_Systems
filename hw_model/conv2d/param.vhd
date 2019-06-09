use work.fixed_pkg.all;

package param is

	constant qi : natural := 8; 
	constant qf : natural := 8;
--	constant r  : natural := 5;
	constant c  : natural := 4; 

	type kernel is array (0 to 4) of sfixed (qi-1 downto -qf);
	type impx 	is array (0 to 4+(c-1)) of sfixed (qi-1 downto -qf);
	type psum 	is array (0 to 5*c-1) of sfixed (qi-1 downto -qf);
	type ompx 	is array (0 to c-1) of sfixed (qi-1 downto -qf);
	
end param;
