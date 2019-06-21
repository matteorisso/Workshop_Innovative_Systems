library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all; 
use work.fixed_pkg.all;
use work.param.all;

-- imap tile in row pixel reuse : filter_size - stride

-- if ld_loop_n = 1 q_cnt stuck at 0 (ptr to first reg) and ld_reg is 1 at each ck cycle (fill)
-- if ld_loop_n = 0 q_cnt is enabled (ptr from top of the rf to the end) and ld_reg is 1 every node period (5 ck cycle)
-- from main fsm ctrl fill op. and loop ( at startup wait 5 ck with ld_loop_n at 1 to fill scratch pad)

entity im_pad is
generic ( qi : natural := 8; qf : natural := 8 );
port (
			ck		: in std_logic; 
			rstn	: in std_logic; 
			ld		: in std_logic;  
			addr 	: in unsigned(2 downto 0);
			sdin  : in  sfixed(qi-1 downto -qf );
			sdout : out sfixed(qi-1 downto -qf )); 
end entity; 


architecture structure of im_pad is

component regn
generic ( qi : natural:= 1; qf : natural:= 15 ) ;	
port (
			d 		:	in sfixed(qi-1 downto -qf);
			ck 	:	in std_logic;  
			rstn	:	in std_logic;  
			en		:	in std_logic;
			q  	:  out sfixed(qi-1 downto -qf));
end component; 


signal imap : imap_rf ;  

begin


rfgen: for i in 0 to 4 generate
	ir:if i = 0 generate
	r: regn generic map ( qi => qi, qf => qf ) port map ( sdin, ck, rstn, ld, imap(i) );
	end generate;
	ar:if i > 0 generate
	r: regn generic map ( qi => qi, qf => qf ) port map ( imap(i-1), ck, rstn, ld, imap(i));
	end generate; 
end generate rfgen; 


with addr select sdout <= 
	imap(0) when "100", 
	imap(1) when "011",
	imap(2) when "010",
	imap(3) when "001",
	imap(4) when others; 



end architecture structure; 