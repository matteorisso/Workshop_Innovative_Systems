
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity conv_fsm is 
port( 
		ck		: in std_logic; 
		rst 	: in std_logic;
		start : in std_logic;
		
		TC_WR : in std_logic; 
		TC_HMODE	: in std_logic;
		TC_VMODE	: in std_logic;
		TC_RES  : in std_logic;
		TC_TILEV	: in std_logic; 
		TC_TILEC : in std_logic;
		EN_RD_PTR  : out std_logic;
		EN_WR_PTR  : out std_logic;
		EN_RES_PTR : out std_logic;
		done  : out std_logic);
		
		--TCF 			: in std_logic;
		--EN_FILL_PTR	: out std_logic;
end entity;

architecture beh of conv_fsm is

type state is (IDLE, INIT, HMODE, VMODE, RES, EOC); --FILL,
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

cc1: process(ps, start, TC_WR, TC_HMODE, TC_VMODE, TC_RES, TC_TILEV, TC_TILEC)
begin
case (ps) is

when IDLE => 
		if start = '1' then
			ns <= INIT;
		else 
			ns <= IDLE;
		end if; 
		
when INIT => 
		if TC_WR = '1' then
			ns <= HMODE;
		else 
			ns <= INIT;
		end if;
		
when HMODE =>
		if TC_HMODE = '1' then
			if TC_VMODE = '1' then 
				ns <= RES; 
			else
				ns <= VMODE;
			end if; 
		else
			ns <= HMODE;
		end if;	
		
when VMODE => ns <= HMODE;

when RES =>
		if TC_RES = '1' then   
			if TC_TILEV = '1' then
				if TC_TILEC = '1' then
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
EN_RD_PTR 	<= '0'; 
EN_WR_PTR 	<= '0';
EN_RES_PTR	<= '0';
done 			<= '0'; 
case(ps) is
when INIT => 
			EN_WR_PTR 	<= '1';
		-- ctrl_en_pe  <= '0';
when HMODE =>
			EN_RD_PTR 	<= '1'; 
		--	ctrl_en_pe 	<= '1';
when VMODE =>  
		--	CS <= '1';
		--	RD <= '1'; kernel
			EN_WR_PTR   <= '1'; 
when RES =>
			--	ctrl_en_pe 	<= '0';
			EN_RES_PTR 	<= '1';
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
