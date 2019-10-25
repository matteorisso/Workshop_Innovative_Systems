library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity countern is 
generic ( N	: natural := 16 );    
port( 
	ck 			: in std_logic; 
	rst			: in std_logic; 
	sync_clr		: in std_logic; 
	en 			: in std_logic;
	arv			: in unsigned(N-1 downto 0); -- auto-reload value
	q 				: out unsigned(N-1 downto 0); 
	tc				: out std_logic
	); 
end entity; 

architecture beh of countern is

signal cnt_out 		: unsigned(N-1 downto 0):= (others => '0'); 
signal terminal_cnt 	: std_logic; 

begin

p1: process(ck, en, rst)
begin
if rst = '1' then

	cnt_out 		 <= (others => '0');
	terminal_cnt <= '0';
	
elsif rising_edge(ck) and en = '1' then
		if sync_clr = '1' then
			cnt_out 			<= (others=>'0');
			terminal_cnt	<= '0';
		
		elsif terminal_cnt = '0'  then
				
				cnt_out <= cnt_out+1;
				
				if ( cnt_out = arv-1) then     		
						terminal_cnt <= '1';
				end if;
				
		else
				cnt_out 		 	<= (others => '0');                 
				terminal_cnt	<= '0';                 
		end if; 
end if; 
end process; 

q  <= cnt_out; 
tc <= terminal_cnt; 

end architecture; 