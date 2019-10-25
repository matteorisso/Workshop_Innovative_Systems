library ieee;

use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.globals.all;

entity weight_buffer is
  port(
    ck        : in  std_logic;
    rst       : in  std_logic;
    cs        : in  std_logic;
    rd        : in  std_logic;
    wr        : in  std_logic;
    rd_addr_v : in  unsigned(2 downto 0);  --clog2K
    rd_addr_h : in  unsigned(2 downto 0);  --clog2K
    wr_addr   : in  unsigned(2 downto 0);
    i_data    : in  std_logic_vector(N_WEIGHT*K-1 downto 0);
    o_data    : out std_logic_vector(N_WEIGHT-1 downto 0)
    ); 
end entity;

architecture beh of weight_buffer is

  type w_buffer_t is array (0 to K-1) of std_logic_vector(N_WEIGHT*K-1 downto 0);

  signal word       : w_buffer_t := (others => (others => '0'));
  signal int_o_data : std_logic_vector(N_WEIGHT*K-1 downto 0);

begin

-- sync wr
  wr_proc : process(ck)
  begin
    if rising_edge(ck) then
      if (cs = '1' and wr = '1') then
        word(to_integer(wr_addr)) <= i_data;
      end if;
    end if;
  end process;

-- sync weight row rd.
  rd_proc : process(ck, rst)
  begin
    if rst = '1' then
      int_o_data <= (others => '0');
    elsif rising_edge(ck) then
      if (cs = '1' and rd = '1') then
        int_o_data <= word(to_integer(rd_addr_v));
      end if;
    end if;
  end process;

-- async weight rd.
  column_rd:
  process(int_o_data, rd_addr_h)
  begin
    case (rd_addr_h) is

      when "001" =>
        o_data <= int_o_data((N_WEIGHT*K-1 -1*N_WEIGHT) downto ((N_WEIGHT*K) - 2*N_WEIGHT));

      when "010" =>
        o_data <= int_o_data((N_WEIGHT*K-1 -2*N_WEIGHT) downto ((N_WEIGHT*K) - 3*N_WEIGHT));

      when "011" =>
        o_data <= int_o_data((N_WEIGHT*K-1 -3*N_WEIGHT) downto ((N_WEIGHT*K) - 4*N_WEIGHT));

      when "100" =>
        o_data <= int_o_data((N_WEIGHT*K-1 -4*N_WEIGHT) downto ((N_WEIGHT*K) - 5*N_WEIGHT));
        
      when others =>
        o_data <= int_o_data((N_WEIGHT*K-1 -0*N_WEIGHT) downto ((N_WEIGHT*K) - 1*N_WEIGHT));
        
    end case;
  end process;

end architecture;

