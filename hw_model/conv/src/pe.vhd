library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.globals.all;

entity PE is 
port(
	ck 		: in 	std_logic;
	rst		: in	std_logic; 
	sync_clr : in 	std_logic;
	en			: in 	std_logic;
	k  		: in 	std_logic_vector(1 downto 0);  -- "00", "01" : zero ; "10" : +1 ; "11" : -1
	i_data	: in 	signed(N-1 downto 0);
	o_data	: out signed(N-1+G downto 0)
	);
end entity;

architecture structure of PE is

component adder_subn
generic( N : natural:=4 );
port(
		a 			: in 	signed(N-1 downto 0);
		b 			: in	signed(N-1 downto 0);
		add_subn		: in	std_logic; 
		res 			: out	signed(N-1 downto 0);
		c_out			: out   std_logic); 
end component;

signal int_q_im  : signed(N-1 downto 0);
signal int_sgnext: signed(N-1+G downto 0); 
signal int_d_acc : signed(N-1+G downto 0);
signal int_q_acc : signed(N-1+G downto 0);
signal int_q_k   : std_logic;

signal int_d_en : std_logic; 
signal int_q_en : std_logic;

begin

int_sgnext(N-1+G downto N-1) 	<= ( others => int_q_im(int_q_im'high) );
int_sgnext(N-1 downto 0)		<= int_q_im;  

add: 
adder_subn generic map(N => N+G) port map(
	a 			=> int_q_acc, 
	b 			=> int_sgnext, 
	add_subn => int_q_k, 
	res 		=> int_d_acc);
	
-- guarded evaluation

int_d_en <= en and k(k'high); 

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

input_data:
process(ck, int_d_en, rst)
begin
if rst = '1' then

	int_q_im		<= (others=>'0');
	int_q_k		<= '0';
	 
elsif rising_edge(ck) and int_d_en = '1' then

	if sync_clr = '1' then
		int_q_im	<= (others=>'0');
		int_q_k 	<= '0';
	
	else
		int_q_im <= i_data;
		int_q_k 	<= k(k'low);  
	
	end if;
end if;
end process;


output_data:
process(ck, int_q_en, rst)
begin
if rst = '1' then

	int_q_acc 	<= (others=>'0'); 
	
elsif ck'event and ck='1' and int_q_en = '1' then

	if sync_clr = '1' then	
		int_q_acc <= (others=>'0');
	
	else
		int_q_acc <= int_d_acc;

	end if;
end if;
end process;


o_data <= int_q_acc; 

end architecture; 
	
