library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.globals.all;

entity wrap_act_buffer is
  port(
    ck               : in  std_logic;
    rst              : in  std_logic;
    i_wr             : in  std_logic;
    i_wr_ptr         : in  unsigned(CLOG2W-1 downto 0);
    i_wr_ifmap_ptr   : in  unsigned(CLOG2B-1 downto 0);
    i_rd_ifmap_ptr   : in  unsigned(CLOG2B-1 downto 0);
    i_hmode_cnt      : in  unsigned(CLOG2K-1 downto 0);
    i_acth           : in  std_logic_vector(N*(K-1)-1 downto 0);
    i_actv           : in  std_logic_vector(N*W-1 downto 0);
    int_i_data_h_npu : out std_logic_vector(N*W-1 downto 0);
    int_i_data_v_npu : out std_logic_vector(N*W-1 downto 0)
    );
end entity;

architecture rtl of wrap_act_buffer is
  --// activation queue
  signal int_i_data_if1    : std_logic_vector(N*(K-1)-1 downto 0);
  signal int_i_data_if2    : std_logic_vector(N*(K-1)-1 downto 0);
  signal int_i_data_if3    : std_logic_vector(N*(K-1)-1 downto 0);
  signal int_i_data_if4    : std_logic_vector(N*(K-1)-1 downto 0);
  signal int_i_data_if5    : std_logic_vector(N*(K-1)-1 downto 0);
  signal int_i_data_if6    : std_logic_vector(N*(K-1)-1 downto 0);
  signal int_i_data_if7    : std_logic_vector(N*(K-1)-1 downto 0);
  signal int_i_data_if8    : std_logic_vector(N*(K-1)-1 downto 0);
  signal int_i_data_h_npu1 : signed(N-1 downto 0);
  signal int_i_data_h_npu2 : signed(N-1 downto 0);
  signal int_i_data_h_npu3 : signed(N-1 downto 0);
  signal int_i_data_h_npu4 : signed(N-1 downto 0);
  signal int_i_data_h_npu5 : signed(N-1 downto 0);
  signal int_i_data_h_npu6 : signed(N-1 downto 0);
  signal int_i_data_h_npu7 : signed(N-1 downto 0);
  signal int_i_data_h_npu8 : signed(N-1 downto 0);
  signal int_sel_column    : unsigned(CLOG2K-1 downto 0);

begin
  --// activation fifo
  act_buffer_inst : entity work.act_buffer
    port map (
      ck             => ck,
      rst            => rst,
      i_wr           => i_wr,
      i_wr_ptr       => i_wr_ptr,
      i_wr_ifmap_ptr => i_wr_ifmap_ptr,
      i_rd_ifmap_ptr => i_rd_ifmap_ptr,
      i_data         => i_acth,
      o_data1        => int_i_data_if1,
      o_data2        => int_i_data_if2,
      o_data3        => int_i_data_if3,
      o_data4        => int_i_data_if4,
      o_data5        => int_i_data_if5,
      o_data6        => int_i_data_if6,
      o_data7        => int_i_data_if7,
      o_data8        => int_i_data_if8);

  int_sel_column <= '0' & i_hmode_cnt(i_hmode_cnt'high-1 downto 0);

  act_if_inst : entity work.act_if
    port map (
      i_sel_rotate => i_wr_ptr,
      i_sel_column => int_sel_column,
      i_data1      => int_i_data_if1,
      i_data2      => int_i_data_if2,
      i_data3      => int_i_data_if3,
      i_data4      => int_i_data_if4,
      i_data5      => int_i_data_if5,
      i_data6      => int_i_data_if6,
      i_data7      => int_i_data_if7,
      i_data8      => int_i_data_if8,
      o_data1      => int_i_data_h_npu1,
      o_data2      => int_i_data_h_npu2,
      o_data3      => int_i_data_h_npu3,
      o_data4      => int_i_data_h_npu4,
      o_data5      => int_i_data_h_npu5,
      o_data6      => int_i_data_h_npu6,
      o_data7      => int_i_data_h_npu7,
      o_data8      => int_i_data_h_npu8);

  int_i_data_h_npu <=
    std_logic_vector(int_i_data_h_npu1) &
    std_logic_vector(int_i_data_h_npu2) &
    std_logic_vector(int_i_data_h_npu3) &
    std_logic_vector(int_i_data_h_npu4) &
    std_logic_vector(int_i_data_h_npu5) &
    std_logic_vector(int_i_data_h_npu6) &
    std_logic_vector(int_i_data_h_npu7) &
    std_logic_vector(int_i_data_h_npu8);
  
  process(ck, rst)
  begin
    if rst = '1' then
      int_i_data_v_npu <= (others => '0');
    elsif rising_edge(ck) then
      if i_wr = '1' then
        int_i_data_v_npu <= i_actv;
      end if;
    end if;
  end process;
  
end architecture;
