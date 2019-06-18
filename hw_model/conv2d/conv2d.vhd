library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.fixed_pkg.all; 
use work.param.all; 


entity conv2d is 
generic ( qi : natural := 8 ; qf : natural := 8 );
port (
			ck				: in std_logic; 
			rstn			: in std_logic;
			start			: in std_logic; 
			
			ld_loop_n	: in std_logic;
			en_buffer	: in std_logic; 
			im_h       : in imap;
			im_w       : in imap; 
			k          : in filter;
			omap_uev     : out std_logic;
			channel_uev  : out std_logic; 
			om				     : out omap); 
end entity; 





architecture structure of conv2d is





component pe_array
generic ( qi : natural := 8; qf : natural := 8; filter_size : natural := 5);
port ( 	
			ck 	: in  std_logic;
			rstn	: in  std_logic;
			im_h 	: in  imap;
			im_w 	: in  imap; 
			k		: in  filter;
			om 	: out omap);
end component; 

component im_pad
generic ( qi : natural := 8; qf : natural := 8 );
port (
			ck		: in std_logic; 
			rstn	: in std_logic; 
			ld		: in std_logic;  
			addr 	: in unsigned(2 downto 0);
			sdin  : in  sfixed(qi-1 downto -qf );
			sdout : out sfixed(qi-1 downto -qf )); 
end component; 


component im_buffer 
generic ( qi : natural := 8 ; qf : natural := 8) ; 
port ( 
		ck			: in std_logic; 
		rstn 		: in std_logic;
		en			: in std_logic; 
		din		: in 	imap; 
		dout 		: out imap); 
end component; 

		
component countern
generic ( n: natural:= 16 ; arr : natural := 4);  
port ( en, sync_rst_n, ck : in std_logic; 
       q : out unsigned (n-1 downto 0); 
       tc: out std_logic ); 
end component; 





signal im_pad_h			: imap ;
signal im_pad_w			: imap; 


signal lb_out			: imap ; 
signal lb_mux_out		: imap ;
 
signal ld_reg			: std_logic ; 


signal q_cnt		: unsigned(2 downto 0) ; 
signal en_cnt		: std_logic ; 
signal tcnt_omap	: std_logic ; 
signal tcnt_channel	: std_logic ; 

signal im_pad_addr 	: unsigned(2 downto 0) ; 

begin



-- processing unit

pes: pe_array	generic map ( qi => qi, qf => qf, filter_size => filter_size ) 
						port map ( ck, rstn, im_pad_h, im_pad_w, k, om) ;
						


-- broadcast imap with data reuse x-dir 


imrf:
for i in 0 to (im_pad_h'length+im_pad_w'length)-1 generate
	lbo:
	if i < filter_size-1 generate
		rf: im_pad 	generic map ( qi => qi, qf => qf ) 
							port map ( ck, rstn, ld_reg, im_pad_addr, lb_mux_out(i), im_pad_h(i) ) ;
	
	end generate ; 
	ext:
	if i > filter_size-2 generate
		rf: im_pad 	generic map ( qi => qi, qf => qf ) 
							port map ( ck, rstn, ld_reg, im_pad_addr, im_w(i-imap'length), im_pad_w(i-imap'length) ) ;
	end generate;
end generate; 
						
-- get tick 						

omap_uev      <= tcnt_omap; 
channel_uev   <= tcnt_channel;


tick_ofmap: countern 	generic map ( n => 3 , arr => 4)
									port map ( en => start, sync_rst_n => rstn, ck => ck, q => q_cnt, tc => tcnt_omap );
-----------
----------- QUA COME ?? 
tick_channel: countern 	generic map ( n => 5 , arr => 4*5)
									port map ( en => start, sync_rst_n => rstn, ck => ck, tc => tcnt_channel );

					
ld_reg 		<=  ld_loop_n or tcnt_channel; 

im_pad_addr <= (others=>'0') when ld_loop_n = '1' else q_cnt;  



-- local buffer data reuse y-dir


lb: im_buffer generic map ( qi => qi, qf => qf ) 
					  port map ( ck, rstn, '1', im_w, lb_out ) ;

lb_mux_out <= lb_out when en_buffer = '1' else im_h; 





end architecture structure; 








