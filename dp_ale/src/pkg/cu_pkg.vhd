library ieee;
use ieee.std_logic_1164.all;
use work.dp_pkg.all; --! mac_cnt_tc, idx_cnt_tc

package cu_pkg is

    --! FSM
    
    type state_t is (
        FSM_IDLE,                       --! Wait for start_i
        FSM_LDK,                        --! Load kernel string
        FSM_INIT,                       --! Load processing elements
        FSM_HMODE,                      --! Kx mac
        FSM_VMODE,                      --! Ky mac
        FSM_UPDATE_IDX,                 --! Inc base address
        FSM_WRB,                        --! Write output buffer
        FSM_FILTER,                     --! Pooling op.
        FSM_WRM,                        --! Write mem
        FSM_TERM);                      --! Convolution done

    attribute enum_encoding            : string;
    attribute enum_encoding of state_t : type is "0000 0001 0011 0010 0110 0111 0101 0100 1100 1101";

    type fsm_flag_t is record
        tc_mac : mac_cnt_tc_t;
        tc_idx : idx_cnt_tc_t;
        
    end record;


    type fsm_cmd_t is record
        
        mem_rd_data   : std_logic;
        mem_rd_weight : std_logic;
--
        dp_en_npu     : std_logic;
        dp_ldh_v_n    : std_logic;
        dp_ldk        : std_logic;
--        npu   : std_logic;
        en_cnt_kx     : std_logic;
        en_cnt_ky     : std_logic;
        en_cnt_re     : std_logic;
        update_idx    : std_logic;

    end record;

    
end package;
