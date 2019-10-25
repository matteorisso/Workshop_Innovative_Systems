library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.globals.all;

-- NOT SYN: RM TEST WR PROCESS

entity dual_port_rf is
  generic (N : natural := N*W);
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
end entity;

architecture beh of dual_port_rf is

  signal word : dual_port_rf_t := (others => (others => '0'));

begin

-- sync wr

  wr_proc : process(ck, rst, test, cs)

    variable px_v   : signed(3 downto 0)           := (others => '0');
    variable word_v : signed(i_data'high downto 0) := (others => '0');

  begin
    if rst = '1' then
      word <= (others => (others => '0'));

    elsif test = '1' then
      for i in 0 to word'high loop
        for j in 0 to W-1 loop
          word_v(word_v'length-1 - j*px_v'length downto word_v'length - (j+1)*px_v'length) := px_v+j+i;
        end loop;
        word(i) <= word_v;
      end loop;
      
    elsif rising_edge(ck) and cs = '1' then
      if wr = '1' then
        word(to_integer(wr_addr)) <= i_data;
      end if;
      
    end if;
  end process;

-- sync rd 

  rd_proc : process(ck, rst)
  begin
    if rst = '1' then
      o_data <= (others => '0');
    elsif rising_edge(ck) and cs = '1' then
      if rd = '1' then
        o_data <= word(to_integer(rd_addr));
      end if;
    end if;
  end process;

end architecture;
