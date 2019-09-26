library ieee;
	use ieee.std_logic_1164.all;
	use ieee.numeric_std.all;

entity batch_norm_fsm is

	port(
		reset			:	in	std_logic;
		ld_coeff_h		:	in	std_logic;
		act_ready_h		:	in	std_logic;
		clk				:	in	std_logic;
		en_reg_a_h		:	out	std_logic;
		en_reg_act_h	:	out	std_logic;
		en_reg_b_h		:	out	std_logic;
		en_reg_mul_h	:	out	std_logic;
		en_reg_sum_h	:	out	std_logic;
		rst_reg_l		:	out	std_logic;
		en_mul			:	out	std_logic;
		en_sum			:	out	std_logic
	);
		
end batch_norm_fsm;

architecture behavior of batch_norm_fsm is

	type 	state is (rst,ld_coeff,idle,ld_act,mul,sum,relu,mul_ld,sum_mul,relu_sum,sum_mul_ld,relu_sum_mul_ld,relu_sum_mul);
	
	signal 	ps, ns : state;
	
begin

	process(ps,ld_coeff_h,act_ready_h)
	begin
		case	ps	is
		
			when	rst			=>
				if	ld_coeff_h	=	'1'	then
					ns	<=	ld_coeff;
				else
					ns	<=	rst;
				end if;
				
			when	ld_coeff		=>
				ns	<=	idle;
				
			when 	idle 		=>
				if	act_ready_h	=	'1'	then
					ns	<=	ld_act;
				else
					ns	<=	idle;
				end if;
				
			when	ld_act	=>
				if	act_ready_h	=	'1'	then
					ns	<=	mul_ld;
				else
					ns	<=	mul;
				end if;
				
			when	mul 		=>
				ns	<=	sum;
				
			when	sum		=>
				ns	<=	relu;	
				
			when	relu		=>
				ns	<=	rst;
			
			when	mul_ld		=>
				if	act_ready_h	=	'1'	then
					ns	<=	sum_mul_ld;
				else
					ns	<=	sum_mul;
				end if;
				
			when	sum_mul		=>
				ns	<=	relu_sum;
			
			when	relu_sum	=>
				ns	<=	relu;

			when	sum_mul_ld	=>
				if	act_ready_h	=	'1'	then
					ns	<=	relu_sum_mul_ld;
				else
					ns	<=	relu_sum;
				end if;
			
			when	relu_sum_mul_ld	=>
				if	act_ready_h	=	'1'	then
					ns	<=	relu_sum_mul_ld;
				else
					ns	<=	relu_sum_mul;
				end if;
			
			when	relu_sum_mul	=>
				ns	<=	relu_sum;
			
			when others			=> 
				ns	<=	rst;
			
		end case;
	end process;

	process(clk,	reset)
	begin
		if	reset	=	'1'	then 
			ps	<=	rst;
		elsif(clk'event	and	clk	=	'1')	then 
			ps	<=	ns;
		end if;
	end process;

	process(ps)
	begin
		--init
		en_reg_a_h	<=	'0';
		en_reg_b_h	<=	'0';
		en_reg_act_h<=	'0';
		en_reg_mul_h<=	'0';
		en_reg_sum_h<=	'0';
		rst_reg_l	<=	'1';	
		en_mul		<=	'0';	
		en_sum		<=	'0';	
		
		case ps is
			when	rst			=>
				rst_reg_l	<=	'0';
				
			when	ld_coeff	=>
				en_reg_a_h	<=	'1';
				en_reg_b_h	<=	'1';
				
			when 	idle 		=>
				
			when	ld_act		=>
				en_reg_act_h<=	'1';
				
			when	mul 		=>
				en_mul		<=	'1';
				en_reg_mul_h<=	'1';
				
			when	sum		=>
				en_mul		<=	'1';
				en_sum		<=	'1';
				en_reg_sum_h<=	'1';
				
			when	relu		=>
				en_mul		<=	'1';
				en_sum		<=	'1';
			
			when	mul_ld		=>
				en_reg_act_h<=	'1';
				en_mul		<=	'1';
				en_reg_mul_h<=	'1';
				
			when	sum_mul		=>
				en_mul		<=	'1';
				en_reg_mul_h<=	'1';
				en_sum		<=	'1';
				en_reg_sum_h<=	'1';
			
			when	relu_sum	=>
				en_mul		<=	'1';
				en_sum		<=	'1';
				en_reg_sum_h<=	'1';
				
			when	sum_mul_ld	=>
				en_mul		<=	'1';
				en_reg_mul_h<=	'1';
				en_sum		<=	'1';
				en_reg_sum_h<=	'1';
				en_reg_act_h<=	'1';
			
			when	relu_sum_mul_ld	=>
				en_mul		<=	'1';
				en_reg_mul_h<=	'1';
				en_sum		<=	'1';
				en_reg_sum_h<=	'1';
				en_reg_act_h<=	'1';
			
			when	relu_sum_mul	=>
				en_mul		<=	'1';
				en_reg_mul_h<=	'1';
				en_sum		<=	'1';
				en_reg_sum_h<=	'1';
			
			when others			=> 
				

		end case;
	end process;
	
end behavior;