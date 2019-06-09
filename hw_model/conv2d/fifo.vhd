library ieee;
use ieee.std_logic_1164.all;
use work.fixed_pkg.all;

entity fifo is
generic ( qi : natural := 8; qf : natural := 8; dim : natural :=5 );
port (
			din  		: in  sfixed(qi-1 downto -qf );
			ck, rstn : in  std_logic; 
			ld		 	: in  std_logic; 
			dout 		: out sfixed(qi-1 downto -qf )); 
end entity; 


architecture structure of fifo is

component regn
generic ( qi : natural:= 1; qf : natural:= 15 );	
port(
		d 	:	in sfixed(qi-1 downto -qf);
		ck, 
		rstn, 
		en	:	in std_logic;

		q  :  out sfixed(qi-1 downto -qf));

end component; 

type myt is array (0 to dim-1) of sfixed(qi-1 downto -qf);
signal q : myt ; 

begin

end architecture structure; 

