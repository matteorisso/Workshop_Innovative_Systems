library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.globals.all;

entity addr_gen is
port(
	ck  					: in 	std_logic;
	rst 					: in 	std_logic;
	inc					: in 	std_logic; 
	even_odd_n			: in 	std_logic;
	offset_val			: in 	unsigned(clog2v downto 0);
	tilev_ptr			: in 	unsigned(clog2v downto 0);
	tc_tilev				: in std_logic;
	even_addr			: out unsigned(clog2X-1 downto 0);
	odd_addr				: out unsigned(clog2X-1 downto 0)
	); 
end entity;

architecture beh of addr_gen is

signal int_inc 				: std_logic;
signal int_even_odd_n		: std_logic;
signal int_tc_tilev			: std_logic; 
signal int_even_addr			: unsigned(clog2X-1 downto 0);
signal int_even_offset 		: unsigned(clog2X-1 downto 0); 
signal int_odd_addr			: unsigned(clog2X-1 downto 0);
signal int_odd_offset		: unsigned(clog2X-1 downto 0); 
signal int_offset_val 		: unsigned(clog2X-1 downto 0); 
signal int_tilev_ptr 		: unsigned(clog2v downto 0);  
signal int_after_init_val	: unsigned(clog2X-1 downto 0);

begin

int_inc			 	<= inc; 
--int_even_odd_n		<= even_odd_n;
int_offset_val		<= offset_val(offset_val'high)&offset_val(offset_val'high)&offset_val; --TEMPORARY ! GENERIC
int_tilev_ptr		<= tilev_ptr;
int_tc_tilev		<= tc_tilev; 

even_addr 			<= int_even_addr;
odd_addr				<= int_odd_addr; 

-------------------------------------------------
even_odd_n_proc:
process(ck,rst)
begin
	if rst = '1' then
		int_even_odd_n <= '0';
	elsif rising_edge(ck) and int_inc = '1' then
		int_even_odd_n <= not int_even_odd_n;
	end if;
end process;

after_init_proc:
process(ck,rst)
begin
	if rst = '1' then
		int_after_init_val <= (others=>'0');
	elsif rising_edge(ck) then
		if int_tc_tilev = '1' then
			int_after_init_val <= (others=>'0');
		end if; 
		if int_inc = '1' then
			int_after_init_val <= to_unsigned(1,int_after_init_val'length); 
		end if;
	end if;
end process; 



even_addr_gen:
process(ck,rst)
begin
	if rst = '1' then
		int_even_addr 			<= (others=>'0');
		int_even_offset	  	<= (others=>'0'); 
		
	elsif rising_edge(ck) then
		int_even_addr 	<= int_even_offset + int_tilev_ptr + int_after_init_val;  
			
		if int_even_odd_n = '1' then
				if int_tc_tilev = '1' then
					int_even_addr <= int_even_offset;		
				end if;
		elsif int_inc = '1' then
				int_even_offset <= int_even_offset + int_offset_val;
		end if; 
	end if;
end process;

odd_addr_gen:
process(ck,rst)
begin
	if rst = '1' then
		int_odd_addr 		<= (others=>'0');
		int_odd_offset	  	<= (others=>'0'); 
		
	elsif rising_edge(ck) then

		int_odd_addr 	<= int_odd_offset + int_tilev_ptr + int_after_init_val; 
			
		if int_even_odd_n = '0' then
				if int_tc_tilev = '1' then
					int_odd_addr <= int_odd_offset;		
				end if;
		elsif int_inc = '1' then
				int_odd_offset <= int_odd_offset + int_offset_val;
				
		end if; 
	end if;
end process;

end architecture; 
