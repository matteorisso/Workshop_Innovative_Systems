library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all; 

use work.globals.all;

entity pe_v2 is 
port(
	ck 			: in 	std_logic; 
	rst 			: in 	std_logic;
	en				: in 	std_logic; 
	ld_h			: in 	std_logic;
	ld_v			: in 	std_logic; 
	wr_pipe		: in 	std_logic; 
	weight 		: in	std_logic_vector(N_WEIGHT-1 downto 0);
	i_data_h		: in	signed(N-1 downto 0);
	i_data_v		: in 	signed(N-1 downto 0);
	i_data_acc	: in 	signed(N-1+BG downto 0);
	o_data_h		: out signed(N-1 downto 0);
	o_data_v		: out signed(N-1 downto 0);
	o_data_res	: out signed(N-1+BG downto 0)
	);
end entity;

architecture beh of pe_v2 is

signal int_q_im_h 	: signed(N-1 downto 0);
signal int_q_im_v 	: signed(N-1 downto 0);
signal int_sgnext		: signed(N-1+BG downto 0); 
signal int_add_im		: signed(N-1+BG downto 0);
signal int_d_acc 		: signed(N-1+BG downto 0);
signal int_q_acc 		: signed(N-1+BG downto 0);

signal int_q_weight  : std_logic;
signal int_d_en 		: std_logic; 
signal int_q_en 		: std_logic;

begin

int_d_en 								<= en and weight(weight'high); 

int_sgnext(N-1+BG downto N-1) 	<= ( others => int_q_im_h(int_q_im_h'high) );
int_sgnext(N-1 downto 0)			<= int_q_im_h;  
int_add_im								<= int_sgnext when int_d_en = '1' else (others=>'0');

o_data_h									<= int_q_im_h;
o_data_v									<= int_q_im_v;
o_data_res 								<= int_q_acc; 

-- guarded evaluation

delay_int_en:
process(ck,rst)
begin
	if rst = '1' then 
		int_q_en <= '0';
	elsif rising_edge(ck) then
		int_q_en <= int_d_en; 
	end if;
end process;

-- i/o pipelining 

input_data_h:
process(ck, rst)
begin
	if rst = '1' then 
		int_q_im_h 			<= (others=>'0');
		int_q_weight		<= '0';
	elsif rising_edge(ck) and ld_h = '1' then 
			int_q_im_h 		<= i_data_h;
			int_q_weight 	<= weight(weight'low);
	end if;
end process; 
				
input_data_v:
process(ck, rst)
begin
	if rst = '1' then 
		int_q_im_v 		<= (others=>'0');
	elsif rising_edge(ck) and ld_v = '1' then 
			int_q_im_v 	<= i_data_v;

	end if;
end process; 
				
output_data:
process(ck, int_q_en, rst)
begin
	if rst = '1' then
		int_q_acc 		<= (others=>'0'); 
	elsif ck'event and ck='1' and int_q_en = '1' then
		if wr_pipe = '1' then	
			int_q_acc 	<= i_data_acc;		
		else
			int_q_acc 	<= int_d_acc;
		end if;
	end if;
end process;

-- add

adder_sub_proc:
process(int_d_en, int_add_im, int_q_acc, int_q_weight)
begin
	if int_d_en = '1' then 
		if int_q_weight = '1' then 
			int_d_acc <= int_add_im - int_q_acc;
		else
			int_d_acc <= int_add_im + int_q_acc;		 
		end if; 
	else
		int_d_acc <= int_q_acc;
	end if; 
end process;

end architecture;
