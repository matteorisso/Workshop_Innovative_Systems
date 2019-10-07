library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.param.all;

entity mem is
generic( H : natural:= 32/WL*32 ; WL : natural := WL); 
port( 
		ck 		: in 	std_logic;
		cs 		: in 	std_logic; 
		rd		: in 	std_logic;
		wr		: in 	std_logic;
		rd_addr : in 	unsigned(7 downto 0);
		wr_addr : in 	unsigned(7 downto 0);
		i_data	: in 	signed(WL-1 downto 0); 
		o_data 	: out 	signed(WL-1 downto 0)); 
end entity;

architecture beh of mem is

type mem_type is array (0 to H-1) of signed(WL-1 downto 0); 
signal mem: mem_type := (others => (others => '0')); 

begin

wr_proc: process(ck)
begin
if (ck'event and ck = '1') then
	if ( cs = '1' and wr = '1') then 
		mem(to_integer(wr_addr)) <= i_data; 
	end if; 
end if; 
end process; 

rd_proc: process(ck) 
begin
if (ck'event and ck = '1') then
	if ( cs = '1' and rd = '1') then
		o_data <= mem(to_integer(rd_addr)); 
	end if;
end if;
end process; 

end architecture;
