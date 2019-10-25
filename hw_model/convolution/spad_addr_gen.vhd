library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.globals.all;

entity spad_addr_gen is
  port(
    ck        : in  std_logic;
    rst       : in  std_logic;
    res_ptr   : in  unsigned(clog2W-1 downto 0);
    tc_res    : in  std_logic;
    arv_tilev : in  unsigned(clog2v-1 downto 0);
    arv_tileh : in  unsigned(clog2h-1 downto 0);
    arv_tileb : in  unsigned(clog2b-1 downto 0);
    cs_enc    : out unsigned(clog2W-1 downto 0);
    rd_ptr    : out unsigned(clog2W-1 downto 0);
    addr      : out unsigned(CLOG2M_SP-1 downto 0)
    );
end entity;

architecture beh of spad_addr_gen is
  
  signal int_en_tilev_ptr : std_logic;
  signal int_en_tileh_ptr : std_logic;
  signal int_en_tileb_ptr : std_logic;
  signal int_tilev_ptr    : unsigned(arv_tilev'high downto 0);
  signal int_tileh_ptr    : unsigned(arv_tileh'high downto 0);
  signal int_tc_rd        : std_logic;
  signal int_tc_tilev     : std_logic;
  signal int_tc_tileh     : std_logic;
  signal int_tc_tileb     : std_logic;
  signal int_arv_tilev    : unsigned(arv_tilev'high downto 0);
  signal int_arv_tileh    : unsigned(arv_tileh'high downto 0);
  signal int_arv_tileb    : unsigned(arv_tileb'high downto 0);
  signal int_offset       : unsigned(CLOG2M_SP-1 downto 0);
  signal int_addr         : unsigned(addr'high downto 0);
  signal int_tc_res_q     : std_logic;
  
begin

  int_arv_tilev <= arv_tilev-1;
  int_arv_tileh <= arv_tilev-1;
  int_arv_tileb <= arv_tileb;

  int_en_tilev_ptr <= int_tc_res_q;
  int_en_tileh_ptr <= int_tc_tilev and int_en_tilev_ptr;
  int_en_tileb_ptr <= int_tc_tileh and int_en_tileh_ptr;

  addr   <= int_addr + int_offset;
  rd_ptr <= res_ptr;

  res_q :
  process(ck, rst)
  begin
    if rst = '1' then
      cs_enc       <= (others => '0');
      int_tc_res_q <= '0';
    elsif rising_edge(ck) then
      cs_enc       <= res_ptr;
      int_tc_res_q <= tc_res;
    end if;
  end process;

  addr_reg:
  process(ck, rst)
  begin
    if rst = '1' then
      int_addr   <= (others => '0');
      int_offset <= (others => '0');
    elsif rising_edge(ck) and int_en_tilev_ptr = '1' then
      if (int_tc_tilev and int_tc_tileh) = '1' then
        int_addr <= (others => '0');
        if int_tc_tileb = '1' then
          int_offset <= int_offset+int_addr+1;
        end if;
      else
        int_addr <= int_addr+1;
      end if;
    end if;
  end process;

  tilev_cnt :
    entity work.countern generic map (N => int_arv_tilev'length) port map (
      ck                                => ck,
      rst                               => rst,
      sync_clr                          => '0',
      en                                => int_en_tilev_ptr,
      arv                               => int_arv_tilev,
      q                                 => int_tilev_ptr,
      tc                                => int_tc_tilev
      );

  tileh_cnt :
    entity work.countern generic map (N => int_arv_tileh'length) port map (
      ck                                => ck,
      rst                               => rst,
      sync_clr                          => '0',
      en                                => int_en_tileh_ptr,
      arv                               => int_arv_tileh,
      q                                 => int_tileh_ptr,
      tc                                => int_tc_tileh
      );

  tileb_cnt :
    entity work.countern generic map (N => int_arv_tileb'length) port map (
      ck                                => ck,
      rst                               => rst,
      sync_clr                          => '0',
      en                                => int_en_tileb_ptr,
      arv                               => int_arv_tileb,
      tc                                => int_tc_tileb
      );

end architecture;
