library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.param.all;

entity wr_pipe is 
port( 
		ck 	 : in  std_logic; 
		rst 	 : in  std_logic; 
		EN_RES_PTR : in std_logic; 
		TC_RES 	  : out std_logic;
		i_data : in  PEBlockDataRes;
		o_data : out PEResData);
end entity;

architecture beh of wr_pipe is 

signal int_res00 : signed((N+G)-1 downto 0);
signal int_res01 : signed((N+G)-1 downto 0);
signal int_res02 : signed((N+G)-1 downto 0);
signal int_res03 : signed((N+G)-1 downto 0);
signal int_res10 : signed((N+G)-1 downto 0);
signal int_res11 : signed((N+G)-1 downto 0);
signal int_res12 : signed((N+G)-1 downto 0);
signal int_res13 : signed((N+G)-1 downto 0);
signal int_res20 : signed((N+G)-1 downto 0);
signal int_res21 : signed((N+G)-1 downto 0);
signal int_res22 : signed((N+G)-1 downto 0);
signal int_res23 : signed((N+G)-1 downto 0);
signal int_res30 : signed((N+G)-1 downto 0);
signal int_res31 : signed((N+G)-1 downto 0);
signal int_res32 : signed((N+G)-1 downto 0);
signal int_res33 : signed((N+G)-1 downto 0);

signal int_en_res_ptr : std_logic; 
signal int_tc_res 	 : std_logic; 
signal int_arv_res 	 : unsigned(1 downto 0);
signal int_res_ptr 	 : unsigned(1 downto 0);


signal int_d_reg	: PEResData; 
signal int_q_reg 	: PEResData;

begin

int_res00 <= i_data(0)(PEResData'length-1-(G+N)*0 downto PEResData'length-(G+N)*1);
int_res01 <= i_data(0)(PEResData'length-1-(G+N)*1 downto PEResData'length-(G+N)*2);
int_res02 <= i_data(0)(PEResData'length-1-(G+N)*2 downto PEResData'length-(G+N)*3);
int_res03 <= i_data(0)(PEResData'length-1-(G+N)*3 downto PEResData'length-(G+N)*4);

int_res10 <= i_data(1)(PEResData'length-1-(G+N)*0 downto PEResData'length-(G+N)*1);
int_res11 <= i_data(1)(PEResData'length-1-(G+N)*1 downto PEResData'length-(G+N)*2);
int_res12 <= i_data(1)(PEResData'length-1-(G+N)*2 downto PEResData'length-(G+N)*3);
int_res13 <= i_data(1)(PEResData'length-1-(G+N)*3 downto PEResData'length-(G+N)*4);

int_res20 <= i_data(2)(PEResData'length-1-(G+N)*0 downto PEResData'length-(G+N)*1);
int_res21 <= i_data(2)(PEResData'length-1-(G+N)*1 downto PEResData'length-(G+N)*2);
int_res22 <= i_data(2)(PEResData'length-1-(G+N)*2 downto PEResData'length-(G+N)*3);
int_res23 <= i_data(2)(PEResData'length-1-(G+N)*3 downto PEResData'length-(G+N)*4);

int_res30 <= i_data(3)(PEResData'length-1-(G+N)*0 downto PEResData'length-(G+N)*1);
int_res31 <= i_data(3)(PEResData'length-1-(G+N)*1 downto PEResData'length-(G+N)*2);
int_res32 <= i_data(3)(PEResData'length-1-(G+N)*2 downto PEResData'length-(G+N)*3);
int_res33 <= i_data(3)(PEResData'length-1-(G+N)*3 downto PEResData'length-(G+N)*4);

o_data	<= int_q_reg;
TC_RES 	<= int_tc_res;

int_en_res_ptr <= EN_RES_PTR; 
int_arv_res 	<= to_unsigned(W-1,clog2W); 

res_cnt: 
entity work.countern generic map(N => clog2W) 
							port map(
	ck 	=> ck, 
	rst	=> rst,
	en 	=> int_en_res_ptr,
	arv	=> int_arv_res,
	q 		=> int_res_ptr,
	tc 	=> int_tc_res);
	
mux:
process(int_res_ptr, i_data)
begin
case (int_res_ptr) is
	when "01" 	=> int_d_reg <= i_data(1);
	when "10" 	=> int_d_reg <= i_data(2);
	when "11" 	=> int_d_reg <= i_data(3);
	when others => int_d_reg <= i_data(0);
end case;
end process; 

pipe:
process(ck,int_en_res_ptr)
begin
if ck'event and ck='1' and int_en_res_ptr='1' then
	if rst = '1' then
		int_q_reg <= (others=>'0');
	else
		int_q_reg <= int_d_reg;
	end if;
end if;
end process;
end architecture; 