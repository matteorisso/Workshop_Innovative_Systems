library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.globals.all;

entity avgp_unit is
  port (
    ck       : in  std_logic;
    rst      : in  std_logic;
    en       : in  std_logic;
    i_data_1 : in  unsigned(N-1 downto 0);
    i_data_2 : in  unsigned(N-1 downto 0);
    o_data   : out unsigned(N+1 downto 0)
    );
end entity;

architecture beh of avgp_unit is

  signal int_ps0 : unsigned(N downto 0);
  signal int_ps1 : unsigned(N downto 0);

begin
  process(ck, rst)
  begin
    if rst = '1' then
      int_ps0 <= (others => '0');
      int_ps1 <= (others => '0');
      o_data  <= (others => '0');
    elsif rising_edge(ck) then
      if en = '1' then
        int_ps0 <= unsigned('0'&i_data_1) + unsigned('0'&i_data_2);
        int_ps1 <= int_ps0;
        o_data  <= unsigned('0'&int_ps0) + unsigned('0'&int_ps1);
      end if;
    end if;
  end process;
  
end architecture;

--  signal int_o_data : unsigned(N+2-1 downto 0);
--  signal int_psum   : unsigned(N+1-1 downto 0);
--begin
--  o_data   <= int_o_data;
--  int_psum <= unsigned('0'&i_data_1) + unsigned('0'&i_data_2);

--  process(ck, rst)
--  begin
--    if rst = '1' then
--      int_o_data <= (others => '0');
--    elsif rising_edge(ck) then
--      if en_p_acc = '1' then
--        int_o_data <= int_o_data + unsigned('0'&int_psum);
--      else                              --//clr
--        int_o_data <= (others => '0');
--      end if;
--    end if;
--  end process;  
--end architecture;
