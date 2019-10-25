library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.globals.all;

entity psb is
  port(
    ck          : in  std_logic;
    rst         : in  std_logic;
    enable      : in  std_logic;
    i_data_dp   : in  signed((N+BG)*W-1 downto 0);
    i_data_spad : in  signed((N+BG2)*W-1 downto 0);
    o_data      : out signed((N+BG2)*W-1 downto 0)
    );
end entity;

architecture beh of psb is

  signal int_q_data_dp   : signed((N+BG2)*W-1 downto 0);
  signal int_q_data_spad : signed((N+BG2)*W-1 downto 0);
  signal int_d_data_dp   : signed((N+BG2)*W-1 downto 0);

  type tmp_t is array (0 to W-1) of signed(N+BG2-1 downto 0);
  signal int_d_data_dp_ext : tmp_t;
  
  
begin
  
  add:
  for i in 0 to W-1 generate
    o_data (o_data'length -1 - i*(N+BG2) downto o_data'length -(i+1)*(N+BG2))
      <= int_q_data_dp (int_q_data_dp'length-1 - i*(N+BG2) downto int_q_data_dp'length - (i+1)*(N+BG2))+
      int_q_data_spad(int_q_data_spad'length-1 - i*(N+BG2) downto int_q_data_spad'length - (i+1)*(N+BG2));
  end generate;

  ext:
  for i in 0 to W-1 generate
    j_1 : for j in 0 to W-1 generate
      
      int_d_data_dp_ext(j)(N+BG2-1 downto N+BG)
        <= (others => i_data_dp(i_data_dp'high -j*(N+BG)));
      
      int_d_data_dp_ext(j)(N+BG-1 downto 0)
        <= i_data_dp(i_data_dp'length-1 - j*(N+BG) downto i_data_dp'length -(j+1)*(N+BG));

      int_d_data_dp(int_d_data_dp'length-1 -i*(N+BG2) downto int_d_data_dp'length -(i+1)*(N+BG2))
        <= int_d_data_dp_ext(i);
    end generate;
  end generate;

  process(ck, rst)
  begin
    if rst = '1' then
      int_q_data_spad <= (others => '0');
      int_q_data_dp   <= (others => '0');
    elsif rising_edge(ck) and enable = '1' then
      int_q_data_spad <= i_data_spad;
      int_q_data_dp   <= int_d_data_dp;
    end if;
  end process;
  
end architecture;
