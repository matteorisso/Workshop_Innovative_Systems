
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity conv_fsm is 
port( 
	ck                 	: in std_logic; 
	rst                 	: in std_logic;
	start          	   : in std_logic;
	  
	s_tc_wr             	: in std_logic; 
	s_tc_hmode          	: in std_logic;
	s_tc_vmode          	: in std_logic;
	s_tc_res            	: in std_logic;
	s_tc_tilev          	: in std_logic; 
	s_tc_tilec         	: in std_logic;
  
	ctrl_en_pe          	: out std_logic;
	ctrl_en_rd_ptr      	: out std_logic;
	ctrl_en_wr_ptr			: out std_logic;
	ctrl_en_res_ptr		: out std_logic;
	done                	: out std_logic);

		--TCF 			: in std_logic;
		--EN_FILL_PTR	: out std_logic;
end entity;

architecture beh of conv_fsm is

type state is (IDLE, LD_KERNEL, INIT, HMODE, VMODE, RES, EOC); --FILL,
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

cc1: process(ps, start, s_tc_wr, s_tc_hmode, s_tc_vmode, s_tc_res, s_tc_tilev, s_tc_tilec)
begin
case (ps) is

when IDLE => 
		if start = '1' then
			ns <= INIT;
		else 
			ns <= IDLE;
		end if; 
		
--when LD_KERNEL =>
--	   if TC_HMODE = '1' then
--			ns <= INIT;
--		else 
--			ns <= LD_KERNEL;
--		end if;
--		
when INIT => 
		if s_tc_wr = '1' then
			ns <=	HMODE;
		else 
			ns <= INIT;
		end if;
 
when HMODE =>
		if s_tc_hmode = '1' then
			if s_tc_vmode = '1' then 
				ns <= RES; 
			else
				ns <= VMODE;
			end if; 
		else
			ns <= HMODE;
		end if;	
		
when VMODE => ns <= HMODE;

when RES =>
		if s_tc_res = '1' then   
			if s_tc_tilev = '1' then
				if s_tc_tilec = '1' then
					ns <= EOC;
				else
					ns <= INIT;
				end if;
			else
				ns <= HMODE; --FILL;
			end if;
		else
			ns <= RES;
		end if;	

when others => ns <= IDLE;
end case;
end process;

cc2:process(ps)
begin
-- default
ctrl_en_rd_ptr 	<= '0'; 
ctrl_en_wr_ptr 	<= '0';
ctrl_en_res_ptr	<= '0';
done 			<= '0'; 

case(ps) is
when LD_KERNEL =>
			ctrl_en_rd_ptr	<= '1';
when INIT => 
			ctrl_en_wr_ptr 	<= '1';
			ctrl_en_pe  <= '0';
when HMODE =>
			ctrl_en_rd_ptr 	<= '1'; 
			ctrl_en_pe 	<= '1';
when VMODE =>  
		--	CS <= '1';--	RD <= '1'; kernel
			ctrl_en_wr_ptr   <= '1'; 
when RES =>
			ctrl_en_pe 	<= '0';
			ctrl_en_res_ptr 	<= '1';
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
