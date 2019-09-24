library ieee;
use ieee.std_logic_1164.all; 
use ieee.numeric_std.all;

entity regn is
generic ( N : natural := 4 );
port ( 
		d 		: in signed(N-1 downto 0);
		ck		: in std_logic; 
		rst	: in std_logic;
		en 	: in std_logic; 
		q 		: out signed(N-1 downto 0));
end entity;

architecture beh of regn is

signal int_en : std_logic;

begin

int_en <= rst or en;
process(ck,int_en)
begin
if ck'event and ck='1' and int_en='1' then
	if rst = '1' then
		q <= (others=>'0');
	else
		q <= d;
	end if;
end if;
end process; 

end architecture;