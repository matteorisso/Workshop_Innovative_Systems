library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.fixed_pkg.all;
use work.param.all; 

entity im_buffer is
generic ( qi : natural := 8 ; qf : natural := 8) ; 
port ( 
		ck			: in std_logic; 
		rstn 		: in std_logic;
		en			: in std_logic; 
		din		: in 	imap; 
		dout 		: out imap); 
end entity; 

architecture structure of im_buffer is

component im_buffer_word 
generic (qi : natural:= 1; qf : natural:= 15);	
port(
		ck		:	in std_logic;
		rstn	:  in std_logic;
		en		:	in std_logic;
		d 	:	in  imap;
		q  :  out imap);
end component;

type net is array ( 0 to 31 ) of imap; 
signal tmp : net; 

begin

mem: for i in 0 to 31 generate
	first:
	if i = 0 generate
	w:im_buffer_word		generic map ( qi => qi, qf => qf )
								port map ( ck, rstn, en, din, tmp(i+1) );
	end generate; 
	mid:
	if i > 0 and i < 31 generate
	w:im_buffer_word		generic map ( qi => qi, qf => qf )
								port map ( ck, rstn, en, tmp(i), tmp(i+1) );
	end generate; 
	last:
	if i = 31 generate
	w:im_buffer_word		generic map ( qi => qi, qf => qf )
								port map ( ck, rstn, en, tmp(i), dout );
	end generate;
end generate; 	
	

end architecture; 





