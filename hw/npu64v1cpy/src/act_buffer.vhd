library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.globals.all;

entity act_buffer is
  port (
    ck             : in  std_logic;
    rst            : in  std_logic;
    i_wr           : in  std_logic;
    i_wr_ptr       : in  unsigned(CLOG2W-1 downto 0);
    i_wr_ifmap_ptr : in  unsigned(CLOG2B-1 downto 0);
    i_rd_ifmap_ptr : in  unsigned(CLOG2B-1 downto 0);
    i_data         : in  std_logic_vector(N*(K-1)-1 downto 0);
    o_data1        : out std_logic_vector(N*(K-1)-1 downto 0);
    o_data2        : out std_logic_vector(N*(K-1)-1 downto 0);
    o_data3        : out std_logic_vector(N*(K-1)-1 downto 0);
    o_data4        : out std_logic_vector(N*(K-1)-1 downto 0);
    o_data5        : out std_logic_vector(N*(K-1)-1 downto 0);
    o_data6        : out std_logic_vector(N*(K-1)-1 downto 0);
    o_data7        : out std_logic_vector(N*(K-1)-1 downto 0);
    o_data8        : out std_logic_vector(N*(K-1)-1 downto 0)
    );

end entity;

architecture beh of act_buffer is

  type rf_t is array (0 to 5) of std_logic_vector(N*(K-1)-1 downto 0);

  signal int_data1 : rf_t;
  signal int_data2 : rf_t;
  signal int_data3 : rf_t;
  signal int_data4 : rf_t;
  signal int_data5 : rf_t;
  signal int_data6 : rf_t;
  signal int_data7 : rf_t;
  signal int_data8 : rf_t;
  
begin

  process(ck, rst)
  begin
    if rst = '1' then
      int_data1 <= (others => (others => '0'));
      int_data2 <= (others => (others => '0'));
      int_data3 <= (others => (others => '0'));
      int_data4 <= (others => (others => '0'));
      int_data5 <= (others => (others => '0'));
      int_data6 <= (others => (others => '0'));
      int_data7 <= (others => (others => '0'));
      int_data8 <= (others => (others => '0'));
    elsif rising_edge(ck) then
      if i_wr = '1' then
        case(to_integer(i_wr_ptr)) is
          when 1      => int_data2(to_integer(i_wr_ifmap_ptr)) <= i_data;
          when 2      => int_data3(to_integer(i_wr_ifmap_ptr)) <= i_data;
          when 3      => int_data4(to_integer(i_wr_ifmap_ptr)) <= i_data;
          when 4      => int_data5(to_integer(i_wr_ifmap_ptr)) <= i_data;
          when 5      => int_data6(to_integer(i_wr_ifmap_ptr)) <= i_data;
          when 6      => int_data7(to_integer(i_wr_ifmap_ptr)) <= i_data;
          when 7      => int_data8(to_integer(i_wr_ifmap_ptr)) <= i_data;
          when others => int_data1(to_integer(i_wr_ifmap_ptr)) <= i_data;
      end case;
      end if;
    end if;
  end process;

  o_data1 <= int_data1(to_integer(i_rd_ifmap_ptr));
  o_data2 <= int_data2(to_integer(i_rd_ifmap_ptr));
  o_data3 <= int_data3(to_integer(i_rd_ifmap_ptr));
  o_data4 <= int_data4(to_integer(i_rd_ifmap_ptr));
  o_data5 <= int_data5(to_integer(i_rd_ifmap_ptr));
  o_data6 <= int_data6(to_integer(i_rd_ifmap_ptr));
  o_data7 <= int_data7(to_integer(i_rd_ifmap_ptr));
  o_data8 <= int_data8(to_integer(i_rd_ifmap_ptr));
  
end architecture;
