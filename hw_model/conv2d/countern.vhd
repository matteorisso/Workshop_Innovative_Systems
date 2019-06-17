library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity countern is 
generic ( n: natural := 16; arr : natural := 4 ) ;  
port ( 
		en				: in std_logic;  
		sync_rst_n  : in std_logic;  
		ck 			: in std_logic; 
      q 				: out unsigned (N-1 downto 0); 
      tc				: out std_logic ); 
end countern; 

architecture behavior of countern is

signal cnt_out : unsigned(N-1 downto 0):= (others => '0'); 
signal terminal_cnt : std_logic; 
begin

p1: process(ck)
begin
edge: if ( ck'event and ck='1' ) then
rst: if (sync_rst_n = '0') then      
         cnt_out <= (others=>'0'); 
         terminal_cnt<= '0'; 
			
     elsif EN = '1' then   
            if (terminal_cnt = '0')  then    
                  if ( cnt_out = arr ) then  -- check stop   
                      terminal_cnt <='1';              -- update terminal count at next ck cycle  
 		      cnt_out <= cnt_out+1; 	       -- update Q			  
                  else
                      cnt_out <= cnt_out+1;            -- update Q  
                  end if;             
            else
                  cnt_out <= (others => '0');          -- EN = '1', TC = '1' => re-start count       
                  terminal_cnt <= '0';                 -- reset terminal_cnt
            end if; 
end if rst;
end if edge; 
end process p1; 


Q <= cnt_out; 
TC <= terminal_cnt; 

end behavior; 