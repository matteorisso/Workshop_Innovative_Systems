library ieee;
use ieee.std_logic_1164.all;

use work.param.all;

entity fsm_fully_connected is
	
	port( 
		clk            : in  std_logic;
        rst_fsm        : in  std_logic;		
		start_l1       : in  std_logic;  
		start_l2       : in  std_logic;
        eq             : in  std_logic;		
        eq2            : in  std_logic;
        en_cnt1        : out std_logic;    
        rst_cnt1       : out std_logic;
        en_cnt2        : out std_logic;    
        rst_cnt2       : out std_logic;		
		layer_fc       : out std_logic;				
		rst            : out std_logic

		
		);
end entity;



architecture behavioral of fsm_fully_connected is

	type state is (IDLE, L1, RST1, RSTI, L2, RST2);
	
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

		
		process(current_state, start_l1, start_l2, eq, eq2)
		
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
		                layer_fc    <= '0';						
		                rst         <= '1'; 						
						
						if start_l1 = '1' then
						
							next_state <= L1;
							
						else
						
							next_state <= current_state;
							
						end if;
						
						----------------------------------------------------------------
						-- L1
						----------------------------------------------------------------	
						when L1 =>


				        en_cnt1     <= '1';
                        rst_cnt1    <= '0';
				        en_cnt2     <= '1';
                        rst_cnt2    <= '0';						
		                layer_fc    <= '0';								 						
		                rst         <= '0'; 

                        if eq = '1' then
						
							next_state <= RST1;						  

						else
						
							next_state <= current_state;
							
						end if;	
						
						----------------------------------------------------------------
						-- RST1
						----------------------------------------------------------------	
						when RST1 =>
						
				        en_cnt1     <= '0';
                        rst_cnt1    <= '1';
				        en_cnt2     <= '1';
                        rst_cnt2    <= '0';							
		                layer_fc    <= '0';							
		                rst         <= '1';  							
						
                        if eq2 = '1' then
						
							next_state <= RSTI;						  

						else
						
							next_state <= L1;
							
						end if;																	
						
						----------------------------------------------------------------
						-- RSTI
						----------------------------------------------------------------	
						when RSTI =>
						
				        en_cnt1     <= '0';
                        rst_cnt1    <= '1';	
				        en_cnt2     <= '0';
                        rst_cnt2    <= '1';							
		                layer_fc    <= '0';							
		                rst         <= '1'; 
						
						
						if start_l2 = '1' then
						
							next_state <= L2;
							
						else
						
							next_state <= current_state;
							
						end if;						

						
						
						----------------------------------------------------------------
						-- L2
						----------------------------------------------------------------	
						when L2 =>

						
				        en_cnt1     <= '1';
                        rst_cnt1    <= '0';		
				        en_cnt2     <= '1';
                        rst_cnt2    <= '0';								
		                layer_fc    <= '1';							
		                rst         <= '0';  						
						
                       if eq = '1' then
						
							next_state <= RST2;						  
							
						else
						
							next_state <= current_state;
							
						end if;	
						
						----------------------------------------------------------------
						-- RST2
						----------------------------------------------------------------	
						when RST2 =>
						
				        en_cnt1     <= '0';
                        rst_cnt1    <= '1';		
				        en_cnt2     <= '1';
                        rst_cnt2    <= '0';							 	
		                layer_fc    <= '1';							
		                rst         <= '1';						
						
						
                        if eq2 = '1' then
						
							next_state <= IDLE;						  

						else
						
							next_state <= L2;
							
						end if;														

						
						
						
						
					end case;
		
		end process;

end architecture;
						
						