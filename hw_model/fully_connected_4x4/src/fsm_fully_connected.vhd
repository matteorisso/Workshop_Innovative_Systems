library ieee;
use ieee.std_logic_1164.all;

use work.param.all;

entity fsm_fully_connected is
	
	port( 
		clk            : in  std_logic;
        rst_fsm        : in  std_logic;		
		start          : in  std_logic;  
        tc             : in  std_logic;		
        tc2            : in  std_logic;
        en_cnt1        : out std_logic;    
        rst_cnt1       : out std_logic;
        en_cnt2        : out std_logic;    
        rst_cnt2       : out std_logic;						
		rst            : out std_logic;
	    sync_clr       : out std_logic		
		
		);
end entity;



architecture behavioral of fsm_fully_connected is

	type state is (IDLE, L, RESET, DONE);
	
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

		
		process(current_state, start, tc, tc2)
		
			begin

				case current_state is
			
						----------------------------------------------------------------
						--IDLE
						----------------------------------------------------------------	
						when IDLE =>
						
				        en_cnt1     <= '0';						
                        rst_cnt1    <= '1';
				        en_cnt2     <= '0';						
                        rst_cnt2    <= '1';											
		                rst         <= '1';
                        sync_clr 	<= '1';					
						
						if start = '1' then
						
							next_state <= L;
							
						else
						
							next_state <= current_state;
							
						end if;
						
						----------------------------------------------------------------
						-- L
						----------------------------------------------------------------	
						when L =>


				        en_cnt1     <= '1';
                        rst_cnt1    <= '0';
				        en_cnt2     <= '1';
                        rst_cnt2    <= '0';														 						
		                rst         <= '0'; 
                        sync_clr 	<= '0';							

                        if tc = '1' then
						
							next_state <= RESET;						  

						else
						
							next_state <= current_state;
							
						end if;	
						
						----------------------------------------------------------------
						-- RESET
						----------------------------------------------------------------	
						when RESET =>
						
				        en_cnt1     <= '0';
                        rst_cnt1    <= '1';
				        en_cnt2     <= '1';
                        rst_cnt2    <= '0';							
		                rst         <= '0';  
                        sync_clr 	<= '1';							
						
                        if tc2 = '1' then
						
							next_state <= DONE;						  

						else
						
							next_state <= L;
							
						end if;																	
						
						----------------------------------------------------------------
						-- DONE
						----------------------------------------------------------------	
						when DONE =>
						
				        en_cnt1     <= '0';
                        rst_cnt1    <= '1';	
				        en_cnt2     <= '0';
                        rst_cnt2    <= '1';													
		                rst         <= '1'; 
                        sync_clr 	<= '1';							
						
						
						next_state <= IDLE;
																												
						
					end case;
		
		end process;

end architecture;
						
						