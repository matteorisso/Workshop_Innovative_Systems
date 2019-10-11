onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /tb_fsm/cu/ps
add wave -noupdate /tb_fsm/dp/CKG_MASK_CTRL/ck
add wave -noupdate /tb_fsm/dp/CKG_MASK_CTRL/rst
add wave -noupdate /tb_fsm/dp/CKG_MASK_CTRL/tc_hmode
add wave -noupdate /tb_fsm/dp/CKG_MASK_CTRL/tc_tilev
add wave -noupdate /tb_fsm/dp/CKG_MASK_CTRL/tc_tileh
add wave -noupdate /tb_fsm/dp/CKG_MASK_CTRL/ckg_mask
add wave -noupdate /tb_fsm/dp/CKG_MASK_CTRL/ckg_mask_lt
add wave -noupdate /tb_fsm/dp/CKG_MASK_CTRL/ckg_rmask
add wave -noupdate /tb_fsm/dp/CKG_MASK_CTRL/ckg_cmask
add wave -noupdate /tb_fsm/dp/CKG_MASK_CTRL/int_en_ckg_r
add wave -noupdate /tb_fsm/dp/CKG_MASK_CTRL/int_en_ckg_c
add wave -noupdate /tb_fsm/dp/int_hmode_cnt
add wave -noupdate /tb_fsm/dp/int_vmode_cnt
add wave -noupdate /tb_fsm/dp/int_wr_ptr
add wave -noupdate /tb_fsm/dp/RD_ADDR_GEN/even_addr
add wave -noupdate /tb_fsm/dp/RD_ADDR_GEN/odd_addr
add wave -noupdate /tb_fsm/dp/WR_ADDR_GEN/int_even_addr
add wave -noupdate /tb_fsm/dp/WR_ADDR_GEN/int_odd_addr
add wave -noupdate -color Coral /tb_fsm/dp/s_tc_tilev
add wave -noupdate -color Coral /tb_fsm/dp/s_tc_tileh
add wave -noupdate -color Coral /tb_fsm/dp/s_tc_tileb
add wave -noupdate -color Coral /tb_fsm/dp/s_tc_tilec
add wave -noupdate /tb_fsm/dp/WR_ADDR_GEN/s_tc_tilev
add wave -noupdate /tb_fsm/dp/WR_ADDR_GEN/s_tc_tileh
add wave -noupdate /tb_fsm/dp/WR_ADDR_GEN/s_tc_tileb
add wave -noupdate /tb_fsm/dp/WR_ADDR_GEN/s_tc_tilec
add wave -noupdate /tb_fsm/dp/ctrl_en_wr_ptr
add wave -noupdate /tb_fsm/dp/s_tc_wr
add wave -noupdate /tb_fsm/dp/RD_ADDR_GEN/int_tc_tilev
add wave -noupdate /tb_fsm/dp/RD_ADDR_GEN/int_tc_tileh
add wave -noupdate /tb_fsm/dp/RD_ADDR_GEN/int_tc_tileb
add wave -noupdate /tb_fsm/dp/RD_ADDR_GEN/int_tc_tilec
add wave -noupdate /tb_fsm/dp/WR_ADDR_GEN/int_tc_tilev
add wave -noupdate /tb_fsm/dp/WR_ADDR_GEN/int_tc_tileh
add wave -noupdate /tb_fsm/dp/WR_ADDR_GEN/int_tc_tileb
add wave -noupdate /tb_fsm/dp/WR_ADDR_GEN/int_tc_tilec
add wave -noupdate /tb_fsm/dp/WR_ADDR_GEN/int_tilev_ptr
add wave -noupdate /tb_fsm/dp/WR_ADDR_GEN/int_tileh_ptr
add wave -noupdate /tb_fsm/dp/WR_ADDR_GEN/int_tileb_ptr
add wave -noupdate /tb_fsm/dp/WR_ADDR_GEN/int_tilec_ptr
add wave -noupdate -radix symbolic /tb_fsm/dp/int_ckg_mask
add wave -noupdate -radix symbolic /tb_fsm/dp/int_ckg_mask_lt
add wave -noupdate -color {Medium Spring Green} /tb_fsm/dp/NPU/PE_ARRAY/row(0)/col(0)/peij/en
add wave -noupdate -color {Medium Spring Green} /tb_fsm/dp/NPU/PE_ARRAY/row(0)/col(1)/peij/en
add wave -noupdate -color {Medium Spring Green} /tb_fsm/dp/NPU/PE_ARRAY/row(0)/col(2)/peij/en
add wave -noupdate -color {Medium Spring Green} /tb_fsm/dp/NPU/PE_ARRAY/row(0)/col(3)/peij/en
add wave -noupdate -color {Medium Spring Green} /tb_fsm/dp/NPU/PE_ARRAY/row(1)/col(0)/peij/en
add wave -noupdate -color {Medium Spring Green} /tb_fsm/dp/NPU/PE_ARRAY/row(1)/col(1)/peij/en
add wave -noupdate -color {Medium Spring Green} /tb_fsm/dp/NPU/PE_ARRAY/row(1)/col(2)/peij/en
add wave -noupdate -color {Medium Spring Green} /tb_fsm/dp/NPU/PE_ARRAY/row(1)/col(3)/peij/en
add wave -noupdate -color {Medium Spring Green} /tb_fsm/dp/NPU/PE_ARRAY/row(2)/col(0)/peij/en
add wave -noupdate -color {Medium Spring Green} /tb_fsm/dp/NPU/PE_ARRAY/row(2)/col(1)/peij/en
add wave -noupdate -color {Medium Spring Green} /tb_fsm/dp/NPU/PE_ARRAY/row(2)/col(2)/peij/en
add wave -noupdate -color {Medium Spring Green} /tb_fsm/dp/NPU/PE_ARRAY/row(2)/col(3)/peij/en
add wave -noupdate -color {Medium Spring Green} /tb_fsm/dp/NPU/PE_ARRAY/row(3)/col(0)/peij/en
add wave -noupdate -color {Medium Spring Green} /tb_fsm/dp/NPU/PE_ARRAY/row(3)/col(1)/peij/en
add wave -noupdate -color {Medium Spring Green} /tb_fsm/dp/NPU/PE_ARRAY/row(3)/col(2)/peij/en
add wave -noupdate -color {Medium Spring Green} /tb_fsm/dp/NPU/PE_ARRAY/row(3)/col(3)/peij/en
add wave -noupdate /tb_fsm/dp/int_en_wr_ptr
add wave -noupdate /tb_fsm/dp/int_en_res_ptr
add wave -noupdate /tb_fsm/dp/WR_ADDR_GEN/ck
add wave -noupdate /tb_fsm/dp/WR_ADDR_GEN/rst
add wave -noupdate /tb_fsm/dp/WR_ADDR_GEN/en_tilev_ptr
add wave -noupdate /tb_fsm/dp/WR_ADDR_GEN/arv_tilev
add wave -noupdate /tb_fsm/dp/WR_ADDR_GEN/arv_tileh
add wave -noupdate /tb_fsm/dp/WR_ADDR_GEN/arv_tileb
add wave -noupdate /tb_fsm/dp/WR_ADDR_GEN/arv_tilec
add wave -noupdate /tb_fsm/dp/WR_ADDR_GEN/even_addr
add wave -noupdate /tb_fsm/dp/WR_ADDR_GEN/odd_addr
add wave -noupdate /tb_fsm/dp/WR_ADDR_GEN/int_en_tilev_ptr
add wave -noupdate /tb_fsm/dp/WR_ADDR_GEN/int_en_tileh_ptr
add wave -noupdate /tb_fsm/dp/WR_ADDR_GEN/int_en_tileb_ptr
add wave -noupdate /tb_fsm/dp/WR_ADDR_GEN/int_en_tilec_ptr
add wave -noupdate /tb_fsm/dp/WR_ADDR_GEN/int_arv_tilev
add wave -noupdate /tb_fsm/dp/WR_ADDR_GEN/int_arv_tileh
add wave -noupdate /tb_fsm/dp/WR_ADDR_GEN/int_arv_tileb
add wave -noupdate /tb_fsm/dp/WR_ADDR_GEN/int_arv_tilec
add wave -noupdate /tb_fsm/dp/WR_ADDR_GEN/int_en_page_ptr
add wave -noupdate /tb_fsm/dp/WR_ADDR_GEN/int_tc_page
add wave -noupdate /tb_fsm/dp/WR_ADDR_GEN/int_page_ptr
add wave -noupdate /tb_fsm/dp/WR_ADDR_GEN/int_inc_even
add wave -noupdate /tb_fsm/dp/WR_ADDR_GEN/int_inc_odd
add wave -noupdate /tb_fsm/dp/int_tc_wr
add wave -noupdate /tb_fsm/dp/RD_ADDR_GEN/ck
add wave -noupdate /tb_fsm/dp/RD_ADDR_GEN/rst
add wave -noupdate /tb_fsm/dp/RD_ADDR_GEN/en_tilev_ptr
add wave -noupdate /tb_fsm/dp/RD_ADDR_GEN/arv_tilev
add wave -noupdate /tb_fsm/dp/RD_ADDR_GEN/arv_tileh
add wave -noupdate /tb_fsm/dp/RD_ADDR_GEN/arv_tileb
add wave -noupdate /tb_fsm/dp/RD_ADDR_GEN/arv_tilec
add wave -noupdate /tb_fsm/dp/RD_ADDR_GEN/s_tc_tilev
add wave -noupdate /tb_fsm/dp/RD_ADDR_GEN/s_tc_tileh
add wave -noupdate /tb_fsm/dp/RD_ADDR_GEN/s_tc_tileb
add wave -noupdate /tb_fsm/dp/RD_ADDR_GEN/s_tc_tilec
add wave -noupdate /tb_fsm/dp/RD_ADDR_GEN/int_en_tilev_ptr
add wave -noupdate /tb_fsm/dp/RD_ADDR_GEN/int_en_tileh_ptr
add wave -noupdate /tb_fsm/dp/RD_ADDR_GEN/int_en_tileb_ptr
add wave -noupdate /tb_fsm/dp/RD_ADDR_GEN/int_en_tilec_ptr
add wave -noupdate /tb_fsm/dp/RD_ADDR_GEN/int_tilev_ptr
add wave -noupdate /tb_fsm/dp/RD_ADDR_GEN/int_tileh_ptr
add wave -noupdate /tb_fsm/dp/RD_ADDR_GEN/int_tileb_ptr
add wave -noupdate /tb_fsm/dp/RD_ADDR_GEN/int_tilec_ptr
add wave -noupdate /tb_fsm/dp/RD_ADDR_GEN/int_arv_tilev
add wave -noupdate /tb_fsm/dp/RD_ADDR_GEN/int_arv_tileh
add wave -noupdate /tb_fsm/dp/RD_ADDR_GEN/int_arv_tileb
add wave -noupdate /tb_fsm/dp/RD_ADDR_GEN/int_arv_tilec
add wave -noupdate /tb_fsm/dp/RD_ADDR_GEN/int_en_page_ptr
add wave -noupdate /tb_fsm/dp/RD_ADDR_GEN/int_tc_page
add wave -noupdate /tb_fsm/dp/RD_ADDR_GEN/int_page_ptr
add wave -noupdate /tb_fsm/dp/RD_ADDR_GEN/int_inc_even
add wave -noupdate /tb_fsm/dp/RD_ADDR_GEN/int_inc_odd
add wave -noupdate /tb_fsm/dp/RD_ADDR_GEN/int_even_offset
add wave -noupdate /tb_fsm/dp/RD_ADDR_GEN/int_odd_offset
add wave -noupdate /tb_fsm/dp/RD_ADDR_GEN/int_offset_val
add wave -noupdate /tb_fsm/dp/RD_ADDR_GEN/int_even_addr
add wave -noupdate /tb_fsm/dp/RD_ADDR_GEN/int_odd_addr
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {416574 ps} 1} {{Cursor 2} {0 ps} 0}
configure wave -namecolwidth 274
configure wave -valuecolwidth 40
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
WaveRestoreZoom {0 ps} {6562512 ps}
