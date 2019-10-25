library ieee;

use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.globals.all;

entity weight_buffer is 
port( 
		ck 			: in 	std_logic;
		rst			: in 	std_logic;
		cs				: in 	std_logic;
		rd_wr_n		: in 	std_logic;
		vmode_ptr	: in 	unsigned(clog2K-1 downto 0);
		hmode_ptr	: in 	unsigned(clog2K-1 downto 0);
		i_data		: in 	std_logic_vector(2*K-1 downto 0);
		o_data 		: out std_logic_vector(1 downto 0));
end entity;

architecture rtl of weight_buffer is

type reg_t is array (0 to K-1) of std_logic_vector(2*K-1 downto 0); 

constant reg 			: reg_t := (others=>("1011001011")); 
signal int_addr_msb	: integer:=0; 
signal int_addr_lsb	: integer:=0;


begin

int_addr_msb	<= to_integer(vmode_ptr);
int_addr_lsb	<= to_integer(hmode_ptr);

process(ck,rst)
begin
if rst = '1' then

	o_data <= (others=>'0');
	
elsif rising_edge(ck) then
	
	if ( cs = '1' and rd_wr_n = '1' ) then
	
		o_data 	<= 	reg(int_addr_msb)(2*K-1 - 2*int_addr_lsb downto 2*K - 2*(int_addr_lsb+1)); 
							
--	elsif ( cs = '1' and rd_wr_n = '0' ) then
--		
--		reg(to_integer(vmode_ptr)) <= i_data;
		
	end if;
	
end if;
end process; 


end architecture;

