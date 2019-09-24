library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.param.all;

entity FIFO_ptr is 
port( 
		ck  : in std_logic; 
		rst : in std_logic; 
		en_wr_ptr: in std_logic;
		en_rd_ptr: in std_logic; 
		arv_wr : in  unsigned(clog2W-1 downto 0);
		arv_rd : in  unsigned(clog2K-1 downto 0);
		wr_ptr : out unsigned(clog2W-1 downto 0);
		rd_ptr : out unsigned(clog2K-1 downto 0);
		tc_wr  : out std_logic;
		tc_rd	 : out std_logic);
end entity;

architecture rlt of FIFO_ptr is

begin
							
wr_cnt: 
entity work.countern generic map (N => clog2W)
							port map (
										ck 	=> ck, 
										rst 	=> rst, 
										en 	=> en_wr_ptr, 
										arv	=> arv_wr, 
										q 		=> wr_ptr,
										tc 	=> tc_wr);
										
HMODECNT: 
entity work.countern 	generic map (N => clog2K)
							port map (
										ck 	=> ck, 
										rst 	=> rst, 
										en 	=> en_rd_ptr, 
										arv 	=> arv_rd, 
										q 		=> rd_ptr, 
										tc 	=> tc_rd);
end architecture; 