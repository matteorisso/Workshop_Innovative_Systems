library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity fsm is
  port(
    ck            : in  std_logic;
    rst           : in  std_logic;
    start         : in  std_logic;
    s_tc_npu_ptr  : in  std_logic;
    s_tc_hmode    : in  std_logic;
    s_tc_vmode    : in  std_logic;
    s_tc_res      : in  std_logic;
    s_tc_tilev    : in  std_logic;
    s_tc_tileh    : in  std_logic;
    s_tc_ifmaps   : in  std_logic;
    s_tc_ofmaps   : in  std_logic;
    ctrl_en_npu   : out std_logic;
    ctrl_en_hmode : out std_logic;
    ctrl_en_vmode : out std_logic;
    ctrl_ldh_v_n  : out std_logic;
    ctrl_wr_pipe  : out std_logic;
    ctrl_en_p     : out std_logic;
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
    s_tc_npu_ptr,
    s_tc_hmode,
    s_tc_vmode,
    s_tc_res,
    s_tc_tilev,
    s_tc_tileh,
    s_tc_ifmaps,
    s_tc_ofmaps)
  begin
    case (ps) is

      when IDLE =>
        if start = '1' then
          ns <= FILL;
        else
          ns <= IDLE;
        end if;
        
      when HMODE =>
        if (s_tc_hmode and s_tc_ifmaps) = '1' then
          if s_tc_vmode = '1' then
            ns <= PS1;
          else
            ns <= VMODE;
          end if;
        else
          ns <= HMODE;
        end if;
        
      when VMODE =>
        if s_tc_ifmaps = '1' then
          ns <= HMODE;
        else
          ns <= VMODE;
        end if;

      when PS1 =>
        ns <= PS2;
        
      when PS2 =>
        if s_tc_res = '1' then
          if (s_tc_tilev and s_tc_tileh and s_tc_ofmaps) = '1' then
            ns <= EOC;
          else
            ns <= FILL;
          end if;
        else
          ns <= PS2;
        end if;
        
      when RES_PS1 =>
        ns <= PS2;

      when FILL =>
        if (s_tc_npu_ptr and s_tc_ifmaps) = '1' then
          ns <= HMODE;
        else
          ns <= FILL;
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

    when FILL =>
    ctrl_en_npu  <= '1';
    ctrl_ldh_v_n <= '1';

    when EOC =>
    done <= '1';

    when others =>

  end case;
end process;


end architecture;

