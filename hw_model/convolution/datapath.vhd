library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.globals.all;

entity datapath is
  port(
    ck             : in  std_logic;
    rst            : in  std_logic;
    task           : in  layer_t;
    ctrl_en_hmode  : in  std_logic;
    ctrl_en_vmode  : in  std_logic;
    ctrl_en_npu    : in  std_logic;
    ctrl_ld_v      : in  std_logic;
    ctrl_en_rf_ptr : in  std_logic;
    ctrl_wr_pipe   : in  std_logic;
    ctrl_weight_wr : in  std_logic;
    s_tc_rd        : out std_logic;
    s_tc_hmode     : out std_logic;
    s_tc_vmode     : out std_logic;
    s_tc_res       : out std_logic;
    s_tc_tilev     : out std_logic;
    s_tc_tileh     : out std_logic;
    s_tc_tileb     : out std_logic;
    s_tc_tilec     : out std_logic;
    i_weight       : in  std_logic_vector(K*N_WEIGHT-1 downto 0);
    i_data_even    : in  mem_data_t;    --i_pe_array_t;
    i_data_odd     : in  mem_data_t;    --i_pe_array_t;
    i_data_spad    : in  signed((N+BG2)*W-1 downto 0);
    o_cs_enc       : out unsigned(CLOG2W-1 downto 0);
    o_addr_rd_even : out unsigned(CLOG2M-1 downto 0);
    o_addr_rd_odd  : out unsigned(CLOG2M-1 downto 0);
    o_wr_spad      : out std_logic;
    o_rd_ptr_spad  : out unsigned(CLOG2W-1 downto 0);
    o_cs_enc_spad  : out unsigned(CLOG2W-1 downto 0);
    o_addr_spad    : out unsigned(CLOG2M_SP-1 downto 0);
    o_data_dp      : out signed((N+BG2)*W-1 downto 0)
    );
end entity;

architecture rtl of datapath is

  signal int_o_data       : o_pe_array_t;
  signal int_i_data_psb   : signed((N+BG)*W-1 downto 0);
  signal int_data_conv_v  : signed(N*W-1 downto 0);
  signal int_data_conv_h  : signed(N*W-1 downto 0);
  signal int_ckg_mask     : std_logic_vector(0 to W-1);
  signal int_ckg_mask_lt  : std_logic_vector(0 to W-1);
  signal int_arv_ckg      : unsigned(clog2W-1 downto 0);
  signal int_arv_res      : unsigned(clog2W-1 downto 0);
  signal int_arv_hmode    : unsigned(clog2K-1 downto 0);
  signal int_arv_vmode    : unsigned(clog2K-1 downto 0);
  signal int_arv_tilev    : unsigned(clog2v-1 downto 0);
  signal int_arv_tileh    : unsigned(clog2v-1 downto 0);
  signal int_arv_tileb    : unsigned(clog2b-1 downto 0);
  signal int_arv_tilec    : unsigned(clog2c-1 downto 0);
  signal int_tc_rd        : std_logic;
  signal int_tc_res       : std_logic;
  signal int_tc_tilev     : std_logic;
  signal int_tc_tileh     : std_logic;
  signal int_tc_tileb     : std_logic;
  signal int_tc_tilec     : std_logic;
  signal int_s_tc_tilev   : std_logic;
  signal int_s_tc_tileh   : std_logic;
  signal int_s_tc_tileb   : std_logic;
  signal int_s_tc_tilec   : std_logic;
  signal int_even_odd_n   : std_logic;
  signal int_even_rd_addr : unsigned(clog2M-1 downto 0);
  signal int_odd_rd_addr  : unsigned(clog2M-1 downto 0);
  signal int_rf_ptr       : unsigned(clog2W-1 downto 0);
  signal int_hmode_cnt    : unsigned(clog2K-1 downto 0);
  signal int_vmode_cnt    : unsigned(clog2K-1 downto 0);
  signal int_weight_wr    : std_logic;
  signal int_s_tc_vmode   : std_logic;
  signal int_rld_v        : std_logic;

  -- queue
  signal int_res_ptr    : unsigned(clog2W-1 downto 0);
  signal int_res_ptr_q1 : unsigned(clog2W-1 downto 0);
  signal int_tc_res_q1  : std_logic;
  signal int_wr_pipe_q1 : std_logic;
  signal int_wr_pipe_q2 : std_logic;

  -- fixed --arv = 3 = npu.dim-1
  constant int_arv_rf_ptr : unsigned(clog2W-1 downto 0) := (others => '1');

begin

  -------------------------------------
  o_cs_enc       <= int_rf_ptr;
  o_addr_rd_even <= int_even_rd_addr;
  o_addr_rd_odd  <= int_odd_rd_addr;

  s_tc_rd    <= int_tc_rd;
  s_tc_res   <= int_tc_res;
  s_tc_vmode <= int_s_tc_vmode;
  s_tc_tilev <= int_s_tc_tilev;
  s_tc_tileh <= int_s_tc_tileh;
  s_tc_tileb <= int_s_tc_tileb;
  s_tc_tilec <= int_s_tc_tilec;

  int_rld_v     <= ctrl_en_vmode and int_s_tc_vmode;
  int_weight_wr <= (int_s_tc_tileh and int_s_tc_tilev and (ctrl_en_vmode or int_tc_res)) or ctrl_weight_wr;
  int_arv_res   <= int_arv_rf_ptr when int_s_tc_tilev = '0' else int_arv_ckg;

  -------------------------------------
  psb_if:
  for i in 0 to W-1 generate
    int_i_data_psb (int_i_data_psb'length -1 - i*(N+BG) downto int_i_data_psb'length -(i+1)*(N+BG))
      <= int_o_data(i);
  end generate;

  -------------------------------------
-- preskew queue
  int_wr_pipe_q1_1:
  process(ck, rst)
  begin
    if rst = '1' then
      int_wr_pipe_q1 <= '0';
      int_tc_res_q1  <= '0';
      int_res_ptr_q1 <= (others => '0');
    elsif rising_edge(ck) then
      int_wr_pipe_q1 <= ctrl_wr_pipe;
      int_tc_res_q1  <= int_tc_res;
      int_res_ptr_q1 <= int_res_ptr;
    end if;
  end process;

  int_wr_pipe_q2_1:
  process(ck, rst)
  begin
    if rst = '1' then
      int_wr_pipe_q2 <= '0';
    elsif rising_edge(ck) then
      int_wr_pipe_q2 <= int_wr_pipe_q1;
    end if;
  end process;

  o_wr_spad <= int_wr_pipe_q2;
  -------------------------------------

  core_inst:
    entity work.core_v2 port map (
      ck            => ck,
      rst           => rst,
      en_npu        => ctrl_en_npu,
      ld_h          => ctrl_en_hmode,
      ld_v          => ctrl_ld_v,
      rld_v         => int_rld_v,
      wr_pipe       => int_wr_pipe_q1,
      ckg_rsel      => int_s_tc_tilev,
      ckg_csel      => int_s_tc_tileh,
      ckg_mask      => int_ckg_mask,
      ckg_mask_lt   => int_ckg_mask_lt,
      weight_rd     => ctrl_en_hmode,
      weight_wr     => int_weight_wr,
      weight_sel    => int_hmode_cnt,
      weight_rd_ptr => int_vmode_cnt,
      weight_wr_ptr => int_vmode_cnt,
      i_weight_conv => i_weight,
      i_data_conv_h => int_data_conv_h,
      i_data_conv_v => int_data_conv_v,
      o_data        => int_o_data
      );

  npu_ctrl_inst:
    entity work.npu_ctrl port map (
      ck        => ck,
      rst       => rst,
      en_vmode  => ctrl_en_vmode,
      en_hmode  => ctrl_en_hmode,
      wr_pipe   => ctrl_wr_pipe,
      arv_vmode => int_arv_vmode,
      arv_res   => int_arv_res,
      hmode_cnt => int_hmode_cnt,
      vmode_cnt => int_vmode_cnt,
      res_ptr   => int_res_ptr,
      tc_hmode  => s_tc_hmode,
      tc_vmode  => int_s_tc_vmode,
      tc_res    => int_tc_res
      );

  s_tile_gen_inst:
    entity work.s_tile_gen port map (
      ck         => ck,
      rst        => rst,
      ck_en      => int_tc_res,
      tc_tilev   => int_tc_tilev,
      tc_tileh   => int_tc_tileh,
      tc_tileb   => int_tc_tileb,
      tc_tilec   => int_tc_tilec,
      s_tc_tilev => int_s_tc_tilev,
      s_tc_tileh => int_s_tc_tileh,
      s_tc_tileb => int_s_tc_tileb,
      s_tc_tilec => int_s_tc_tilec
      );

  addr_gen_inst :
    entity work.addr_gen port map (
      ck         => ck,
      rst        => rst,
      inc        => ctrl_en_rf_ptr,
      arv_rf_ptr => int_arv_rf_ptr,
      arv_tilev  => int_arv_tilev,
      arv_tileh  => int_arv_tileh,
      arv_tileb  => int_arv_tileb,
      arv_tilec  => int_arv_tilec,
      tc_rd      => int_tc_rd,
      tc_tilev   => int_tc_tilev,
      tc_tileh   => int_tc_tileh,
      tc_tileb   => int_tc_tileb,
      tc_tilec   => int_tc_tilec,
      even_odd_n => int_even_odd_n,
      even_addr  => int_even_rd_addr,
      odd_addr   => int_odd_rd_addr,
      rf_ptr     => int_rf_ptr
      );

  psb_1 :
    entity work.psb port map (
      ck          => ck,
      rst         => rst,
      enable      => int_wr_pipe_q1,
      i_data_dp   => int_i_data_psb,
      i_data_spad => i_data_spad,
      o_data      => o_data_dp
      );

  spad_addr_gen_inst :
    entity work.spad_addr_gen port map (
      ck        => ck,
      rst       => rst,
      res_ptr   => int_res_ptr_q1,
      tc_res    => int_tc_res_q1,
      arv_tilev => int_arv_tilev,
      arv_tileh => int_arv_tileh,
      arv_tileb => int_arv_tileb,
      cs_enc    => o_cs_enc_spad,
      rd_ptr    => o_rd_ptr_spad,
      addr      => o_addr_spad
      );

  globals_inst:
    entity work.urom port map (
      task        => task,
      arv_hmode   => int_arv_hmode,
      arv_vmode   => int_arv_vmode,
      arv_tilev   => int_arv_tilev,
      arv_tileh   => int_arv_tileh,
      arv_tileb   => int_arv_tileb,
      arv_tilec   => int_arv_tilec,
      arv_ckg     => int_arv_ckg,
      ckg_mask    => int_ckg_mask,
      ckg_mask_lt => int_ckg_mask_lt
      );

  imem_if_inst:
    entity work.imem_if_top (rtl) port map (

      even_odd_n    => int_even_odd_n,
      rf_ptr        => int_rf_ptr,
      px_ptr        => int_hmode_cnt,
      i_data_even   => i_data_even,
      i_data_odd    => i_data_odd,
      o_data_conv_v => int_data_conv_v,
      o_data_conv_h => int_data_conv_h
      );


end architecture;
