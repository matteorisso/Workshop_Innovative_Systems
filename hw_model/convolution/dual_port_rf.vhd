library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.globals.all;

entity dual_port_rf is
  generic (
    n_addr : natural := clog2m;
    n_word : natural := N*W;
    width  : natural := CL_MEM_WIDTH
    );
  port(
    ck      : in  std_logic;
    rst     : in  std_logic;
    cs      : in  std_logic;
    wr      : in  std_logic;
    rd_addr : in  unsigned(n_addr-1 downto 0);
    wr_addr : in  unsigned(n_addr-1 downto 0);
    i_data  : in  signed(n_word-1 downto 0);
    o_data  : out signed(n_word-1 downto 0)
    ); 
end entity;

architecture beh of dual_port_rf is
  
  type dual_port_rf_t is array (0 to width-1) of signed(n_word-1 downto 0);
  signal word : dual_port_rf_t := (others => (others => '0'));

begin

-- sync wr

  wr_proc : process(ck, rst, cs)
  begin
    if rst = '1' then
      word <= (others => (others => '0'));
    elsif rising_edge(ck) and cs = '1' then
      if wr = '1' then
        word(to_integer(wr_addr)) <= i_data;
      end if;
    end if;
  end process;

  --async rd
  o_data <= word(to_integer(rd_addr));

end architecture;
