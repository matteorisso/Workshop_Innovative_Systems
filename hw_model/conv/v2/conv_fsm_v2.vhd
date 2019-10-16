library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity conv_fsm_v2 is 
port( 
	ck                : in std_logic; 
	rst               : in std_logic;
	start          	: in std_logic;

	s_tc_wr				: in std_logic; 
	s_tc_hmode			: in std_logic;
	s_tc_vmode			: in std_logic;
	s_tc_res				: in std_logic; 
	s_last_tile			: in std_logic; 
	s_tc_tilev			: in std_logic;
	s_tc_tileh			: in std_logic;
	s_tc_tileb			: in std_logic;
	s_tc_tilec			: in std_logic;

	ctrl_en_vmode		: out	std_logic;
	ctrl_en_npu			: out std_logic;
	ctrl_ld_h			: out	std_logic;
	ctrl_ld_v			: out std_logic;
	ctrl_wr_pipe		: out std_logic;
	ctrl_sel_arv_res	: out std_logic; 
	
	done              : out std_logic
	);

end entity;

architecture beh of conv_fsm_v2 is

type state is (
	IDLE, 
	LD_KERNEL, 
	INIT, 
	HMODE, 
	VMODE, 
	RES, 
	LT_RES, 
	EOC);

signal ps, ns : state; 

begin

state_transitions: process(ck, rst)
begin
	if rst='1' then
		ps	<=	IDLE;
	elsif rising_edge(ck) then
		ps	<=	ns;
	end if;	
end process;

cc1: process	(
	ps, 
	start, 
	s_tc_wr, 
	s_tc_hmode, 
	s_tc_vmode, 
	s_tc_res, 
	s_tc_tilev, 
	s_tc_tileh,
	s_tc_tileb, 
	s_tc_tilec
	)
	
begin

case (ps) is

when IDLE => 
		if start = '1' then
			ns <= LD_KERNEL;
		else 
			ns <= IDLE;
		end if; 
		
when LD_KERNEL =>
	   if s_tc_vmode = '1' then
			ns <= INIT;
		else 
			ns <= LD_KERNEL;
		end if;
		
when INIT => 
		if s_tc_wr = '1' then	
			ns <=	HMODE;
		else 
			ns <= INIT;
		end if;
 
when HMODE =>
		if s_tc_hmode = '1' then	
			if s_tc_vmode = '1' then
				if s_last_tile = '1' then
					ns <= LT_RES;
				else
					ns <= RES;
				end if;
			else
				ns <= VMODE; 
			end if;
		else
				ns <= HMODE;
		end if;	
		
when VMODE => 
			ns <= HMODE;

when RES =>
		if s_tc_res = '1' then   
				ns <= HMODE;
		else
				ns <= RES;
		end if;	
		
when LT_RES =>
		if s_tc_res = '1' then
			if s_tc_tileb = '1' then
				ns <= LD_KERNEL;
			else
				ns <= INIT;
			end if;
		else
			ns <= LT_RES;
		end if;
		
when others => ns <= IDLE;

end case;
end process;

cc2:process(ps)
begin
 
-- default
ctrl_en_vmode 		<= '0';
ctrl_en_npu 		<= '1'; 
ctrl_ld_h			<= '0';
ctrl_ld_v			<= '0';
ctrl_wr_pipe		<= '0';
ctrl_sel_arv_res	<= '0';
done 					<= '0'; 

case(ps) is
when LD_KERNEL =>
			ctrl_en_npu			<= '0';
			ctrl_en_vmode		<= '1';
			
when INIT => 
			
			ctrl_en_npu 		<= '0';
			ctrl_ld_v			<= '1';
			
when HMODE =>
			ctrl_ld_h 			<= '1'; 
			
when VMODE =>  
			ctrl_ld_v			<= '1'; 
			ctrl_en_vmode  	<= '1';
			
when RES =>
			ctrl_wr_pipe 		<= '1';
			
when LT_RES =>
			ctrl_wr_pipe 		<= '1';
			ctrl_sel_arv_res	<= '1';

when EOC => 
			done <= '1'; 

when others =>  

end case;
end process;
	
	
end architecture; 

--
--when FILL =>
--		if tc_fill = '1' then
--			ns <= HMODE;
--		else
--			ns <= FILL;
--		end if;
--when FILL =>
--			en_rem_ptr 	<= '1';
			-- rem ptr is downcnt [(pesize - ksize)+1] if > 0 else ? skip fill
			-- while !tc_rem_ptr  enable wr_ptr : i.e. if en_rem_ptr then en_wr_ptr <= not tc_rem_ptr; 
			-- if [(pesize - ksize)+1] = 0 do nothing
