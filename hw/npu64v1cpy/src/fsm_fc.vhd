library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity fsm_fc is
  port(
    ck           : in  std_logic;
    rst          : in  std_logic;
    start        : in  std_logic;
    s_tc_res     : in  std_logic;
    --s_tc_L0       : in  std_logic;      --// stuck at 1 - do not use input rf
    s_tc_L1      : in  std_logic;       --// px in word ptr
    s_tc_L2      : in  std_logic;       --// half of word ptr
    s_tc_L3      : in  std_logic;       --// half of word ptr
    s_tc_L4      : in  std_logic;       --// step ptr (64 output neurons /step)
    ctrl_en_npu  : out std_logic;
    ctrl_ldh_v_n : out std_logic;
    ctrl_wr_pipe : out std_logic;
    done         : out std_logic
    );
end entity;

architecture beh of fsm is

  type state is (
    IDLE,
    LD,
    ACC,
    RES
    EOC);

  signal ps, ns : state;

begin
  
  state_transitions : process(ck, rst)
  begin
    if rst = '1' then
      ps <= IDLE;
    elsif rising_edge(ck) then
      ps <= ns;
    end if;
  end process;

  cc1 : process (
    ps,
    start,
    s_tc_res,
    s_tc_L0,
    s_tc_L1,
    s_tc_L2,
    s_tc_L3,
    s_tc_L4)
  begin
    case (ps) is
      
      when IDLE =>
        if start = '1' then
          ns <= LD;
        else
          ns <= IDLE;
        end if;
        
      when LD =>
        ns <= ACC;
        
      when ACC =>
        if (s_tc_L1 and s_tc_L2 and s_tc_L3) = '1' then  --// first 64          
          ns <= RES;
        else
          ns <= LD;
        end if;

      when RES =>
        if s_tc_L4 = '1' then
          ns <= IDLE;
        else
          ns <= LD;
        end if;
      when others => ns <= IDLE;

    end case;
  end process;

  cc2 : process(ps)
  begin
-- default
    ctrl_en_npu  <= '0';
    ctrl_ldh_v_n <= '0';
    ctrl_wr_pipe <= '0';
    done         <= '0';

    case(ps) is
      
      when LD =>
    ctrl_ldh_v_n <= '1';

    when ACC =>
    ctrl_en_npu <= '1';

    when RES =>
    ctrl_wr_pipe <= '1';

    when EOC =>
    done <= '1';

    when others =>

  end case;
end process;

end architecture;


