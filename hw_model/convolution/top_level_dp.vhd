library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.globals.all;

entity top_level_dp is
  port(
    ck             : in  std_logic;
    rst            : in  std_logic;
    task           : in  layer_t;
    test           : in  std_logic;
    i_data_weight  : in  std_logic_vector(N_WEIGHT*K-1 downto 0);
    i_data_even    : in  mem_data_t;
    i_data_odd     : in  mem_data_t;
    cs_all         : in  std_logic;
    wr             : in  std_logic_vector(0 to W-1);
    even_rd_addr   : in  unsigned(clog2m-1 downto 0);
    odd_rd_addr    : in  unsigned(clog2m-1 downto 0);
    even_wr_addr   : in  unsigned(clog2m-1 downto 0);
    odd_wr_addr    : in  unsigned(clog2m-1 downto 0);
    rd_spad        : in  std_logic;
    rf_ptr_spad    : in  unsigned(CLOG2W-1 downto 0);
    rd_addr_spad   : in  unsigned(CLOG2M_SP-1 downto 0);
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
    o_data         : out signed((N+BG2)*W-1 downto 0)
    );
end entity;

architecture rtl of top_level_dp is

  signal int_data_even_mem : mem_data_t;
  signal int_data_odd_mem  : mem_data_t;
  signal int_data_even     : mem_data_t;
  signal int_data_odd      : mem_data_t;
  signal int_data_weight   : std_logic_vector(K*N_WEIGHT-1 downto 0);
  signal int_addr_rd_even  : unsigned(even_rd_addr'high downto 0);
  signal int_addr_rd_odd   : unsigned(odd_rd_addr'high downto 0);
  signal int_cs_all        : std_logic;
  signal int_cs_enc        : unsigned(CLOG2W-1 downto 0);
  signal int_wr            : std_logic_vector(0 to W-1);
  signal int_o_data_spad   : signed((N+BG2)*W-1 downto 0);
  signal int_i_data_spad   : signed((N+BG2)*W-1 downto 0);
  signal int_psb_addr      : unsigned(CLOG2M_SP-1 downto 0);
  signal int_psb_cs_enc    : unsigned(CLOG2W-1 downto 0);
  signal int_psb_rd_ptr    : unsigned(CLOG2W-1 downto 0);
  signal int_psb_en        : std_logic;
  signal int_rf_ptr_spad   : unsigned(CLOG2W-1 downto 0);
  signal int_rd_addr_spad  : unsigned(CLOG2M_SP-1 downto 0);
  
begin
  
  int_data_even   <= i_data_even   when test = '1' else int_data_even_mem;
  int_data_odd    <= i_data_odd    when test = '1' else int_data_odd_mem;
  int_data_weight <= i_data_weight when test = '1' else (others => '1');  -- tmp,

  int_cs_all <= cs_all;
  int_wr     <= wr;

  o_data           <= int_o_data_spad when rd_spad = '1' else (others => '0');  --output freez
  int_rf_ptr_spad  <= rf_ptr_spad     when rd_spad = '1' else int_psb_rd_ptr;
  int_rd_addr_spad <= rd_addr_spad    when rd_spad = '1' else int_psb_addr;

  dp_inst:
    entity work.datapath port map (
      ck             => ck,
      rst            => rst,
      task           => task,
      ctrl_en_hmode  => ctrl_en_hmode,
      ctrl_en_vmode  => ctrl_en_vmode,
      ctrl_en_npu    => ctrl_en_npu,
      ctrl_ld_v      => ctrl_ld_v,
      ctrl_en_rf_ptr => ctrl_en_rf_ptr,
      ctrl_wr_pipe   => ctrl_wr_pipe,
      ctrl_weight_wr => ctrl_weight_wr,
      s_tc_rd        => s_tc_rd,
      s_tc_hmode     => s_tc_hmode,
      s_tc_vmode     => s_tc_vmode,
      s_tc_res       => s_tc_res,
      s_tc_tilev     => s_tc_tilev,
      s_tc_tileh     => s_tc_tileh,
      s_tc_tileb     => s_tc_tileb,
      s_tc_tilec     => s_tc_tilec,
      i_weight       => int_data_weight,
      i_data_even    => int_data_even,
      i_data_odd     => int_data_odd,
      i_data_spad    => int_o_data_spad,
      o_cs_enc       => int_cs_enc,
      o_addr_rd_even => int_addr_rd_even,
      o_addr_rd_odd  => int_addr_rd_odd,
      o_wr_spad      => int_psb_en,
      o_cs_enc_spad  => int_psb_cs_enc,
      o_rd_ptr_spad  => int_psb_rd_ptr,
      o_addr_spad    => int_psb_addr,
      o_data_dp      => int_i_data_spad
      );

  spad_inst :
    entity work.spad port map (
      ck      => ck,
      rst     => rst,
      wr      => int_psb_en,
      cs_enc  => int_psb_cs_enc,
      rd_ptr  => int_rf_ptr_spad,
      wr_addr => int_psb_addr,
      rd_addr => int_rd_addr_spad,
      i_data  => int_i_data_spad,
      o_data  => int_o_data_spad
      );

  imem_inst:
    entity work.imem_w port map (
      ck           => ck,
      rst          => rst,
      i_data_even  => i_data_even,
      i_data_odd   => i_data_odd,
      cs_all       => int_cs_all,
      cs_enc       => int_cs_enc,
      wr           => int_wr,
      even_rd_addr => int_addr_rd_even,
      even_wr_addr => even_wr_addr,
      odd_rd_addr  => int_addr_rd_odd,
      odd_wr_addr  => odd_wr_addr,
      o_data_even  => int_data_even_mem,
      o_data_odd   => int_data_odd_mem
      );

end architecture;
