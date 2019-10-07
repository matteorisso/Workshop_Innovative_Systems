library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.globals.all;

entity addr_gen is
port(
	ck  					: in 	std_logic;
	rst 					: in 	std_logic;
	en				 		: in 	std_logic; 
	offset_val			: in 	unsigned(clog2v downto 0);
	tilev_ptr			: in 	unsigned(clog2v downto 0);
	tileh_ptr			: in 	unsigned(clog2v downto 0);
	even_addr			: out unsigned(clog2X-1 downto 0);
	odd_addr				: out unsigned(clog2X-1 downto 0)
	); 
end entity;

architecture beh of addr_gen is

signal int_en 				: std_logic;
signal int_even_addr		: unsigned(clog2X-1 downto 0);
signal int_even_offset 	: unsigned(clog2X-1 downto 0); 
signal int_odd_addr		: unsigned(clog2X-1 downto 0);
signal int_odd_offset	: unsigned(clog2X-1 downto 0); 
signal int_offset_val 	: unsigned(clog2X-1 downto 0); 
signal int_tilev_ptr 	: unsigned(clog2v downto 0);  
signal int_tileh_ptr 	: unsigned(clog2h downto 0); 

begin

int_en			 	<= en; 
int_offset_val		<= offset_val(offset_val'high)&offset_val(offset_val'high)&offset_val; --TEMPORARY ! GENERIC
int_tilev_ptr		<= tilev_ptr;
int_tileh_ptr 		<= tileh_ptr;

-------------------------------------------------

even_addr 	<= int_even_addr;
odd_addr		<= int_odd_addr; 

-------------------------------------------------

even_addr_gen:
process(ck,rst)
begin
if rst = '1' then
	int_even_addr 			<= (others=>'0');
	int_even_offset	  	<= (others=>'0'); 
	
elsif rising_edge(ck) then
	if int_en = '1' then
		if int_tileh_ptr(int_tileh_ptr'low) = '0' then
			int_even_offset <= int_even_offset + int_offset_val;
		end if;
	else
		int_even_addr <= int_even_offset + int_tilev_ptr; 
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
	if int_en = '1' then
		if int_tileh_ptr(int_tileh_ptr'low) = '1' then
			int_odd_offset <= int_odd_offset + int_offset_val;
		end if;
	else
		int_odd_addr 	<= int_odd_offset + int_tilev_ptr; 
	end if; 
end if; 
end process;

end architecture; 
