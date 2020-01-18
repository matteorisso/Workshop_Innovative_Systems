library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.globals.all;

entity pe is
  port(
    ck          : in  std_logic;
    rst         : in  std_logic;
    en          : in  std_logic;
    ckg         : in  std_logic;
    ldh_v_n     : in  std_logic;
    wr_pipe     : in  std_logic;
    i_ifmap_ptr : in  unsigned(CLOG2B-1 downto 0);
    i_weight    : in  std_logic_vector(1 downto 0);
    i_data_h    : in  unsigned(N-1 downto 0);
    i_data_v    : in  unsigned(N-1 downto 0);
    i_data_acc  : in  signed(N+BG-1 downto 0);
    o_data_h    : out unsigned(N-1 downto 0);
    o_data_v    : out unsigned(N-1 downto 0);
    o_data_res  : out signed(N+BG-1 downto 0)
    );

end entity;

architecture beh of pe is

  type input_rf_t is array (0 to 5) of unsigned(N-1 downto 0);

  signal int_q_reg_v : input_rf_t;
  signal int_q_reg_h : input_rf_t;
  signal int_data    : unsigned(N-1 downto 0);
  signal int_d_acc   : signed(N+BG-1 downto 0);
  signal int_q_acc   : signed(N+BG-1 downto 0);
  
begin
  --------------------------------------------------------------------
  -- // pe_input
  --------------------------------------------------------------------
  
  input_reg:
  process(ck, rst)
  begin
    if rst = '1' then
      int_q_reg_h <= (others => (others => '0'));
      int_q_reg_v <= (others => (others => '0'));
      
    elsif rising_edge(ck) then
      if en = '1' then
        if ldh_v_n = '1' then
          int_q_reg_h(to_integer(i_ifmap_ptr)) <= i_data_v;
          int_q_reg_v(to_integer(i_ifmap_ptr)) <= i_data_v;
          
        elsif ldh_v_n = '0' then
          int_q_reg_h(to_integer(i_ifmap_ptr)) <= i_data_h;
          
        end if;  -- ld_v
      end if;  -- en
    end if;  -- rising_edge(ck)    
  end process;

  --------------------------------------------------------------------
  -- // pe_core
  --------------------------------------------------------------------

  add_mux :
    int_data <= int_q_reg_h(to_integer(i_ifmap_ptr)) when i_weight(1) = '1' else (others => '0');
  
  add_sub :
  process(int_data, int_q_acc, i_weight(0))
  begin
    if i_weight(0) = '1' then
      int_d_acc <= int_q_acc - signed('0'&int_data);
    else
      int_d_acc <= int_q_acc + signed('0'&int_data);
    end if;
  end process;

  --------------------------------------------------------------------
  -- // pe_output 
  --------------------------------------------------------------------

  acc:
  process(ck, rst)
  begin
    
    if rst = '1' then
      int_q_acc <= (others => '0');
      
    elsif rising_edge(ck) then
      if wr_pipe = '1' then
        int_q_acc <= i_data_acc;
        
      else
        if ldh_v_n = '0' then
          if ckg = '0' then
            if i_weight(1) = '1' then
              int_q_acc <= int_d_acc;
              
            end if;
          end if;
        end if;
        
      end if;  -- wr_pipe/en
    end if;  -- rising_edge(ck)
  end process;

  --// output freeze
  res_pin : for i in 0 to o_data_res'high generate
    o_data_res(i) <= wr_pipe and int_q_acc(i);  --//for DGB force '1'
  end generate;
  v_reg_pin : for i in 0 to o_data_v'high generate
    o_data_v(i) <= ldh_v_n and int_q_reg_v(to_integer(i_ifmap_ptr))(i);
  end generate;

  o_data_h <= int_q_reg_h(to_integer(i_ifmap_ptr));

end architecture;
