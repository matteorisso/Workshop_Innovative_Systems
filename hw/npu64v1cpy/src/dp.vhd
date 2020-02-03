library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.globals.all;

entity dp is
  port (
    ck               : in  std_logic;
    rst              : in  std_logic;
    hctrl_fc         : in  std_logic;
    i_acth           : in  std_logic_vector(N*W-1 downto 0);
    i_actv           : in  std_logic_vector(N*W-1 downto 0);
    i_c_weight       : in  std_logic_vector(1 downto 0);
    i_fc_weight      : in  std_logic_vector(2*W*W-1 downto 0);
    arv_CKG          : in  unsigned(CLOG2W-1 downto 0);
    arv_KSI          : in  unsigned(CLOG2K-1 downto 0);
    arv_L0           : in  unsigned(CLOG2L-1 downto 0);
    arv_L1           : in  unsigned(CLOG2L-1 downto 0);
    arv_L2           : in  unsigned(CLOG2L-1 downto 0);
    arv_L3           : in  unsigned(CLOG2L-1 downto 0);
    arv_L4           : in  unsigned(CLOG2L-1 downto 0);
    ctrl_en_npu      : in  std_logic;
    ctrl_ldh_v_n     : in  std_logic;
    ctrl_en_hmode    : in  std_logic;
    ctrl_en_vmode    : in  std_logic;
    ctrl_wr_pipe     : in  std_logic;
    ctrl_en_p        : in  std_logic;
    ctrl_en_st       : in  std_logic;
    ctrl_wr_mem      : in  std_logic;
    s_tc_hmode       : out std_logic;
    s_tc_vmode       : out std_logic;
    s_tc_res         : out std_logic;
    s_tc_L1          : out std_logic;
    s_tc_L2          : out std_logic;
    s_tc_L3          : out std_logic;
    s_tc_L0          : out std_logic;
    s_tc_L4          : out std_logic;
    i_weight_addr    : out unsigned(CLOG2MW-1 downto 0);
    i_data_ev_odd_n  : out std_logic;
    i_data_even_addr : out unsigned(CLOG2M+CLOG2W-1 downto 0);
    i_data_odd_addr  : out unsigned(CLOG2M+CLOG2W-1 downto 0);
    o_data_ev_odd_n  : out std_logic;
    o_data_even_addr : out unsigned(CLOG2M+CLOG2W-1 downto 0);
    o_data_odd_addr  : out unsigned(CLOG2M+CLOG2W-1 downto 0);
    o_data_wr        : out std_logic;
    o_data_wrh       : out std_logic;
    o_data_wrh_l_n   : out std_logic;
    o_data           : out std_logic_vector(N*W-1 downto 0)
    );
end entity;

architecture rtl of dp is
  --
  --// ctrl pipe stage
  --
  signal ps_ctrl_en_hmode            : std_logic;
  signal ps_ctrl_en_npu              : std_logic;
  signal ps_ctrl_ldh_v_n             : std_logic;
  signal ps_ctrl_wr_pipe             : std_logic;
  signal ps_ctrl_en_p                : std_logic;
  signal ps_ctrl_en_st               : std_logic;
  signal ps2_ctrl_en_st              : std_logic;
  signal ps_ctrl_wr_mem              : std_logic;
  signal ps2_ctrl_wr_mem             : std_logic;  --// wr_mem cmd
  --
  --// npu data
  --
  signal int_i_data_h_npu            : std_logic_vector(N*W-1 downto 0);
  signal int_i_data_v_npu            : std_logic_vector(N*W-1 downto 0);
  signal int_i_data_acc              : std_logic_vector((N+BG)*W-1 downto 0) := (others => '0');
  signal int_o_data_npu              : std_logic_vector((N+BG)*W-1 downto 0);
  --
  --// activation + pool + o_data mux
  --
  signal int_o_data_relu             : std_logic_vector(N*W-1 downto 0);
  signal int_o_data_p                : std_logic_vector((N+2)*(W/2)-1 downto 0);
  signal int_o_data_r                : std_logic_vector(N*(W/2)-1 downto 0);  --// output byte
  --
  --// kernel counters
  --
  signal int_en_hmode                : std_logic;
  signal int_en_vmode                : std_logic;
  signal int_hmode_cnt               : unsigned(CLOG2K-1 downto 0);
  signal int_vmode_cnt               : unsigned(CLOG2K-1 downto 0);
  signal ps_int_hmode_cnt            : unsigned(CLOG2K-1 downto 0);  --// act if
  --
  --// result pipe counter
  --
  signal int_s_tc_res                : std_logic;
  signal ps_int_s_tc_res             : std_logic;
  signal int_arv_res                 : unsigned(CLOG2W-1 downto 0);
  --
  --// loop counters
  --
  signal int_en_L0_ptr               : std_logic;
  signal int_en_L1_ptr               : std_logic;
  signal int_en_L2_ptr               : std_logic;
  signal int_en_L3_ptr               : std_logic;
  signal int_en_L4_ptr               : std_logic;
  signal int_tc_L0                   : std_logic;
  signal int_tc_L1                   : std_logic;
  signal int_tc_L2                   : std_logic;
  signal int_tc_L3                   : std_logic;
  signal int_tc_L4                   : std_logic;
  signal int_L0_ptr                  : unsigned(CLOG2L-1 downto 0);
  signal int_L1_ptr                  : unsigned(CLOG2L-1 downto 0);
  signal int_L2_ptr                  : unsigned(CLOG2L-1 downto 0);
  signal int_L3_ptr                  : unsigned(CLOG2L-1 downto 0);
  signal int_L4_ptr                  : unsigned(CLOG2L-1 downto 0);
  signal ps_int_L0_ptr               : unsigned(CLOG2L-1 downto 0);  --// npu input rf
  signal int_L3_ptr_0                : std_logic;
  signal int_L3_ptr_1                : std_logic;
  --
  --// tile status input
  --
  signal int_d_tc                    : std_logic_vector(2 downto 0);
  signal int_q_tc                    : std_logic_vector(2 downto 0);
  signal int_s_tc_L0                 : std_logic;
  signal int_s_tc_L1                 : std_logic;
  signal int_s_tc_L2                 : std_logic;
  signal int_s_tc_L3                 : std_logic;
  signal int_s_tc_L4                 : std_logic;
  signal ps_int_s_tc_L2              : std_logic;
  signal ps_int_s_tc_L3              : std_logic;
  signal ps_int_s_tc_L4              : std_logic;
  --
  --// clk gating ctrl
  --
  signal int_mask                    : std_logic_vector(0 to 7);
  signal int_ckg_rmask               : std_logic_vector(0 to 7);     --// npu
  signal int_ckg_cmask               : std_logic_vector(0 to 7);     --// npu
  --
  --// i_data address ctrl logic
  --
  signal int_c_i_en_even             : std_logic;
  signal int_c_i_en_odd              : std_logic;
  signal int_c_i_clr                 : std_logic;
  signal int_c_i_sync_clr_even       : std_logic;
  signal int_c_i_clr_offs_even       : std_logic;
  signal int_c_i_mux_base_addr_even  : std_logic;
  signal int_c_i_en_base_even        : std_logic;
  signal int_c_i_en_offs_even        : std_logic;
  signal int_c_i_sync_clr_odd        : std_logic;
  signal int_c_i_clr_offs_odd        : std_logic;
  signal int_c_i_mux_base_addr_odd   : std_logic;
  signal int_c_i_en_base_odd         : std_logic;
  signal int_c_i_en_offs_odd         : std_logic;
  signal int_fc_i_data_ev_odd_n      : std_logic;
  signal int_fc_i_sync_clr_even      : std_logic;
  signal int_fc_i_clr_offs_even      : std_logic;
  signal int_fc_i_mux_base_addr_even : std_logic;
  signal int_fc_i_en_base_even       : std_logic;
  signal int_fc_i_en_offs_even       : std_logic;
  signal int_fc_i_sync_clr_odd       : std_logic;
  signal int_fc_i_clr_offs_odd       : std_logic;
  signal int_fc_i_mux_base_addr_odd  : std_logic;
  signal int_fc_i_en_base_odd        : std_logic;
  signal int_fc_i_en_offs_odd        : std_logic;
  --
  --// i_data address
  --
  signal int_c_i_inc_value_base      : unsigned(CLOG2M+CLOG2W-1 downto 0);
  signal int_c_i_inc_value_offs      : unsigned(CLOG2M+CLOG2W-1 downto 0);
  signal int_fc_i_inc_value_base     : unsigned(CLOG2M+CLOG2W-1 downto 0);
  signal int_fc_i_inc_value_offs     : unsigned(CLOG2M+CLOG2W-1 downto 0);
  signal int_i_data_even_addr        : unsigned(CLOG2M+CLOG2W-1 downto 0);
  signal int_i_data_odd_addr         : unsigned(CLOG2M+CLOG2W-1 downto 0);
  --
  --// i_c_weight address ctrl logic
  --
  signal int_c_i_en_weight_addr      : std_logic;
  signal int_fc_i_en_weight_addr     : std_logic;
  --
  --// o_data address ctrl logic
  --
  signal int_c_o_en                  : std_logic;
  signal int_c_o_sync_clr_even       : std_logic;
  signal int_c_o_clr_offs_even       : std_logic;
  signal int_c_o_mux_base_addr_even  : std_logic;
  signal int_c_o_en_base_even        : std_logic;
  signal int_c_o_en_offs_even        : std_logic;
  signal int_c_o_sync_clr_odd        : std_logic;
  signal int_c_o_clr_offs_odd        : std_logic;
  signal int_c_o_mux_base_addr_odd   : std_logic;
  signal int_c_o_en_base_odd         : std_logic;
  signal int_c_o_en_offs_odd         : std_logic;
  signal int_fc_o_sync_clr_even      : std_logic;
  signal int_fc_o_clr_offs_even      : std_logic;
  signal int_fc_o_mux_base_addr_even : std_logic;
  signal int_fc_o_en_base_even       : std_logic;
  signal int_fc_o_en_offs_even       : std_logic;
  signal int_fc_o_sync_clr_odd       : std_logic;
  signal int_fc_o_clr_offs_odd       : std_logic;
  signal int_fc_o_mux_base_addr_odd  : std_logic;
  signal int_fc_o_en_base_odd        : std_logic;
  signal int_fc_o_en_offs_odd        : std_logic;
  --
  --// o_data wr
  --
  signal int_fc_o_data_ev_odd_n      : std_logic;
  signal int_o_data_ev_odd_n         : std_logic;
  signal int_o_data_wrh              : std_logic;
  signal int_o_data_wrh_l_n          : std_logic;
  --
  --// o_data address
  --
  signal int_c_o_inc_value_base      : unsigned(CLOG2M+CLOG2W-1 downto 0);
  signal int_c_o_inc_value_offs      : unsigned(CLOG2M+CLOG2W-1 downto 0);
  signal int_fc_o_inc_value_base     : unsigned(CLOG2M+CLOG2W-1 downto 0);
  signal int_fc_o_inc_value_offs     : unsigned(CLOG2M+CLOG2W-1 downto 0);
  signal int_o_data_even_addr        : unsigned(CLOG2M+CLOG2W-1 downto 0);
  signal int_o_data_odd_addr         : unsigned(CLOG2M+CLOG2W-1 downto 0);
  
begin

  --// i data buffer (conv2d)
  wrap_act_buffer_inst :
    entity work.wrap_act_buffer
      port map (
        ck               => ck,
        rst              => rst,
        i_wr             => ctrl_ldh_v_n,
        i_wr_ptr         => int_L1_ptr(CLOG2W-1 downto 0),
        i_wr_ifmap_ptr   => int_L0_ptr(CLOG2B-1 downto 0),
        i_rd_ifmap_ptr   => ps_int_L0_ptr(CLOG2B-1 downto 0),
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
      ps_ctrl_en_st    <= '0';
      ps_ctrl_wr_mem   <= '0';
      ps2_ctrl_en_st   <= '0';
      ps2_ctrl_wr_mem  <= '0';
    elsif rising_edge(ck) then
      ps_ctrl_en_hmode <= ctrl_en_hmode;
      ps_ctrl_en_npu   <= ctrl_en_npu;
      ps_ctrl_ldh_v_n  <= ctrl_ldh_v_n;
      ps_ctrl_wr_pipe  <= ctrl_wr_pipe;
      ps_ctrl_en_p     <= ctrl_en_p;
      ps_ctrl_en_st    <= ctrl_en_st;
      ps_ctrl_wr_mem   <= ctrl_wr_mem;
      ps2_ctrl_en_st   <= ps_ctrl_en_st;
      ps2_ctrl_wr_mem  <= ps_ctrl_wr_mem;
    end if;
  end process;

  --// ps npu rf ptr
  process(ck, rst)
  begin
    if rst = '1' then
      ps_int_hmode_cnt <= (others => '0');
      ps_int_L0_ptr    <= (others => '0');
    elsif rising_edge(ck) then
      ps_int_hmode_cnt <= int_hmode_cnt;
      ps_int_L0_ptr    <= int_L0_ptr;
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
        i_ifmap_ptr   => ps_int_L0_ptr(CLOG2B-1 downto 0),
        i_c_weight    => i_c_weight,
        i_fc_weight   => (others => '0'),
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
          i_data                   => signed(int_o_data_npu(int_o_data_npu'high - i*(N+BG) downto int_o_data_npu'length - (N+BG)*(i+1))),
          std_logic_vector(o_data) => int_o_data_relu(int_o_data_relu'high - i*N downto int_o_data_relu'length - N*(i+1)));
  end generate;

  --// subsampling K=2, S=2

  p_unit_inst:
  for i in 0 to (W/2)-1 generate
    p_unit_i :
      entity work.avgp_unit
        port map (
          ck                       => ck,
          rst                      => rst,
          en                       => ps_ctrl_en_p,
          i_data_1                 => unsigned(int_o_data_relu(int_o_data_relu'high - i*2*N downto int_o_data_relu'length - N*(i*2+1))),
          i_data_2                 => unsigned(int_o_data_relu(int_o_data_relu'high - (i*2+1)*N downto int_o_data_relu'length - N*(i*2+2))),
          std_logic_vector(o_data) => int_o_data_p(int_o_data_p'high - i*(N+2) downto int_o_data_p'length - (i+1)*(N+2)));
  end generate;

  --// quantize pooling res

  quantize_p_inst:
  for i in 0 to (W/2)-1 generate
    round_i:
      entity work.quantize_p
        port map (
          ck                       => ck,
          rst                      => rst,
          en                       => ps_ctrl_wr_mem,
          i_data                   => unsigned(int_o_data_p(int_o_data_p'high - i*(N+2) downto int_o_data_p'length - (i+1)*(N+2))),
          std_logic_vector(o_data) => int_o_data_r(int_o_data_r'high - i*N downto int_o_data_r'length - (i+1)*N));
  end generate;

  --// skip pool

  process (int_o_data_wrh, int_o_data_wrh_l_n, int_o_data_r, int_o_data_relu)
  begin
    if int_o_data_wrh = '1' then
      if int_o_data_wrh_l_n = '1' then  --// pad msb
        o_data(N*W-1 downto N*(W/2)) <= (others => '0');
        o_data(N*(W/2)-1 downto 0)   <= int_o_data_r;
      else
        o_data(N*W-1 downto N*(W/2)) <= int_o_data_r;
        o_data(N*(W/2)-1 downto 0)   <= (others => '0');
      end if;
    else
      o_data <= std_logic_vector(int_o_data_relu);
    end if;
  end process;

  --// when hctrl_fc = '1' int_s_tc_L4 mux internals
  int_arv_res   <= arv_CKG  when int_s_tc_L2 = '1' else to_unsigned(W-1, CLOG2W);
  int_ckg_rmask <= int_mask when int_s_tc_L2 = '1' else (others => '0');
  int_ckg_cmask <= int_mask when int_s_tc_L3 = '1' else (others => '0');
  process(arv_CKG)
  begin
    case (to_integer(arv_CKG)) is
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

  int_en_hmode <= ctrl_en_hmode and int_s_tc_L0;

  hmode_cnt_inst :
    entity work.countern
      generic map (N => arv_KSI'length)
      port map (
        ck       => ck,
        rst      => rst,
        sync_clr => '0',
        en       => int_en_hmode,
        arv      => arv_KSI,
        q        => int_hmode_cnt,
        tc       => s_tc_hmode);

  int_en_vmode <= (ctrl_en_vmode and int_s_tc_L0) or int_s_tc_res;

  vmode_cnt_inst :
    entity work.countern
      generic map (N => arv_KSI'length)
      port map (
        ck       => ck,
        rst      => rst,
        sync_clr => '0',
        en       => int_en_vmode,
        arv      => arv_KSI,
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

                                        --// Loop status reg
  process(ck, rst)
                                        --// update status
                                        --// when results are ready to be written
                                        --// back to memory
  begin
    if rst = '1' then
      int_q_tc <= (others => '0');
    elsif rising_edge(ck) then
      if ps2_ctrl_en_st = '1' then      --s_tc_res
        int_q_tc <= int_d_tc;
      end if;
    end if;
  end process;

  int_d_tc    <= int_tc_L2 & int_tc_L3 & int_tc_L4;
  --
  int_s_tc_L0 <= int_tc_L0;  --// aliases : signal copy. different delta cycle during sim.
  int_s_tc_L1 <= int_tc_L1;
  int_s_tc_L2 <= int_q_tc(2);
  int_s_tc_L3 <= int_q_tc(1);
  int_s_tc_L4 <= int_q_tc(0);
  --
  s_tc_L0     <= int_tc_L0;
  s_tc_L1     <= int_tc_L1;
  s_tc_L2     <= int_q_tc(2);
  s_tc_L3     <= int_q_tc(1);
  s_tc_L4     <= int_q_tc(0);

  --// Loop ordering

  int_en_L0_ptr <= ctrl_en_npu;
  int_en_L1_ptr <= int_tc_L0 and ctrl_ldh_v_n;
  int_en_L2_ptr <= int_tc_L1 and int_en_L1_ptr;
  int_en_L3_ptr <= int_tc_L2 and int_en_L2_ptr;
  int_en_L4_ptr <= int_tc_L3 and int_en_L3_ptr;

                                        --// Loop ctrl counters

  L1_inst :                             --// CX: npu row ptr
    entity work.countern
      generic map (N => CLOG2L)
      port map (
        ck       => ck,
        rst      => rst,
        sync_clr => '0',
        en       => int_en_L1_ptr,
        arv      => arv_L1,
        q        => int_L1_ptr,
        tc       => int_tc_L1);

  L2_inst :                             --// CX: tilev
    entity work.countern
      generic map (N => CLOG2L)
      port map (
        ck       => ck,
        rst      => rst,
        sync_clr => '0',
        en       => int_en_L2_ptr,
        arv      => arv_L2,
        q        => int_L2_ptr,
        tc       => int_tc_L2);

  L3_inst :                             --// CX: tileh
    entity work.countern
      generic map (N => CLOG2L)
      port map (
        ck       => ck,
        rst      => rst,
        sync_clr => '0',
        en       => int_en_L3_ptr,
        arv      => arv_L3,
        q        => int_L3_ptr,
        tc       => int_tc_L3);

  int_L3_ptr_0 <= int_L3_ptr(0);
  int_L3_ptr_1 <= int_L3_ptr(1);

  L0_inst :                             --// CX: ifmaps
    entity work.countern
      generic map (N => CLOG2L)
      port map (
        ck       => ck,
        rst      => rst,
        sync_clr => '0',
        en       => int_en_L0_ptr,
        arv      => arv_L0,
        q        => int_L0_ptr,
        tc       => int_tc_L0);

  L4_inst :                             --// CX: ofmaps
    entity work.countern
      generic map (N => CLOG2L)
      port map (
        ck       => ck,
        rst      => rst,
        sync_clr => '0',
        en       => int_en_L4_ptr,
        arv      => arv_L4,
        q        => int_L4_ptr,
        tc       => int_tc_L4);

                                        --// weight address
  
  int_fc_i_en_weight_addr <= ctrl_ldh_v_n and int_s_tc_L1;
  int_c_i_en_weight_addr  <= int_s_tc_L2 and int_s_tc_L3 and int_s_tc_res;

  i_c_weight_addr_gen_inst :
    entity work.addr_gen
      generic map (
        N => CLOG2MW)
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

                                        --// i_data address ctrl logic

  --// convolution
  
  int_c_i_en_even            <= int_en_L3_ptr and not(int_L3_ptr_0);
  int_c_i_en_odd             <= int_en_L3_ptr and int_L3_ptr_0;
  int_c_i_clr                <= int_tc_L2 and int_tc_L3 and int_en_L2_ptr;
  --
  int_c_i_sync_clr_even      <= int_c_i_clr;
  int_c_i_clr_offs_even      <= int_c_i_en_even or int_c_i_en_odd;
  int_c_i_mux_base_addr_even <= int_c_i_en_even;
  int_c_i_en_base_even       <= int_c_i_en_even;
  int_c_i_en_offs_even       <= ctrl_ldh_v_n;
  --
  int_c_i_sync_clr_odd       <= int_c_i_clr;
  int_c_i_clr_offs_odd       <= int_c_i_en_even or int_c_i_en_odd;
  int_c_i_mux_base_addr_odd  <= int_c_i_en_odd;
  int_c_i_en_base_odd        <= int_c_i_en_odd;
  int_c_i_en_offs_odd        <= ctrl_ldh_v_n;
  --
  int_c_i_inc_value_base     <= to_unsigned(1, int_c_i_inc_value_base'length);
  int_c_i_inc_value_offs     <= to_unsigned(1, int_c_i_inc_value_offs'length);

  --// classifier

  int_fc_i_data_ev_odd_n      <= '0';
  --
  int_fc_i_sync_clr_even      <= '0';
  int_fc_i_clr_offs_even      <= '0';
  int_fc_i_mux_base_addr_even <= '0';
  int_fc_i_en_base_even       <= '0';
  int_fc_i_en_offs_even       <= ctrl_ldh_v_n and int_s_tc_L1;
  --
  int_fc_i_sync_clr_odd       <= '0';
  int_fc_i_clr_offs_odd       <= '0';
  int_fc_i_mux_base_addr_odd  <= '0';
  int_fc_i_en_base_odd        <= '0';
  int_fc_i_en_offs_odd        <= '0';
  --
  int_fc_i_inc_value_base     <= to_unsigned(0, int_fc_i_inc_value_base'length);
  int_fc_i_inc_value_offs     <= to_unsigned(1, int_fc_i_inc_value_offs'length);

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
        inc_value_base => int_c_i_inc_value_base,
        inc_value_offs => int_c_i_inc_value_offs,
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
        inc_value_base => int_c_i_inc_value_base,
        inc_value_offs => int_c_i_inc_value_offs,
        addr           => int_i_data_odd_addr);

  i_data_even_addr <= int_i_data_even_addr;
  i_data_odd_addr  <= int_i_data_odd_addr;
  i_data_ev_odd_n  <= int_L3_ptr_0 when hctrl_fc = '0' else int_fc_i_data_ev_odd_n;

                                        --// ps status o_data addr ctrl  
  process(ck, rst)
  begin
    if rst = '1' then
      ps_int_s_tc_res <= '0';
      ps_int_s_tc_L2  <= '0';
      ps_int_s_tc_L3  <= '0';
      ps_int_s_tc_L4  <= '0';
    elsif rising_edge(ck) then
      ps_int_s_tc_res <= int_s_tc_res;
      ps_int_s_tc_L2  <= int_s_tc_L2;
      ps_int_s_tc_L3  <= int_s_tc_L3;
      ps_int_s_tc_L4  <= int_s_tc_L4;
    end if;
  end process;

  --// convolution

  int_c_o_en                 <= ps_int_s_tc_L2 and ps_int_s_tc_L3 and ps2_ctrl_en_st;
  --
  int_c_o_sync_clr_even      <= ps_int_s_tc_L2 and ps_int_s_tc_L3 and ps_int_s_tc_L4 and ps2_ctrl_en_st;
  int_c_o_clr_offs_even      <= ps2_ctrl_en_st and ps_int_s_tc_L2;
  int_c_o_mux_base_addr_even <= '0';
  int_c_o_en_base_even       <= int_c_o_en;
  int_c_o_en_offs_even       <= ps2_ctrl_wr_mem and not(int_o_data_ev_odd_n);
  --
  int_c_o_sync_clr_odd       <= ps_int_s_tc_L2 and ps_int_s_tc_L3 and ps_int_s_tc_L4 and ps2_ctrl_en_st;
  int_c_o_clr_offs_odd       <= ps2_ctrl_en_st and ps_int_s_tc_L2;
  int_c_o_mux_base_addr_odd  <= '0';
  int_c_o_en_base_odd        <= int_c_o_en;
  int_c_o_en_offs_odd        <= ps2_ctrl_wr_mem and int_o_data_ev_odd_n;
  --
  int_c_o_inc_value_base     <= to_unsigned(1, int_c_o_inc_value_offs'length);
  int_c_o_inc_value_offs     <= to_unsigned(to_integer(arv_L4), int_c_o_inc_value_offs'length) + 1;

  --// classifier

  int_fc_o_data_ev_odd_n      <= '0';
  --
  int_fc_o_sync_clr_even      <= '0';
  int_fc_o_clr_offs_even      <= '0';
  int_fc_o_mux_base_addr_even <= '0';
  int_fc_o_en_base_even       <= '0';
  int_fc_o_en_offs_even       <= ps2_ctrl_wr_mem;
  int_fc_o_sync_clr_odd       <= '0';
  int_fc_o_clr_offs_odd       <= '0';
  int_fc_o_mux_base_addr_odd  <= '0';
  int_fc_o_en_base_odd        <= '0';
  int_fc_o_en_offs_odd        <= '0';
  --
  int_fc_o_inc_value_base     <= to_unsigned(0, int_fc_o_inc_value_offs'length);
  int_fc_o_inc_value_offs     <= to_unsigned(1, int_fc_o_inc_value_offs'length);

  o_data_even_addr_gen_inst:
    entity work.addr_gen
      generic map (
        N => CLOG2M+CLOG2W)
      port map (
        ck             => ck,
        rst            => rst,
        sync_clr       => int_c_o_sync_clr_even,
        en_offs        => int_c_o_en_offs_even,
        en_base        => int_c_o_en_base_even,
        mux_base_addr  => int_c_o_mux_base_addr_even,
        clr_offs       => int_c_o_clr_offs_even,
        inc_value_base => int_c_o_inc_value_base,
        inc_value_offs => int_c_o_inc_value_offs,
        addr           => int_o_data_even_addr);

  o_data_odd_addr_gen_inst:
    entity work.addr_gen
      generic map (
        N => CLOG2M+CLOG2W)
      port map (
        ck             => ck,
        rst            => rst,
        sync_clr       => int_c_o_sync_clr_odd,
        en_offs        => int_c_o_en_offs_odd,
        en_base        => int_c_o_en_base_odd,
        mux_base_addr  => int_c_o_mux_base_addr_odd,
        clr_offs       => int_c_o_clr_offs_odd,
        inc_value_base => int_c_o_inc_value_base,
        inc_value_offs => int_c_o_inc_value_offs,
        addr           => int_o_data_odd_addr);

  --// half-word c/p ctrl
  process(ck, rst)
  begin
    if rst = '1' then
      int_o_data_ev_odd_n <= '0';
      int_o_data_wrh_l_n  <= '0';
    elsif rising_edge(ck) then
      if hctrl_fc = '0' then
        if ps2_ctrl_en_st = '1' then
          if ps_int_s_tc_L2 = '1' then
            int_o_data_wrh_l_n  <= int_L3_ptr_0;
            int_o_data_ev_odd_n <= int_L3_ptr_1;
          end if;
        end if;
      end if;
    end if;
  end process;

  int_o_data_wrh   <= not(hctrl_fc);    --// skip pool, word write-back
  --
  o_data_wr        <= ps2_ctrl_wr_mem;
  o_data_wrh       <= int_o_data_wrh;
  o_data_wrh_l_n   <= int_o_data_wrh_l_n;  --// when hctrl_fc = '0' else don't care
  --
  o_data_ev_odd_n  <= int_o_data_ev_odd_n when hctrl_fc = '0' else int_fc_o_data_ev_odd_n;
  o_data_even_addr <= int_o_data_even_addr;
  o_data_odd_addr  <= int_o_data_odd_addr;

end architecture;
