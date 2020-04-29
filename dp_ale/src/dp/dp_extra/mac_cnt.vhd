library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.dp_pkg.all;

entity mac_cnt is
    generic (MAC_CNT_WIDTH : natural := MAC_CNT_WIDTH);
    
    port (
        clk   : in  std_logic;
        rst_n : in  std_logic;
--
        dpc_i : in  std_logic;
--
        mod_i : in  mac_cnt_mod_t;
        en_i  : in  mac_cnt_en_t;
        tc_o  : out mac_cnt_tc_t;
        q_o   : out mac_cnt_q_t

        );

end entity;

architecture rtl of mac_cnt is

    signal tc_kx_int       : std_logic;
    signal tc_ky_int       : std_logic;
    --
    signal clr_cnt_npu_int : std_logic;
    signal clr_cnt_kx_int  : std_logic;
    signal clr_cnt_ky_int  : std_logic;
    --
    signal mod_cnt_npu_int : std_logic_vector(MAC_CNT_WIDTH-1 downto 0);
begin

    --! Kx
    mod_counter_1 : entity work.mod_counter
        generic map (
            N => MAC_CNT_WIDTH)

        port map (
            clk   => clk,
            rst_n => rst_n,
            en_i  => en_i.kx,
            clr_i => clr_cnt_kx_int,
            mod_i => mod_i.kx,
            tc_o  => tc_kx_int,
            q_o   => q_o.kx

            );

    --! Ky
    mod_counter_2 : entity work.mod_counter
        generic map (
            N => MAC_CNT_WIDTH)

        port map (
            clk   => clk,
            rst_n => rst_n,
            en_i  => en_i.ky,
            clr_i => clr_cnt_ky_int,
            mod_i => mod_i.ky,
            tc_o  => tc_ky_int,
            q_o   => q_o.ky

            );

    tc_o.kx        <= tc_kx_int;
    tc_o.ky        <= tc_ky_int;
    clr_cnt_kx_int <= '0';
    clr_cnt_ky_int <= tc_kx_int and tc_ky_int;

    --! BLOCK-SIZE
    mod_cnt_npu_int <= std_logic_vector(to_unsigned(7, MAC_CNT_WIDTH));
    mod_counter_3 : entity work.mod_counter
        generic map (
            N => MAC_CNT_WIDTH)

        port map (
            clk   => clk,
            rst_n => rst_n,
            mod_i => mod_cnt_npu_int,
            en_i  => en_i.npu,
            clr_i => clr_cnt_npu_int,
            tc_o  => tc_o.npu,
            q_o   => q_o.npu

            );

    clr_cnt_npu_int <= (tc_kx_int and tc_ky_int) when dpc_i = '0' else '0';


    --! LDK
    mod_counter_4 : entity work.mod_counter
        generic map (
            N => MAC_CNT_WIDTH)

        port map (
            clk   => clk,
            rst_n => rst_n,
            mod_i => (others => '0'),
            en_i  => '1',               --! 1 cycle
            clr_i => '0',
            tc_o  => tc_o.ldk

            );

    --! RES
    mod_counter_5 : entity work.mod_counter
        generic map (
            N => MAC_CNT_WIDTH)

        port map (
            clk   => clk,
            rst_n => rst_n,
            mod_i => mod_i.re,
            en_i  => en_i.re,
            clr_i => '0',
            tc_o  => tc_o.re,
            q_o   => q_o.re

            );


end architecture;
