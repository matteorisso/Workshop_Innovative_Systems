library ieee; 
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.param.all;
use work.fixed_pkg.all; 


entity fsm is
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
		
end entity; 


architecture structure of fsm is

type state is (
				RESET, STARTUP, WAIT_END_STARTUP, WAIT_CHANNEL, LOAD_IM, 
				REUSE_Y_STARTUP, REUSE_Y_WAIT_END_STARTUP, REUSE_Y_WAIT_CHANNEL, REUSE_Y_LOAD_IM);
				
signal ps, ns : state; 

begin


state_transitions: process(ck,rstn)
begin
	if rstn='0' then
		ps	<=	RESET;
	elsif rising_edge(ck) then
		ps	<= 	ns;
	end if;
end process state_transitions;




nxt_state_process: process(ps, start, omap_uev, channel_uev, EOR, EOIM)

begin

case ps is

when RESET => 
	if start = '1' then ns <= STARTUP; 
	else ns <= RESET; 
	end if; 
	
when STARTUP => 
	ns <= WAIT_END_STARTUP; 
	 
when WAIT_END_STARTUP =>
	if omap_uev = '1' then ns <= WAIT_CHANNEL; 
	else ns <= WAIT_END_STARTUP; 
	end if; 
	
when WAIT_CHANNEL =>
	if channel_uev = '1' then 
		if EOR = '1' then 
			ns <= REUSE_Y_STARTUP; 
		else
			ns <= LOAD_IM; 
		end if;
	else 
		ns <= WAIT_CHANNEL;
	end if; 
	
when LOAD_IM => 
	ns <= WAIT_CHANNEL; 

when REUSE_Y_STARTUP =>  ns <= REUSE_Y_WAIT_END_STARTUP;

when REUSE_Y_WAIT_END_STARTUP => 
	if omap_uev = '1' then ns <= REUSE_Y_WAIT_CHANNEL; 
	else ns <= REUSE_Y_WAIT_END_STARTUP; 
	end if; 
	
when REUSE_Y_WAIT_CHANNEL =>
	if channel_uev = '1' then 
		if EOR = '1' then
			ns <=REUSE_Y_STARTUP;
		else 
			ns <=REUSE_Y_LOAD_IM;
		end if; 
	else ns <= REUSE_Y_WAIT_CHANNEL; 
	end if; 
	
when REUSE_Y_LOAD_IM => 
	if EOR = '1' then ns <= REUSE_Y_STARTUP;
	elsif EOIM = '1' then ns <= RESET; 
	else ns <= REUSE_Y_WAIT_CHANNEL; 
	end if; 
	
when others => ns <= RESET;

end case; 
end process nxt_state_process; 


output_network: process(ps)
begin

start_dp  <= '1';  
ld_loop_n <= '0'; 
en_buffer <= '1'; 

rd_filter 		<= '1'; 
rd_im 		  	<= '0';
rd_im_reusey	<= '0';
 
rd_im_startup 			<= '0'; 
rd_im_reusey_startup	<= '0';


case ps is 

when RESET =>	
		start_dp 	<='0'; 
		rd_filter	<='0';
		
when STARTUP =>
	
		ld_loop_n		<= '1';
		rd_im			<= '1'; 
		rd_im_startup	<= '1';
		en_buffer <= '0';
		
when WAIT_END_STARTUP =>
		
		ld_loop_n 		<= '1';
		rd_im			<= '1'; 
		en_buffer <= '0';
		
when LOAD_IM =>
		
		rd_im 	<= '1'; 
		en_buffer <= '0';
		
		
		
when REUSE_Y_STARTUP => 
		
		ld_loop_n 				<= '1';
		
		rd_im_reusey			<= '1'; 
		rd_im_reusey_startup	<= '1';
		
when REUSE_Y_WAIT_END_STARTUP =>

		ld_loop_n 				<= '1';
		rd_im_reusey 			<= '1'; 
		
when REUSE_Y_LOAD_IM =>
		 		
		rd_im_reusey	<= '1';
		
when others =>  

end case;
end process; 




end architecture; 

