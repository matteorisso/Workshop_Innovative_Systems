library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.globals.all;

entity cmp is 
generic( N : natural:= clog2v );
port(
	ck		: in std_logic;
	rst 	: in std_logic; 
	arv 	: in unsigned(N-1 downto 0);
	i_data: in unsigned(N-1 downto 0);
	tc		: out std_logic);
end entity;

architecture beh of cmp is

begin

tc <= '1' when i_data >= arv-1 else '0';

end architecture;