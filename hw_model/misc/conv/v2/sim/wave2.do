onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -format Literal /tb_fsm_v2/top_level_dp_1/imem_inst/i_data_even
add wave -noupdate -format Literal /tb_fsm_v2/top_level_dp_1/imem_inst/i_data_odd
add wave -noupdate -format Literal /tb_fsm_v2/top_level_dp_1/imem_inst/rd
add wave -noupdate -format Literal /tb_fsm_v2/top_level_dp_1/imem_inst/wr
add wave -noupdate -format Literal /tb_fsm_v2/top_level_dp_1/imem_inst/even_wr_addr
add wave -noupdate -format Literal /tb_fsm_v2/top_level_dp_1/imem_inst/odd_wr_addr
add wave -noupdate -format Literal /tb_fsm_v2/top_level_dp_1/imem_inst/int_en
add wave -noupdate -format Logic /tb_fsm_v2/top_level_dp_1/imem_inst/cs_all
add wave -noupdate -format Logic /tb_fsm_v2/top_level_dp_1/imem_inst/test
add wave -noupdate -format Logic /tb_fsm_v2/top_level_dp_1/imem_inst/rst
add wave -noupdate -format Logic /tb_fsm_v2/top_level_dp_1/imem_inst/ck
add wave -noupdate -color {Dark Slate Blue} -format Literal -itemcolor Gold /tb_fsm_v2/top_level_dp_1/imem_inst/o_data_even(0)
add wave -noupdate -color {Dark Slate Blue} -format Literal -itemcolor Gold /tb_fsm_v2/top_level_dp_1/imem_inst/o_data_even(1)
add wave -noupdate -color {Dark Slate Blue} -format Literal -itemcolor Gold /tb_fsm_v2/top_level_dp_1/imem_inst/o_data_even(2)
add wave -noupdate -color {Dark Slate Blue} -format Literal -itemcolor Gold /tb_fsm_v2/top_level_dp_1/imem_inst/o_data_even(3)
add wave -noupdate -format Literal /tb_fsm_v2/top_level_dp_1/imem_inst/o_data_odd(0)
add wave -noupdate -format Literal /tb_fsm_v2/top_level_dp_1/imem_inst/o_data_odd(1)
add wave -noupdate -format Literal /tb_fsm_v2/top_level_dp_1/imem_inst/o_data_odd(2)
add wave -noupdate -format Literal /tb_fsm_v2/top_level_dp_1/imem_inst/o_data_odd(3)
add wave -noupdate -format Literal /tb_fsm_v2/top_level_dp_1/imem_inst/cs_enc
add wave -noupdate -format Literal /tb_fsm_v2/top_level_dp_1/imem_inst/even_rd_addr
add wave -noupdate -format Literal /tb_fsm_v2/top_level_dp_1/imem_inst/odd_rd_addr
add wave -noupdate -format Literal /tb_fsm_v2/top_level_dp_1/dp_inst/o_addr_rd_even
add wave -noupdate -format Literal /tb_fsm_v2/top_level_dp_1/dp_inst/int_rf_ptr
add wave -noupdate -format Literal /tb_fsm_v2/top_level_dp_1/imem_inst/int_cs
add wave -noupdate -format Literal -itemcolor Gold -radix decimal /tb_fsm_v2/top_level_dp_1/dp_inst/core_inst/npu_inst/i_data_conv_v(0)
add wave -noupdate -format Literal -itemcolor Gold -radix decimal /tb_fsm_v2/top_level_dp_1/dp_inst/core_inst/npu_inst/i_data_conv_v(1)
add wave -noupdate -format Literal -itemcolor Gold -radix decimal /tb_fsm_v2/top_level_dp_1/dp_inst/core_inst/npu_inst/i_data_conv_v(2)
add wave -noupdate -format Literal -itemcolor Gold -radix decimal /tb_fsm_v2/top_level_dp_1/dp_inst/core_inst/npu_inst/i_data_conv_v(3)
add wave -noupdate -format Literal -radix decimal /tb_fsm_v2/top_level_dp_1/dp_inst/core_inst/npu_inst/i_data_conv_h(0)
add wave -noupdate -format Literal -radix decimal /tb_fsm_v2/top_level_dp_1/dp_inst/core_inst/npu_inst/i_data_conv_h(1)
add wave -noupdate -format Literal -radix decimal /tb_fsm_v2/top_level_dp_1/dp_inst/core_inst/npu_inst/i_data_conv_h(2)
add wave -noupdate -format Literal -radix decimal /tb_fsm_v2/top_level_dp_1/dp_inst/core_inst/npu_inst/i_data_conv_h(3)
add wave -noupdate -format Logic /tb_fsm_v2/top_level_dp_1/dp_inst/core_inst/npu_inst/rld_v
add wave -noupdate -format Logic /tb_fsm_v2/top_level_dp_1/dp_inst/core_inst/npu_inst/wr_pipe
add wave -noupdate -format Literal /tb_fsm_v2/top_level_dp_1/dp_inst/core_inst/npu_inst/ckg_rmask
add wave -noupdate -format Literal /tb_fsm_v2/top_level_dp_1/dp_inst/core_inst/npu_inst/ckg_cmask
add wave -noupdate -format Literal /tb_fsm_v2/top_level_dp_1/dp_inst/core_inst/npu_inst/i_weight_conv
add wave -noupdate -format Literal /tb_fsm_v2/top_level_dp_1/dp_inst/core_inst/npu_inst/i_data_pool
add wave -noupdate -format Literal /tb_fsm_v2/top_level_dp_1/dp_inst/core_inst/npu_inst/o_data
add wave -noupdate -format Literal /tb_fsm_v2/top_level_dp_1/dp_inst/core_inst/npu_inst/int_pe_en
add wave -noupdate -format Literal /tb_fsm_v2/top_level_dp_1/dp_inst/core_inst/npu_inst/int_data_x
add wave -noupdate -format Literal /tb_fsm_v2/top_level_dp_1/dp_inst/core_inst/npu_inst/int_data_y
add wave -noupdate -format Literal /tb_fsm_v2/top_level_dp_1/dp_inst/core_inst/npu_inst/int_data_res
add wave -noupdate -format Logic /tb_fsm_v2/top_level_dp_1/dp_inst/core_inst/npu_inst/int_ld_h
add wave -noupdate -format Logic /tb_fsm_v2/top_level_dp_1/dp_inst/core_inst/npu_inst/int_ld_v
add wave -noupdate -format Logic /tb_fsm_v2/top_level_dp_1/dp_inst/core_inst/npu_inst/int_rld_v
add wave -noupdate -format Logic /tb_fsm_v2/top_level_dp_1/dp_inst/core_inst/npu_inst/int_wr_pipe
add wave -noupdate -format Literal /tb_fsm_v2/top_level_dp_1/dp_inst/core_inst/npu_inst/int_weight
add wave -noupdate -format Logic /tb_fsm_v2/top_level_dp_1/dp_inst/ck
add wave -noupdate -format Logic /tb_fsm_v2/top_level_dp_1/dp_inst/rst
add wave -noupdate -format Literal /tb_fsm_v2/top_level_dp_1/dp_inst/task
add wave -noupdate -format Logic /tb_fsm_v2/top_level_dp_1/dp_inst/ctrl_en_hmode
add wave -noupdate -format Logic /tb_fsm_v2/top_level_dp_1/dp_inst/ctrl_en_vmode
add wave -noupdate -format Logic /tb_fsm_v2/top_level_dp_1/dp_inst/ctrl_en_npu
add wave -noupdate -format Logic /tb_fsm_v2/top_level_dp_1/dp_inst/ctrl_ld_v
add wave -noupdate -format Logic /tb_fsm_v2/top_level_dp_1/dp_inst/ctrl_en_rf_ptr
add wave -noupdate -format Logic /tb_fsm_v2/top_level_dp_1/dp_inst/ctrl_wr_pipe
add wave -noupdate -format Logic /tb_fsm_v2/top_level_dp_1/dp_inst/ctrl_weight_wr
add wave -noupdate -format Logic /tb_fsm_v2/top_level_dp_1/dp_inst/s_tc_rd
add wave -noupdate -format Logic /tb_fsm_v2/top_level_dp_1/dp_inst/s_tc_hmode
add wave -noupdate -format Logic /tb_fsm_v2/top_level_dp_1/dp_inst/s_tc_vmode
add wave -noupdate -format Logic /tb_fsm_v2/top_level_dp_1/dp_inst/s_tc_res
add wave -noupdate -format Logic /tb_fsm_v2/top_level_dp_1/dp_inst/s_tc_tilev
add wave -noupdate -format Logic /tb_fsm_v2/top_level_dp_1/dp_inst/s_tc_tileh
add wave -noupdate -format Logic /tb_fsm_v2/top_level_dp_1/dp_inst/s_tc_tileb
add wave -noupdate -format Logic /tb_fsm_v2/top_level_dp_1/dp_inst/s_tc_tilec
add wave -noupdate -format Literal /tb_fsm_v2/top_level_dp_1/dp_inst/i_weight
add wave -noupdate -format Literal /tb_fsm_v2/top_level_dp_1/dp_inst/i_data_even
add wave -noupdate -format Literal /tb_fsm_v2/top_level_dp_1/dp_inst/i_data_odd
add wave -noupdate -format Literal /tb_fsm_v2/top_level_dp_1/dp_inst/o_cs_enc
add wave -noupdate -format Literal /tb_fsm_v2/top_level_dp_1/dp_inst/o_addr_rd_odd
add wave -noupdate -format Literal /tb_fsm_v2/top_level_dp_1/dp_inst/o_data
add wave -noupdate -format Literal /tb_fsm_v2/top_level_dp_1/dp_inst/int_o_data
add wave -noupdate -format Literal /tb_fsm_v2/top_level_dp_1/dp_inst/int_data_conv_v
add wave -noupdate -format Literal /tb_fsm_v2/top_level_dp_1/dp_inst/int_data_conv_h
add wave -noupdate -format Literal /tb_fsm_v2/top_level_dp_1/dp_inst/int_ckg_mask
add wave -noupdate -format Literal /tb_fsm_v2/top_level_dp_1/dp_inst/int_ckg_mask_lt
add wave -noupdate -format Literal /tb_fsm_v2/top_level_dp_1/dp_inst/int_arv_ckg
add wave -noupdate -format Literal /tb_fsm_v2/top_level_dp_1/dp_inst/int_arv_res
add wave -noupdate -format Literal /tb_fsm_v2/top_level_dp_1/dp_inst/int_arv_rf_ptr
add wave -noupdate -format Literal /tb_fsm_v2/top_level_dp_1/dp_inst/int_arv_hmode
add wave -noupdate -format Literal /tb_fsm_v2/top_level_dp_1/dp_inst/int_arv_vmode
add wave -noupdate -format Literal /tb_fsm_v2/top_level_dp_1/dp_inst/int_arv_tilev
add wave -noupdate -format Literal /tb_fsm_v2/top_level_dp_1/dp_inst/int_arv_tileh
add wave -noupdate -format Literal /tb_fsm_v2/top_level_dp_1/dp_inst/int_arv_tileb
add wave -noupdate -format Literal /tb_fsm_v2/top_level_dp_1/dp_inst/int_arv_tilec
add wave -noupdate -format Literal /tb_fsm_v2/top_level_dp_1/dp_inst/int_arv_addr
add wave -noupdate -format Logic /tb_fsm_v2/top_level_dp_1/dp_inst/int_tc_rd
add wave -noupdate -format Logic /tb_fsm_v2/top_level_dp_1/dp_inst/int_tc_res
add wave -noupdate -format Logic /tb_fsm_v2/top_level_dp_1/dp_inst/int_tc_tilev
add wave -noupdate -format Logic /tb_fsm_v2/top_level_dp_1/dp_inst/int_tc_tileh
add wave -noupdate -format Logic /tb_fsm_v2/top_level_dp_1/dp_inst/int_tc_tileb
add wave -noupdate -format Logic /tb_fsm_v2/top_level_dp_1/dp_inst/int_tc_tilec
add wave -noupdate -format Logic /tb_fsm_v2/top_level_dp_1/dp_inst/int_s_tc_tilev
add wave -noupdate -format Logic /tb_fsm_v2/top_level_dp_1/dp_inst/int_s_tc_tileh
add wave -noupdate -format Logic /tb_fsm_v2/top_level_dp_1/dp_inst/int_s_tc_tileb
add wave -noupdate -format Logic /tb_fsm_v2/top_level_dp_1/dp_inst/int_s_tc_tilec
add wave -noupdate -format Logic /tb_fsm_v2/top_level_dp_1/dp_inst/int_even_odd_n
add wave -noupdate -format Literal /tb_fsm_v2/top_level_dp_1/dp_inst/int_even_rd_addr
add wave -noupdate -format Literal /tb_fsm_v2/top_level_dp_1/dp_inst/int_odd_rd_addr
add wave -noupdate -format Literal /tb_fsm_v2/top_level_dp_1/dp_inst/int_hmode_cnt
add wave -noupdate -format Literal /tb_fsm_v2/top_level_dp_1/dp_inst/int_vmode_cnt
add wave -noupdate -format Logic /tb_fsm_v2/top_level_dp_1/dp_inst/int_weight_wr
add wave -noupdate -format Literal /tb_fsm_v2/conv_fsm_v2_1/ps
add wave -noupdate -format Logic -radix decimal /tb_fsm_v2/top_level_dp_1/dp_inst/core_inst/npu_inst/mesh_body__0/c__0/peij/ck
add wave -noupdate -format Logic -radix decimal /tb_fsm_v2/top_level_dp_1/dp_inst/core_inst/npu_inst/mesh_body__0/c__0/peij/rst
add wave -noupdate -format Logic -radix decimal /tb_fsm_v2/top_level_dp_1/dp_inst/core_inst/npu_inst/mesh_body__0/c__0/peij/en
add wave -noupdate -format Logic -radix decimal /tb_fsm_v2/top_level_dp_1/dp_inst/core_inst/npu_inst/mesh_body__0/c__0/peij/ld_h
add wave -noupdate -format Logic -radix decimal /tb_fsm_v2/top_level_dp_1/dp_inst/core_inst/npu_inst/mesh_body__0/c__0/peij/ld_v
add wave -noupdate -format Logic -radix decimal /tb_fsm_v2/top_level_dp_1/dp_inst/core_inst/npu_inst/mesh_body__0/c__0/peij/rld_v
add wave -noupdate -format Logic -radix decimal /tb_fsm_v2/top_level_dp_1/dp_inst/core_inst/npu_inst/mesh_body__0/c__0/peij/wr_pipe
add wave -noupdate -format Literal /tb_fsm_v2/top_level_dp_1/dp_inst/core_inst/npu_inst/mesh_body__0/c__0/peij/weight
add wave -noupdate -format Literal -radix decimal /tb_fsm_v2/top_level_dp_1/dp_inst/core_inst/npu_inst/mesh_body__0/c__0/peij/i_data_h
add wave -noupdate -format Literal -radix decimal /tb_fsm_v2/top_level_dp_1/dp_inst/core_inst/npu_inst/mesh_body__0/c__0/peij/i_data_v
add wave -noupdate -format Literal -radix decimal /tb_fsm_v2/top_level_dp_1/dp_inst/core_inst/npu_inst/mesh_body__0/c__0/peij/o_data_h
add wave -noupdate -format Literal -radix decimal /tb_fsm_v2/top_level_dp_1/dp_inst/core_inst/npu_inst/mesh_body__0/c__0/peij/o_data_v
add wave -noupdate -format Literal -radix decimal /tb_fsm_v2/top_level_dp_1/dp_inst/core_inst/npu_inst/mesh_body__0/c__0/peij/o_data_res
add wave -noupdate -format Literal -radix decimal /tb_fsm_v2/top_level_dp_1/dp_inst/core_inst/npu_inst/mesh_body__0/c__0/peij/int_q_reg_h
add wave -noupdate -format Literal -radix decimal /tb_fsm_v2/top_level_dp_1/dp_inst/core_inst/npu_inst/mesh_body__0/c__0/peij/int_q_reg_v
add wave -noupdate -format Logic /tb_fsm_v2/top_level_dp_1/dp_inst/core_inst/npu_inst/mesh_body__0/c__0/peij/int_q_weight
add wave -noupdate -format Literal -radix decimal /tb_fsm_v2/top_level_dp_1/dp_inst/core_inst/npu_inst/mesh_body__0/c__0/peij/int_q_reg_in
add wave -noupdate -format Literal -radix decimal /tb_fsm_v2/top_level_dp_1/dp_inst/core_inst/npu_inst/mesh_body__0/c__0/peij/int_sgnext
add wave -noupdate -format Literal -radix decimal /tb_fsm_v2/top_level_dp_1/dp_inst/core_inst/npu_inst/mesh_body__0/c__0/peij/int_q_acc
add wave -noupdate -format Literal -radix decimal /tb_fsm_v2/top_level_dp_1/dp_inst/core_inst/npu_inst/mesh_body__0/c__0/peij/int_d_acc
add wave -noupdate -format Logic /tb_fsm_v2/top_level_dp_1/dp_inst/core_inst/npu_inst/mesh_body__0/c__0/peij/int_q_en
add wave -noupdate -format Logic /tb_fsm_v2/top_level_dp_1/dp_inst/core_inst/npu_inst/mesh_body__0/c__0/peij/int_acc_en
add wave -noupdate -format Logic /tb_fsm_v2/top_level_dp_1/dp_inst/core_inst/npu_inst/mesh_body__0/c__0/peij/int_ld_h
add wave -noupdate -format Logic /tb_fsm_v2/top_level_dp_1/dp_inst/core_inst/npu_inst/mesh_body__0/c__0/peij/int_ld_v
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 5} {192 ns} 0}
configure wave -namecolwidth 685
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
WaveRestoreZoom {164 ns} {310 ns}
