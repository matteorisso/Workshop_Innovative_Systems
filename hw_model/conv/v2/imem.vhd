library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.globals.all;

entity imem is
  port(
    ck           : in  std_logic;
    rst          : in  std_logic;
    test         : in  std_logic;
    i_data_even  : in  mem_data_t;
    i_data_odd   : in  mem_data_t;
    cs           : in  std_logic_vector(0 to W-1);
    rd           : in  std_logic_vector(0 to W-1);
    wr           : in  std_logic_vector(0 to W-1);
    even_rd_addr : in  unsigned(clog2m-1 downto 0);
    even_wr_addr : in  unsigned(clog2m-1 downto 0);
    odd_rd_addr  : in  unsigned(clog2m-1 downto 0);
    odd_wr_addr  : in  unsigned(clog2m-1 downto 0);
    o_data_even  : out mem_data_t;
    o_data_odd   : out mem_data_t
    );
end entity;

architecture rtl of imem is

  component dual_port_rf
    generic (N : natural := N);
    port(
      ck      : in  std_logic;
      rst     : in  std_logic;
      test    : in  std_logic;
      cs      : in  std_logic;
      rd      : in  std_logic;
      wr      : in  std_logic;
      rd_addr : in  unsigned(clog2m-1 downto 0);
      wr_addr : in  unsigned(clog2m-1 downto 0);
      i_data  : in  signed(N-1 downto 0);
      o_data  : out signed(N-1 downto 0)
      ); 
  end component;

  signal int_mem_even    : mem_data_t;
  signal int_mem_odd     : mem_data_t;
  signal int_i_data_even : mem_data_t;
  signal int_i_data_odd  : mem_data_t;

begin

  o_data_even <= int_mem_even;
  o_data_odd  <= int_mem_odd;


  even_bin:
  for i in 0 to W-1 generate rfi:
                               dual_port_rf generic map (N => N*W) port map (
                                 ck                        => ck,
                                 rst                       => rst,
                                 test                      => test,
                                 cs                        => cs(i),
                                 rd                        => rd(i),
                                 wr                        => wr(i),
                                 rd_addr                   => even_rd_addr,
                                 wr_addr                   => even_wr_addr,
                                 i_data                    => i_data_even(i),
                                 o_data                    => int_mem_even(i)
                                 );
  end generate;

  odd_bin:
  for i in 0 to W-1 generate rfi:
                               dual_port_rf generic map (N => N*W) port map (
                                 ck                        => ck,
                                 rst                       => rst,
                                 test                      => test,
                                 cs                        => cs(i),
                                 rd                        => rd(i),
                                 wr                        => wr(i),
                                 rd_addr                   => odd_rd_addr,
                                 wr_addr                   => odd_wr_addr,
                                 i_data                    => i_data_odd(i),
                                 o_data                    => int_mem_odd(i)
                                 );
  end generate;

end architecture;

