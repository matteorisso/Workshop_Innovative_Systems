library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.fixed_pkg.all; 
use work.param.all; 


entity conv2d is 
generic ( qi : natural := 8 ; qf : natural := 8 ;  filter_size : natural := 5 );
port (
			ck				: in std_logic; 
			rstn			: in std_logic;
			ld_loop_n	: in std_logic;
			im_h 			: in 	imap;
			im_w			: in	imap; 
			k				: in 	filter;
			om				: out omap); -- debug : release is k inside conv2d
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

--component local_buffer
--generic ( qi : natural := 8 ; qf : natural := 8) ; 
--port ( 
--		ck			: in std_logic; 
--		rstn 		: in std_logic; 
--		cs 		: in std_logic;
--		rd_wr_n	: in std_logic;  
--      address	: in unsigned(9 downto 0);
--		data_in 	: in 	imap;
--		data_out : out imap);
--end component;

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

signal q_cnt			: unsigned(2 downto 0) ; 
signal en_cnt			: std_logic ; 
signal tcnt_ofmap		: std_logic ; 
signal tcnt_channel	: std_logic ; 


begin



-- processing unit

pes: pe_array	generic map ( qi => qi, qf => qf, filter_size => filter_size ) 
						port map ( ck, rstn, im_pad_h, im_pad_w, k, om) ;
						

						
-- get tick 						

tick_ofmap: countern 	generic map ( n => 3 , arr => 4)
									port map ( en => en_cnt, sync_rst_n => rstn, ck => ck, q => q_cnt, tc => tcnt_ofmap );
tick_channel: countern 	generic map ( n => 3 , arr => 5)
									port map ( en => tcnt_ofmap, sync_rst_n => rstn, ck => ck, tc => tcnt_channel );

					
ld_reg <= tcnt_channel or ld_loop_n ; 
en_cnt <= not (ld_loop_n);




-- local buffer data reuse y-dir
lb: im_buffer generic map ( qi => qi, qf => qf ) 
					  port map ( ck, rstn, '1', im_w, lb_out ) ;

--
--lb: local_buffer generic map ( qi => qi, qf => qf ) 
--							port map ( ck, rstn, '1', rd_wr_n, q_cnt, im_h, lb_out ) ;

with ld_loop_n select lb_mux_out <= im_h when '1', lb_out when others; 





	
-- broadcast imap with data reuse x-dir 


imrf:
for i in 0 to (im_pad_h'length+im_pad_w'length)-1 generate
	lbo:
	if i < filter_size-1 generate
		rf: im_pad 	generic map ( qi => qi, qf => qf ) 
							port map ( ck, rstn, ld_reg, q_cnt, lb_mux_out(i), im_pad_h(i) ) ;
	
	end generate ; 
	ext:
	if i > filter_size-2 generate
		rf: im_pad 	generic map ( qi => qi, qf => qf ) 
							port map ( ck, rstn, ld_reg, q_cnt, im_w(i-imap'length), im_pad_w(i-imap'length) ) ;
	end generate;
end generate; 





-- primitive op (conv1d) cnt : each 5 ck psum must be accumulated (adder tree) 
-- 5 x 6(filters) ck for 4 pixel along rows of 6 OFMAPS
-- 5 x 6 x 32(ifmap width) ck for completing first 4 rows of 6 OFMAPS  
-- ld from mem or lb (new data) once every 5x6 

-- ld_loop_n is 0 at startup only ( first 5 ck to load first 5 pixel of 8 imap if in parallel)
-- otherwise wait N ck before start to load all 8 imap rows first pixel (16b)

-- rd_lb is 0 at first 5x6x32 ck, because i read from mem and only after that i reuse y-dir data 
-- moving over rows every 5x6x32 ck 

end architecture structure; 








