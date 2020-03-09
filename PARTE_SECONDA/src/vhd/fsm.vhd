library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity fsm is
  port(
    ck            : in  std_logic;
    rst           : in  std_logic;
    start         : in  std_logic;
    s_tc_hmode    : in  std_logic;
    s_tc_vmode    : in  std_logic;
    s_tc_res      : in  std_logic;
    s_tc_L0       : in  std_logic;      --// ifmaps ptr
    s_tc_L1       : in  std_logic;      --// npu ptr
    s_tc_L2       : in  std_logic;      --// tile-v ptr
    s_tc_L3       : in  std_logic;      --// tile-h ptr
    s_tc_L4       : in  std_logic;      --// ofmaps ptr
    ctrl_en_npu   : out std_logic;
    ctrl_en_hmode : out std_logic;
    ctrl_en_vmode : out std_logic;
    ctrl_ldh_v_n  : out std_logic;
    ctrl_wr_pipe  : out std_logic;
    ctrl_en_p     : out std_logic;
    ctrl_en_st    : out std_logic;
    ctrl_wr_mem   : out std_logic;
    done          : out std_logic
    );
end entity;

architecture beh of fsm is

  type state is (
    IDLE,
    HMODE,
    VMODE,
    PS1,
    PS2,
    RES_PS1,
    RES,
    FILL,
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
    s_tc_L1,
    s_tc_hmode,
    s_tc_vmode,
    s_tc_res,
    s_tc_L2,
    s_tc_L3,
    s_tc_L0,
    s_tc_L4)
  begin
    case (ps) is
      when IDLE =>
        if start = '1' then
          ns <= FILL;
        else
          ns <= IDLE;
        end if;
        
      when HMODE =>
        if (s_tc_hmode and s_tc_L0) = '1' then
          if s_tc_vmode = '1' then
            ns <= PS1;
          else
            ns <= VMODE;
          end if;
        else
          ns <= HMODE;
        end if;
        
      when VMODE =>
        if s_tc_L0 = '1' then
          ns <= HMODE;
        else
          ns <= VMODE;
        end if;

      when PS1 =>
        ns <= PS2;
        
      when PS2 =>
        if s_tc_res = '1' then
          ns <= RES;
        else
          ns <= RES_PS1;
        end if;
        
      when RES_PS1 =>
        ns <= PS2;

      when RES =>
        if (s_tc_L2 and s_tc_L3 and s_tc_L4) = '1' then
          ns <= EOC;
        else
          ns <= FILL;
        end if;
        
      when FILL =>
        if (s_tc_L1 and s_tc_L0) = '1' then
          ns <= HMODE;
        else
          ns <= FILL;
        end if;
        
      when EOC =>
        if start = '1' then
          ns <= FILL;
        else
          ns <= IDLE;
        end if;
        
      when others => ns <= IDLE;

    end case;
  end process;

  cc2 : process(ps)
  begin
-- default
    ctrl_en_vmode <= '0';
    ctrl_en_hmode <= '0';
    ctrl_en_npu   <= '0';
    ctrl_ldh_v_n  <= '0';
    ctrl_wr_pipe  <= '0';
    ctrl_en_p     <= '0';
    ctrl_wr_mem   <= '0';
    ctrl_en_st    <= '0';
    done          <= '0';

    case(ps) is
      when HMODE =>
    ctrl_en_npu   <= '1';
    ctrl_en_hmode <= '1';

    when VMODE =>
    ctrl_ldh_v_n  <= '1';
    ctrl_en_vmode <= '1';
    ctrl_en_npu   <= '1';

    when PS1 =>
    ctrl_wr_pipe <= '1';
    ctrl_en_p    <= '1';

    when PS2 =>
    ctrl_wr_pipe <= '1';
    ctrl_en_p    <= '1';

    when RES_PS1 =>
    ctrl_wr_pipe <= '1';
    ctrl_wr_mem  <= '1';
    ctrl_en_p    <= '1';

    when RES =>
    ctrl_wr_mem <= '1';
    ctrl_en_p   <= '1';
    ctrl_en_st  <= '1';

    when FILL =>
    ctrl_en_npu  <= '1';
    ctrl_ldh_v_n <= '1';

    when EOC =>
    done <= '1';

    when others =>

  end case;
end process;

end architecture;

