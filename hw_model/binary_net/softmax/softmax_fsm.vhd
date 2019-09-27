library ieee;
	use ieee.std_logic_1164.all;
	use ieee.numeric_std.all;

entity softmax_fsm is

	port(
		reset			:	in		std_logic;
		clk				:	in		std_logic;
		start			:	in		std_logic;
		
		tc_9			:	in		std_logic;
		
		cnt4_en_h		:	out		std_logic;
		
		en_reg_h		:	out		std_logic;
		rst_reg_l		:	out		std_logic
	);
		
end softmax_fsm;

architecture behavior of softmax_fsm is

	type 	state is (idle,find_max,en_exp,eval,wait_0);
	
	signal 	ps, ns : state;
	
begin

	process(ps,start,tc_9)
	begin
		case ps	is
		
			when idle =>
				if start = '1' then
					ns <= find_max;
				else
					ns <= idle;
				end if;
				
			when find_max =>
				if	tc_9 = '1' then
					ns <= en_exp;
				else
					ns <= find_max;
				end if;
			
			when en_exp =>
				ns <= eval;
		
			when eval =>
				if tc_9 = '1' then
					ns <= wait_0;
				else
					ns <= eval;
				end if;
			
			when wait_0 =>
				ns <= idle;
				
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
		cnt4_en_h		<=	'0';
		en_reg_h		<=	'0';
		rst_reg_l		<=	'1';
		
		case ps is
			
			when idle		=>
				rst_reg_l	<= '0';
				
			when find_max	=>
				cnt4_en_h	<=	'1';
			
			when en_exp		=>
				en_reg_h	<=	'1';

			when eval		=>
				cnt4_en_h	<=	'1';
				en_reg_h	<=	'1';
			
			when wait_0		=>
				en_reg_h	<=	'1';
				
			when others => 
				

		end case;
	end process;
	
end behavior;