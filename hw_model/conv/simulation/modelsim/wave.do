onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /tb_fsm/dp/DP/DATA_BUFFER/ck
add wave -noupdate /tb_fsm/dp/DP/DATA_BUFFER/rst
add wave -noupdate /tb_fsm/dp/DP/DATA_BUFFER/ld
add wave -noupdate /tb_fsm/dp/DP/DATA_BUFFER/rd_ptr
add wave -noupdate /tb_fsm/dp/DP/DATA_BUFFER/wr_ptr
add wave -noupdate /tb_fsm/dp/DP/DATA_BUFFER/i_data
add wave -noupdate -expand /tb_fsm/dp/DP/DATA_BUFFER/o_data
add wave -noupdate /tb_fsm/dp/DP/DATA_BUFFER/int_mask
add wave -noupdate /tb_fsm/dp/DP/DATA_BUFFER/int_en
add wave -noupdate /tb_fsm/dp/DP/DATA_BUFFER/ss
add wave -noupdate /tb_fsm/dp/DP/DATA_BUFFER/data_b/ck
add wave -noupdate /tb_fsm/dp/DP/DATA_BUFFER/data_b/rst
add wave -noupdate /tb_fsm/dp/DP/DATA_BUFFER/data_b/en
add wave -noupdate /tb_fsm/dp/DP/DATA_BUFFER/data_b/rd_ptr
add wave -noupdate /tb_fsm/dp/DP/DATA_BUFFER/data_b/i_data
add wave -noupdate -expand /tb_fsm/dp/DP/DATA_BUFFER/data_b/o_data
add wave -noupdate -expand /tb_fsm/dp/DP/DATA_BUFFER/data_b/ss
add wave -noupdate /tb_fsm/dp/DP/PE_BLOCK/peRowGen(0)/peColGen(0)/peij/ck
add wave -noupdate /tb_fsm/dp/DP/PE_BLOCK/peRowGen(0)/peColGen(0)/peij/rst
add wave -noupdate /tb_fsm/dp/DP/PE_BLOCK/peRowGen(0)/peColGen(0)/peij/sync_clr
add wave -noupdate /tb_fsm/dp/DP/PE_BLOCK/peRowGen(0)/peColGen(0)/peij/en
add wave -noupdate /tb_fsm/dp/DP/PE_BLOCK/peRowGen(0)/peColGen(0)/peij/k
add wave -noupdate /tb_fsm/dp/DP/PE_BLOCK/peRowGen(0)/peColGen(0)/peij/i_data
add wave -noupdate /tb_fsm/dp/DP/PE_BLOCK/peRowGen(0)/peColGen(0)/peij/o_data
add wave -noupdate /tb_fsm/dp/DP/PE_BLOCK/peRowGen(0)/peColGen(0)/peij/q_im
add wave -noupdate /tb_fsm/dp/DP/PE_BLOCK/peRowGen(0)/peColGen(0)/peij/sgnext
add wave -noupdate /tb_fsm/dp/DP/PE_BLOCK/peRowGen(0)/peColGen(0)/peij/d_acc
add wave -noupdate /tb_fsm/dp/DP/PE_BLOCK/peRowGen(0)/peColGen(0)/peij/q_acc
add wave -noupdate /tb_fsm/dp/DP/PE_BLOCK/peRowGen(0)/peColGen(0)/peij/q_k
add wave -noupdate /tb_fsm/dp/WEIGHT_BUFFER/o_data
add wave -noupdate /tb_fsm/cu/ps
add wave -noupdate /tb_fsm/dp/WR_PIPE/ck
add wave -noupdate /tb_fsm/dp/WR_PIPE/rst
add wave -noupdate /tb_fsm/dp/WR_PIPE/EN_RES_PTR
add wave -noupdate /tb_fsm/dp/WR_PIPE/TC_RES
add wave -noupdate /tb_fsm/dp/WR_PIPE/i_data
add wave -noupdate /tb_fsm/dp/WR_PIPE/o_data
add wave -noupdate /tb_fsm/dp/WR_PIPE/int_res00
add wave -noupdate /tb_fsm/dp/WR_PIPE/int_res01
add wave -noupdate /tb_fsm/dp/WR_PIPE/int_res02
add wave -noupdate /tb_fsm/dp/WR_PIPE/int_res03
add wave -noupdate /tb_fsm/dp/WR_PIPE/int_res10
add wave -noupdate /tb_fsm/dp/WR_PIPE/int_res11
add wave -noupdate /tb_fsm/dp/WR_PIPE/int_res12
add wave -noupdate /tb_fsm/dp/WR_PIPE/int_res13
add wave -noupdate /tb_fsm/dp/WR_PIPE/int_res20
add wave -noupdate /tb_fsm/dp/WR_PIPE/int_res21
add wave -noupdate /tb_fsm/dp/WR_PIPE/int_res22
add wave -noupdate /tb_fsm/dp/WR_PIPE/int_res23
add wave -noupdate /tb_fsm/dp/WR_PIPE/int_res30
add wave -noupdate /tb_fsm/dp/WR_PIPE/int_res31
add wave -noupdate /tb_fsm/dp/WR_PIPE/int_res32
add wave -noupdate /tb_fsm/dp/WR_PIPE/int_res33
add wave -noupdate /tb_fsm/dp/WR_PIPE/int_en_res_ptr
add wave -noupdate /tb_fsm/dp/WR_PIPE/int_tc_res
add wave -noupdate /tb_fsm/dp/WR_PIPE/int_arv_res
add wave -noupdate /tb_fsm/dp/WR_PIPE/int_res_ptr
add wave -noupdate /tb_fsm/dp/WR_PIPE/int_d_reg
add wave -noupdate /tb_fsm/dp/WR_PIPE/int_q_reg
add wave -noupdate /tb_fsm/dp/WEIGHT_BUFFER/ck
add wave -noupdate /tb_fsm/dp/WEIGHT_BUFFER/rst
add wave -noupdate /tb_fsm/dp/WEIGHT_BUFFER/cs
add wave -noupdate /tb_fsm/dp/WEIGHT_BUFFER/rd
add wave -noupdate /tb_fsm/dp/WEIGHT_BUFFER/vmode_ptr
add wave -noupdate /tb_fsm/dp/WEIGHT_BUFFER/hmode_ptr
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {529331 ps} 0}
configure wave -namecolwidth 379
configure wave -valuecolwidth 233
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 1
configure wave -timelineunits ns
update
WaveRestoreZoom {202500 ps} {727500 ps}
