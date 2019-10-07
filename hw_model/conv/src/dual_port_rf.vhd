library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.globals.all;

entity dual_port_rf is
port( 
		ck 		: in 	std_logic;
		rst		: in 	std_logic;
		cs 		: in 	std_logic; 
		rd			: in 	std_logic;
		wr			: in 	std_logic;
		rd_addr	: in 	unsigned(clog2X-1 downto 0);
		wr_addr 	: in 	unsigned(clog2X-1 downto 0);
		i_data	: in 	signed(N*W-1 downto 0); 
		o_data 	: out signed(N*W-1 downto 0)); 
end entity;

architecture beh of dual_port_rf is

type int_mem_t is array (0 to W*X-1) of signed(N*W-1 downto 0);
signal word : int_mem_t := (others => (others => '0')); 

begin

wr_proc: process(ck)
begin
if rising_edge(ck) then
	if ( cs = '1' and wr = '1') then 
		word(to_integer(wr_addr)) <= i_data; 
	end if; 
end if; 
end process; 

rd_proc: process(ck,rst)
begin
if rst = '1' then
	o_data	<=(others=>'0');
elsif rising_edge(ck) then
	if ( cs = '1' and rd = '1') then
		o_data <= word(to_integer(rd_addr)); 
	end if;
end if;
end process; 

end architecture;
