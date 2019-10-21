library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.globals.all;

entity npu_ctrl is
  port(
    ck        : in  std_logic;
    rst       : in  std_logic;
    en_vmode  : in  std_logic;
    en_hmode  : in  std_logic;
    wr_pipe   : in  std_logic;
    arv_vmode : in  unsigned(clog2K-1 downto 0);
    arv_res   : in  unsigned(clog2W-1 downto 0);
    hmode_cnt : out unsigned(clog2K-1 downto 0);
    vmode_cnt : out unsigned(clog2K-1 downto 0);
    tc_hmode  : out std_logic;
    tc_vmode  : out std_logic;
    tc_res    : out std_logic
    );
end entity;

architecture rtl of npu_ctrl is

  signal int_en_vmode : std_logic;
  signal int_tc_res   : std_logic;

begin

  int_en_vmode <= en_vmode or int_tc_res;
  tc_res       <= int_tc_res;

  hmode_cnt_inst :
    entity work.countern generic map (N => arv_vmode'length) port map (
      ck                                => ck,
      rst                               => rst,
      sync_clr                          => '0',
      en                                => en_hmode,
      arv                               => arv_vmode,
      q                                 => hmode_cnt,
      tc                                => tc_hmode
      );

  vmode_cnt_inst:
    entity work.countern generic map (N => arv_vmode'length) port map (
      ck                                => ck,
      rst                               => rst,
      sync_clr                          => '0',
      en                                => int_en_vmode,
      arv                               => arv_vmode,
      q                                 => vmode_cnt,
      tc                                => tc_vmode
      );

  res_pipe_cnt_inst :
    entity work.countern generic map(N => arv_res'length) port map(
      ck                               => ck,
      rst                              => rst,
      sync_clr                         => '0',
      en                               => wr_pipe,
      arv                              => arv_res,
      tc                               => int_tc_res);

end architecture;
