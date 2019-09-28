library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.param.all;

entity tb_fsm is
end entity;

architecture test of tb_fsm is 

signal ck_tb 	      : std_logic;
signal rst_tb 	      : std_logic; 
signal start_tb      : std_logic; 
signal done_tb  	  : std_logic; 


signal int_tc_rd      : std_logic;
signal int_tc_wr      : std_logic;
signal int_tc_vmode	  : std_logic; 
signal int_tc_res     : std_logic;
signal int_tc_tilev   : std_logic;
signal int_tc_tilec   : std_logic;

signal int_en_rd_ptr  : std_logic;
signal int_en_wr_ptr  : std_logic; 
signal int_en_res_ptr : std_logic; 

signal i_kernel_tb    : std_logic_vector(1 downto 0):= (others=>'0');
signal i_data_tb      : RFRowData;
signal o_data_tb      : PEResData; 

begin

-------------------------------------------------

ckgen: process(ck_tb)
begin
if ck_tb = 'U' then 
	ck_tb <= '0'; 
else
	ck_tb <= not ck_tb after 5 ns; 
end if; 
end process;

-------------------------------------------------

stimuli: process
begin
rst_tb 	<= '1';
start_tb <= '0';
wait for 20 ns;
rst_tb 	<= '0';
wait for 5 ns;
start_tb <= '1';
wait for 20 ns;
start_tb <= '0'; 
wait;
end process;

stimuli2: process
begin
i_data_tb <= to_signed(0, WL);
wait until ck_tb'event and ck_tb='1' and int_en_wr_ptr = '1';
i_data_tb <= to_signed(1, WL);
wait until ck_tb'event and ck_tb='1';
i_data_tb <= to_signed(2, WL);
wait until ck_tb'event and ck_tb='1';
i_data_tb <= to_signed(3, WL);
wait until ck_tb'event and ck_tb='1';
i_data_tb <= to_signed(4, WL);
wait until ck_tb'event and ck_tb='1' and int_en_wr_ptr = '1';
i_data_tb <= to_signed(-1, WL);
wait;
end process;

-------------------------------------------------

-- DUT

cu: 
entity work.conv_fsm port map (
	ck	 		=> ck_tb, 
	rst 		=> rst_tb,
	start 		=> start_tb,
	TC_WR 		=> int_tc_wr, 
	TC_HMODE	=> int_tc_rd,
	TC_VMODE	=> int_tc_vmode,
	TC_RES      => int_tc_res,
	TC_TILEV    => int_tc_tilev, 
	TC_TILEC 	=> int_tc_tilec,
	EN_RD_PTR  	=> int_en_rd_ptr,
	EN_WR_PTR  	=> int_en_wr_ptr,
	EN_RES_PTR 	=> int_en_res_ptr,
	done  	  	=> done_tb);
					
dp: 
entity work.main port map (
	ck	 		=> ck_tb, 
	rst 		=> rst_tb,
	TC_WR 		=> int_tc_wr, 
	TC_HMODE	=> int_tc_rd,
	TC_VMODE	=> int_tc_vmode,
	TC_RES  	=> int_tc_res,
	TC_TILEV	=> int_tc_tilev, 
	TC_TILEC 	=> int_tc_tilec,
	EN_RD_PTR  	=> int_en_rd_ptr,
	EN_WR_PTR  	=> int_en_wr_ptr,
	EN_RES_PTR 	=> int_en_res_ptr,
	i_kernel 	=> i_kernel_tb,
	i_data 		=> i_data_tb,
	o_data 		=> o_data_tb);
	
end architecture; 