library ieee;
use ieee.std_logic_1164.all;
use work.fixed_pkg.all; 
use work.param.all; 

-- */MEMO/* 
--	start-up :
-- 	buffer must be filled with first 4 rows (I0-I4) 16x4 x32ck, store last 4 in local buffer LB(2k) for reuse while feeding (I4-I7)
-- 	I5-I7 read from mem during inner-loop 1 px at ck (16x3 = 48) 
-- LB rows are fifo (data out to array <-> data in from mem while feeding the array from the other side)

--	normal-mode :
--		read 4 rows from mem to feed the array and re-use 4 rows from LB

entity conv2d is 
generic ( qi : natural := 8 ; qf : natural := 8 ;  filter_size : natural := 5 );
port (
			ck		: in std_logic; 
			rstn	: in std_logic;
			ld_loop_n : in std_logic;
			im 	: in  imap_in;
			k		: in  filter); -- debug : release is k inside conv2d
			
end entity; 

architecture structure of conv2d is


component pe_array
generic ( qi : natural := 8; qf : natural := 8; filter_size : natural := 5 );
port ( 	
			ck 	: in  std_logic;
			rstn	: in  std_logic;
			im 	: in  imap_in;
			k		: in  filter;
			om 	: out omap);
end component; 

component im_pad
generic ( qi : natural := 8; qf : natural := 8 );
port (
			ck 	 		: in std_logic; 
			rstn	 		: in std_logic; 
			ld_loop_n	: in std_logic;  
			
			sdin   : in  sfixed(qi-1 downto -qf );
			sdout  : out sfixed(qi-1 downto -qf )); 
end component; 

signal imap_rows 	 : imap_in ;
signal filter_rows : filter ; 

 
begin


imrf:
for i in 0 to imap_rows'length-1 generate
	rf: im_pad generic map ( qi => qi, qf => qf ) port map ( ck, rstn, ld_loop_n, im(i), imap_rows(i) ) ;
end generate; 



pes: pe_array	generic map ( qi => qi, qf => qf, filter_size => filter_size ) 
						port map ( ck, rstn, imap_rows, filter_rows ) ;



end architecture structure; 








