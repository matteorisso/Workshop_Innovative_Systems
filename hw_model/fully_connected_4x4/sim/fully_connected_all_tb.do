vcom -93 -work ./work ../src/param.vhd
vcom -93 -work ./work ../src/fa.vhd 
vcom -93 -work ./work ../src/adder_subn.vhd
vcom -93 -work ./work ../src/regn.vhd
vcom -93 -work ./work ../src/pe.vhd
vcom -93 -work ./work ../src/pe_block.vhd
vcom -93 -work ./work ../src/zero_skip.vhd
vcom -93 -work ./work ../src/countern.vhd
vcom -93 -work ./work ../src/mux_c.vhd
vcom -93 -work ./work ../src/mux_c2.vhd
vcom -93 -work ./work ../src/fully_connected.vhd
vcom -93 -work ./work ../src/fsm_fully_connected.vhd

vcom -93 -work ./work ../tb/fully_connected_all_tb.vhd

vsim -t ns -novopt work.fully_connected_all_tb

set NumericStdNoWarnings 1 
run 0 ps
set NumericStdNoWarnings 0 

add wave -radix binary   -color GREEN      sim:/fully_connected_all_tb/tb_clk
add wave -radix binary   -color GREEN      sim:/fully_connected_all_tb/tb_rst
add wave -radix binary   -color GREEN      sim:/fully_connected_all_tb/tb_sync_clr
add wave -radix binary   -color GREEN      sim:/fully_connected_all_tb/tb_ckg_rmask
add wave -radix binary   -color GREEN      sim:/fully_connected_all_tb/tb_ckg_cmask
add wave -radix binary   -color GREEN      sim:/fully_connected_all_tb/tb_rst_cnt1
add wave -radix binary   -color GREEN      sim:/fully_connected_all_tb/tb_en_cnt1
add wave -radix binary   -color GREEN      sim:/fully_connected_all_tb/tb_rst_cnt2
add wave -radix binary   -color GREEN      sim:/fully_connected_all_tb/tb_en_cnt2
add wave -radix binary   -color GREEN      sim:/fully_connected_all_tb/tb_rst_fsm
add wave -radix binary   -color GREEN      sim:/fully_connected_all_tb/tb_start
add wave -radix binary   -color RED        sim:/fully_connected_all_tb/tb_i_data
add wave -radix binary   -color RED        sim:/fully_connected_all_tb/tb_i_kernel
add wave -radix binary   -color RED        sim:/fully_connected_all_tb/tb_o_data
add wave -radix binary   -color RED        sim:/fully_connected_all_tb/tb_cnt1
add wave -radix binary   -color RED        sim:/fully_connected_all_tb/tb_cnt2
add wave -radix binary   -color RED        sim:/fully_connected_all_tb/tb_tc
add wave -radix binary   -color RED        sim:/fully_connected_all_tb/tb_tc2
add wave -radix binary   -color RED        sim:/fully_connected_all_tb/tb_layer_fc

run 2500 ns
