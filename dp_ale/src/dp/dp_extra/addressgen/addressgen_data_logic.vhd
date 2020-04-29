library ieee;
use ieee.std_logic_1164.all;
use work.dp_pkg.all;

entity addressgen_data_logic is
    
    port(
        nif_z_i      : in  std_logic;
        en_base_i    : in  std_logic;   --! update_idx
        en_offs_i    : in  std_logic;   --! mem_rd_data
        idx_cnt_en_i : in  idx_cnt_en_t;
        idx_cnt_tc_i : in  idx_cnt_tc_t;
        idx_cnt_q_i  : in  idx_cnt_q_t;
        cmd_o        : out addressgen_cmd_t
        );

end entity;

architecture gate of addressgen_data_logic is

begin

    --! ----------------------------------------------------------------------------------
    cmd_o.en_word          <= en_offs_i;
    cmd_o.en_nif           <= en_base_i;
--    
    cmd_o.en_block_y       <= idx_cnt_en_i.block_y;
    cmd_o.en_block_x_even  <= idx_cnt_en_i.block_x and not(idx_cnt_q_i.block_x(0));
    cmd_o.en_block_x_odd   <= idx_cnt_en_i.block_x and idx_cnt_q_i.block_x(0);
--
    cmd_o.clr_word         <= idx_cnt_en_i.block_x when nif_z_i = '1' else en_base_i;
    cmd_o.clr_nif          <= idx_cnt_en_i.block_y;
    cmd_o.clr_block_y      <= idx_cnt_en_i.block_x;
    cmd_o.clr_block_x_even <= idx_cnt_en_i.nof;
    cmd_o.clr_block_x_odd  <= idx_cnt_en_i.nof;

    
end architecture;
