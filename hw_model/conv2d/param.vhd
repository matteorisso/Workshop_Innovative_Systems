use work.fixed_pkg.all;

package param is

	constant qi : natural := 8; 
	constant qf : natural := 8;

	constant filter_size : natural := 5;
	constant stride 		: natural := 1; 	
	constant array_c		: natural := 4; 

	-- subtype sfixed ? 
	
	type filter		is array ( 0 to filter_size-1) of sfixed (qi-1 downto -qf);
	-- pe_array
	type imap    	is array ( 0 to ( filter_size - 2 ) ) of sfixed (qi-1 downto -qf);
	type psum		is array ( 0 to filter_size*array_c - 1 ) of sfixed (qi-1 downto -qf);
	type omap		is array ( 0 to array_c  - 1 ) of sfixed (qi-1 downto -qf);
	-- im_pad
	type imap_rf	is array ( 0 to filter_size - stride) of sfixed (qi-1 downto -qf);

end param;
