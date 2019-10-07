library ieee;
	use ieee.std_logic_1164.all;
	use ieee.numeric_std.all;

entity pooling_fsm is

	port(
		reset		:	in	std_logic;
		clk			:	in	std_logic;
		start		:	in	std_logic;
		done		:	in	std_logic;

		tc_27		:	in	std_logic;
		
		cnt5_en_h	:	out	std_logic;
		
		en_rfint_h	:	out std_logic;
		
		rf_en_0_h	: 	out std_logic;
		rf_en_1_h	: 	out std_logic;
		rf_en_2_h	: 	out std_logic;
		rf_en_3_h	: 	out std_logic;
		rf_en_4_h	: 	out std_logic;
		
		rst_reg_l	:	out	std_logic
	);
		
end pooling_fsm;

architecture behavior of pooling_fsm is

	type 	state is (idle,row0,row1,row2,row3,row4,ld_xz,ld_yw,pool,last_pool);
	
	signal 	ps, ns : state;
	
begin

	process(ps,start,done,tc_27)
	begin
		case ps	is
		
			when idle  =>
				if start = '1' then
					ns <= row0;
				else
					ns <= idle;
				end if;
				
			when row0  =>
				ns	<=	row1;
				
			when row1  =>
				ns <= row2;
				
			when row2  =>
				ns <= row3;
				
			when row3  =>
				ns	<=	row4;
				
			when row4  =>
				ns <= ld_xz;

			when ld_xz =>
				ns <= ld_yw;
			
			when ld_yw =>
				if tc_27 = '0' then
					ns <= pool;
				else
					ns <= last_pool;
				end if;
				
			when pool =>
				ns <= ld_xz;
					
			when last_pool =>
				if done = '1' then
					ns <= idle;
				else
					ns <= row0;
				end if;
			
			when others => 
				ns <= idle;
			
		end case;
	end process;

	process(clk, reset)
	begin
		if reset = '0' then 
			ps <= idle;
		elsif(clk'event	and	clk	= '1') then 
			ps <= ns;
		end if;
	end process;

	process(ps)
	begin
		--init
		cnt5_en_h		<=	'0';
		
		en_rfint_h		<=	'0';
		
		rst_reg_l		<=	'1';
		
		rf_en_0_h		<=	'0';
		rf_en_1_h		<=	'0';
		rf_en_2_h		<=	'0';
		rf_en_3_h		<=	'0';
		rf_en_4_h		<=	'0';
		
		case ps is
			
			when idle =>
				rst_reg_l 		<= '0';
				
				
			when row0 =>
				rf_en_0_h		<=	'1';
				
				
			when row1 =>
				rf_en_1_h		<=	'1';
				
			when row2 =>
				rf_en_2_h		<=	'1';
				
			when row3 =>
				rf_en_3_h		<=	'1';
				
			when row4 =>
				rf_en_4_h		<=	'1';
			
			when ld_xz =>
				en_rfint_h		<=	'1';
				cnt5_en_h		<=	'1';
				
			when ld_yw =>
				en_rfint_h		<=	'1';
				cnt5_en_h		<=	'1';
			
			when pool =>
			
			when last_pool =>
			
			when others => 
				rst_reg_l 		<= '0';

		end case;
	end process;
	
end behavior;