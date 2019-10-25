library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.globals.all;

entity pe_array is
  port(
    ck            : in  std_logic;
    rst           : in  std_logic;
    en            : in  std_logic;
    ld_h          : in  std_logic;
    ld_v          : in  std_logic;
    rld_v         : in  std_logic;
    wr_pipe       : in  std_logic;
    ckg_rmask     : in  std_logic_vector(0 to W-1);
    ckg_cmask     : in  std_logic_vector(0 to W-1);
    i_weight_conv : in  std_logic_vector(N_WEIGHT-1 downto 0);
    i_data_conv_h : in  i_pe_array_t;
    i_data_conv_v : in  i_pe_array_t;
    i_data_pool   : in  pe_array_t;
    i_weight_fc   : in  std_logic_vector(N_WEIGHT*W*W-1 downto 0);
    i_data_fc     : in  signed(N-1 downto 0);
    o_data        : out o_pe_array_t
    );
end entity;

architecture rtl of pe_array is

  type ckg_mask_t is array (0 to W-1) of std_logic_vector(0 to W-1);
  type int_matrix_t is array (0 to W, 0 to W) of signed(N-1 downto 0);
  type int_matrix_res_t is array (0 to W, 0 to W-1) of signed(N-1+BG downto 0);

  signal int_pe_en    : ckg_mask_t;
  signal int_data_x   : int_matrix_t;
  signal int_data_y   : int_matrix_t;
  signal int_data_res : int_matrix_res_t;

  signal int_ld_h    : std_logic;
  signal int_ld_v    : std_logic;
  signal int_rld_v   : std_logic;
  signal int_wr_pipe : std_logic;
  signal int_weight  : std_logic_vector(N_WEIGHT-1 downto 0);

begin

  int_ld_h    <= ld_h;
  int_ld_v    <= ld_v;
  int_rld_v   <= rld_v;
  int_wr_pipe <= wr_pipe;
  int_weight  <= i_weight_conv;

  mesh_body:
  for i in 0 to W-1 generate c:
                             for j in 0 to W-1 generate peij :
                                                          entity work.pev2_2 port map (
                                                            ck         => ck,
                                                            rst        => rst,
                                                            en         => int_pe_en(i)(j),
                                                            ld_h       => int_ld_h,
                                                            ld_v       => int_ld_v,
                                                            rld_v      => int_rld_v,
                                                            wr_pipe    => int_wr_pipe,
                                                            weight     => int_weight,
                                                            i_data_h   => int_data_x(i, j+1),
                                                            i_data_v   => int_data_y(i+1, j),
                                                            i_data_acc => int_data_res(i+1, j),
                                                            o_data_h   => int_data_x(i, j),
                                                            o_data_v   => int_data_y(i, j),
                                                            o_data_res => int_data_res(i, j)
                                                            );
                             end generate;
  end generate;

  dinh : for i in 0 to W-1 generate
    int_data_x(i, W) <= i_data_conv_h(i);
    
  end generate;
  dinv : for j in 0 to W-1 generate
    int_data_y(W, j) <= i_data_conv_v(j);
  end generate;

  ckg:
  for i in 0 to W-1 generate ckg_col:
                             for j in 0 to W-1 generate
                               int_pe_en(i)(j) <= en and (ckg_rmask(i) nor ckg_cmask(j));
                             end generate;
  end generate;

  feed_zero_acc:
  for j in 0 to W-1 generate
    int_data_res(W,j) <= (others => '0');
  end generate;

  take_o_data:
  for j in 0 to W-1 generate
    o_data(j) <= int_data_res(0,j);
  end generate;

end architecture;
