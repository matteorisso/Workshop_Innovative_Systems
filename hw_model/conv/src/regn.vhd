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

begin

process(ck, en, rst)
begin
if rst = '1' then

	q <= (others=>'0');

elsif ck'event and ck='1' and en='1' then
	
	q <= d;

end if;
end process; 

end architecture;