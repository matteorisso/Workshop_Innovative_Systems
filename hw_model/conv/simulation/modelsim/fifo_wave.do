onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /tb_fsm/cu/ps
add wave -noupdate /tb_fsm/dp/DP/DATA_BUFFER/ck
add wave -noupdate /tb_fsm/dp/DP/DATA_BUFFER/rst
add wave -noupdate /tb_fsm/dp/DP/DATA_BUFFER/ld
add wave -noupdate /tb_fsm/dp/DP/DATA_BUFFER/rd_ptr
add wave -noupdate /tb_fsm/dp/DP/DATA_BUFFER/wr_ptr
add wave -noupdate /tb_fsm/dp/DP/DATA_BUFFER/i_data
add wave -noupdate /tb_fsm/dp/DP/DATA_BUFFER/int_mask
add wave -noupdate /tb_fsm/dp/DP/DATA_BUFFER/int_en
add wave -noupdate /tb_fsm/dp/DP/DATA_BUFFER/SRF/r/en
add wave -noupdate /tb_fsm/dp/DP/DATA_BUFFER/SRF/r/i_data
add wave -noupdate -expand /tb_fsm/dp/DP/DATA_BUFFER/SRF/r/o_data
add wave -noupdate /tb_fsm/dp/WEIGHT_BUFFER/cs
add wave -noupdate /tb_fsm/dp/WEIGHT_BUFFER/rd
add wave -noupdate /tb_fsm/dp/WEIGHT_BUFFER/vmode_ptr
add wave -noupdate /tb_fsm/dp/WEIGHT_BUFFER/hmode_ptr
add wave -noupdate /tb_fsm/dp/WEIGHT_BUFFER/o_data
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {0 ps} 0}
configure wave -namecolwidth 266
configure wave -valuecolwidth 206
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
WaveRestoreZoom {0 ps} {262500 ps}
