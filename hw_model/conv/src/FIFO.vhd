library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.param.all;

entity FIFO is
generic ( W : natural:= W ; WL : natural:= WL ; N : natural:= N );
port(
		ck 	 : in std_logic; 
		rst	 : in std_logic; 
		ld 	 : in std_logic;
		rd_ptr : in unsigned(2 downto 0);
		wr_ptr : in unsigned(1 downto 0);
		i_data : in  RFRowData; 
		o_data : out PEBlockData);
end entity;

architecture rtl of FIFO is

component SHRegFile
generic ( W : natural:= W ; WL : natural:= WL ; N : natural:= N );
port(
		ck 	 : in std_logic; 
		rst	 : in std_logic; 
		en 	 : in std_logic_vector(0 to W-1);
		rd_ptr : in unsigned(clog2K-1 downto 0);
		i_data : in  RFRowData; 
		o_data : out PEBlockData);
end component; 

signal int_mask 	: std_logic_vector(0 to W-1);
signal int_en 		: std_logic_vector(0 to W-1);

signal int_q_shreg: PEBlockData; 

begin

row_sel:
process(int_q_shreg,wr_ptr)
begin
case( wr_ptr ) is 
	when "01"   => o_data <= int_q_shreg(1 to int_q_shreg'length-1) & int_q_shreg(0); 
	when "10"   => o_data <= int_q_shreg(2 to int_q_shreg'length-1) & int_q_shreg(0 to 1); 
	when "11" 	=> o_data <= int_q_shreg(3 to int_q_shreg'length-1) & int_q_shreg(0 to 2);
	when others => o_data <= int_q_shreg;
end case;
end process; 

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

LDM: for i in 0 to (int_en'length-1) generate
	int_mask(i) <= int_en(i) and ld; 
end generate;

SRF: SHRegFile generic map ( W => W, WL => WL, N => N) port map (
		ck 		=> ck, 
		rst 		=> rst, 
		en 		=> int_mask, 
		rd_ptr 	=> rd_ptr, 
		i_data 	=> i_data, 
		o_data 	=> int_q_shreg);	

end architecture;  
 