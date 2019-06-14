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
			ck 	 		: in std_logic; 
			rstn	 		: in std_logic; 
			ld_loop_n	: in std_logic;  
			sdin   : in  sfixed(qi-1 downto -qf );
			sdout  : out sfixed(qi-1 downto -qf )); 
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

component countern
generic ( n: natural:= 16 ; arr : natural := 4);  
port ( en, sync_rst_n, clk : in std_logic; 
       q : out unsigned (N-1 downto 0); 
       tc: out std_logic ); 
end component; 


signal imap : imap_rf ;  

signal q_cnt	: unsigned(2 downto 0) ; 
signal en_cnt	: std_logic ; 
signal ld_reg 	: std_logic ; 
signal tcnt		: std_logic ; 

begin


rfgen: for i in 0 to 4 generate
	ir:if i = 0 generate
	r: regn generic map ( qi => qi, qf => qf ) port map ( sdin, ck, rstn, ld_reg, imap(i) );
	end generate;
	ar:if i > 0 generate
	r: regn generic map ( qi => qi, qf => qf ) port map ( imap(i-1), ck, rstn, ld_reg, imap(i));
	end generate; 
end generate rfgen; 

cnt: countern generic map ( n => 3 , arr => 4) port map ( en_cnt, rstn, ck, q_cnt, tcnt );

with q_cnt select sdout <= 
	imap(0) when "100", 
	imap(1) when "011",
	imap(2) when "010",
	imap(3) when "001",
	imap(4) when others; 

ld_reg <= tcnt or ld_loop_n ; 
en_cnt <= not (ld_loop_n);



end architecture structure; 