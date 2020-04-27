library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.globals.all;

entity act_lb is
  port(
    ck       : in  std_logic;
    rst      : in  std_logic;
    i_wr     : in  std_logic;
    i_wr_ptr : in  unsigned(CLOG2M+CLOG2W-1 downto 0);
    i_rd_ptr : in  unsigned(CLOG2M+CLOG2W-1 downto 0);
    i_data   : in  std_logic_vector(N*W-1 downto 0);
    o_data   : out std_logic_vector(N*W-1 downto 0)
    );
end entity;

architecture beh of act_lb is

  type act_lb_t is array (0 to 96) of std_logic_vector(N*W-1 downto 0);  --// max(IMG_H)*max(IMG_CHANNEL)
  signal int_data : act_lb_t;
begin
  o_data <= int_data(to_integer(i_rd_ptr));
  process (ck, rst)
  begin
    if rst = '1' then
      int_data <= (others => (others => '0'));
    elsif rising_edge(ck) then
      if i_wr = '1' then
        int_data(to_integer(i_wr_ptr)) <= i_data;
      end if;
    end if;
  end process;

end architecture;
