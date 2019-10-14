library ieee;
use ieee.std_logic_1164.all;

use work.param.all;

entity avr_pooling_fsm is
	
	port( 
		clk            : in  std_logic;
        rst_fsm        : in  std_logic;		
		start          : in  std_logic; 
		done		   : in  std_logic;
        tc             : in  std_logic;	
        --tc2            : in  std_logic;
		sel            : out  std_logic;
        en_cnt1        : out std_logic;    
        rst_cnt1       : out std_logic;
       -- en_cnt2        : out std_logic;    
       -- rst_cnt2       : out std_logic;						
		rst            : out std_logic;
	    sync_clr       : out std_logic		
		
		);
end entity;



architecture behavioral of avr_pooling_fsm is

	type state is (IDLE, L_EVEN, L_ODD,	WAIT_RESET,RESET);
	
	signal current_state, next_state: state;
		
	begin
		
		process(clk, rst_fsm)
		
			begin
				if rst_fsm = '1' then
				
					current_state <= IDLE;
					
				elsif clk'event and clk = '1' then
				
					current_state <= next_state;
					
				end if;
		end process;

		
		process(current_state, start, tc, done)
		
			begin

				case current_state is
			
						----------------------------------------------------------------
						--IDLE
						----------------------------------------------------------------	
						when IDLE =>
						
				        en_cnt1     <= '0';						
                        rst_cnt1    <= '1';
				        --en_cnt2     <= '0';						
                        --rst_cnt2    <= '1';											
		                rst         <= '1';
                        sync_clr 	<= '1';	
						sel			<= '0';
						
						if start = '1' then
						
							next_state <= L_EVEN;
							
						else
						
							next_state <= current_state;
							
						end if;
						
						----------------------------------------------------------------
						-- L_EVEN
						----------------------------------------------------------------	
						when L_EVEN =>


				        en_cnt1     <= '1';
                        rst_cnt1    <= '0';
				        --en_cnt2     <= '1';
                        --rst_cnt2    <= '0';														 						
		                rst         <= '0'; 
                        sync_clr 	<= '0';	
						sel			<= '0';
						
						next_state <= L_ODD;
						
						----------------------------------------------------------------
						-- L_ODD
						----------------------------------------------------------------	
						when L_ODD =>


				        en_cnt1     <= '1';
                        rst_cnt1    <= '0';
				        --en_cnt2     <= '1';
                        --rst_cnt2    <= '0';														 						
		                rst         <= '0'; 
                        sync_clr 	<= '0';		
						sel			<= '1';

                        if tc = '1' then
							
							if done = '0' then
							
								next_state <= WAIT_RESET;
							
							else
								
								next_state <= IDLE;
							
							end if;

						else
						
							next_state <= L_EVEN;
							
						end if;	
						
						----------------------------------------------------------------
						-- WAIT_RESET
						----------------------------------------------------------------
						
						when WAIT_RESET =>
						
				        en_cnt1     <= '0';
                        rst_cnt1    <= '1';
				        --en_cnt2     <= '1';
                        --rst_cnt2    <= '0';							
		                rst         <= '0';  
                        sync_clr 	<= '0';	
						sel			<= '0';
						
						next_state <= RESET;
						
						----------------------------------------------------------------
						-- RESET
						----------------------------------------------------------------	
						when RESET =>
						
				        en_cnt1     <= '0';
                        rst_cnt1    <= '1';
				        --en_cnt2     <= '1';
                        --rst_cnt2    <= '0';							
		                rst         <= '0';  
                        sync_clr 	<= '1';	
						sel			<= '0';
						
						next_state <= L_EVEN;																	
						
					end case;
		
		end process;

end architecture;
						
						