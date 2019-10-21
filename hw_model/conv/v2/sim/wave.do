onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -format Literal /tb_fsm_v2/cu/ps
add wave -noupdate -format Literal -radix unsigned /tb_fsm_v2/dp/int_even_rd_addr
add wave -noupdate -format Literal -radix unsigned /tb_fsm_v2/dp/int_odd_rd_addr
add wave -noupdate -format Literal -radix unsigned /tb_fsm_v2/dp/int_rf_ptr
add wave -noupdate -format Literal -radix unsigned /tb_fsm_v2/dp/int_hmode_cnt
add wave -noupdate -format Literal -radix unsigned /tb_fsm_v2/dp/int_vmode_cnt
add wave -noupdate -format Literal -radix unsigned /tb_fsm_v2/dp/int_arv_res
add wave -noupdate -format Literal -radix unsigned /tb_fsm_v2/dp/int_arv_rf_ptr
add wave -noupdate -format Literal -radix unsigned /tb_fsm_v2/dp/int_arv_hmode
add wave -noupdate -format Literal -radix unsigned /tb_fsm_v2/dp/int_arv_vmode
add wave -noupdate -format Literal -radix unsigned /tb_fsm_v2/dp/int_arv_tilev
add wave -noupdate -format Literal -radix unsigned /tb_fsm_v2/dp/int_arv_tileh
add wave -noupdate -format Literal -radix unsigned /tb_fsm_v2/dp/int_arv_tileb
add wave -noupdate -format Literal -radix unsigned /tb_fsm_v2/dp/int_arv_tilec
add wave -noupdate -format Logic /tb_fsm_v2/dp/ck
add wave -noupdate -format Logic /tb_fsm_v2/dp/rst
add wave -noupdate -format Literal /tb_fsm_v2/dp/task
add wave -noupdate -format Logic /tb_fsm_v2/dp/ctrl_en_hmode
add wave -noupdate -format Logic /tb_fsm_v2/dp/ctrl_en_vmode
add wave -noupdate -format Logic /tb_fsm_v2/dp/ctrl_en_npu
add wave -noupdate -format Logic /tb_fsm_v2/dp/ctrl_ld_v
add wave -noupdate -format Logic /tb_fsm_v2/dp/ctrl_en_rf_ptr
add wave -noupdate -format Logic /tb_fsm_v2/dp/ctrl_wr_pipe
add wave -noupdate -format Logic /tb_fsm_v2/dp/ctrl_weight_wr
add wave -noupdate -format Logic /tb_fsm_v2/dp/s_tc_rd
add wave -noupdate -format Logic /tb_fsm_v2/dp/s_tc_hmode
add wave -noupdate -format Logic /tb_fsm_v2/dp/s_tc_vmode
add wave -noupdate -format Logic /tb_fsm_v2/dp/s_tc_res
add wave -noupdate -format Logic /tb_fsm_v2/dp/s_tc_tilev
add wave -noupdate -format Logic /tb_fsm_v2/dp/s_tc_tileh
add wave -noupdate -format Logic /tb_fsm_v2/dp/s_tc_tileb
add wave -noupdate -format Logic /tb_fsm_v2/dp/s_tc_tilec
add wave -noupdate -format Literal /tb_fsm_v2/dp/i_weight
add wave -noupdate -format Literal /tb_fsm_v2/dp/i_data_v
add wave -noupdate -format Literal /tb_fsm_v2/dp/i_data_h
add wave -noupdate -format Literal /tb_fsm_v2/dp/o_data
add wave -noupdate -format Literal /tb_fsm_v2/dp/int_o_data
add wave -noupdate -format Literal /tb_fsm_v2/dp/int_data_conv_h
add wave -noupdate -format Literal /tb_fsm_v2/dp/int_data_conv_v
add wave -noupdate -format Literal /tb_fsm_v2/dp/int_ckg_mask
add wave -noupdate -format Literal /tb_fsm_v2/dp/int_ckg_mask_lt
add wave -noupdate -format Literal /tb_fsm_v2/dp/int_arv_ckg
add wave -noupdate -format Logic /tb_fsm_v2/dp/int_tc_rd
add wave -noupdate -format Logic /tb_fsm_v2/dp/int_tc_res
add wave -noupdate -format Logic /tb_fsm_v2/dp/int_tc_tilev
add wave -noupdate -format Logic /tb_fsm_v2/dp/int_tc_tileh
add wave -noupdate -format Logic /tb_fsm_v2/dp/int_tc_tileb
add wave -noupdate -format Logic /tb_fsm_v2/dp/int_tc_tilec
add wave -noupdate -format Logic /tb_fsm_v2/dp/int_s_tc_tilev
add wave -noupdate -format Logic /tb_fsm_v2/dp/int_s_tc_tileh
add wave -noupdate -format Logic /tb_fsm_v2/dp/int_s_tc_tileb
add wave -noupdate -format Logic /tb_fsm_v2/dp/int_s_tc_tilec
add wave -noupdate -format Logic /tb_fsm_v2/dp/int_weight_wr
add wave -noupdate -format Literal /tb_fsm_v2/dp/addr_gen_inst/int_arv_rf_ptr
add wave -noupdate -format Literal /tb_fsm_v2/dp/addr_gen_inst/arv_rf_ptr
add wave -noupdate -format Literal /tb_fsm_v2/dp/addr_gen_inst/arv_tilev
add wave -noupdate -format Literal /tb_fsm_v2/dp/addr_gen_inst/arv_tileh
add wave -noupdate -format Literal /tb_fsm_v2/dp/addr_gen_inst/arv_tileb
add wave -noupdate -format Literal /tb_fsm_v2/dp/addr_gen_inst/arv_tilec
add wave -noupdate -format Literal /tb_fsm_v2/dp/addr_gen_inst/even_addr
add wave -noupdate -format Literal /tb_fsm_v2/dp/addr_gen_inst/odd_addr
add wave -noupdate -format Literal /tb_fsm_v2/dp/addr_gen_inst/rf_ptr
add wave -noupdate -format Logic /tb_fsm_v2/dp/addr_gen_inst/int_en_tilev_ptr
add wave -noupdate -format Logic /tb_fsm_v2/dp/addr_gen_inst/int_en_tileh_ptr
add wave -noupdate -format Logic /tb_fsm_v2/dp/addr_gen_inst/int_en_tileb_ptr
add wave -noupdate -format Logic /tb_fsm_v2/dp/addr_gen_inst/int_en_tilec_ptr
add wave -noupdate -format Logic /tb_fsm_v2/dp/addr_gen_inst/int_tc_rd
add wave -noupdate -format Logic /tb_fsm_v2/dp/addr_gen_inst/int_tc_tilev
add wave -noupdate -format Logic /tb_fsm_v2/dp/addr_gen_inst/int_tc_tileh
add wave -noupdate -format Logic /tb_fsm_v2/dp/addr_gen_inst/int_tc_tileb
add wave -noupdate -format Logic /tb_fsm_v2/dp/addr_gen_inst/int_tc_tilec
add wave -noupdate -format Literal /tb_fsm_v2/dp/addr_gen_inst/int_rf_ptr
add wave -noupdate -format Literal /tb_fsm_v2/dp/addr_gen_inst/int_tilev_ptr
add wave -noupdate -format Literal /tb_fsm_v2/dp/addr_gen_inst/int_tileh_ptr
add wave -noupdate -format Literal -radix unsigned /tb_fsm_v2/dp/addr_gen_inst/int_arv_rf_ptr
add wave -noupdate -format Literal -radix unsigned /tb_fsm_v2/dp/addr_gen_inst/int_arv_tilev
add wave -noupdate -format Literal -radix unsigned /tb_fsm_v2/dp/addr_gen_inst/int_arv_tileh
add wave -noupdate -format Literal -radix unsigned /tb_fsm_v2/dp/addr_gen_inst/int_arv_tileb
add wave -noupdate -format Literal -radix unsigned /tb_fsm_v2/dp/addr_gen_inst/int_arv_tilec
add wave -noupdate -format Logic /tb_fsm_v2/dp/addr_gen_inst/int_inc_even
add wave -noupdate -format Logic /tb_fsm_v2/dp/addr_gen_inst/int_inc_odd
add wave -noupdate -format Literal /tb_fsm_v2/dp/addr_gen_inst/int_offset_val
add wave -noupdate -format Literal /tb_fsm_v2/dp/addr_gen_inst/int_even_offset
add wave -noupdate -format Literal /tb_fsm_v2/dp/addr_gen_inst/int_odd_offset
add wave -noupdate -format Literal /tb_fsm_v2/dp/addr_gen_inst/int_even_addr
add wave -noupdate -format Literal /tb_fsm_v2/dp/addr_gen_inst/int_odd_addr
add wave -noupdate -format Logic /tb_fsm_v2/dp/addr_gen_inst/tc_tilec
add wave -noupdate -format Logic /tb_fsm_v2/dp/addr_gen_inst/tc_tileb
add wave -noupdate -format Logic /tb_fsm_v2/dp/addr_gen_inst/tc_tileh
add wave -noupdate -format Logic /tb_fsm_v2/dp/addr_gen_inst/tc_tilev
add wave -noupdate -format Logic /tb_fsm_v2/dp/addr_gen_inst/tc_rd
add wave -noupdate -format Logic /tb_fsm_v2/dp/addr_gen_inst/inc
add wave -noupdate -format Logic /tb_fsm_v2/dp/addr_gen_inst/rst
add wave -noupdate -format Logic /tb_fsm_v2/dp/addr_gen_inst/ck
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {125 ns} 0}
configure wave -namecolwidth 401
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits us
update
WaveRestoreZoom {0 ns} {2880 ns}
