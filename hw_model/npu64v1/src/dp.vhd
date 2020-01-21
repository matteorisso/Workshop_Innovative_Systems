library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.globals.all;

entity dp is
  port (
    ck               : in  std_logic;
    rst              : in  std_logic;
    i_acth           : in  std_logic_vector(N*W-1 downto 0);
    i_actv           : in  std_logic_vector(N*W-1 downto 0);
    i_weight         : in  std_logic_vector(1 downto 0);
    i_gamma          : in  signed(7 downto 0);
    i_beta           : in  signed(7 downto 0);
    arv_npu          : in  unsigned(CLOG2W-1 downto 0);
    arv_ckg          : in  unsigned(CLOG2W-1 downto 0);
    arv_k            : in  unsigned(CLOG2K-1 downto 0);
    arv_tile         : in  unsigned(CLOG2T-1 downto 0);
    arv_ifmaps       : in  unsigned(CLOG2B-1 downto 0);
    arv_ofmaps       : in  unsigned(CLOG2C-1 downto 0);
    ctrl_en_npu      : in  std_logic;
    ctrl_ldh_v_n     : in  std_logic;
    ctrl_en_hmode    : in  std_logic;
    ctrl_en_vmode    : in  std_logic;
    ctrl_wr_pipe     : in  std_logic;
    s_tc_hmode       : out std_logic;
    s_tc_vmode       : out std_logic;
    s_tc_res         : out std_logic;
    s_tc_npu_ptr     : out std_logic;
    s_tc_tilev       : out std_logic;
    s_tc_tileh       : out std_logic;
    s_tc_ifmaps      : out std_logic;
    s_tc_ofmaps      : out std_logic;
    i_weight_addr    : out unsigned(31 downto 0);
    i_data_ev_odd_n  : out std_logic;
    i_data_even_addr : out unsigned(CLOG2M+CLOG2W-1 downto 0);
    i_data_odd_addr  : out unsigned(CLOG2M+CLOG2W-1 downto 0);
    o_data_ev_odd_n  : out std_logic;
    o_data_even_addr : out unsigned(CLOG2M+CLOG2W-1 downto 0);
    o_data_odd_addr  : out unsigned(CLOG2M+CLOG2W-1 downto 0);
    o_data           : out std_logic_vector((N+BG)*W-1 downto 0)  --//*2 is tmp
                                                                  --: after bn
    );

end entity;

architecture rtl of dp is
  --// ctrl pipe stage
  signal ps_ctrl_en_npu       : std_logic;
  signal ps_ctrl_ldh_v_n      : std_logic;
  signal ps_ctrl_wr_pipe      : std_logic;  -- #
  signal ps_ctrl_en_hmode     : std_logic;
  --// activation queue
  signal int_i_data_if1       : std_logic_vector(N*(K-1)-1 downto 0);
  signal int_i_data_if2       : std_logic_vector(N*(K-1)-1 downto 0);
  signal int_i_data_if3       : std_logic_vector(N*(K-1)-1 downto 0);
  signal int_i_data_if4       : std_logic_vector(N*(K-1)-1 downto 0);
  signal int_i_data_if5       : std_logic_vector(N*(K-1)-1 downto 0);
  signal int_i_data_if6       : std_logic_vector(N*(K-1)-1 downto 0);
  signal int_i_data_if7       : std_logic_vector(N*(K-1)-1 downto 0);
  signal int_i_data_if8       : std_logic_vector(N*(K-1)-1 downto 0);
  signal int_sel_column       : unsigned(CLOG2K-1 downto 0);
  signal int_i_data_h_npu1    : signed(N-1 downto 0);
  signal int_i_data_h_npu2    : signed(N-1 downto 0);
  signal int_i_data_h_npu3    : signed(N-1 downto 0);
  signal int_i_data_h_npu4    : signed(N-1 downto 0);
  signal int_i_data_h_npu5    : signed(N-1 downto 0);
  signal int_i_data_h_npu6    : signed(N-1 downto 0);
  signal int_i_data_h_npu7    : signed(N-1 downto 0);
  signal int_i_data_h_npu8    : signed(N-1 downto 0);
  --// npu data
  signal int_i_data_h_npu     : std_logic_vector(N*W-1 downto 0);
  signal int_i_data_v_npu     : std_logic_vector(N*W-1 downto 0);
  signal int_i_data_acc       : std_logic_vector((N+BG)*W-1 downto 0) := (others => '0');
  signal int_o_data_npu       : std_logic_vector((N+BG)*W-1 downto 0);
  --// kernel counters
  signal int_en_hmode         : std_logic;
  signal int_en_vmode         : std_logic;
  signal int_hmode_cnt        : unsigned(CLOG2K-1 downto 0);
  signal int_vmode_cnt        : unsigned(CLOG2K-1 downto 0);
  signal ps_int_hmode_cnt     : unsigned(CLOG2K-1 downto 0);
  --// result pipe counter
  signal int_s_tc_res         : std_logic;
  signal int_arv_res          : unsigned(CLOG2W-1 downto 0);
  --// tile counters
  signal int_en_npu_ptr       : std_logic;
  signal int_en_tilev_ptr     : std_logic;
  signal int_en_tileh_ptr     : std_logic;
  signal int_en_ifmaps_ptr    : std_logic;
  signal int_en_ofmaps_ptr    : std_logic;
  signal int_tc_npu_ptr       : std_logic;
  signal int_tc_tilev         : std_logic;
  signal int_tc_tileh         : std_logic;
  signal int_tc_ofmaps        : std_logic;
  signal int_tc_ifmaps        : std_logic;
  signal int_arv_tilev        : unsigned(CLOG2T-1 downto 0);
  signal int_arv_tileh        : unsigned(CLOG2T-1 downto 0);
  signal int_npu_ptr          : unsigned(CLOG2W-1 downto 0);
  signal int_tilev_ptr        : unsigned(CLOG2T-1 downto 0);
  signal int_tileh_ptr        : unsigned(CLOG2T-1 downto 0);
  signal int_ofmaps_ptr       : unsigned(CLOG2C-1 downto 0);
  signal int_ifmaps_ptr       : unsigned(CLOG2B-1 downto 0);
  signal ps_int_ifmaps_ptr    : unsigned(CLOG2B-1 downto 0);
  --// tile status  
  signal int_d_tc             : std_logic_vector(2 downto 0);
  signal int_q_tc             : std_logic_vector(2 downto 0);
  signal int_s_tc_tilev       : std_logic;
  signal int_s_tc_tileh       : std_logic;
  signal int_s_tc_ifmaps      : std_logic;
  signal int_s_tc_ofmaps      : std_logic;
  --// clk gating ctrl 
  signal ps_int_s_tc_tilev    : std_logic;
  signal ps_int_s_tc_tileh    : std_logic;
  signal int_ckg_rmask        : std_logic_vector(0 to 7);
  signal int_ckg_cmask        : std_logic_vector(0 to 7);
  --// i_data address ctrl
  signal int_inc_i_data_even  : std_logic;
  signal int_inc_i_data_odd   : std_logic;
  signal int_rst_i_data_addr  : std_logic;
  --// i_weight address ctrl
  signal int_inc_i_w_addr     : std_logic;
  --// o_data address 
  signal int_o_data_ev_odd_n  : std_logic;
  signal int_o_data_even_addr : unsigned(CLOG2M+CLOG2W-1 downto 0);
  signal int_o_data_odd_addr  : unsigned(CLOG2M+CLOG2W-1 downto 0);
  
begin
  act_buffer_inst : entity work.act_buffer
    port map (
      ck             => ck,
      rst            => rst,
      i_wr           => ctrl_ldh_v_n,
      i_wr_ptr       => int_npu_ptr,
      i_wr_ifmap_ptr => int_ifmaps_ptr,
      i_rd_ifmap_ptr => ps_int_ifmaps_ptr,
      i_data         => i_acth(N*W-1 downto N*W - N*(K-1)),
      o_data1        => int_i_data_if1,
      o_data2        => int_i_data_if2,
      o_data3        => int_i_data_if3,
      o_data4        => int_i_data_if4,
      o_data5        => int_i_data_if5,
      o_data6        => int_i_data_if6,
      o_data7        => int_i_data_if7,
      o_data8        => int_i_data_if8);

  process(ck, rst)
  begin
    if rst = '1' then
      ps_int_hmode_cnt  <= (others => '0');
      ps_int_ifmaps_ptr <= (others => '0');
    elsif rising_edge(ck) then
      ps_int_hmode_cnt  <= int_hmode_cnt;
      ps_int_ifmaps_ptr <= int_ifmaps_ptr;
    end if;
  end process;

  int_sel_column <= '0' & ps_int_hmode_cnt(ps_int_hmode_cnt'high-1 downto 0);

  act_if_inst : entity work.act_if
    port map (
      i_sel_rotate => int_npu_ptr,
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
      if ctrl_ldh_v_n = '1' then
        int_i_data_v_npu <= i_actv;
      end if;
    end if;
  end process;

  process(ck, rst)
  begin
    if rst = '1' then
      ps_ctrl_en_npu   <= '0';
      ps_ctrl_ldh_v_n  <= '0';
      ps_ctrl_wr_pipe  <= '0';
      ps_ctrl_en_hmode <= '0';
    elsif rising_edge(ck) then
      ps_ctrl_en_npu   <= ctrl_en_npu;
      ps_ctrl_ldh_v_n  <= ctrl_ldh_v_n;
      ps_ctrl_wr_pipe  <= ctrl_wr_pipe;
      ps_ctrl_en_hmode <= ctrl_en_hmode;
    end if;
  end process;

  npu_inst : entity work.npu
    port map (
      ck            => ck,
      rst           => rst,
      en            => ps_ctrl_en_npu,
      ldh_v_n       => ps_ctrl_ldh_v_n,
      wr_pipe       => ps_ctrl_wr_pipe,
      ckg_rmask     => int_ckg_rmask,
      ckg_cmask     => int_ckg_cmask,
      i_ifmap_ptr   => ps_int_ifmaps_ptr,
      i_weight      => i_weight,
      i_data_conv_h => int_i_data_h_npu,
      i_data_conv_v => int_i_data_v_npu,
      i_data_acc    => int_i_data_acc,
      o_data        => o_data);         --int_o_data_npu);

  process(ck, rst)                      --// enable clk gate
  begin
    if rst = '1' then
      ps_int_s_tc_tilev <= '0';
      ps_int_s_tc_tileh <= '0';
    elsif rising_edge(ck) then
      ps_int_s_tc_tilev <= int_s_tc_tilev;
      ps_int_s_tc_tileh <= int_s_tc_tileh;
    end if;
  end process;

  ckg_ctrl8b_inst:
    entity work.ckg_ctrl8b
      port map (
        arv_npu   => arv_npu,
        arv_ckg   => arv_ckg,
        en_ckgr   => ps_int_s_tc_tilev,
        en_ckgc   => ps_int_s_tc_tileh,
        arv_res   => int_arv_res,
        ckg_rmask => int_ckg_rmask,
        ckg_cmask => int_ckg_cmask);

  int_en_hmode <= ctrl_en_hmode and int_s_tc_ifmaps;

  hmode_cnt_inst :
    entity work.countern
      generic map (N => arv_k'length)
      port map (
        ck       => ck,
        rst      => rst,
        sync_clr => '0',
        en       => int_en_hmode,
        arv      => arv_k,
        q        => int_hmode_cnt,
        tc       => s_tc_hmode);

  int_en_vmode <= (ctrl_en_vmode and int_s_tc_ifmaps) or int_s_tc_res;

  vmode_cnt_inst:
    entity work.countern
      generic map (N => arv_k'length)
      port map (
        ck       => ck,
        rst      => rst,
        sync_clr => '0',
        en       => int_en_vmode,
        arv      => arv_k,
        q        => int_vmode_cnt,
        tc       => s_tc_vmode);

  res_cnt_inst:
    entity work.countern
      generic map (N => arv_k'length)
      port map (
        ck       => ck,
        rst      => rst,
        sync_clr => '0',
        en       => ctrl_wr_pipe,
        arv      => int_arv_res,
        tc       => int_s_tc_res);

  s_tc_res <= int_s_tc_res;

  int_d_tc <= int_tc_tilev & int_tc_tileh & int_tc_ofmaps;

  process(ck, rst)                      --// tile status reg
  begin
    if rst = '1' then
      int_q_tc <= (others => '0');
    elsif rising_edge(ck) then
      if int_s_tc_res = '1' then
        int_q_tc <= int_d_tc;
      end if;
    end if;
  end process;

  int_s_tc_ifmaps <= int_tc_ifmaps;  --// signal copy: different delta cycle during sim.
  int_s_tc_tilev  <= int_q_tc(2);
  int_s_tc_tileh  <= int_q_tc(1);
  int_s_tc_ofmaps <= int_q_tc(0);

  s_tc_ifmaps  <= int_tc_ifmaps;
  s_tc_npu_ptr <= int_tc_npu_ptr;
  s_tc_tilev   <= int_q_tc(2);
  s_tc_tileh   <= int_q_tc(1);
  s_tc_ofmaps  <= int_q_tc(0);

  int_en_ifmaps_ptr <= ctrl_en_npu;
  int_en_npu_ptr    <= int_tc_ifmaps and ctrl_ldh_v_n;
  int_en_tilev_ptr  <= int_tc_npu_ptr and int_en_npu_ptr;
  int_en_tileh_ptr  <= int_tc_tilev and int_en_tilev_ptr;
  int_en_ofmaps_ptr <= int_tc_tileh and int_en_tileh_ptr;

  ifmaps_cnt_inst :
    entity work.countern
      generic map (N => arv_ifmaps'length)
      port map (
        ck       => ck,
        rst      => rst,
        sync_clr => '0',
        en       => int_en_ifmaps_ptr,
        arv      => arv_ifmaps,
        q        => int_ifmaps_ptr,
        tc       => int_tc_ifmaps);

  npu_cnt_inst :
    entity work.countern
      generic map (N => arv_npu'length)
      port map (
        ck       => ck,
        rst      => rst,
        sync_clr => '0',
        en       => int_en_npu_ptr,
        arv      => arv_npu,
        q        => int_npu_ptr,
        tc       => int_tc_npu_ptr);

  int_arv_tilev <= arv_tile;
  int_arv_tileh <= arv_tile;

  tilev_cnt_inst :
    entity work.countern
      generic map (N => arv_tile'length)
      port map (
        ck       => ck,
        rst      => rst,
        sync_clr => '0',
        en       => int_en_tilev_ptr,
        arv      => int_arv_tilev,
        q        => int_tilev_ptr,
        tc       => int_tc_tilev);

  tileh_cnt_inst :
    entity work.countern
      generic map (N => arv_tile'length)
      port map (
        ck       => ck,
        rst      => rst,
        sync_clr => '0',
        en       => int_en_tileh_ptr,
        arv      => int_arv_tileh,
        q        => int_tileh_ptr,
        tc       => int_tc_tileh);

  ofmaps_cnt_inst :
    entity work.countern
      generic map (N => arv_ofmaps'length)
      port map (
        ck       => ck,
        rst      => rst,
        sync_clr => '0',
        en       => int_en_ofmaps_ptr,
        arv      => arv_ofmaps,
        tc       => int_tc_ofmaps);

  i_data_ev_odd_n     <= int_tileh_ptr(0);
  int_inc_i_data_even <= int_en_tileh_ptr and (not int_tileh_ptr(0));
  int_inc_i_data_odd  <= int_en_tileh_ptr and int_tileh_ptr(0);
  int_rst_i_data_addr <= int_tc_tilev and int_tc_tileh and int_en_tilev_ptr;

  i_data_addr_gen_inst:
    entity work.data_addr_gen
      port map (
        ck             => ck,
        rst            => rst,
        sync_clr       => int_rst_i_data_addr,
        en             => ctrl_ldh_v_n,
        inc_even       => int_inc_i_data_even,
        inc_odd        => int_inc_i_data_odd,
        data_even_addr => i_data_even_addr,
        data_odd_addr  => i_data_odd_addr);

  --// sample ev_odd_n for output data
  process(ck, rst)
  begin
    if rst = '1' then
      int_o_data_ev_odd_n <= '0';
    elsif rising_edge(ck) then
      if int_s_tc_res = '1' then
        int_o_data_ev_odd_n <= int_tileh_ptr(0);
      end if;
    end if;
  end process;

  --// cnt + 1 o_data_addr
  process(ck, rst)
  begin
    if rst = '1' then
      int_o_data_even_addr <= (others => '0');
      int_o_data_odd_addr <= (others => '0');
    elsif rising_edge(ck) then
      if ctrl_wr_pipe = '1' then
        if int_o_data_ev_odd_n = '1' then
          int_o_data_odd_addr <= int_o_data_odd_addr + 1;
        else
          int_o_data_even_addr <= int_o_data_even_addr + 1;
        end if;
      end if;
    end if;
  end process;

  o_data_even_addr <= int_o_data_even_addr;
  o_data_odd_addr  <= int_o_data_odd_addr;
  o_data_ev_odd_n  <= int_o_data_ev_odd_n;

  int_inc_i_w_addr <= int_s_tc_tilev and int_s_tc_tileh and int_s_tc_res;

  i_weight_addr_gen_inst :
    entity work.weight_addr_gen
      port map (
        ck       => ck,
        rst      => rst,
        sync_clr => int_s_tc_res,
        en       => ctrl_en_hmode,
        inc      => int_inc_i_w_addr,
        o_addr   => i_weight_addr);

--vect_mpy_add_inst:
--for i in 0 to W-1 generate
--  prod_sum_i : entity work.prod_sum
--    port map (
--      ck                       => ck,
--      rst                      => rst,
--      en                       => ps_ctrl_wr_pipe,
--      i_gamma                  => i_gamma,
--      i_beta                   => i_beta,
--      i_data                   => signed(int_o_data_npu(int_o_data_npu'high - i*(N+BG) downto int_o_data_npu'length - (i+1)*(N+BG))),
--      std_logic_vector(o_data) => o_data(o_data'high - i*(N+BG)*2 downto o_data'length - (i+1)*(N+BG)*2),
--      o_data_val               => int_o_data_val);
--end generate;

end architecture;
