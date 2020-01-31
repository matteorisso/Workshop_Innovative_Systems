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
    arv_ckg          : in  unsigned(CLOG2W-1 downto 0);
    arv_k            : in  unsigned(CLOG2K-1 downto 0);
    arv_i_tile       : in  unsigned(CLOG2T-1 downto 0);
    arv_o_tile       : in  unsigned(CLOG2T-1 downto 0);
    arv_ifmaps       : in  unsigned(CLOG2B-1 downto 0);
    arv_ofmaps       : in  unsigned(CLOG2C-1 downto 0);
    ctrl_en_npu      : in  std_logic;
    ctrl_ldh_v_n     : in  std_logic;
    ctrl_en_hmode    : in  std_logic;
    ctrl_en_vmode    : in  std_logic;
    ctrl_wr_pipe     : in  std_logic;
    ctrl_en_p        : in  std_logic;
    ctrl_wr_mem      : in  std_logic;
    s_tc_hmode       : out std_logic;
    s_tc_vmode       : out std_logic;
    s_tc_res         : out std_logic;
    s_tc_npu_ptr     : out std_logic;
    s_tc_tilev       : out std_logic;
    s_tc_tileh       : out std_logic;
    s_tc_ifmaps      : out std_logic;
    s_tc_ofmaps      : out std_logic;
    i_weight_addr    : out unsigned(15 downto 0);
    i_data_ev_odd_n  : out std_logic;
    i_data_even_addr : out unsigned(CLOG2M+CLOG2W-1 downto 0);
    i_data_odd_addr  : out unsigned(CLOG2M+CLOG2W-1 downto 0);
    o_data_ev_odd_n  : out std_logic;
    o_data_even_addr : out unsigned(CLOG2M+CLOG2W-1 downto 0);
    o_data_odd_addr  : out unsigned(CLOG2M+CLOG2W-1 downto 0);
    o_data_wr        : out std_logic;
    o_data_wrh_l_n   : out std_logic;
    o_data           : out std_logic_vector(N*(W/2)-1 downto 0);
    o_data_relu      : out std_logic_vector(N*W-1 downto 0)
    );
end entity;

architecture rtl of dp is
  --// ctrl pipe stage  
  signal ps_ctrl_en_hmode           : std_logic;
  signal ps_ctrl_en_npu             : std_logic;
  signal ps_ctrl_ldh_v_n            : std_logic;
  signal ps_ctrl_wr_pipe            : std_logic;
  signal ps_ctrl_en_p               : std_logic;
  signal ps_ctrl_wr_mem             : std_logic;  --// wr_mem cmd
  --// npu data
  signal int_i_data_h_npu           : std_logic_vector(N*W-1 downto 0);
  signal int_i_data_v_npu           : std_logic_vector(N*W-1 downto 0);
  signal int_i_data_acc             : std_logic_vector((N+BG)*W-1 downto 0) := (others => '0');
  signal int_o_data_npu             : std_logic_vector((N+BG)*W-1 downto 0);
  --// activation
  signal int_o_data_relu            : unsigned(N*W-1 downto 0);
  --// pooling
  signal int_o_data_p               : unsigned((N+2)*(W/2)-1 downto 0);
  --// kernel counters
  signal int_en_hmode               : std_logic;
  signal int_en_vmode               : std_logic;
  signal int_hmode_cnt              : unsigned(CLOG2K-1 downto 0);
  signal int_vmode_cnt              : unsigned(CLOG2K-1 downto 0);
  signal ps_int_hmode_cnt           : unsigned(CLOG2K-1 downto 0);  --// act if
  --// result pipe counter
  signal int_s_tc_res               : std_logic;
  signal ps_int_s_tc_res            : std_logic;
  signal int_arv_res                : unsigned(CLOG2W-1 downto 0);
  --// loop counters
  signal int_en_npu_ptr             : std_logic;
  signal int_en_tilev_ptr           : std_logic;
  signal int_en_tileh_ptr           : std_logic;
  signal int_en_ifmaps_ptr          : std_logic;
  signal int_en_ofmaps_ptr          : std_logic;
  signal int_tc_npu_ptr             : std_logic;
  signal int_tc_tilev               : std_logic;
  signal int_tc_tileh               : std_logic;
  signal int_tc_ofmaps              : std_logic;
  signal int_tc_ifmaps              : std_logic;
  signal int_npu_ptr                : unsigned(CLOG2W-1 downto 0);
  signal int_tilev_ptr              : unsigned(CLOG2T-1 downto 0);
  signal int_tileh_ptr              : unsigned(CLOG2T-1 downto 0);
  signal int_ofmaps_ptr             : unsigned(CLOG2C-1 downto 0);
  signal int_ifmaps_ptr             : unsigned(CLOG2B-1 downto 0);
  signal int_tileh_ptr_0            : std_logic;
  signal int_tileh_ptr_1            : std_logic;
  signal ps_int_ifmaps_ptr          : unsigned(CLOG2B-1 downto 0);  --// npu input rf
  --// tile status input
  signal int_d_tc                   : std_logic_vector(2 downto 0);
  signal int_q_tc                   : std_logic_vector(2 downto 0);
  signal int_s_tc_tilev             : std_logic;
  signal int_s_tc_tileh             : std_logic;
  signal int_s_tc_ifmaps            : std_logic;
  signal int_s_tc_ofmaps            : std_logic;
  signal ps_int_s_tc_tilev          : std_logic;
  signal ps_int_s_tc_tileh          : std_logic;
  --// clk gating ctrl
  signal int_mask                   : std_logic_vector(0 to 7);
  signal int_ckg_rmask              : std_logic_vector(0 to 7);     --// npu
  signal int_ckg_cmask              : std_logic_vector(0 to 7);     --// npu
  --// i_data address ctrl logic
  signal int_c_i_en_even            : std_logic;
  signal int_c_i_en_odd             : std_logic;
  signal int_c_i_sync_clr_even      : std_logic;
  signal int_c_i_clr_offs_even      : std_logic;
  signal int_c_i_mux_base_addr_even : std_logic;
  signal int_c_i_en_base_even       : std_logic;
  signal int_c_i_en_offs_even       : std_logic;
  signal int_c_i_sync_clr_odd       : std_logic;
  signal int_c_i_clr_offs_odd       : std_logic;
  signal int_c_i_mux_base_addr_odd  : std_logic;
  signal int_c_i_en_base_odd        : std_logic;
  signal int_c_i_en_offs_odd        : std_logic;
  --// i_data address 
  signal int_i_data_even_addr       : unsigned(CLOG2M+CLOG2W-1 downto 0);
  signal int_i_data_odd_addr        : unsigned(CLOG2M+CLOG2W-1 downto 0);
  --// i_weight address ctrl logic
  signal int_c_i_en_weight_addr     : std_logic;
  --// o_data address
  signal int_o_data_ev_odd_n        : std_logic;
  signal int_o_data_wrh_l_n         : std_logic;
  signal int_o_data_even_base_addr  : unsigned(CLOG2M+CLOG2W-1 downto 0);
  signal int_o_data_odd_base_addr   : unsigned(CLOG2M+CLOG2W-1 downto 0);
  signal int_o_data_even_offs_addr  : unsigned(CLOG2M+CLOG2W-1 downto 0);
  signal int_o_data_odd_offs_addr   : unsigned(CLOG2M+CLOG2W-1 downto 0);
begin
  --// i data buffer
  wrap_act_buffer_inst :
    entity work.wrap_act_buffer
      port map (
        ck               => ck,
        rst              => rst,
        i_wr             => ctrl_ldh_v_n,
        i_wr_ptr         => int_npu_ptr,
        i_wr_ifmap_ptr   => int_ifmaps_ptr,
        i_rd_ifmap_ptr   => ps_int_ifmaps_ptr,
        i_hmode_cnt      => ps_int_hmode_cnt,
        i_acth           => i_acth(N*W-1 downto N*W - N*(K-1)),
        i_actv           => i_actv,
        int_i_data_h_npu => int_i_data_h_npu,
        int_i_data_v_npu => int_i_data_v_npu);

  --// fsm cmd pipe stage
  process(ck, rst)
  begin
    if rst = '1' then
      ps_ctrl_en_hmode <= '0';
      ps_ctrl_en_npu   <= '0';
      ps_ctrl_ldh_v_n  <= '0';
      ps_ctrl_wr_pipe  <= '0';
      ps_ctrl_en_p     <= '0';
      ps_ctrl_wr_mem   <= '0';
    elsif rising_edge(ck) then
      ps_ctrl_en_hmode <= ctrl_en_hmode;
      ps_ctrl_en_npu   <= ctrl_en_npu;
      ps_ctrl_ldh_v_n  <= ctrl_ldh_v_n;
      ps_ctrl_wr_pipe  <= ctrl_wr_pipe;
      ps_ctrl_en_p     <= ctrl_en_p;
      ps_ctrl_wr_mem   <= ctrl_wr_mem;
    end if;
  end process;

  --// ps npu rf ptr
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

  --// NPU
  npu_inst :
    entity work.npu
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
        o_data        => int_o_data_npu);

  --// activation
  qrelu_inst :
  for i in 0 to W-1 generate
    qrelu_i:
      entity work.relu
        port map (
          i_data => signed(int_o_data_npu(int_o_data_npu'high - i*(N+BG) downto int_o_data_npu'length - (N+BG)*(i+1))),
          o_data => int_o_data_relu(int_o_data_relu'high - i*N downto int_o_data_relu'length - N*(i+1)));
  end generate;

  --// DBG skip relu
  o_data_relu <= std_logic_vector(int_o_data_relu);

  --// subsampling K=2, S=2
  p_unit_inst:
  for i in 0 to (W/2)-1 generate
    p_unit_i :
      entity work.avgp_unit
        port map (
          ck       => ck,
          rst      => rst,
          en       => ps_ctrl_en_p,
          i_data_1 => int_o_data_relu(int_o_data_relu'high - i*2*N downto int_o_data_relu'length - N*(i*2+1)),
          i_data_2 => int_o_data_relu(int_o_data_relu'high - (i*2+1)*N downto int_o_data_relu'length - N*(i*2+2)),
          o_data   => int_o_data_p(int_o_data_p'high - i*(N+2) downto int_o_data_p'length - (i+1)*(N+2)));
  end generate;

  --p_unit_0 :
  --  entity work.avgp_unit
  --    port map (
  --      ck       => ck,
  --      rst      => rst,
  --      en_p_acc => ps_ctrl_en_p,
  --      i_data_1 => int_o_data_relu(int_o_data_relu'high - 0*N downto int_o_data_relu'length - N*(0+1)),
  --      i_data_2 => int_o_data_relu(int_o_data_relu'high - (0+1)*N downto int_o_data_relu'length - N*(0+2)),
  --      o_data   => int_o_data_p(int_o_data_p'high - 0*(N+2) downto int_o_data_p'length - (0+1)*(N+2)));
  --p_unit_1 :
  --  entity work.avgp_unit
  --    port map (
  --      ck       => ck,
  --      rst      => rst,
  --      en_p_acc => ps_ctrl_en_p,
  --      i_data_1 => int_o_data_relu(int_o_data_relu'high - 2*N downto int_o_data_relu'length - N*(2+1)),
  --      i_data_2 => int_o_data_relu(int_o_data_relu'high - (2+1)*N downto int_o_data_relu'length - N*(2+2)),
  --      o_data   => int_o_data_p(int_o_data_p'high - 1*(N+2) downto int_o_data_p'length - (1+1)*(N+2)));
  --p_unit_2 :
  --  entity work.avgp_unit
  --    port map (
  --      ck       => ck,
  --      rst      => rst,
  --      en_p_acc => ps_ctrl_en_p,
  --      i_data_1 => int_o_data_relu(int_o_data_relu'high - 4*N downto int_o_data_relu'length - N*(4+1)),
  --      i_data_2 => int_o_data_relu(int_o_data_relu'high - (4+1)*N downto int_o_data_relu'length - N*(4+2)),
  --      o_data   => int_o_data_p(int_o_data_p'high - 2*(N+2) downto int_o_data_p'length - (2+1)*(N+2)));

  --p_unit_3 :
  --  entity work.avgp_unit
  --    port map (
  --      ck       => ck,
  --      rst      => rst,
  --      en_p_acc => ps_ctrl_en_p,
  --      i_data_1 => int_o_data_relu(int_o_data_relu'high - 6*N downto int_o_data_relu'length - N*(6+1)),
  --      i_data_2 => int_o_data_relu(int_o_data_relu'high - (6+1)*N downto int_o_data_relu'length - N*(6+2)),
  --      o_data   => int_o_data_p(int_o_data_p'high - 3*(N+2) downto int_o_data_p'length - (3+1)*(N+2)));

  --// quantize pooling res
  quantize_p_inst:
  for i in 0 to (W/2)-1 generate
    round_i:
      entity work.quantize_p
        port map (
          ck                       => ck,
          rst                      => rst,
          en                       => ps_ctrl_wr_mem,
          i_data                   => int_o_data_p(int_o_data_p'high - i*(N+2) downto int_o_data_p'length - (i+1)*(N+2)),
          std_logic_vector(o_data) => o_data(o_data'high - i*N downto o_data'length - (i+1)*N));
  end generate;

  int_arv_res   <= arv_ckg  when int_s_tc_tilev = '1' else to_unsigned(W-1, CLOG2W);
  int_ckg_rmask <= int_mask when int_s_tc_tilev = '1' else (others => '0');
  int_ckg_cmask <= int_mask when int_s_tc_tileh = '1' else (others => '0');
  process(arv_ckg)
  begin
    case (to_integer(arv_ckg)) is
      when 0      => int_mask <= "01111111";
      when 1      => int_mask <= "00111111";
      when 2      => int_mask <= "00011111";
      when 3      => int_mask <= "00001111";
      when 4      => int_mask <= "00000111";
      when 5      => int_mask <= "00000011";
      when 6      => int_mask <= "00000001";
      when others => int_mask <= (others => '0');
    end case;
  end process;

                                        --// kdim counters

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

  vmode_cnt_inst :
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

                                        --// Write pipe ctrl counter
  res_cnt_inst :
    entity work.countern
      generic map (N => CLOG2W)
      port map (
        ck       => ck,
        rst      => rst,
        sync_clr => '0',
        en       => ctrl_wr_pipe,
        arv      => int_arv_res,
        tc       => int_s_tc_res);

  s_tc_res <= int_s_tc_res;

                                        --// Tile status reg
  process(ck, rst)
                                        --// tile status reg : update status
                                        -- when results are ready to be written
                                        -- back to memory
  begin
    if rst = '1' then
      int_q_tc <= (others => '0');
    elsif rising_edge(ck) then
      if int_s_tc_res = '1' then
        int_q_tc <= int_d_tc;
      end if;
    end if;
  end process;

  int_d_tc <= int_tc_tilev & int_tc_tileh & int_tc_ofmaps;

  int_s_tc_ifmaps <= int_tc_ifmaps;  --// aliases : signal copy. different delta cycle during sim.
  int_s_tc_tilev  <= int_q_tc(2);
  int_s_tc_tileh  <= int_q_tc(1);
  int_s_tc_ofmaps <= int_q_tc(0);

  s_tc_ifmaps  <= int_tc_ifmaps;
  s_tc_npu_ptr <= int_tc_npu_ptr;
  s_tc_tilev   <= int_q_tc(2);
  s_tc_tileh   <= int_q_tc(1);
  s_tc_ofmaps  <= int_q_tc(0);

                                        --// Loop ordering 
  int_en_ifmaps_ptr <= ctrl_en_npu;
  int_en_npu_ptr    <= int_tc_ifmaps and ctrl_ldh_v_n;
  int_en_tilev_ptr  <= int_tc_npu_ptr and int_en_npu_ptr;
  int_en_tileh_ptr  <= int_tc_tilev and int_en_tilev_ptr;
  int_en_ofmaps_ptr <= int_tc_tileh and int_en_tileh_ptr;

                                        --// Tile ctrl counters

  i_data_npu_cnt_inst :
    entity work.countern
      generic map (N => CLOG2W)
      port map (
        ck       => ck,
        rst      => rst,
        sync_clr => '0',
        en       => int_en_npu_ptr,
        arv      => to_unsigned(W-1, CLOG2W),
        q        => int_npu_ptr,
        tc       => int_tc_npu_ptr);

  i_data_tilev_cnt_inst :
    entity work.countern
      generic map (N => arv_i_tile'length)
      port map (
        ck       => ck,
        rst      => rst,
        sync_clr => '0',
        en       => int_en_tilev_ptr,
        arv      => arv_i_tile,
        q        => int_tilev_ptr,
        tc       => int_tc_tilev);

  i_data_tileh_cnt_inst :
    entity work.countern
      generic map (N => arv_i_tile'length)
      port map (
        ck       => ck,
        rst      => rst,
        sync_clr => '0',
        en       => int_en_tileh_ptr,
        arv      => arv_i_tile,
        q        => int_tileh_ptr,
        tc       => int_tc_tileh);

  int_tileh_ptr_0 <= int_tileh_ptr(0);
  int_tileh_ptr_1 <= int_tileh_ptr(1);

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

                                        --// weight address

  int_c_i_en_weight_addr <= int_s_tc_tilev and int_s_tc_tileh and int_s_tc_res;

  i_weight_addr_gen_inst :
    entity work.addr_gen
      generic map (
        N => 16)
      port map (
        ck             => ck,
        rst            => rst,
        sync_clr       => '0',
        clr_offs       => int_s_tc_res,
        en_offs        => ctrl_en_hmode,
        en_base        => int_c_i_en_weight_addr,
        mux_base_addr  => int_c_i_en_weight_addr,
        inc_value_base => to_unsigned(0, i_weight_addr'length),
        inc_value_offs => to_unsigned(1, i_weight_addr'length),
        addr           => i_weight_addr);

                                        --// i_data address 

  int_c_i_en_even <= int_en_tileh_ptr and not(int_tileh_ptr_0);
  int_c_i_en_odd  <= int_en_tileh_ptr and int_tileh_ptr_0;

  int_c_i_sync_clr_even      <= int_tc_tilev and int_tc_tileh and int_en_tilev_ptr;
  int_c_i_clr_offs_even      <= int_c_i_en_even or int_c_i_en_odd;
  int_c_i_mux_base_addr_even <= int_c_i_en_even;
  int_c_i_en_base_even       <= int_c_i_en_even;
  int_c_i_en_offs_even       <= ctrl_ldh_v_n;

  int_c_i_sync_clr_odd      <= int_tc_tilev and int_tc_tileh and int_en_tilev_ptr;
  int_c_i_clr_offs_odd      <= int_c_i_en_even or int_c_i_en_odd;
  int_c_i_mux_base_addr_odd <= int_c_i_en_odd;
  int_c_i_en_base_odd       <= int_c_i_en_odd;
  int_c_i_en_offs_odd       <= ctrl_ldh_v_n;

  i_data_even_addr_gen_inst :
    entity work.addr_gen
      generic map (
        N => CLOG2M+CLOG2W)
      port map (
        ck             => ck,
        rst            => rst,
        sync_clr       => int_c_i_sync_clr_even,
        clr_offs       => int_c_i_clr_offs_even,
        en_offs        => int_c_i_en_offs_even,
        en_base        => int_c_i_en_base_even,
        mux_base_addr  => int_c_i_mux_base_addr_even,
        inc_value_base => to_unsigned(1, i_data_even_addr'length),
        inc_value_offs => to_unsigned(1, i_data_even_addr'length),
        addr           => int_i_data_even_addr);

  i_data_odd_addr_gen_inst:
    entity work.addr_gen
      generic map (
        N => CLOG2M+CLOG2W)

      port map (
        ck             => ck,
        rst            => rst,
        sync_clr       => int_c_i_sync_clr_odd,
        clr_offs       => int_c_i_clr_offs_odd,
        en_offs        => int_c_i_en_offs_odd,
        en_base        => int_c_i_en_base_odd,
        mux_base_addr  => int_c_i_mux_base_addr_odd,
        inc_value_base => to_unsigned(1, int_i_data_odd_addr'length),
        inc_value_offs => to_unsigned(1, int_i_data_odd_addr'length),
        addr           => int_i_data_odd_addr);

  i_data_even_addr <= int_i_data_even_addr;
  i_data_odd_addr  <= int_i_data_odd_addr;
  i_data_ev_odd_n  <= int_tileh_ptr_0;

                                        --// ps status o_data addr ctrl  
  process(ck, rst)
  begin
    if rst = '1' then
      ps_int_s_tc_res   <= '0';
      ps_int_s_tc_tilev <= '0';
      ps_int_s_tc_tileh <= '0';
    elsif rising_edge(ck) then
      ps_int_s_tc_res   <= int_s_tc_res;
      ps_int_s_tc_tilev <= int_s_tc_tilev;
      ps_int_s_tc_tileh <= int_s_tc_tileh;
    end if;
  end process;

                                        --// o_data address
  o_data_wr <= ps_ctrl_wr_mem;

  process(ck, rst)
  begin
    if rst = '1' then
      int_o_data_even_base_addr <= (others => '0');
      int_o_data_odd_base_addr  <= (others => '0');
      int_o_data_even_offs_addr <= (others => '0');
      int_o_data_odd_offs_addr  <= (others => '0');
    elsif rising_edge(ck) then
      if ps_ctrl_wr_mem = '1' then      --ps_ctrl_wr_pipe = '1' then      
        if (ps_int_s_tc_tilev and ps_int_s_tc_tileh and ps_int_s_tc_res) = '1' then
          int_o_data_even_base_addr <= int_o_data_even_base_addr + 1;
          int_o_data_odd_base_addr  <= int_o_data_odd_base_addr + 1;
          int_o_data_even_offs_addr <= (others => '0');
          int_o_data_odd_offs_addr  <= (others => '0');
        else
          if int_o_data_ev_odd_n = '0' then
            int_o_data_even_offs_addr <= int_o_data_even_offs_addr + arv_ofmaps + 1;
          else
            int_o_data_odd_offs_addr <= int_o_data_odd_offs_addr + arv_ofmaps + 1;
          end if;
        end if;
      end if;
    end if;
  end process;

  o_data_even_addr <= int_o_data_even_base_addr + int_o_data_even_offs_addr;
  o_data_odd_addr  <= int_o_data_odd_base_addr + int_o_data_odd_offs_addr;
  o_data_ev_odd_n  <= int_o_data_ev_odd_n;
  o_data_wrh_l_n   <= int_o_data_wrh_l_n;  --// sample tileh ptr @tc res?

  process(ck, rst)
  begin
    if rst = '1' then
      int_o_data_ev_odd_n <= '0';
      int_o_data_wrh_l_n  <= '0';
    elsif rising_edge(ck) then
      if ps_int_s_tc_res = '1' then
        if ps_int_s_tc_tilev = '1' then
          int_o_data_ev_odd_n <= int_tileh_ptr_1;  --not int_o_data_ev_odd_n;
                                                   --PS INT S TC TIL rm
                                                   --? 
          int_o_data_wrh_l_n  <= int_tileh_ptr_0;  --int_tileh_ptr_0
        end if;
      end if;
    end if;
  end process;

end architecture;
