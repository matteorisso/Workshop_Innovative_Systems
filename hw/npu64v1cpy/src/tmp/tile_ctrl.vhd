library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.globals.all;

entity tile_ctrl is
  port(
    ck            : in  std_logic;
    rst           : in  std_logic;
    s_tc_res      : in  std_logic;
    ctrl_ld_v     : in  std_logic;
    en_ifmaps_ptr : in  std_logic;
    arv_npu_ptr   : in  unsigned(CLOG2W-1 downto 0);
    arv_tile      : in  unsigned(CLOG2T-1 downto 0);
    arv_ifmaps    : in  unsigned(CLOG2B-1 downto 0);
    arv_ofmaps    : in  unsigned(CLOG2C-1 downto 0);
    npu_ptr       : out unsigned(CLOG2W-1 downto 0);
    ifmaps_ptr    : out unsigned(CLOG2B-1 downto 0);
    tc_ifmaps     : out unsigned(CLOG2B-1 downto 0);
    s_tc_npu_ptr  : out std_logic;
    s_tc_tilev    : out std_logic;
    s_tc_tileh    : out std_logic;
    s_tc_ifmaps   : out std_logic;
    s_tc_ofmaps   : out std_logic;
    even_odd_n    : out std_logic;
    inc_even      : out std_logic;
    inc_odd       : out std_logic;
    rst_addr      : out std_logic
    );
end entity;


architecture rtl of tile_ctrl is

  signal int_en_npu_ptr    : std_logic;
  signal int_en_tilev_ptr  : std_logic;
  signal int_en_tileh_ptr  : std_logic;
  signal int_en_ifmaps_ptr : std_logic;
  signal int_en_ofmaps_ptr : std_logic;
  signal int_tc_npu_ptr    : std_logic;
  signal int_tc_tilev      : std_logic;
  signal int_tc_tileh      : std_logic;
  signal int_tc_ifmaps     : std_logic;
  signal int_tc_ofmaps     : std_logic;
  signal int_npu_ptr       : unsigned(CLOG2W-1 downto 0);
  signal int_ifmaps_ptr    : unsigned(CLOG2B-1 downto 0);
  signal int_tilev_ptr     : unsigned(CLOG2T-1 downto 0);
  signal int_tileh_ptr     : unsigned(CLOG2T-1 downto 0);
  signal int_d_tc          : signed(2 downto 0);  -- not a number ! type match at reg component
  signal int_q_tc          : signed(2 downto 0);  -- not a number ! type match at reg component

  
begin

  npu_ptr    <= int_npu_ptr;
  ifmaps_ptr <= int_ifmaps_ptr;

  ------------------------------------------------
  -- Address gen. ctrl
  ------------------------------------------------

  even_odd_n <= int_tileh_ptr(0);
  inc_even   <= int_en_tileh_ptr and (not int_tileh_ptr(0));
  inc_odd    <= int_en_tileh_ptr and int_tileh_ptr(0);
  rst_addr   <= int_tc_tilev and int_tc_tileh and int_en_tilev_ptr;

  ------------------------------------------------
  -- Status
  ------------------------------------------------

  s_tc_ifmaps  <= int_tc_ifmaps;
  s_tc_npu_ptr <= int_tc_npu_ptr;
  s_tc_tilev   <= int_q_tc(2);
  s_tc_tileh   <= int_q_tc(1);
  s_tc_ofmaps  <= int_q_tc(0);

  ------------------------------------------------
  -- Internals
  ------------------------------------------------
  int_en_npu_ptr    <= int_tc_ifmaps and ctrl_ld_v;
  int_en_tilev_ptr  <= int_tc_npu_ptr and int_en_npu_ptr;
  int_en_tileh_ptr  <= int_tc_tilev and int_en_tilev_ptr;
  int_en_ofmaps_ptr <= int_tc_tileh and int_en_tileh_ptr;

  int_d_tc <= int_tc_tilev & int_tc_tileh & int_tc_ofmaps;

  status_reg:
  process(ck, rst)
  begin
    if rst = '1' then
      int_q_tc <= (others => '0');
    elsif rising_edge(ck) then
      if s_tc_res = '1' then
        int_q_tc <= int_d_tc;
      end if;
    end if;
  end process;

  ------------------------------------------------
  -- Counter inst.
  ------------------------------------------------

  ifmaps_cnt :
    entity work.countern
      generic map (N => arv_ifmaps'length)
      port map (
        ck       => ck,
        rst      => rst,
        sync_clr => '0',
        en       => en_ifmaps_ptr,
        arv      => arv_ifmaps,
        q        => int_ifmaps_ptr,
        tc       => int_tc_ifmaps
        );

  npu_cnt :
    entity work.countern
      generic map (N => arv_npu_ptr'length)
      port map (
        ck       => ck,
        rst      => rst,
        sync_clr => '0',
        en       => int_en_npu_ptr,
        arv      => arv_npu_ptr,
        q        => int_npu_ptr,
        tc       => int_tc_npu_ptr
        );

  tilev_cnt :
    entity work.countern
      generic map (N => arv_tile'length)
      port map (
        ck       => ck,
        rst      => rst,
        sync_clr => '0',
        en       => int_en_tilev_ptr,
        arv      => arv_tile,
        q        => int_tilev_ptr,
        tc       => int_tc_tilev
        );

  tileh_cnt :
    entity work.countern
      generic map (N => arv_tile'length)
      port map (
        ck       => ck,
        rst      => rst,
        sync_clr => '0',
        en       => int_en_tileh_ptr,
        arv      => arv_tile,
        q        => int_tileh_ptr,
        tc       => int_tc_tileh
        );

  ofmaps_cnt :
    entity work.countern
      generic map (N => arv_ofmaps'length)
      port map (
        ck       => ck,
        rst      => rst,
        sync_clr => '0',
        en       => int_en_ofmaps_ptr,
        arv      => arv_ofmaps,
        tc       => int_tc_ofmaps
        );

  ------------------------------------------------

end architecture;
