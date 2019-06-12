library ieee;
use ieee.std_logic_1164.all;
use work.fixed_pkg.all;
use work.param.all;

entity regn_tanh1 is
generic ( 	qi : natural:= 8; qf : natural:= 8 );
	
port(
		d 	:	in sfixed(qi-1 downto -qf);
		ck, 
		rstn, 
		en	:	in std_logic;
		q  :  out sfixed(qi-1 downto -qf)
		);
end entity;

architecture behavior of regn_tanh1 is
begin

process(ck,rstn)

begin

if (rstn = '0') then

	q <= (others=>'0');

elsif (rising_edge(ck) and en = '1') then

	q <= d; 

 
end if;
end process;

end architecture behavior; 
