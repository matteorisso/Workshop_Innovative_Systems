library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.globals.all;

entity addr_gen is
  port(
    ck         : in  std_logic;
    rst        : in  std_logic;
    inc        : in  std_logic;
    arv_rf_ptr : in  unsigned(clog2W-1 downto 0);
    arv_tilev  : in  unsigned(clog2v-1 downto 0);
    arv_tileh  : in  unsigned(clog2h-1 downto 0);
    arv_tileb  : in  unsigned(clog2b-1 downto 0);
    arv_tilec  : in  unsigned(clog2c-1 downto 0);
    tc_rd      : out std_logic;
    tc_tilev   : out std_logic;
    tc_tileh   : out std_logic;
    tc_tileb   : out std_logic;
    tc_tilec   : out std_logic;
    even_odd_n : out std_logic;
    even_addr  : out unsigned(clog2M-1 downto 0);
    odd_addr   : out unsigned(clog2M-1 downto 0);
    rf_ptr     : out unsigned(clog2W-1 downto 0)
    );
end entity;

architecture rtl of addr_gen is
  
  component countern
    generic (N : natural := 16);
    port(
      ck       : in  std_logic;
      rst      : in  std_logic;
      sync_clr : in  std_logic;
      en       : in  std_logic;
      arv      : in  unsigned(N-1 downto 0);  -- auto-reload value
      q        : out unsigned(N-1 downto 0);
      tc       : out std_logic
      );
  end component;

  signal int_en_tilev_ptr : std_logic;
  signal int_en_tileh_ptr : std_logic;
  signal int_en_tileb_ptr : std_logic;
  signal int_en_tilec_ptr : std_logic;
  signal int_tc_rd        : std_logic;
  signal int_tc_tilev     : std_logic;
  signal int_tc_tileh     : std_logic;
  signal int_tc_tileb     : std_logic;
  signal int_tc_tilec     : std_logic;
  signal int_rf_ptr       : unsigned(arv_rf_ptr'high downto 0);
  signal int_tilev_ptr    : unsigned(arv_tilev'high downto 0);
  signal int_tileh_ptr    : unsigned(arv_tileh'high downto 0);
  signal int_arv_rf_ptr   : unsigned(arv_rf_ptr'high downto 0);
  signal int_arv_tilev    : unsigned(arv_tilev'high downto 0);
  signal int_arv_tileh    : unsigned(arv_tileh'high downto 0);
  signal int_arv_tileb    : unsigned(arv_tileb'high downto 0);
  signal int_arv_tilec    : unsigned(arv_tilec'high downto 0);
  signal int_inc_even     : std_logic;
  signal int_inc_odd      : std_logic;
  signal int_even_offset  : unsigned(even_addr'high downto 0);
  signal int_odd_offset   : unsigned(even_addr'high downto 0);
  signal int_even_addr    : unsigned(even_addr'high downto 0);
  signal int_odd_addr     : unsigned(even_addr'high downto 0);

begin
  
  addr_gen:
  process (rst, ck)
  begin
    if rst = '1' then
      int_even_addr <= (others => '0');
      int_odd_addr  <= (others => '0');
    elsif rising_edge(ck) and int_en_tilev_ptr = '1' then
      if (int_tc_tileb and int_tc_tilev and int_tc_tileh) = '1' then
        int_even_addr <= (others => '0');
        int_odd_addr  <= (others => '0');
      end if;
    else
      int_even_addr <= int_even_offset + int_tilev_ptr;
      int_odd_addr  <= int_odd_offset + int_tilev_ptr;
    end if;
  end process;

  even_odd_n <= int_tileh_ptr(0);
  even_addr  <= int_even_addr;
  odd_addr   <= int_odd_addr;
  rf_ptr     <= int_rf_ptr;

  tc_rd    <= int_tc_rd;
  tc_tilev <= int_tc_tilev;
  tc_tileh <= int_tc_tileh;
  tc_tileb <= int_tc_tileb;
  tc_tilec <= int_tc_tilec;

  int_en_tilev_ptr <= int_tc_rd and inc;
  int_en_tileh_ptr <= int_tc_tilev and int_en_tilev_ptr;
  int_en_tileb_ptr <= int_tc_tileh and int_en_tileh_ptr;
  int_en_tilec_ptr <= int_tc_tileb and int_en_tileb_ptr;

  int_inc_even <= (int_en_tileh_ptr and (not int_tileh_ptr(0))) or (int_tc_tileh and int_en_tileh_ptr);  -- init
  int_inc_odd  <= (int_en_tileh_ptr and int_tileh_ptr(0)) or (int_tc_tileh and int_en_tileh_ptr);  -- init

  int_arv_rf_ptr <= arv_rf_ptr;
  int_arv_tilev  <= arv_tilev;
  int_arv_tileh  <= arv_tileh;
  int_arv_tileb  <= arv_tileb;
  int_arv_tilec  <= arv_tilec;

  even_offset_gen :
  process(ck, rst)
  begin
    if rst = '1' then
      int_even_offset <= (others => '0');
    elsif rising_edge(ck) then
      if int_inc_even = '1' then
        if (int_tc_tileb and int_tc_tilev and int_tc_tileh) = '1' then
          int_even_offset <= (others => '0');
        else
          int_even_offset <= int_even_offset + int_arv_tilev +1;
        end if;
      end if;
    end if;
  end process;

  odd_offset_gen :
  process(ck, rst)
  begin
    if rst = '1' then
      int_odd_offset <= (others => '0');
    elsif rising_edge(ck) then
      if int_inc_odd = '1' then
        if (int_tc_tileb and int_tc_tilev and int_tc_tileh) = '1' then
          int_odd_offset <= (others => '0');
        else
          int_odd_offset <= int_odd_offset + int_arv_tilev +1;
        end if;
      end if;
    end if;
  end process;

  rf_cnt :
    countern generic map (N => clog2W) port map (
      ck                    => ck,
      rst                   => rst,
      sync_clr              => '0',
      en                    => inc,
      arv                   => int_arv_rf_ptr,  --npu.dim
      q                     => int_rf_ptr,
      tc                    => int_tc_rd
      );

  tilev_cnt :
    countern generic map (N => int_arv_tilev'length) port map (
      ck                    => ck,
      rst                   => rst,
      sync_clr              => '0',
      en                    => int_en_tilev_ptr,
      arv                   => int_arv_tilev,
      q                     => int_tilev_ptr,
      tc                    => int_tc_tilev
      );

  tileh_cnt :
    countern generic map (N => int_arv_tileh'length) port map (
      ck                    => ck,
      rst                   => rst,
      sync_clr              => '0',
      en                    => int_en_tileh_ptr,
      arv                   => int_arv_tileh,
      q                     => int_tileh_ptr,
      tc                    => int_tc_tileh
      );

  tileb_cnt :
    countern generic map (N => int_arv_tileb'length) port map (
      ck                    => ck,
      rst                   => rst,
      sync_clr              => '0',
      en                    => int_en_tileb_ptr,
      arv                   => int_arv_tileb,
      tc                    => int_tc_tileb
      );

  tilec_cnt :
    countern generic map (N => int_arv_tilec'length) port map (
      ck                    => ck,
      rst                   => rst,
      sync_clr              => '0',
      en                    => int_en_tilec_ptr,
      arv                   => int_arv_tilec,
      tc                    => int_tc_tilec
      );

end architecture;
