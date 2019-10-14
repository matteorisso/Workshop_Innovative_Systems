library ieee;
	use ieee.std_logic_1164.all;
	use ieee.numeric_std.all;

entity conv_pool_intf_fsm is

	port(
		reset			:	in		std_logic;
		clk				:	in		std_logic;
		start			:	in		std_logic;
		load			:	in		std_logic;
		done			:	in		std_logic;
		
		pl_nh			: 	in		std_logic;
		tc_6			:	in		std_logic;
		
		en_cnt_h		: 	out 	std_logic;
		en_tff_h		: 	out 	std_logic;
		en_i_h			: 	out 	std_logic;
		en_k_h			: 	out 	std_logic;
		rst_l 			: 	out 	std_logic;
		rst_cnt_l 		:	out 	std_logic;
		evenl_oddh 		: 	out 	std_logic;
		toggle			: 	out		std_logic;
		mux_sel			: 	out		std_logic;
		out_sel			: 	out		std_logic;
		inc				: 	out 	std_logic_vector(1 	downto 0)
	);
		
end conv_pool_intf_fsm;

architecture behavior of conv_pool_intf_fsm is

	type 	state is (idle,ld,wr_0_even,wr_1_even,wait_even,wr_2_even,wr_3_even,wait_even1,wait_even2,wr_l_even,wr_l1_even,even_odd,wait_odd,wait_odd1,wait_odd2,wr_0_odd,wr_1_odd,wr_2_odd,wr_3_odd,wr_l_odd,wr_l1_odd,odd_even);
	
	signal 	ps, ns : state;
	
begin

	process(ps,start,load,done,tc_6,pl_nh)
	begin
		case ps	is
		
			when idle =>
				if start = '1' then
					ns <= ld;
				else
					ns <= idle;
				end if;
				
			when ld =>
				if load = '1' then
					if	pl_nh = '0' then
						ns <= wr_0_even;
					else
						ns <= wr_0_odd;
					end if;
				else
					ns	<=	ld;
				end if;
				
			when wr_0_even =>
				ns <= wr_1_even;
				
			when wr_1_even =>
				if	load = '1' then
					ns <= wr_2_even;
				else
					ns <= wait_even;
				end if;
			
			when wait_even =>
				if	load = '1' then
					ns <= wr_2_even;
				else
					ns <= wait_even;
				end if;
				
			when wr_2_even =>
				ns <= wr_3_even;
				
			when wr_3_even =>
				if	tc_6 = '0' then
					if	load = '1' then
						ns <= wr_0_even;
					else
						ns <= wait_even1;
					end if;
				else
					if	load = '1' then
						ns <= wr_l_even;
					else
						ns <= wait_even2;
					end if;
				end if;
			
			when wait_even1=>
				if	load = '1' then
					ns <= wr_0_even;
				else
					ns <= wait_even1;
				end if;
				
			when wait_even2=>
				if	load = '1' then
					ns <= wr_l_even;
				else
					ns <= wait_even2;
				end if;
				
			when wr_l_even =>
				ns <= wr_l1_even;
				
			when wr_l1_even =>
				ns <= even_odd;
			
			when even_odd =>
				if done = '1' then
					ns <= idle;
				else
					ns <= ld;
				end if;
				
			when wr_0_odd =>
				ns <= wr_1_odd;
			
			when wr_1_odd =>
				if	load = '1' then
					ns <= wr_2_odd;
				else
					ns <= wait_odd;
				end if;
			
			when wait_odd =>
				if	load = '1' then
					ns <= wr_2_odd;
				else
					ns <= wait_odd;
				end if;
				
			when wr_2_odd =>
				ns <= wr_3_odd;
				
			when wr_3_odd =>
				if	tc_6 = '0' then
					if	load = '1' then
						ns <= wr_0_odd;
					else
						ns <= wait_odd1;
					end if;
				else
					if	load = '1' then
						ns <= wr_l_odd;
					else
						ns <= wait_odd2;
					end if;
				end if;
			
			when wait_odd1=>
				if	load = '1' then
					ns <= wr_0_odd;
				else
					ns <= wait_odd1;
				end if;
				
			when wait_odd2=>
				if	load = '1' then
					ns <= wr_l_odd;
				else
					ns <= wait_odd2;
				end if;
			
			when wr_l_odd =>
				ns <= wr_l1_odd;
				
			when wr_l1_odd =>
				ns <= odd_even;
			
			when odd_even =>
				if done = '1' then
					ns <= idle;
				else
					ns <= ld;
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
		en_cnt_h		<=	'0';
		en_tff_h		<=	'0';
		en_i_h			<=	'0';
		en_k_h			<=	'0';
		rst_l 			<=	'1';
		rst_cnt_l		<=	'1';
		evenl_oddh 		<=	'0';
		toggle			<=	'0';
		mux_sel			<=	'0';
		out_sel			<=	'0';
		inc				<=	"11";
		
		case ps is
			
			when idle 		=>
				rst_l 		<= '0';
				rst_cnt_l	<= '0';
				
			when ld			=>
				
				
			when wr_0_even 	=>
				en_cnt_h	<=	'1';
				en_tff_h	<=	'1';
				en_i_h		<=	'1';
				inc			<=	"00";
			
			when wr_1_even 	=>
				en_tff_h	<=	'1';
				en_i_h		<=	'1';
				mux_sel		<=	'1';
				inc			<=	"01";
				
			when wait_even	=>
				en_tff_h	<=	'1';
			
			when wr_2_even 	=>
				en_cnt_h	<=	'1';
				en_tff_h	<=	'1';
				en_i_h		<=	'1';
				inc			<=	"00";
			
			when wr_3_even 	=>
				en_tff_h	<=	'1';
				en_i_h		<=	'1';
				mux_sel		<=	'1';
				inc			<=	"00";
			
			when wait_even1	=>
				en_tff_h	<=	'1';
			
			when wait_even2	=>
				en_tff_h	<=	'1';
			
			when wr_l_even 	=>
				en_tff_h	<=	'1';
				en_i_h		<=	'1';
				mux_sel		<=	'1';
				inc			<=	"00";
			
			when wr_l1_even 	=>
				en_tff_h	<=	'1';
				en_i_h		<=	'1';
				mux_sel		<=	'1';
				inc			<=	"00";
				
			
			when even_odd	=>
				en_tff_h	<=	'1';
				en_i_h		<=	'1';
				toggle		<=	'1';
				rst_cnt_l	<=	'0';
			
			when wr_0_odd 	=>
				out_sel		<=	'1';
				evenl_oddh 	<=	'1';
				en_cnt_h	<=	'1';
				en_tff_h	<=	'1';
				en_k_h		<=	'1';
				inc			<=	"00";
				
			when wr_1_odd 	=>
				out_sel		<=	'1';
				evenl_oddh 	<=	'1';
				en_tff_h	<=	'1';
				en_k_h		<=	'1';
				inc			<=	"01";
				
			when wait_odd	=>
				out_sel		<=	'1';
				evenl_oddh 	<=	'1';
				en_tff_h	<=	'1';
			
			when wr_2_odd	=>
				out_sel		<=	'1';
				evenl_oddh 	<=	'1';
				en_cnt_h	<=	'1';
				en_tff_h	<=	'1';
				en_k_h		<=	'1';
				inc			<=	"00";
			
			when wr_3_odd 	=>
				out_sel		<=	'1';
				evenl_oddh 	<=	'1';
				en_tff_h	<=	'1';
				en_k_h		<=	'1';
				inc			<=	"00";
				
			when wait_odd1	=>
				out_sel		<=	'1';
				evenl_oddh 	<=	'1';
				en_tff_h	<=	'1';
			
			when wait_odd2	=>
				out_sel		<=	'1';
				evenl_oddh 	<=	'1';
				en_tff_h	<=	'1';
			
			when wr_l_odd 	=>
				out_sel		<=	'1';
				evenl_oddh 	<=	'1';
				en_tff_h	<=	'1';
				en_k_h		<=	'1';
				mux_sel		<=	'1';
				inc			<=	"00";
			
			when wr_l1_odd 	=>
				out_sel		<=	'1';
				evenl_oddh 	<=	'1';
				en_tff_h	<=	'1';
				en_k_h		<=	'1';
				mux_sel		<=	'1';
				inc			<=	"00";
				
			
			when odd_even	=>	
				out_sel		<=	'1';
				evenl_oddh 	<=	'1';
				en_tff_h	<=	'1';
				en_k_h		<=	'1';
				toggle		<=	'1';
				rst_cnt_l	<=	'0';
				
			when others 	=> 
				rst_l 		<= '0';
				rst_cnt_l	<= '0';

		end case;
	end process;
	
end behavior;