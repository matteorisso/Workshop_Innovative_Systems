library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.globals.all;

entity imem is
  
  port(
    ck           : in  std_logic;
    rst          : in  std_logic;
    i_data_even  : in  mem_data_t;
    i_data_odd   : in  mem_data_t;
    cs           : in  std_logic_vector(0 to W-1);
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

  signal int_mem_even    : mem_data_t;
  signal int_mem_odd     : mem_data_t;
  signal int_i_data_even : mem_data_t;
  signal int_i_data_odd  : mem_data_t;

  type q_cast_even_rd_addr_t is array (0 to mem_data_t'high) of signed(even_rd_addr'high downto 0);
  type q_cast_odd_rd_addr_t is array (0 to mem_data_t'high) of signed(odd_rd_addr'high downto 0);

  type int_even_rd_addr_t is array (0 to mem_data_t'high) of unsigned(odd_rd_addr'high downto 0);
  type int_odd_rd_addr_t is array (0 to mem_data_t'high) of unsigned(odd_rd_addr'high downto 0);

  signal q_cast_even_rd_addr : q_cast_even_rd_addr_t;
  signal q_cast_odd_rd_addr  : q_cast_odd_rd_addr_t;

  signal d_cast_even_rd_addr : signed(even_rd_addr'high downto 0);
  signal d_cast_odd_rd_addr  : signed(odd_rd_addr'high downto 0);

  signal int_even_rd_addr : int_even_rd_addr_t;
  signal int_odd_rd_addr  : int_odd_rd_addr_t;
  
begin

  o_data_even <= int_mem_even;
  o_data_odd  <= int_mem_odd;

  d_cast_even_rd_addr <= signed(std_logic_vector(even_rd_addr));
  d_cast_odd_rd_addr  <= signed(std_logic_vector(odd_rd_addr));

  addr_reg_in:
  for i in 0 to cs'high generate

    int_even_rd_addr(i) <= unsigned(std_logic_vector(q_cast_even_rd_addr(i)));
    int_odd_rd_addr(i)  <= unsigned(std_logic_vector(q_cast_odd_rd_addr(i)));

    rd_addr_even_reg:
      entity work.regn generic map (N => even_rd_addr'length) port map (
        ck                            => ck,
        rst                           => rst,
        en                            => cs(i),
        d                             => d_cast_even_rd_addr,
        q                             => q_cast_even_rd_addr(i)
        );

    rd_addr_odd_reg:
      entity work.regn generic map (N => even_rd_addr'length) port map (
        ck                            => ck,
        rst                           => rst,
        en                            => cs(i),
        d                             => d_cast_odd_rd_addr,
        q                             => q_cast_odd_rd_addr(i)
        );
  end generate;

  even_bin:
  for i in 0 to W-1 generate rfi:
                               
                               entity work.dual_port_rf port map (
                                 ck      => ck,
                                 rst     => rst,
                                 cs      => cs(i),
                                 wr      => wr(i),
                                 rd_addr => int_even_rd_addr(i),
                                 wr_addr => even_wr_addr,
                                 i_data  => i_data_even(i),
                                 o_data  => int_mem_even(i)
                                 );

                             
  end generate;

  odd_bin:
  for i in 0 to W-1 generate rfi:
                               
                               entity work. dual_port_rf port map (
                                 ck      => ck,
                                 rst     => rst,
                                 cs      => cs(i),
                                 wr      => wr(i),
                                 rd_addr => int_odd_rd_addr(i),
                                 wr_addr => odd_wr_addr,
                                 i_data  => i_data_odd(i),
                                 o_data  => int_mem_odd(i)
                                 );

  end generate;

end architecture;

