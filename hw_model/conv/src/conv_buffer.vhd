library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.globals.all;

entity conv_buffer is
port(
	ck 		: in 	std_logic; 
	rst 		: in 	std_logic; 
	ld 	 	: in 	std_logic;
	rd_ptr 	: in 	unsigned(clog2W-1 downto 0); -- clog2(K-1)
 	wr_ptr 	: in 	unsigned(clog2W-1 downto 0); 
	i_data 	: in  signed(N*(K-1)-1 downto 0); 
	o_data 	: out PERowData2
	);
end entity;

architecture rtl of conv_buffer is

component regn
generic ( N : natural := 4 );
port ( 
	d 		: in 	signed(N-1 downto 0);
	ck		: in 	std_logic; 
	rst	: in 	std_logic;
	en 	: in 	std_logic; 
	q 		: out signed(N-1 downto 0)
	);
end component;

type int_conv_buffer_t is array (0 to W-1) of signed(N*(K-1)-1 downto 0);

signal int_o_data : int_conv_buffer_t; 

signal int_mask 	: std_logic_vector(0 to W-1);
signal int_en 		: std_logic_vector(0 to W-1);

begin

r_gen: 
for i in 0 to W-1 generate regi: 	
	regn 	generic map (N => N*(K-1)) port map (
		ck 	=> ck, 
		rst 	=> rst, 
		en	 	=> int_mask(i), 
		d 		=> i_data, 
		q 		=> int_o_data(i)
		);
end generate;
	
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

-- fixed k.size = 5

rd_mux:
process(rd_ptr, int_o_data)
begin
-- hmode cnt 
--	000
--	001
--	010
--	011
--	100
-- LSB: 1 downto 0 is rd ptr

case(rd_ptr) is 
	when "10"   => -- 4th column px
		o_data(0) <= int_o_data(0)( (N*(K-1)-1 -1*N) downto (N*(K-1) - 2*N) );
		o_data(1) <= int_o_data(1)( (N*(K-1)-1 -1*N) downto (N*(K-1) - 2*N) );
		o_data(2) <= int_o_data(2)( (N*(K-1)-1 -1*N) downto (N*(K-1) - 2*N) );
		o_data(3) <= int_o_data(3)( (N*(K-1)-1 -1*N) downto (N*(K-1) - 2*N) );
		
	when "11"   => -- 3rd column px
		o_data(0) <= int_o_data(0)( (N*(K-1)-1 -2*N) downto (N*(K-1) - 3*N) );
		o_data(1) <= int_o_data(1)( (N*(K-1)-1 -2*N) downto (N*(K-1) - 3*N) );
		o_data(2) <= int_o_data(2)( (N*(K-1)-1 -2*N) downto (N*(K-1) - 3*N) );
		o_data(3) <= int_o_data(3)( (N*(K-1)-1 -2*N) downto (N*(K-1) - 3*N) );
		
	when "00" 	=> -- 2nd column px
		o_data(0) <= int_o_data(0)( (N*(K-1)-1 -3*N) downto (N*(K-1) - 4*N) );
		o_data(1) <= int_o_data(1)( (N*(K-1)-1 -3*N) downto (N*(K-1) - 4*N) );
		o_data(2) <= int_o_data(2)( (N*(K-1)-1 -3*N) downto (N*(K-1) - 4*N) );
		o_data(3) <= int_o_data(3)( (N*(K-1)-1 -3*N) downto (N*(K-1) - 4*N) );
			
	when others => -- 1st column px
		o_data(0) <= int_o_data(0)( (N*(K-1)-1 -0*N) downto (N*(K-1) - 1*N) );
		o_data(1) <= int_o_data(1)( (N*(K-1)-1 -0*N) downto (N*(K-1) - 1*N) );
		o_data(2) <= int_o_data(2)( (N*(K-1)-1 -0*N) downto (N*(K-1) - 1*N) );
		o_data(3) <= int_o_data(3)( (N*(K-1)-1 -0*N) downto (N*(K-1) - 1*N) );
		
end case;
end process;

end architecture;
