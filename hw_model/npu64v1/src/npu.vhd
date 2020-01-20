library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.globals.all;

entity npu is
  port(
    ck            : in  std_logic;
    rst           : in  std_logic;
    en            : in  std_logic;
    ldh_v_n       : in  std_logic;
    wr_pipe       : in  std_logic;
    ckg_rmask     : in  std_logic_vector(0 to W-1);
    ckg_cmask     : in  std_logic_vector(0 to W-1);
    i_ifmap_ptr   : in  unsigned(CLOG2B-1 downto 0);
    i_weight      : in  std_logic_vector(1 downto 0);
    i_data_conv_h : in  std_logic_vector(N*W-1 downto 0);
    i_data_conv_v : in  std_logic_vector(N*W-1 downto 0);
    i_data_acc    : in  std_logic_vector((N+BG)*W-1 downto 0);
    o_data        : out std_logic_vector((N+BG)*W-1 downto 0)
    );

end entity;

architecture rtl of npu is

  type ckg_mask_t is array (0 to W-1) of std_logic_vector(0 to W-1);
  type int_matrix_t is array (0 to W, 0 to W) of unsigned(N-1 downto 0);
  type int_matrix_res_t is array (0 to W, 0 to W-1) of signed(N+BG-1 downto 0);

  signal int_ckg      : ckg_mask_t;
  signal int_data_x   : int_matrix_t;
  signal int_data_y   : int_matrix_t;
  signal int_data_res : int_matrix_res_t;

begin
  clk_gating_mask:
  for i in 0 to W-1 generate
    ckg_j : for j in 0 to W-1 generate
      int_ckg(i)(j) <= (ckg_rmask(i) or ckg_cmask(j));
    end generate;
  end generate;

  type_cast_h : for i in 0 to W-1 generate
    int_data_x(i, W) <= unsigned(i_data_conv_h(i_data_conv_v'high - (N*i) downto i_data_conv_v'length - (N*(i+1))));
  end generate;

  type_cast_v : for j in 0 to W-1 generate
    int_data_y(W, j) <= unsigned(i_data_conv_v(i_data_conv_v'high - (N*j) downto i_data_conv_v'length - (N*(j+1))));
  end generate;

  type_cast_res :
  for j in 0 to W-1 generate
    o_data(o_data'high - j*(N+BG) downto o_data'length - (j+1)*(N+BG)) <= std_logic_vector(int_data_res(0, j));
  end generate;

  r : for i in 0 to W-1 generate
    c : for j in 0 to W-1 generate
      pe_1 : entity work.pe
        port map (
          ck          => ck,
          rst         => rst,
          en          => en,
          ckg         => int_ckg(i)(j),
          ldh_v_n     => ldh_v_n,
          wr_pipe     => wr_pipe,
          i_ifmap_ptr => i_ifmap_ptr,
          i_weight    => i_weight,
          i_data_h    => int_data_x(i, j+1),
          i_data_v    => int_data_y(i+1, j),
          i_data_acc  => int_data_res(i+1, j),
          o_data_h    => int_data_x(i, j),
          o_data_v    => int_data_y(i, j),
          o_data_res  => int_data_res(i, j));
    end generate;
  end generate;

  i_data_acc_j :                        -- rst_acc:
  for j in 0 to W-1 generate
    int_data_res(W, j) <= signed(i_data_acc(i_data_acc'high - (N+BG)*j downto i_data_acc'length - (N+BG)*(j+1)));
  end generate;

end architecture;