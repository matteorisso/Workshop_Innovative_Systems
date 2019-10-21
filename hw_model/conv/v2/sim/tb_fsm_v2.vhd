
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.globals.all;

entity tb_fsm_v2 is
end entity;

architecture test of tb_fsm_v2 is

  signal ck_tb    : std_logic;
  signal rst_tb   : std_logic;
  signal start_tb : std_logic;
  signal done_tb  : std_logic;

  signal int_ctrl_weight_wr : std_logic;
  signal int_ctrl_en_vmode  : std_logic;
  signal int_ctrl_en_hmode  : std_logic;
  signal int_ctrl_en_npu    : std_logic;
  signal int_ctrl_ld_v      : std_logic;
  signal int_ctrl_en_rf_ptr : std_logic;
  signal int_ctrl_wr_pipe   : std_logic;

  signal int_s_tc_rd    : std_logic;
  signal int_s_tc_hmode : std_logic;
  signal int_s_tc_vmode : std_logic;
  signal int_s_tc_res   : std_logic;
  signal int_s_tc_tilev : std_logic;
  signal int_s_tc_tileh : std_logic;
  signal int_s_tc_tileb : std_logic;
  signal int_s_tc_tilec : std_logic;

  signal int_i_data_h      : signed(N*W-1 downto 0)                  := (others => '1');
  signal int_i_data_v      : signed(N*W-1 downto 0)                  := (others => '1');
  signal int_i_weight_conv : std_logic_vector(N_WEIGHT*K-1 downto 0) := (others => '0');
  
begin

-------------------------------------------------

  ckgen : process(ck_tb)
  begin
    if ck_tb = 'U' then
      ck_tb <= '0';
    else
      ck_tb <= not ck_tb after 5 ns;
    end if;
  end process;

-------------------------------------------------

  stimuli : process
  begin
    rst_tb   <= '1';
    start_tb <= '0';
    wait for 20 ns;
    rst_tb   <= '0';
    wait for 5 ns;
    start_tb <= '1';
    wait for 20 ns;
    start_tb <= '0';
    wait;
  end process;

--stimuli:  
--process(ck_tb)
--
--variable px_v          :signed(N-1 downto 0):=(others=>'0');
--variable word_v :signed(N*W-1 downto 0):=(others=>'0');
--
--begin
--      if rising_edge(ck_tb) then
--              if test_tb = '0' then
--                      for i in 0 to W-1 loop 
--                              word_v(word_v'length-1 - i*px_v'length  downto word_v'length - (i+1)*px_v'length) := px_v+i;
--                      end loop;
--                      px_v := px_v+1; 
--                      i_data_even_tb <= (others=>word_v); 
--                      i_data_odd_tb   <= (others=>word_v); 
--              end if; 
--      end if; 
--end process;

-------------------------------------------------

-- DUT

  cu :
    entity work.conv_fsm_v2 port map (
      ck             => ck_tb,
      rst            => rst_tb,
      start          => start_tb,
      ctrl_en_hmode  => int_ctrl_en_hmode,
      ctrl_en_vmode  => int_ctrl_en_vmode,
      ctrl_en_npu    => int_ctrl_en_npu,
      ctrl_weight_wr => int_ctrl_weight_wr,
      ctrl_ld_v      => int_ctrl_ld_v,
      ctrl_en_rf_ptr => int_ctrl_en_rf_ptr,
      ctrl_wr_pipe   => int_ctrl_wr_pipe,
      s_tc_rd        => int_s_tc_rd,
      s_tc_hmode     => int_s_tc_hmode,
      s_tc_vmode     => int_s_tc_vmode,
      s_tc_res       => int_s_tc_res,
      s_tc_tilev     => int_s_tc_tilev,
      s_tc_tileh     => int_s_tc_tileh,
      s_tc_tileb     => int_s_tc_tileb,
      s_tc_tilec     => int_s_tc_tilec,
      done           => done_tb
      );


  dp :
    entity work.datapath port map (
      ck             => ck_tb,
      rst            => rst_tb,
      task           => c2,
      ctrl_en_vmode  => int_ctrl_en_vmode,
      ctrl_en_hmode  => int_ctrl_en_hmode,
      ctrl_en_npu    => int_ctrl_en_npu,
      ctrl_ld_v      => int_ctrl_ld_v,
      ctrl_wr_pipe   => int_ctrl_wr_pipe,
      ctrl_en_rf_ptr => int_ctrl_en_rf_ptr,
      ctrl_weight_wr => int_ctrl_weight_wr,
      s_tc_rd        => int_s_tc_rd,
      s_tc_hmode     => int_s_tc_hmode,
      s_tc_vmode     => int_s_tc_vmode,
      s_tc_res       => int_s_tc_res,
      s_tc_tilev     => int_s_tc_tilev,
      s_tc_tileh     => int_s_tc_tileh,
      s_tc_tileb     => int_s_tc_tileb,
      s_tc_tilec     => int_s_tc_tilec,
      i_weight       => int_i_weight_conv,
      i_data_v       => int_i_data_v,
      i_data_h       => int_i_data_h
      );

end architecture;


---------------------------------------------------

---------------------------------------------------


architecture test_top_dp of tb_fsm_v2 is


  signal ck_tb    : std_logic;
  signal rst_tb   : std_logic;
  signal start_tb : std_logic;
  signal done_tb  : std_logic;

  signal int_ctrl_weight_wr : std_logic;
  signal int_ctrl_en_vmode  : std_logic;
  signal int_ctrl_en_hmode  : std_logic;
  signal int_ctrl_en_npu    : std_logic;
  signal int_ctrl_ld_v      : std_logic;
  signal int_ctrl_en_rf_ptr : std_logic;
  signal int_ctrl_wr_pipe   : std_logic;

  signal int_s_tc_rd    : std_logic;
  signal int_s_tc_hmode : std_logic;
  signal int_s_tc_vmode : std_logic;
  signal int_s_tc_res   : std_logic;
  signal int_s_tc_tilev : std_logic;
  signal int_s_tc_tileh : std_logic;
  signal int_s_tc_tileb : std_logic;
  signal int_s_tc_tilec : std_logic;

  signal int_data_even : mem_data_t := (others => (others => '0'));
  signal int_data_odd  : mem_data_t := (others => (others => '0'));

  signal int_cs_all : std_logic:='0';
  signal int_rd     : std_logic:='0';
  signal int_wr     : std_logic:='0';

  signal int_even_rd_addr : unsigned(clog2m-1 downto 0) := (others => '0');
  signal int_even_wr_addr : unsigned(clog2m-1 downto 0) := (others => '0');

  signal int_odd_rd_addr : unsigned(clog2m-1 downto 0) := (others => '0');
  signal int_odd_wr_addr : unsigned(clog2m-1 downto 0) := (others => '0');
  
begin
  
  dp:
    entity work.top_level_dp port map (
      ck             => ck_tb,
      rst            => rst_tb,
      task           => c2,
      test           => '1',
      i_data_even    => int_data_even,
      i_data_odd     => int_data_odd,
      cs_all         => int_cs_all,
      rd             => int_rd,
      wr             => int_wr,
      even_rd_addr   => int_even_rd_addr,
      even_wr_addr   => int_even_wr_addr,
      odd_rd_addr    => int_odd_rd_addr,
      odd_wr_addr    => int_odd_wr_addr,
      ctrl_en_hmode  => int_ctrl_en_hmode,
      ctrl_en_vmode  => int_ctrl_en_vmode,
      ctrl_en_npu    => int_ctrl_en_npu,
      ctrl_ld_v      => int_ctrl_ld_v,
      ctrl_wr_pipe   => int_ctrl_wr_pipe,
      ctrl_en_rf_ptr => int_ctrl_en_rf_ptr,
      ctrl_weight_wr => int_ctrl_weight_wr,
      s_tc_rd        => int_s_tc_rd,
      s_tc_hmode     => int_s_tc_hmode,
      s_tc_vmode     => int_s_tc_vmode,
      s_tc_res       => int_s_tc_res,
      s_tc_tilev     => int_s_tc_tilev,
      s_tc_tileh     => int_s_tc_tileh,
      s_tc_tileb     => int_s_tc_tileb,
      s_tc_tilec     => int_s_tc_tilec
      );

  cu :
    entity work.conv_fsm_v2 port map (
      ck             => ck_tb,
      rst            => rst_tb,
      start          => start_tb,
      ctrl_en_hmode  => int_ctrl_en_hmode,
      ctrl_en_vmode  => int_ctrl_en_vmode,
      ctrl_en_npu    => int_ctrl_en_npu,
      ctrl_weight_wr => int_ctrl_weight_wr,
      ctrl_ld_v      => int_ctrl_ld_v,
      ctrl_en_rf_ptr => int_ctrl_en_rf_ptr,
      ctrl_wr_pipe   => int_ctrl_wr_pipe,
      s_tc_rd        => int_s_tc_rd,
      s_tc_hmode     => int_s_tc_hmode,
      s_tc_vmode     => int_s_tc_vmode,
      s_tc_res       => int_s_tc_res,
      s_tc_tilev     => int_s_tc_tilev,
      s_tc_tileh     => int_s_tc_tileh,
      s_tc_tileb     => int_s_tc_tileb,
      s_tc_tilec     => int_s_tc_tilec,
      done           => done_tb
      );

end architecture;
