library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all; 
use ieee.std_logic_textio.all;
use std.textio.all;

use work.fixed_pkg.all;
use work.param.all;

entity conv2d_tb is  
end entity;



architecture test of conv2d_tb is

component conv2d
generic ( qi : natural := 8 ; qf : natural := 8 );
port (
			ck			: in std_logic; 
			rstn		: in std_logic;
			start 		: in std_logic; 
			ld_loop_n	: in std_logic;
			en_buffer	: in std_logic; 
			omap_uev	: out std_logic;
			channel_uev : out std_logic; 
			im_h       	: in imap;
			im_w       	: in imap; 
			k			: in filter;
			om			: out omap); 
			
end component; 

component fsm
port (	
		ck, rstn 	: in std_logic;
		
		-- tb master
		start 		: in std_logic; 
		
		-- conv2d status
		channel_uev : in std_logic; 
		omap_uev	: in std_logic; 
		
		-- file if status
		EOR			: in std_logic; 
		EOIM		: in std_logic; 								
		
		-- file if cmd
		rd_im			: out std_logic; 
		rd_im_reusey	: out std_logic; 
		rd_im_startup			: out std_logic;
		rd_im_reusey_startup	: out std_logic;
		rd_filter	: out std_logic; 
		
		-- conv2d cmd
		start_dp	: out std_logic;
		en_buffer	: out std_logic; 
		ld_loop_n	: out std_logic);
end component; 




constant half_period : time := 0.5 ns; 

signal 	ck_tb  		: std_logic; 
signal  rstn_tb 	: std_logic; 
signal 	start_tb 	: std_logic; 

signal rd_im		        : std_logic;
signal rd_im_startup  : std_logic;
signal rd_im_reusey   : std_logic; 
signal rd_im_reusey_startup : std_logic; 

signal rd_filter	: std_logic;

signal channel_uev 	: std_logic; 
signal omap_uev		: std_logic;

signal start_dp		: std_logic;  
signal en_buffer	: std_logic;
signal ld_loop_n	: std_logic;
 
signal EOR	 : std_logic:='0'; 
signal EOIM : std_logic:='0'; 

signal 	im_h_tb	: imap;
signal 	im_w_tb 	: imap; 
signal  filter_tb	: filter; 

type v_ilines is array ( 0 to imap'length - 1 ) of line; 


begin 

cu:		fsm 	port map ( 
                      ck_tb, 
                      rstn_tb, 
                      start_tb, 
                      channel_uev, 
                      omap_uev, 
                      EOR, 
                      EOIM, 
                      rd_im, 
                      rd_im_reusey, 
                      rd_im_startup,
                      rd_im_reusey_startup, 
                      rd_filter, 
					  start_dp,
                      en_buffer, 
                      ld_loop_n); 
		
dp:		conv2d   generic map ( qi => qi, qf => qf )
				         port map ( 
				                    ck_tb, 
				                    rstn_tb, 
				                    start_dp, 
				                    ld_loop_n, 
				                    en_buffer, 
				                    omap_uev, 
				                    channel_uev, 
				                    im_h_tb, 
				                    im_w_tb, 
				                    filter_tb);

		


process(ck_tb)  



file data_file    : text is in "image.txt";

variable v_rows_h : v_ilines;
variable v_rows_w : v_ilines; 
variable v_im	  : real;



begin


if rising_edge(ck_tb) then	
	if ( not endfile(data_file) ) then
		
		if rd_im = '1' then
		  
			for i in 0 to imap'length-1 loop
					
					if rd_im_startup = '1' then  
						readline(data_file, v_rows_h(i)); 		
					end if; 
	
					read(v_rows_h(i), v_im);
					im_h_tb(i) <= to_sfixed(v_im, qi-1, -qf); 	
					
					if v_rows_h(i)'length = 0 then EOR <= '1'; 
					end if; 
			end loop; 
			
			for i in 0 to imap'length-1 loop
	
				if rd_im_startup = '1' then 
						readline(data_file, v_rows_w(i)); 		
				end if; 
					
				read(v_rows_w(i), v_im);
				im_w_tb(i) <= to_sfixed(v_im, qi-1, -qf); 
				
				
				if v_rows_w(i)'length = 0 then EOR <= '1'; 
				end if; 
			end loop; 
			
			
		
		elsif rd_im_reusey = '1' then 
			
			EOR <='0';
			
			for i in 0 to imap'length-1 loop
	
				if rd_im_reusey_startup = '1' then 
					readline(data_file, v_rows_w(i)); 		
				end if; 
					
				read(v_rows_w(i), v_im);
				im_w_tb(i) <= to_sfixed(v_im, qi-1, -qf); 
				
				
				if v_rows_w(i)'length = 0 then EOR <= '1'; 
				end if; 
			end loop; 		
		end if; 
	end if ; 	
end if ;
 			
end process; 






process(ck_tb)


file filter_file    : text is in "filter.txt";



variable v_iline : line;
variable v_space : character;
     
variable v_k 	: real;

begin

if rising_edge(ck_tb) then
	if ( not endfile( filter_file ) ) then 	
		if rd_filter = '1' then 
			readline(filter_file, v_iline);
			
			for i in 0 to filter_size-1	loop -- while (v_iline'length > 0)
					
					read(v_iline, v_k);
					
					filter_tb(i) <= to_sfixed(v_k, qi-1, -qf);
			end loop;
		end if; 
	end if; 
end if; 
end process; 


		
ck_proc: process(ck_tb)
begin

	if (ck_tb='U') then
	
		ck_tb <= '0';
	else
	
		ck_tb <= not ck_tb after half_period; 
	end if;
end process;

 
 
reset_start_gen: process
begin

	rstn_tb 	<= '0';  
	start_tb 	<= '0'; 
	
	wait for (2*half_period); 

	rstn_tb		<= '1';
	start_tb	<= '1'; 
	
	wait;
end process;



end architecture; 
