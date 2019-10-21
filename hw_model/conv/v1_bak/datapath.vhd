library ieee;

use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.globals.all;


entity datapath is
end entity;

architecture rtl of datapath is

component main
port(
	ck  					: in 	std_logic; 
	rst 					: in 	std_logic;
	task					: in 	layer_t;
	ctrl_en_pe			: in 	std_logic;
	ctrl_en_rd_ptr  	: in 	std_logic;
	ctrl_en_wr_ptr  	: in 	std_logic;
	ctrl_en_res_ptr 	: in 	std_logic;
	ctrl_en_vmode		: in  std_logic; 
	s_tc_wr				: out std_logic; 
	s_tc_hmode			: out std_logic;
	s_tc_vmode			: out std_logic;
	s_tc_res				: out std_logic; 
	s_ckg					: out std_logic; 
	s_tc_tilev			: out std_logic; 
	s_tc_tileh			: out std_logic; 
	s_tc_tileb			: out std_logic; 
	s_tc_tilec 			: out std_logic;
	i_kernel 			: in 	std_logic_vector(2*K*K-1 downto 0);
	i_data 				: in  FIFORowData;
	o_data				: out PEResData
	);
end component;

component imem_w
port(
	ck 				: in  std_logic;
	rst 				: in 	std_logic; 
	even_rd_addr	: in 	unsigned(clog2X-1 downto 0);
	even_wr_addr	: in 	unsigned(clog2X-1 downto 0);
	odd_rd_addr 	: in 	unsigned(clog2X-1 downto 0);
	odd_wr_addr 	: in 	unsigned(clog2X-1 downto 0);
	sel				: in	unsigned(clog2W-1 downto 0);
	sel2				: in 	std_logic; 
	i_data 			: in 	signed(2*N*W-1 downto 0);	
	o_data 			: out signed(2*N*W-1 downto 0);
	o_data2			: out int_mem_t
	);
end component;

component kmem_w
port( 
	ck 		: in 	std_logic;
	rst		: in 	std_logic;
	cs 		: in 	std_logic; 
	rd			: in 	std_logic;
	wr			: in 	std_logic;
	rd_addr	: in 	unsigned(clog2X-1 downto 0);
	wr_addr 	: in 	unsigned(clog2X-1 downto 0);
	i_data	: in 	signed(N*W-1 downto 0); 
	o_data 	: out signed(N*W-1 downto 0)
	); 
end component; 

begin

kernel_mem:
kmem_w port map (
	);

img_mem:
imem_w port map (
	);
	
npu:
main port map (
	);
end architecture; 
