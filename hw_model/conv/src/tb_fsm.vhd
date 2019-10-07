
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.globals.all;

entity tb_fsm is
end entity;

architecture test of tb_fsm is 

signal ck_tb 	      : std_logic;
signal rst_tb 	      : std_logic; 
signal start_tb      : std_logic; 
signal done_tb  	 	: std_logic; 

signal int_tc_rd      : std_logic;
signal int_tc_wr      : std_logic;
signal int_tc_vmode	 : std_logic; 
signal int_tc_res     : std_logic;
signal int_tc_tilev   : std_logic;
signal int_tc_tilec   : std_logic;

signal int_en_pe		 : std_logic; 
signal int_en_rd_ptr  : std_logic;
signal int_en_wr_ptr  : std_logic; 
signal int_en_res_ptr : std_logic; 

signal i_kernel_tb    : std_logic_vector(2*K-1 downto 0):= (others=>'0');
signal i_data_tb      : RFRowData:= (others=>'0');
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

idata: process(ck_tb)
variable i_data_v : RFRowData:= (others=>'0'); 
begin
if rising_edge(ck_tb) then
	if int_en_wr_ptr = '1' then
		i_data_v 	:= i_data_v +1; 
		i_data_tb 	<= i_data_v;
	end if;
end if;
end process;

-------------------------------------------------

-- DUT

cu: 
entity work.conv_fsm port map (
	ck	 					=> ck_tb, 
	rst 					=> rst_tb,
	start 				=> start_tb,
	s_tc_wr 				=> int_tc_wr, 
	s_tc_hmode			=> int_tc_rd,
	s_tc_vmode			=> int_tc_vmode,
	s_tc_res     		=> int_tc_res,
	s_tc_tilev   	 	=> int_tc_tilev, 
	s_tc_tilec 			=> int_tc_tilec,
	ctrl_en_pe			=> int_en_pe,
	ctrl_en_rd_ptr  	=> int_en_rd_ptr,
	ctrl_en_wr_ptr  	=> int_en_wr_ptr,
	ctrl_en_res_ptr 	=> int_en_res_ptr,
	done  	  			=> done_tb);
					
dp: 
entity work.main port map (
	ck	 					=> ck_tb, 
	rst 					=> rst_tb,
	task					=> c2,
	s_tc_wr 				=> int_tc_wr, 
	s_tc_hmode			=> int_tc_rd,
	s_tc_vmode			=> int_tc_vmode,
	s_tc_res  			=> int_tc_res,
	s_tc_tilev			=> int_tc_tilev, 
	s_tc_tilec 			=> int_tc_tilec,
	ctrl_en_pe			=> int_en_pe,
	ctrl_en_rd_ptr  	=> int_en_rd_ptr,
	ctrl_en_wr_ptr  	=> int_en_wr_ptr,
	ctrl_en_res_ptr 	=> int_en_res_ptr,
	i_kernel 			=> i_kernel_tb,
	i_data 		=> i_data_tb,
	o_data 		=> o_data_tb);
	
end architecture; 