library ieee;
use ieee.numeric_std.all;

entity sign_ext is

	generic( ni : natural ; no : natural );
	
	port(	
		  d 		:	in  signed(ni-1 downto 0);
		  d_ext     :   out signed(no-1 downto 0)
		  
		);

end entity;

architecture beh of sign_ext is

begin

    d_ext <=signed(resize(signed(d), d_ext'length));
	
end architecture;