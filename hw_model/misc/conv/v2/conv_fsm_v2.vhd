library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity conv_fsm_v2 is
  port(
    ck             : in  std_logic;
    rst            : in  std_logic;
    start          : in  std_logic;
    s_tc_rd        : in  std_logic;
    s_tc_hmode     : in  std_logic;
    s_tc_vmode     : in  std_logic;
    s_tc_res       : in  std_logic;
    s_tc_tilev     : in  std_logic;
    s_tc_tileh     : in  std_logic;
    s_tc_tileb     : in  std_logic;
    s_tc_tilec     : in  std_logic;
    ctrl_en_npu    : out std_logic;
    ctrl_en_hmode  : out std_logic;
    ctrl_en_vmode  : out std_logic;
    ctrl_en_rf_ptr : out std_logic;
    ctrl_ld_v      : out std_logic;
    ctrl_wr_pipe   : out std_logic;
    ctrl_weight_wr : out std_logic;
    done           : out std_logic
    );
end entity;

architecture beh of conv_fsm_v2 is

  type state is (
    IDLE,
    LD_KERNEL,
    INIT_NPU,
    WAIT_V,
    HMODE,
    VMODE,
    RES,
    LT_RES,
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
    s_tc_rd,
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
          ns <= INIT_NPU;
        else
          ns <= LD_KERNEL;
        end if;
        
      when INIT_NPU =>
        if s_tc_rd = '1' then
          ns <= WAIT_V;
        else
          ns <= INIT_NPU;
        end if;
        
      when HMODE =>
        if s_tc_hmode = '1' then
          if s_tc_vmode = '1' then
            if s_tc_tilev = '1' then
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
        ns <= WAIT_V;

      when WAIT_V =>
        ns <= HMODE;
        
      when RES =>
        if s_tc_res = '1' then
          ns <= HMODE;
        else
          ns <= RES;
        end if;
        
      when LT_RES =>
        if s_tc_res = '1' then
          if (s_tc_tilec and s_tc_tileb and s_tc_tileh and s_tc_tilev) = '1' then
            ns <= EOC;
          else
            ns <= INIT_NPU;
          end if;
        else
          ns <= LT_RES;
        end if;
        
      when others => ns <= IDLE;

    end case;
  end process;

  cc2 : process(ps)
  begin

-- default
    ctrl_weight_wr <= '0';
    ctrl_en_vmode  <= '0';
    ctrl_en_hmode  <= '0';
    ctrl_en_npu    <= '1';
    ctrl_ld_v      <= '0';
    ctrl_en_rf_ptr <= '0';
    ctrl_wr_pipe   <= '0';
    done           <= '0';

    case(ps) is
      when IDLE =>
    ctrl_en_npu    <= '0';
    when LD_KERNEL =>
    ctrl_en_npu    <= '0';
    ctrl_en_vmode  <= '1';
    ctrl_weight_wr <= '1';
    when INIT_NPU =>
    ctrl_en_rf_ptr <= '1';
    ctrl_ld_v      <= '1';
    when WAIT_V =>
    ctrl_ld_v      <= '1';
    when HMODE =>
    ctrl_en_hmode  <= '1';
    when VMODE =>
    ctrl_en_rf_ptr <= '1';
    ctrl_en_vmode  <= '1';
    when RES =>
    ctrl_wr_pipe   <= '1';
    when LT_RES =>
    ctrl_wr_pipe   <= '1';
    when EOC =>
    done           <= '1';

    when others =>

  end case;
end process;


end architecture;

--
--when FILL =>
--              if tc_fill = '1' then
--                      ns <= HMODE;
--              else
--                      ns <= FILL;
--              end if;
--when FILL =>
--                      en_rem_ptr      <= '1';
-- rem ptr is downcnt [(pesize - ksize)+1] if > 0 else ? skip fill
-- while !tc_rem_ptr  enable wr_ptr : i.e. if en_rem_ptr then en_wr_ptr <= not tc_rem_ptr; 
-- if [(pesize - ksize)+1] = 0 do nothing
