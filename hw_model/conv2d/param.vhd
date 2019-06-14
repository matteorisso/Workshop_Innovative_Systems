use work.fixed_pkg.all;

package param is

	constant qi : natural := 8; 
	constant qf : natural := 8;
	

	constant filter_size : natural := 5;
	constant stride 		: natural := 1; 	
	constant array_c		: natural := 4; 
	
	-- pe array
	type filter		is array ( 0 to filter_size ) of sfixed (qi-1 downto -qf);
	type imap_in	is array ( 0 to ( filter_size - 1 ) + ( array_c - 1 ) ) of sfixed (qi-1 downto -qf);
	type psum_row	is array ( 0 to filter_size*array_c - 1 ) of sfixed (qi-1 downto -qf);
	type omap		is array ( 0 to array_c  - 1 ) of sfixed (qi-1 downto -qf);

	-- pe 
	type imap_rf	is array ( 0 to filter_size - stride) of sfixed (qi-1 downto -qf);

end param;
