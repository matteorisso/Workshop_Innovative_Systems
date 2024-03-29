library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.globals.all;

entity pe is
  port(
    ck           : in  std_logic;
    rst          : in  std_logic;
    ctrl_en      : in  std_logic;
    ctrl_ckg     : in  std_logic;
    ctrl_ldh_v_n : in  std_logic;
    ctrl_wr_pipe : in  std_logic;
    i_ifmap_ptr  : in  unsigned(CLOG2B-1 downto 0);
    i_weight     : in  std_logic_vector(1 downto 0);
    i_data_h     : in  unsigned(N-1 downto 0);
    i_data_v     : in  unsigned(N-1 downto 0);
    i_data_acc   : in  signed(N+BG-1 downto 0);
    o_data_h     : out unsigned(N-1 downto 0);
    o_data_v     : out unsigned(N-1 downto 0);
    o_data_res   : out signed(N+BG-1 downto 0)
    );
end entity;

architecture beh of pe is
  
  type input_rf_t is array (0 to 5) of unsigned(N-1 downto 0);

  signal int_q_reg_v  : input_rf_t;
  signal int_q_reg_h  : input_rf_t;
  signal int_q_weight : std_logic_vector(1 downto 0);
  signal int_q_data   : unsigned(N-1 downto 0);
  signal int_d_acc    : signed(N+BG-1 downto 0);
  signal int_q_acc    : signed(N+BG-1 downto 0);
begin
  
  input_reg : process(ck, rst)
  begin
    if rst = '1' then
      int_q_reg_h  <= (others => (others => '0'));
      int_q_reg_v  <= (others => (others => '0'));
      int_q_weight <= (others => '0');
    elsif rising_edge(ck) then
      if ctrl_en = '1' then        
        int_q_weight <= i_weight;
        
        if ctrl_ldh_v_n = '1' then
          int_q_reg_h(to_integer(i_ifmap_ptr)) <= i_data_v;
          int_q_reg_v(to_integer(i_ifmap_ptr)) <= i_data_v;
        elsif ctrl_ldh_v_n = '0' then
          int_q_reg_h(to_integer(i_ifmap_ptr)) <= i_data_h;
        end if;  --// ld_v
      end if;  --// en
    end if;  --// rising_edge(ck)    
  end process;

  int_q_data_mask : for i in 0 to int_q_data'high generate
    int_q_data(i) <= int_q_reg_h(to_integer(i_ifmap_ptr))(i) and int_q_weight(1);
  end generate;

  add_sub : process(int_q_data, int_q_acc, int_q_weight(0))
  begin
    if int_q_weight(0) = '1' then
      int_d_acc <= int_q_acc - signed('0'&int_q_data);
    else
      int_d_acc <= int_q_acc + signed('0'&int_q_data);
    end if;
  end process;

  acc : process(ck, rst)
  begin
    if rst = '1' then
      int_q_acc <= (others => '0');
    elsif rising_edge(ck) then
      if ctrl_wr_pipe = '1' then
        int_q_acc <= i_data_acc;
      else
        if ctrl_ldh_v_n = '0' then
          if ctrl_ckg = '0' then
            if int_q_weight(1) = '1' then
              int_q_acc <= int_d_acc;
            end if;
          end if;
        end if;
      end if;  --// wr_pipe/en
    end if;  --// rising_edge(ck)
  end process;

  --// output freeze
  res_pin : for i in 0 to o_data_res'high generate
    o_data_res(i) <= ctrl_wr_pipe and int_q_acc(i);  --// for DGB force '1'
  end generate;

  v_reg_pin : for i in 0 to o_data_v'high generate
    o_data_v(i) <= ctrl_ldh_v_n and int_q_reg_v(to_integer(i_ifmap_ptr))(i);
  end generate;
  o_data_h <= int_q_reg_h(to_integer(i_ifmap_ptr));


end architecture;
