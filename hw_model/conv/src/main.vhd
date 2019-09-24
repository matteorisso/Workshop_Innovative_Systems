library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.param.all;

-- caps-lock : FSM interface, i/o entity
-- int_* 	 : internal signals
-- i_* 		 : input data
-- o_*		 : output data

entity main is 
port(
		ck  : in std_logic; 
		rst : in std_logic;
		EN_RD_PTR  	: in std_logic;
		EN_WR_PTR  	: in std_logic;
		EN_RES_PTR 	: in std_logic;  
		TC_WR			: out std_logic; 
		TC_HMODE		: out std_logic;
		TC_VMODE		: out std_logic;
		TC_RES		: out std_logic; 
		TC_TILEV		: out std_logic; 
		TC_TILEC 	: out std_logic;
		i_kernel 	: in 	std_logic;
		i_data 		: in  RFRowData;
		o_data		: out PEResData);
end entity; 

architecture rtl of main is

signal int_o_data 		: PEBlockDataRes;

signal int_pe_en 			: std_logic; 
signal int_pe_rst 		: std_logic; 

signal int_k_cs			: std_logic;
signal int_k_rd			: std_logic;  
signal int_k_data			: std_logic;

signal int_tc_rd			: std_logic;
signal int_tc_wr 			: std_logic; 
signal int_tc_vmode		: std_logic;
signal int_tc_res 		: std_logic; 

signal int_tc_tilev 		: std_logic;
signal int_tc_tileh 		: std_logic;
signal int_tc_tilec 		: std_logic;

signal int_en_rd_ptr	 	: std_logic;
signal int_en_wr_ptr	 	: std_logic; 
signal int_en_res_ptr 	: std_logic; 
signal int_en_vmode_cnt : std_logic;

signal int_rd_ptr 		: unsigned(clog2K-1 downto 0);
signal int_wr_ptr 		: unsigned(clog2W-1 downto 0);
signal int_vmode_ptr 	: unsigned(clog2K-1 downto 0);

signal int_arv_rd 		: unsigned(clog2K-1 downto 0);
signal int_arv_wr 		: unsigned(clog2W-1 downto 0);
signal int_arv_tilev 	: unsigned(clog2v-1 downto 0);
signal int_arv_tileh	 	: unsigned(clog2h-1 downto 0);
signal int_arv_tilec 	: unsigned(clog2c-1 downto 0);

signal int_arv_wr_ckg	: unsigned(clog2W-1 downto 0);
signal int_ckg_size		: unsigned(clog2W-1 downto 0);

signal int_msb_addr		: unsigned(clog2MSBaddr-1 downto 0);
signal int_addr 			: unsigned(clog2addr-1 downto 0);

constant task 				: natural := 1;
constant C1					: natural := 1;
 
begin
-------------------------------------------------

-- intern

int_pe_rst 			<= rst or int_tc_res;
int_pe_en 	   	<= not int_en_res_ptr;   

int_en_vmode_cnt  <= int_tc_rd;

int_k_cs				<= '1';
int_k_rd				<= int_en_rd_ptr;

int_addr 			<= int_msb_addr & int_wr_ptr;
int_arv_wr_ckg 	<= int_ckg_size 
							when int_tc_tilev = '1' 
							else int_arv_wr;

-------------------------------------------------

-- ports

TC_WR 	<= int_tc_wr;
TC_HMODE <= int_tc_rd;
TC_VMODE <= int_tc_vmode;
TC_RES  	<= int_tc_res;
TC_TILEV <= int_tc_tilev;
TC_TILEC <= int_tc_tilec;

int_en_rd_ptr  <= EN_RD_PTR;
int_en_wr_ptr  <= EN_WR_PTR;
int_en_res_ptr <= EN_RES_PTR;

-------------------------------------------------
WEIGHT_BUFFER:
entity work.weight_buffer port map (
	ck 		 => ck,
	rst		 => rst,
	cs 		 => int_k_cs,
	rd 		 => int_k_rd,
	vmode_ptr => int_vmode_ptr,
	hmode_ptr => int_rd_ptr,
	o_data 	 => int_k_data);
	
DP: 
entity work.PEBF port map(
	ck 	 	 => ck,
	rst	 	 => rst,
	ld 	 	 => int_en_wr_ptr,
	pe_en		 => int_pe_en,
	pe_rst	 => int_pe_rst,
	rd_ptr 	 => int_rd_ptr,
	wr_ptr 	 => int_wr_ptr,
	i_kernel  => int_k_data,
	i_data 	 => i_data,
	o_data 	 => int_o_data);

WRPIPE:
entity work.wr_pipe port map (
	ck			 => ck,
	rst 		 => rst,
	EN_RES_PTR=> int_en_res_ptr, 
	TC_RES 	 => int_tc_res,
	i_data 	 => int_o_data,
	o_data 	 => o_data);	

FIFOPTR:
entity work.FIFO_ptr port map(
	ck 		 => ck, 
	rst 		 => rst,
	en_wr_ptr => int_en_wr_ptr,
	en_rd_ptr => int_en_rd_ptr,
	arv_wr 	 => int_arv_wr,
	arv_rd    => int_arv_rd,
	wr_ptr 	 => int_wr_ptr,
	rd_ptr 	 => int_rd_ptr,
	tc_wr 	 => int_tc_wr,
	tc_rd 	 => int_tc_rd);

ADDRGEN: 
entity work.addr_gen port map(
	ck 		 		=> ck,
	rst		 		=> rst,
	int_en_wr_ptr	=> int_en_wr_ptr,
	int_tc_wr		=> int_tc_wr,
	arv_tilev		=> int_arv_tilev,
	arv_tileh		=> int_arv_tileh,
	arv_tilec		=> int_arv_tilec,
	TC_TILEV 		=> int_tc_tilev,
	TC_TILEH 		=> int_tc_tileh,
	TC_TILEC 		=> int_tc_tilec,
	MSB_ADDR 		=> int_msb_addr);

VMODECNT:
entity work.countern generic map (N => clog2K) port map (
	ck 	=> ck, 
	rst 	=> rst, 
	en	 	=> int_en_vmode_cnt, 
	arv	=> int_arv_rd,
	q		=> int_vmode_ptr,
	tc		=> int_tc_vmode);
	
UROM: 
process(ck)
begin
case(task) is
when C1 => 
			int_arv_rd 		<= to_unsigned(K-1,clog2K);
			int_arv_wr 		<= to_unsigned(W-1,clog2W);
			int_arv_tilev	<= to_unsigned(C1_NB_TILEV-1,clog2v);
			int_arv_tileh 	<= to_unsigned(C1_NB_TILEH-1,clog2h);
			int_arv_tilec 	<= to_unsigned(C1_NB_TILEC-1,clog2c);
			int_ckg_size 	<= to_unsigned(C1_LT_CKG,clog2W);
			
when others =>
end case;
end process;
							
end architecture; 

-- TODO: apply ckg mask at PE Block , feed with 0 fifo word? or ckg fifo register with same mask of pe cols 	
-- TODO: add fine-grained ckg to registers in PE Block (conv psum width < fc psum width)							

