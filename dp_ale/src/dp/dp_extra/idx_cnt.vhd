library ieee;
use ieee.std_logic_1164.all;
use work.dp_pkg.all;

entity idx_cnt is
    generic (IDX_CNT_WIDTH : natural := IDX_CNT_WIDTH);
    
    port(
        clk   : in  std_logic;
        rst_n : in  std_logic;
--        
        en_i  : in  std_logic;          --! update idx
        mod_i : in  idx_cnt_mod_t;
        tc_o  : out idx_cnt_tc_t;
        en_o  : out idx_cnt_en_t;
        q_o   : out idx_cnt_q_t

        );

end entity;

architecture rtl of idx_cnt is

    signal en_1_int : std_logic;
    signal en_2_int : std_logic;
    signal en_3_int : std_logic;
    signal en_4_int : std_logic;
    --
    signal tc_1_int : std_logic;
    signal tc_2_int : std_logic;
    signal tc_3_int : std_logic;
    signal tc_4_int : std_logic;
    --
    signal q_1_int  : std_logic_vector(IDX_CNT_WIDTH-1 downto 0);
    signal q_2_int  : std_logic_vector(IDX_CNT_WIDTH-1 downto 0);
    signal q_3_int  : std_logic_vector(IDX_CNT_WIDTH-1 downto 0);
    signal q_4_int  : std_logic_vector(IDX_CNT_WIDTH-1 downto 0);
begin

    en_1_int     <= en_i;
    en_2_int     <= tc_1_int and en_1_int;
    en_3_int     <= tc_2_int and en_2_int;
    en_4_int     <= tc_3_int and en_3_int;
    --    
    tc_o.nif     <= tc_1_int;
    tc_o.block_y <= tc_2_int;
    tc_o.block_x <= tc_3_int;
    tc_o.nof     <= tc_4_int;
    --
    en_o.nif     <= en_1_int;
    en_o.block_y <= en_2_int;
    en_o.block_x <= en_3_int;
    en_o.nof     <= en_4_int;
    --
    q_o.nif      <= q_1_int;
    q_o.block_y  <= q_2_int;
    q_o.block_x  <= q_3_int;
    q_o.nof      <= q_4_int;


    --! nif
    mod_counter_1 : entity work.mod_counter
        generic map (
            n => IDX_CNT_WIDTH)

        port map (
            clk   => clk,
            rst_n => rst_n,
            en_i  => en_1_int,
            clr_i => '0',
            mod_i => mod_i.nif,
            tc_o  => tc_1_int,
            q_o   => q_1_int
            );

    --! block_y
    mod_counter_2 : entity work.mod_counter
        generic map (
            n => IDX_CNT_WIDTH)

        port map (
            clk   => clk,
            rst_n => rst_n,
            en_i  => en_2_int,
            clr_i => '0',
            mod_i => mod_i.block_y,
            tc_o  => tc_2_int,
            q_o   => q_2_int

            );

    --! block_x
    mod_counter_3 : entity work.mod_counter
        generic map (
            n => IDX_CNT_WIDTH)

        port map (
            clk   => clk,
            rst_n => rst_n,
            en_i  => en_3_int,
            clr_i => '0',
            mod_i => mod_i.block_x,
            tc_o  => tc_3_int,
            q_o   => q_3_int

            );

    --! nof
    mod_counter_4 : entity work.mod_counter
        generic map (
            n => IDX_CNT_WIDTH)

        port map (
            clk   => clk,
            rst_n => rst_n,
            en_i  => en_4_int,
            clr_i => '0',
            mod_i => mod_i.nof,
            tc_o  => tc_4_int,
            q_o   => q_4_int

            );



end architecture;

