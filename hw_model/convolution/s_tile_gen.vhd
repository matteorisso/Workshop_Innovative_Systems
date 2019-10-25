library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.globals.all;

entity s_tile_gen is
  port(
    ck       : in std_logic;
    rst      : in std_logic;
    ck_en    : in std_logic;
    tc_tilev : in std_logic;
    tc_tileh : in std_logic;
    tc_tileb : in std_logic;
    tc_tilec : in std_logic;

    s_tc_tilev : out std_logic;
    s_tc_tileh : out std_logic;
    s_tc_tileb : out std_logic;
    s_tc_tilec : out std_logic
    );
end entity;

architecture beh of s_tile_gen is

begin

  process(ck, ck_en, rst)
  begin
    if rst = '1' then
      s_tc_tilev <= '0';
      s_tc_tileh <= '0';
      s_tc_tileb <= '0';
      s_tc_tilec <= '0';
    elsif rising_edge(ck) and ck_en = '1' then
      s_tc_tilev <= tc_tilev;
      s_tc_tileh <= tc_tileh;
      s_tc_tileb <= tc_tileb;
      s_tc_tilec <= tc_tilec;
    end if;
  end process;

end architecture;
