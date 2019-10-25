onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -format Logic /tb_fsm_v2/ck
add wave -noupdate -format Logic /tb_fsm_v2/rst
add wave -noupdate -format Logic /tb_fsm_v2/start
add wave -noupdate -format Literal /tb_fsm_v2/task
add wave -noupdate -format Literal /tb_fsm_v2/i_data_even
add wave -noupdate -format Literal /tb_fsm_v2/i_data_odd
add wave -noupdate -format Logic /tb_fsm_v2/cs_all
add wave -noupdate -format Literal /tb_fsm_v2/rd
add wave -noupdate -format Literal /tb_fsm_v2/wr
add wave -noupdate -format Logic /tb_fsm_v2/ctrl_en_hmode
add wave -noupdate -format Logic /tb_fsm_v2/ctrl_en_vmode
add wave -noupdate -format Logic /tb_fsm_v2/ctrl_en_npu
add wave -noupdate -format Logic /tb_fsm_v2/ctrl_ld_v
add wave -noupdate -format Logic /tb_fsm_v2/ctrl_en_rf_ptr
add wave -noupdate -format Logic /tb_fsm_v2/ctrl_wr_pipe
add wave -noupdate -format Logic /tb_fsm_v2/ctrl_weight_wr
add wave -noupdate -format Logic /tb_fsm_v2/s_tc_rd
add wave -noupdate -format Logic /tb_fsm_v2/s_tc_hmode
add wave -noupdate -format Logic /tb_fsm_v2/s_tc_vmode
add wave -noupdate -format Logic /tb_fsm_v2/s_tc_res
add wave -noupdate -format Logic /tb_fsm_v2/s_tc_tilev
add wave -noupdate -format Logic /tb_fsm_v2/s_tc_tileh
add wave -noupdate -format Logic /tb_fsm_v2/s_tc_tileb
add wave -noupdate -format Logic /tb_fsm_v2/s_tc_tilec
add wave -noupdate -format Literal /tb_fsm_v2/top_level_dp_1/dp_inst/int_hmode_cnt
add wave -noupdate -format Literal /tb_fsm_v2/top_level_dp_1/dp_inst/int_vmode_cnt
add wave -noupdate -format Logic /tb_fsm_v2/top_level_dp_1/dp_inst/ctrl_en_rf_ptr
add wave -noupdate -format Literal /tb_fsm_v2/top_level_dp_1/dp_inst/int_arv_rf_ptr
add wave -noupdate -format Literal /tb_fsm_v2/top_level_dp_1/dp_inst/int_rf_ptr
add wave -noupdate -format Logic /tb_fsm_v2/top_level_dp_1/dp_inst/core_inst/npu_inst/mesh_body__0/c__0/peij/ck
add wave -noupdate -format Logic /tb_fsm_v2/top_level_dp_1/dp_inst/core_inst/npu_inst/mesh_body__0/c__0/peij/rst
add wave -noupdate -format Logic /tb_fsm_v2/top_level_dp_1/dp_inst/core_inst/npu_inst/mesh_body__0/c__0/peij/en
add wave -noupdate -format Logic /tb_fsm_v2/top_level_dp_1/dp_inst/core_inst/npu_inst/mesh_body__0/c__0/peij/ld_h
add wave -noupdate -format Logic /tb_fsm_v2/top_level_dp_1/dp_inst/core_inst/npu_inst/mesh_body__0/c__0/peij/ld_v
add wave -noupdate -format Logic /tb_fsm_v2/top_level_dp_1/dp_inst/core_inst/npu_inst/mesh_body__0/c__0/peij/rld_v
add wave -noupdate -format Logic /tb_fsm_v2/top_level_dp_1/dp_inst/core_inst/npu_inst/mesh_body__0/c__0/peij/wr_pipe
add wave -noupdate -format Literal /tb_fsm_v2/top_level_dp_1/dp_inst/core_inst/npu_inst/mesh_body__0/c__0/peij/weight
add wave -noupdate -format Literal /tb_fsm_v2/top_level_dp_1/dp_inst/core_inst/npu_inst/mesh_body__0/c__0/peij/i_data_h
add wave -noupdate -format Literal /tb_fsm_v2/top_level_dp_1/dp_inst/core_inst/npu_inst/mesh_body__0/c__0/peij/i_data_v
add wave -noupdate -format Literal /tb_fsm_v2/top_level_dp_1/dp_inst/core_inst/npu_inst/mesh_body__0/c__0/peij/i_data_acc
add wave -noupdate -format Literal /tb_fsm_v2/top_level_dp_1/dp_inst/core_inst/npu_inst/mesh_body__0/c__0/peij/o_data_h
add wave -noupdate -format Literal /tb_fsm_v2/top_level_dp_1/dp_inst/core_inst/npu_inst/mesh_body__0/c__0/peij/o_data_v
add wave -noupdate -format Literal /tb_fsm_v2/top_level_dp_1/dp_inst/core_inst/npu_inst/mesh_body__0/c__0/peij/o_data_res
add wave -noupdate -format Literal /tb_fsm_v2/top_level_dp_1/dp_inst/core_inst/npu_inst/mesh_body__0/c__0/peij/int_q_reg_in
add wave -noupdate -format Literal /tb_fsm_v2/top_level_dp_1/dp_inst/core_inst/npu_inst/mesh_body__0/c__0/peij/int_q_reg_h
add wave -noupdate -format Literal /tb_fsm_v2/top_level_dp_1/dp_inst/core_inst/npu_inst/mesh_body__0/c__0/peij/int_q_reg_v
add wave -noupdate -format Literal /tb_fsm_v2/top_level_dp_1/dp_inst/core_inst/npu_inst/mesh_body__0/c__0/peij/int_sgnext
add wave -noupdate -format Literal /tb_fsm_v2/top_level_dp_1/dp_inst/core_inst/npu_inst/mesh_body__0/c__0/peij/int_q_acc
add wave -noupdate -format Literal /tb_fsm_v2/top_level_dp_1/dp_inst/core_inst/npu_inst/mesh_body__0/c__0/peij/int_d_acc
add wave -noupdate -format Logic /tb_fsm_v2/top_level_dp_1/dp_inst/core_inst/npu_inst/mesh_body__0/c__0/peij/int_q_weight
add wave -noupdate -format Logic /tb_fsm_v2/top_level_dp_1/dp_inst/core_inst/npu_inst/mesh_body__0/c__0/peij/int_q_en
add wave -noupdate -format Logic /tb_fsm_v2/top_level_dp_1/dp_inst/core_inst/npu_inst/mesh_body__0/c__0/peij/int_acc_en
add wave -noupdate -format Logic /tb_fsm_v2/top_level_dp_1/dp_inst/core_inst/npu_inst/mesh_body__0/c__0/peij/int_ld_h
add wave -noupdate -format Logic /tb_fsm_v2/top_level_dp_1/dp_inst/core_inst/npu_inst/mesh_body__0/c__0/peij/int_ld_v
add wave -noupdate -format Literal /tb_fsm_v2/top_level_dp_1/dp_inst/core_inst/i_data_conv_h
add wave -noupdate -format Literal /tb_fsm_v2/top_level_dp_1/dp_inst/core_inst/i_data_conv_v
add wave -noupdate -format Logic /tb_fsm_v2/top_level_dp_1/dp_inst/core_inst/rst
add wave -noupdate -format Literal /tb_fsm_v2/top_level_dp_1/dp_inst/core_inst/i_weight_conv
add wave -noupdate -format Logic /tb_fsm_v2/top_level_dp_1/dp_inst/core_inst/en_npu
add wave -noupdate -format Logic /tb_fsm_v2/top_level_dp_1/dp_inst/core_inst/ld_h
add wave -noupdate -format Logic /tb_fsm_v2/top_level_dp_1/dp_inst/core_inst/ld_v
add wave -noupdate -format Logic /tb_fsm_v2/top_level_dp_1/dp_inst/core_inst/rld_v
add wave -noupdate -format Logic /tb_fsm_v2/top_level_dp_1/dp_inst/core_inst/wr_pipe
add wave -noupdate -format Logic /tb_fsm_v2/top_level_dp_1/dp_inst/core_inst/ckg_rsel
add wave -noupdate -format Logic /tb_fsm_v2/top_level_dp_1/dp_inst/core_inst/ckg_csel
add wave -noupdate -format Literal /tb_fsm_v2/top_level_dp_1/dp_inst/core_inst/ckg_mask
add wave -noupdate -format Literal /tb_fsm_v2/top_level_dp_1/dp_inst/core_inst/ckg_mask_lt
add wave -noupdate -format Literal /tb_fsm_v2/top_level_dp_1/dp_inst/core_inst/o_data
add wave -noupdate -format Literal /tb_fsm_v2/top_level_dp_1/dp_inst/core_inst/int_weight_fc
add wave -noupdate -format Literal /tb_fsm_v2/top_level_dp_1/dp_inst/core_inst/int_data_fc
add wave -noupdate -format Literal /tb_fsm_v2/top_level_dp_1/dp_inst/core_inst/int_data_pool
add wave -noupdate -format Literal /tb_fsm_v2/top_level_dp_1/dp_inst/core_inst/int_weight_conv
add wave -noupdate -format Literal /tb_fsm_v2/top_level_dp_1/dp_inst/core_inst/int_i_data_conv_h
add wave -noupdate -format Literal /tb_fsm_v2/top_level_dp_1/dp_inst/core_inst/int_i_data_conv_v
add wave -noupdate -format Logic /tb_fsm_v2/top_level_dp_1/dp_inst/core_inst/ck
add wave -noupdate -format Logic /tb_fsm_v2/top_level_dp_1/dp_inst/core_inst/weight_wr
add wave -noupdate -format Logic /tb_fsm_v2/top_level_dp_1/dp_inst/core_inst/weight_rd
add wave -noupdate -format Literal /tb_fsm_v2/top_level_dp_1/dp_inst/core_inst/weight_wr_ptr
add wave -noupdate -format Literal /tb_fsm_v2/top_level_dp_1/dp_inst/core_inst/weight_rd_ptr
add wave -noupdate -format Literal /tb_fsm_v2/top_level_dp_1/dp_inst/core_inst/weight_sel
add wave -noupdate -format Literal /tb_fsm_v2/top_level_dp_1/dp_inst/core_inst/int_data_conv_h
add wave -noupdate -format Literal /tb_fsm_v2/top_level_dp_1/dp_inst/core_inst/int_data_conv_v
add wave -noupdate -format Literal /tb_fsm_v2/top_level_dp_1/dp_inst/core_inst/int_ckg_rmask
add wave -noupdate -format Literal /tb_fsm_v2/top_level_dp_1/dp_inst/core_inst/int_ckg_cmask
add wave -noupdate -format Literal /tb_fsm_v2/conv_fsm_v2_1/ps
add wave -noupdate -format Logic /tb_fsm_v2/top_level_dp_1/imem_inst/imem_inst/even_bin__0/rfi/ck
add wave -noupdate -format Logic /tb_fsm_v2/top_level_dp_1/imem_inst/imem_inst/even_bin__0/rfi/rst
add wave -noupdate -format Logic /tb_fsm_v2/top_level_dp_1/imem_inst/imem_inst/even_bin__0/rfi/test
add wave -noupdate -format Logic /tb_fsm_v2/top_level_dp_1/imem_inst/imem_inst/even_bin__0/rfi/cs
add wave -noupdate -format Logic /tb_fsm_v2/top_level_dp_1/imem_inst/imem_inst/even_bin__0/rfi/rd
add wave -noupdate -format Logic /tb_fsm_v2/top_level_dp_1/imem_inst/imem_inst/even_bin__0/rfi/wr
add wave -noupdate -format Literal /tb_fsm_v2/top_level_dp_1/imem_inst/imem_inst/even_bin__0/rfi/rd_addr
add wave -noupdate -format Literal /tb_fsm_v2/top_level_dp_1/imem_inst/imem_inst/even_bin__0/rfi/wr_addr
add wave -noupdate -format Literal /tb_fsm_v2/top_level_dp_1/imem_inst/imem_inst/even_bin__0/rfi/i_data
add wave -noupdate -format Literal /tb_fsm_v2/top_level_dp_1/imem_inst/imem_inst/even_bin__0/rfi/o_data
add wave -noupdate -format Literal /tb_fsm_v2/top_level_dp_1/imem_inst/imem_inst/even_bin__0/rfi/word
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {5 ns} 0}
configure wave -namecolwidth 485
configure wave -valuecolwidth 128
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
WaveRestoreZoom {0 ns} {269 ns}
