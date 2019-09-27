library ieee;
	use ieee.std_logic_1164.all;
	use ieee.numeric_std.all;

entity conv_unit_fsm is

	port(
		reset			:	in		std_logic;
		clk				:	in		std_logic;
		start			:	in		std_logic;
		done			:	in		std_logic;
		
		tc_4			:	in		std_logic;
		tc_31			:	in		std_logic;
		uph_dnl			:	in		std_logic;
		
		cnt5_en_h		:	out		std_logic;
		
		sbpg_ctrl_inc	:	out		std_logic;
		sbpg_tgl_en_h	:	out		std_logic;
		
		rf_ctrl_inc_h	:	out		std_logic;
		
		spw0_en_0_h		: 	out 	std_logic;
		spw0_en_1_h		: 	out 	std_logic;
		spw0_en_2_h		: 	out 	std_logic;
		spw0_en_3_h		: 	out 	std_logic;
		spw0_en_4_h		: 	out 	std_logic;
		
		spw1_en_0_h		: 	out 	std_logic;
		spw1_en_1_h		: 	out 	std_logic;
		spw1_en_2_h		: 	out 	std_logic;
		spw1_en_3_h		: 	out 	std_logic;
		spw1_en_4_h		: 	out 	std_logic;
		
		spw2_en_0_h		: 	out 	std_logic;
		spw2_en_1_h		: 	out 	std_logic;
		spw2_en_2_h		: 	out 	std_logic;
		spw2_en_3_h		: 	out 	std_logic;
		spw2_en_4_h		: 	out 	std_logic;
		
		spw3_en_0_h		: 	out 	std_logic;
		spw3_en_1_h		: 	out 	std_logic;
		spw3_en_2_h		: 	out 	std_logic;
		spw3_en_3_h		: 	out 	std_logic;
		spw3_en_4_h		: 	out 	std_logic;
		
		spw4_en_0_h		: 	out 	std_logic;
		spw4_en_1_h		: 	out 	std_logic;
		spw4_en_2_h		: 	out 	std_logic;
		spw4_en_3_h		: 	out 	std_logic;
		spw4_en_4_h		: 	out 	std_logic;
		
		spw5_en_0_h		: 	out 	std_logic;
		spw5_en_1_h		: 	out 	std_logic;
		spw5_en_2_h		: 	out 	std_logic;
		spw5_en_3_h		: 	out 	std_logic;
		spw5_en_4_h		: 	out 	std_logic;
		
		rfint_ctrl_sh_h	:	out		std_logic;
		
		rfint_en_h		:	out		std_logic;
		
		rst_reg_l		:	out		std_logic
	);
		
end conv_unit_fsm;

architecture behavior of conv_unit_fsm is

	type 	state is (idle,row0_iw,row1_iw,row2_iw,row3_iw,row4_iw,ld_sipo,conv,new_page,new_row);
	
	signal 	ps, ns : state;
	
begin

	process(ps,start,done,tc_4,tc_31,uph_dnl)
	begin
		case ps	is
		
			when idle =>
				if start = '1' then
					ns <= row0_iw;
				else
					ns <= idle;
				end if;
				
			when row0_iw =>
				ns	<=	row1_iw;
				
			when row1_iw =>
				ns <= row2_iw;
				
			when row2_iw =>
				ns <= row3_iw;
				
			when row3_iw =>
				ns	<=	row4_iw;
				
			when row4_iw =>
				ns <= ld_sipo;	
			
			when ld_sipo =>
				if	tc_4 = '1' then
					ns <= conv;
				else
					ns <= ld_sipo;
				end if;
				
			when conv =>
				if tc_31 = '1' then
					if uph_dnl = '1' then
						ns <= new_page;
					else
						ns <= new_row;
					end if;
				else
					ns <= conv;
				end if;
			
			when new_page =>
				ns <= ld_sipo;
			
			when new_row =>
				if done = '1' then
					ns <= idle;
				else
					ns <= ld_sipo;
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
		
		sbpg_ctrl_inc	<=	'0';
		sbpg_tgl_en_h	<=	'0';
		
		rf_ctrl_inc_h	<=	'0';
		
		spw0_en_0_h		<=	'0';
		spw0_en_1_h		<=	'0';
		spw0_en_2_h		<=	'0';
		spw0_en_3_h		<=	'0';
		spw0_en_4_h		<=	'0';
		
		spw1_en_0_h		<=	'0';
		spw1_en_1_h		<=	'0';
		spw1_en_2_h		<=	'0';
		spw1_en_3_h		<=	'0';
		spw1_en_4_h		<=	'0';
		
		spw2_en_0_h		<=	'0';
		spw2_en_1_h		<=	'0';
		spw2_en_2_h		<=	'0';
		spw2_en_3_h		<=	'0';
		spw2_en_4_h		<=	'0';
		
		spw3_en_0_h		<=	'0';
		spw3_en_1_h		<=	'0';
		spw3_en_2_h		<=	'0';
		spw3_en_3_h		<=	'0';
		spw3_en_4_h		<=	'0';
		
		spw4_en_0_h		<=	'0';
		spw4_en_1_h		<=	'0';
		spw4_en_2_h		<=	'0';
		spw4_en_3_h		<=	'0';
		spw4_en_4_h		<=	'0';
		
		spw5_en_0_h		<=	'0';
		spw5_en_1_h		<=	'0';
		spw5_en_2_h		<=	'0';
		spw5_en_3_h		<=	'0';
		spw5_en_4_h		<=	'0';
		
		rfint_ctrl_sh_h	<=	'0';
		
		rfint_en_h		<=	'0';
		
		rst_reg_l		<=	'1';
		
		case ps is
			
			when idle =>
				rst_reg_l 		<= '0';
				
				
			when row0_iw =>
				rf_ctrl_inc_h	<=	'1';
				spw0_en_0_h		<=	'1';
				spw1_en_0_h		<=	'1';
				spw2_en_0_h		<=	'1';
				spw3_en_0_h		<=	'1';
				spw4_en_0_h		<=	'1';
				spw5_en_0_h		<=	'1';
				
				
			when row1_iw =>
				rf_ctrl_inc_h	<=	'1';
				spw0_en_1_h		<=	'1';
				spw1_en_1_h		<=	'1';
				spw2_en_1_h		<=	'1';
				spw3_en_1_h		<=	'1';
				spw4_en_1_h		<=	'1';
				spw5_en_1_h		<=	'1';
				
			when row2_iw =>
				rf_ctrl_inc_h	<=	'1';
				spw0_en_2_h		<=	'1';
				spw1_en_2_h		<=	'1';
				spw2_en_2_h		<=	'1';
				spw3_en_2_h		<=	'1';
				spw4_en_2_h		<=	'1';
				spw5_en_2_h		<=	'1';
				
			when row3_iw =>
				rf_ctrl_inc_h	<=	'1';
				spw0_en_3_h		<=	'1';
				spw1_en_3_h		<=	'1';
				spw2_en_3_h		<=	'1';
				spw3_en_3_h		<=	'1';
				spw4_en_3_h		<=	'1';
				spw5_en_3_h		<=	'1';
				
			when row4_iw =>
				rf_ctrl_inc_h	<=	'1';
				spw0_en_4_h		<=	'1';
				spw1_en_4_h		<=	'1';
				spw2_en_4_h		<=	'1';
				spw3_en_4_h		<=	'1';
				spw4_en_4_h		<=	'1';
				spw5_en_4_h		<=	'1';
			
			when ld_sipo =>
				rfint_en_h		<=	'1';
				cnt5_en_h		<=	'1';
				sbpg_tgl_en_h	<=	'1';
				
			when conv =>
				cnt5_en_h		<=	'1';
				rfint_en_h		<=	'1';
			
			when new_page =>
				sbpg_ctrl_inc	<=	'1';
				rfint_ctrl_sh_h	<=	'1';
	
			
			when new_row =>
				rf_ctrl_inc_h	<=	'1';
				sbpg_ctrl_inc	<=	'1';
				rfint_ctrl_sh_h	<=	'1';
				
				
			when others => 
				

		end case;
	end process;
	
end behavior;