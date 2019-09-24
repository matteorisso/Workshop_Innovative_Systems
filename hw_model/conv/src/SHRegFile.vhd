library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.param.all;

entity SHRegFile is
generic ( W : natural:= W ; WL : natural:= WL ; N : natural:= N );
port(
		ck 	 : in std_logic; 
		rst	 : in std_logic; 
		en 	 : in std_logic_vector(0 to W-1);
		rd_ptr : in unsigned(2 downto 0);
		i_data : in  RFRowData; 
		o_data : out PEBlockData);
end entity;

architecture rtl_v1 of SHRegFile is

signal ss: RFBlockData; 

begin

r:entity work.regfile 	generic map (W => W, WL => WL) 
					port map (ck => ck, rst => rst, en => en, i_data => i_data, o_data => ss);
					
sGen: for i in 0 to W-1 generate
		hsi: entity work.shift5p generic map (W => W, WL => WL, N => N)
							port map (sel => rd_ptr, i_data => ss(i), o_data => o_data(i));
end generate; 


end architecture; 
