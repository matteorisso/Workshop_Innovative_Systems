library ieee;

use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.param.all;

entity weight_buffer is --wrapper
port( 
		ck 		: in std_logic;
		rst		: in std_logic;
		cs			: in std_logic;
		rd			: in std_logic;
		vmode_ptr: in unsigned(clog2K-1 downto 0);
		hmode_ptr: in unsigned(clog2K-1 downto 0);
		o_data 	: out std_logic);
end entity;

architecture rtl of weight_buffer is

type reg_array is array (0 to K-1) of std_logic_vector(K-1 downto 0); 

constant reg: reg_array	:=	(	 
					(others=>'0'), 
					(others=>'1'), 
					(others=>'0'), 
					(others=>'1'), 
					(others=>'0')); 
begin

process(ck,rst)
begin
if rst = '1' then
	o_data <= '0';
elsif (ck'event and ck = '1') then
	if ( cs = '1' and rd = '1') then
		o_data <= reg(to_integer(vmode_ptr))(to_integer(hmode_ptr)); 
	end if;
end if;

end process; 
end architecture;

