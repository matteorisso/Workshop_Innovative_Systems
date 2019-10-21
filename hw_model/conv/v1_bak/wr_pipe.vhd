library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.globals.all;

entity wr_pipe is 
port( 
		ck 	 				: in  std_logic; 
		rst 	 				: in  std_logic; 
		ctrl_en_res_ptr 	: in 	std_logic;
		arv_res				: in 	unsigned(clog2W-1 downto 0);
		s_tc_res	 	 		: out std_logic;
		i_data 				: in  PEBlockDataRes;
		o_data		 		: out PEResData
		);
end entity;

architecture beh of wr_pipe is 

component countern 
generic ( N	: natural := 16 );    
port( 
	ck 			: in std_logic; 
	rst			: in std_logic; 
	sync_clr		: in std_logic; 
	en 			: in std_logic;
	arv			: in unsigned(N-1 downto 0); 
	q 				: out unsigned(N-1 downto 0); 
	tc				: out std_logic
	);
end component;

signal int_res00 : signed((N+BG)-1 downto 0);
signal int_res01 : signed((N+BG)-1 downto 0);
signal int_res02 : signed((N+BG)-1 downto 0);
signal int_res03 : signed((N+BG)-1 downto 0);
signal int_res10 : signed((N+BG)-1 downto 0);
signal int_res11 : signed((N+BG)-1 downto 0);
signal int_res12 : signed((N+BG)-1 downto 0);
signal int_res13 : signed((N+BG)-1 downto 0);
signal int_res20 : signed((N+BG)-1 downto 0);
signal int_res21 : signed((N+BG)-1 downto 0);
signal int_res22 : signed((N+BG)-1 downto 0);
signal int_res23 : signed((N+BG)-1 downto 0);
signal int_res30 : signed((N+BG)-1 downto 0);
signal int_res31 : signed((N+BG)-1 downto 0);
signal int_res32 : signed((N+BG)-1 downto 0);
signal int_res33 : signed((N+BG)-1 downto 0);

signal int_en_res_ptr : std_logic; 
signal int_tc_res 	 : std_logic; 
signal int_arv_res 	 : unsigned(1 downto 0);
signal int_res_ptr 	 : unsigned(1 downto 0);

signal int_d_reg	: PEResData; 
signal int_q_reg 	: PEResData;

begin

int_res00 <= i_data(0)(PEResData'length-1-(BG+N)*0 downto PEResData'length-(BG+N)*1);
int_res01 <= i_data(0)(PEResData'length-1-(BG+N)*1 downto PEResData'length-(BG+N)*2);
int_res02 <= i_data(0)(PEResData'length-1-(BG+N)*2 downto PEResData'length-(BG+N)*3);
int_res03 <= i_data(0)(PEResData'length-1-(BG+N)*3 downto PEResData'length-(BG+N)*4);

int_res10 <= i_data(1)(PEResData'length-1-(BG+N)*0 downto PEResData'length-(BG+N)*1);
int_res11 <= i_data(1)(PEResData'length-1-(BG+N)*1 downto PEResData'length-(BG+N)*2);
int_res12 <= i_data(1)(PEResData'length-1-(BG+N)*2 downto PEResData'length-(BG+N)*3);
int_res13 <= i_data(1)(PEResData'length-1-(BG+N)*3 downto PEResData'length-(BG+N)*4);

int_res20 <= i_data(2)(PEResData'length-1-(BG+N)*0 downto PEResData'length-(BG+N)*1);
int_res21 <= i_data(2)(PEResData'length-1-(BG+N)*1 downto PEResData'length-(BG+N)*2);
int_res22 <= i_data(2)(PEResData'length-1-(BG+N)*2 downto PEResData'length-(BG+N)*3);
int_res23 <= i_data(2)(PEResData'length-1-(BG+N)*3 downto PEResData'length-(BG+N)*4);

int_res30 <= i_data(3)(PEResData'length-1-(BG+N)*0 downto PEResData'length-(BG+N)*1);
int_res31 <= i_data(3)(PEResData'length-1-(BG+N)*1 downto PEResData'length-(BG+N)*2);
int_res32 <= i_data(3)(PEResData'length-1-(BG+N)*2 downto PEResData'length-(BG+N)*3);
int_res33 <= i_data(3)(PEResData'length-1-(BG+N)*3 downto PEResData'length-(BG+N)*4);

o_data				<= int_q_reg;
s_tc_res 			<= int_tc_res;

int_en_res_ptr 	<= ctrl_en_res_ptr; 
int_arv_res 		<= arv_res;

res_cnt: 
countern generic map(N => int_arv_res'length) port map(
	ck 		=> ck, 
	rst		=> rst,
	sync_clr => '0',
	en 		=> int_en_res_ptr,
	arv		=> int_arv_res,
	q 			=> int_res_ptr,
	tc 		=> int_tc_res);
	
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
process(ck, rst, int_en_res_ptr)
begin
if rst = '1' then
	int_q_reg <= (others=>'0');
elsif rising_edge(ck) and int_en_res_ptr='1' then
		int_q_reg <= int_d_reg;
end if;
end process;
 


end architecture; 