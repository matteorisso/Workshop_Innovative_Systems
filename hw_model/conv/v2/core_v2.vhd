library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.globals.all;

entity core_v2 is
  port(
    ck            : in std_logic;
    rst           : in std_logic;
    i_weight_conv : in std_logic_vector(N_WEIGHT*K-1 downto 0);
    i_data_conv_h : in signed(N*W-1 downto 0);  -- to conv_buffer
    i_data_conv_v : in signed(N*W-1 downto 0);  -- to pe_array

    en_npu        : in  std_logic;
    ld_h          : in  std_logic;
    ld_v          : in  std_logic;
    rld_v         : in  std_logic;
    wr_pipe       : in  std_logic;
    ckg_rsel      : in  std_logic;
    ckg_csel      : in  std_logic;
    ckg_mask      : in  std_logic_vector(0 to W-1);
    ckg_mask_lt   : in  std_logic_vector(0 to W-1);
    weight_wr     : in  std_logic;
    weight_rd     : in  std_logic;
    weight_wr_ptr : in  unsigned(clog2K-1 downto 0);
    weight_rd_ptr : in  unsigned(clog2K-1 downto 0);
    weight_sel    : in  unsigned(clog2K-1 downto 0);
    o_data        : out o_pe_array_t
    );
end entity;

architecture rtl of core_v2 is
-------------------------------------------------
  signal int_weight_fc     : std_logic_vector(N_WEIGHT*W*W -1 downto 0);  --TMP CHECK ALE
  signal int_data_fc       : signed(N-1 downto 0);
  signal int_data_pool     : pe_array_t;
  signal int_weight_conv   : std_logic_vector(N_WEIGHT-1 downto 0);
  signal int_i_data_conv_h : signed(i_data_conv_h'high downto 0);
  signal int_i_data_conv_v : signed(i_data_conv_v'high downto 0);
-------------------------------------------------
  signal int_data_conv_h   : i_pe_array_t;
  signal int_data_conv_v   : i_pe_array_t;
  signal int_o_data        : o_pe_array_t;
-------------------------------------------------

  signal int_ckg_rmask : std_logic_vector(0 to W-1);
  signal int_ckg_cmask : std_logic_vector(0 to W-1);

begin

  int_i_data_conv_v <= i_data_conv_v;
  int_i_data_conv_h <= i_data_conv_h;

  npu_if_h:
  for i in 0 to int_data_conv_h'high generate
    int_data_conv_h(i)
      <= int_i_data_conv_h(int_i_data_conv_h'length-1 - i*N downto int_i_data_conv_h'length - (i+1)*N);
  end generate;

  npu_if_v:
  for i in 0 to int_data_conv_v'high generate
    int_data_conv_v(i)
      <= int_i_data_conv_v(int_i_data_conv_v'length-1 - i*N downto int_i_data_conv_v'length - (i+1)*N);
  end generate;

  npu_inst :
    entity work.pe_array port map (
      ck            => ck,
      rst           => rst,
      en            => en_npu,
      ld_h          => ld_h,
      ld_v          => ld_v,
      rld_v         => rld_v,
      wr_pipe       => wr_pipe,
      ckg_rmask     => int_ckg_rmask,
      ckg_cmask     => int_ckg_cmask,
      i_weight_conv => int_weight_conv,
      i_weight_fc   => int_weight_fc,
      i_data_conv_h => int_data_conv_h,
      i_data_conv_v => int_data_conv_v,
      i_data_pool   => int_data_pool,
      i_data_fc     => int_data_fc,
      o_data        => o_data
      );

  weight_buffer_inst:
    entity work.weight_buffer port map (
      ck        => ck,
      rst       => rst,
      cs        => '1',
      rd        => weight_rd,
      wr        => weight_wr,
      rd_addr_h => weight_sel,
      rd_addr_v => weight_rd_ptr,
      wr_addr   => weight_wr_ptr,
      i_data    => i_weight_conv,
      o_data    => int_weight_conv
      );

  ckg_ctrl_inst:
    entity work.ckg_ctrl port map (
      ck          => ck,
      rst         => rst,
      ckg_rsel    => ckg_rsel,
      ckg_csel    => ckg_csel,
      ckg_mask    => ckg_mask,
      ckg_mask_lt => ckg_mask_lt,
      ckg_rmask   => int_ckg_rmask,
      ckg_cmask   => int_ckg_cmask
      );

end architecture;
