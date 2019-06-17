library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.fixed_pkg.all;
use work.param.all; 

entity im_buffer_word is 
generic (qi : natural:= 1; qf : natural:= 15);	
port(
		ck		:	in std_logic;
		rstn	:  in std_logic;
		en		:	in std_logic;
		d 	:	in  imap;
		q  :  out imap);
end entity; 

architecture structure of im_buffer_word is

component regn
generic (qi : natural:= 1; qf : natural:= 15);	
port(
		ck, 
		rstn, 
		en	:	in std_logic;
		d 	:	in sfixed(qi-1 downto -qf);
		q  :  out sfixed(qi-1 downto -qf));

end component; 

begin

gen: for i in 0 to imap'length -1 generate
	reg: regn	generic map ( qi => qi, qf => qf ) 
						port map ( ck, rstn, en, d(i), q(i));
	end generate; 

end architecture; 