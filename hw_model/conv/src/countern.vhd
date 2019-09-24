library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity countern is 
generic ( N: natural := 16 );    
port( 
		ck : in std_logic; 
		rst: in std_logic; 
		en : in std_logic;
		arv: in unsigned(N-1 downto 0); -- auto-reload value
		q : out unsigned(N-1 downto 0); 
      tc: out std_logic); 
end entity; 

architecture beh of countern is

signal int_en  : std_logic;
signal cnt_out : unsigned(N-1 downto 0):= (others => '0'); 
signal terminal_cnt : std_logic; 

begin
int_en <= rst or en;

p1: process(ck, int_en)
begin
if ( ck'event and ck='1' ) and int_en = '1' then
	if rst = '1' then      
		cnt_out 			<= (others=>'0'); 
		terminal_cnt 	<= '0'; 
   else
		if terminal_cnt = '0'  then
				if ( cnt_out = arv-1) then     		
						terminal_cnt <= '1';
				end if;
				cnt_out <= cnt_out+1;
		else
				cnt_out 		 	<= (others => '0');                 
				terminal_cnt	<= '0';                 
		end if; 
	end if;
end if; 
end process; 

q  <= cnt_out; 
tc <= terminal_cnt; 

end architecture; 