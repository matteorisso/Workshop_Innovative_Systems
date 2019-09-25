library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.param.all;

entity sync_fifo is
port(
		ck 	 	: in std_logic; 
		rst	 	: in std_logic; 
		ld 	 	: in std_logic;
		rd_ptr 	: in unsigned(2 downto 0);
		wr_ptr 	: in unsigned(1 downto 0);
		i_data 	: in  RFRowData; 
		o_data 	: out PEBlockData);
end entity;

architecture rtl of sync_fifo is

signal int_mask 	: std_logic_vector(0 to W-1);
signal int_en 		: std_logic_vector(0 to W-1);

signal ss		 	: PEBlockData; 

begin
data_b:
entity work.data_buffer port map (
	ck 		=> ck, 
	rst 	=> rst, 
	en 		=> int_mask, 
	rd_ptr 	=> rd_ptr, 
	i_data 	=> i_data, 
	o_data 	=> ss);	

row_sel:
process(ss, wr_ptr)
begin
case( wr_ptr ) is 
	when "01"   => o_data <= ss(1 to ss'length-1) & ss(0); 
	when "10"   => o_data <= ss(2 to ss'length-1) & ss(0 to 1); 
	when "11" 	=> o_data <= ss(3 to ss'length-1) & ss(0 to 2);
	when others => o_data <= ss;
end case;
end process; 

en_mask:
for i in 0 to (int_en'length-1) generate
	int_mask(i) <= int_en(i) and ld; 
end generate;

dec2_4:
process(wr_ptr)
begin
case(wr_ptr) is 
	when "01"   => int_en <= "0100"; 
	when "10"   => int_en <= "0010"; 
	when "11" 	=> int_en <= "0001";
	when others => int_en <= "1000";
end case;
end process;

end architecture;  
 