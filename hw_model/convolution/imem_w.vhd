library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.globals.all;

entity imem_w is
  port(
    ck           : in  std_logic;
    rst          : in  std_logic;
    i_data_even  : in  mem_data_t;
    i_data_odd   : in  mem_data_t;
    cs_all       : in  std_logic;
    cs_enc       : in  unsigned(clog2W-1 downto 0);
    wr           : in  std_logic_vector(0 to W-1);
    even_rd_addr : in  unsigned(clog2m-1 downto 0);
    even_wr_addr : in  unsigned(clog2m-1 downto 0);
    odd_rd_addr  : in  unsigned(clog2m-1 downto 0);
    odd_wr_addr  : in  unsigned(clog2m-1 downto 0);
    o_data_even  : out mem_data_t;
    o_data_odd   : out mem_data_t
    );
end entity;

architecture rtl of imem_w is

  signal int_cs : std_logic_vector(0 to W-1);
  signal int_en : std_logic_vector(0 to W-1);

begin
  
  cs_dec:
  process(cs_enc, rst)
  begin
    if rst = '1' then
      int_cs <= (others => '0');
    else
      case (to_integer(cs_enc)) is
        when 1      => int_cs <= "0100";
        when 2      => int_cs <= "0010";
        when 3      => int_cs <= "0001";
        when others => int_cs <= "1000";
      end case;
    end if;
  end process;

  ck_en:
  for i in 0 to int_cs'high generate
    int_en(i) <= cs_all or int_cs(i);
  end generate;

  imem_inst :
    entity work.imem port map (
      ck           => ck,
      rst          => rst,
      i_data_even  => i_data_even,
      i_data_odd   => i_data_odd,
      cs           => int_en,
      wr           => wr,
      even_rd_addr => even_rd_addr,
      even_wr_addr => even_wr_addr,
      odd_rd_addr  => odd_rd_addr,
      odd_wr_addr  => odd_wr_addr,
      o_data_even  => o_data_even,
      o_data_odd   => o_data_odd
      );



end architecture;
