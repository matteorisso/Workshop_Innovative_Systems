vcom -93 -work ./work ../src/param.vhd
vcom -93 -work ./work ../src/fa.vhd 
vcom -93 -work ./work ../src/add_sub.vhd
vcom -93 -work ./work ../src/regn.vhd
vcom -93 -work ./work ../src/ff.vhd
vcom -93 -work ./work ../src/sign_ext.vhd
vcom -93 -work ./work ../src/pe.vhd
vcom -93 -work ./work ../src/counter.vhd
vcom -93 -work ./work ../src/comparator.vhd
vcom -93 -work ./work ../src/mux2to1.vhd
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
add wave -radix binary   -color GREEN      sim:/fully_connected_all_tb/tb_en_reg_acc
add wave -radix binary   -color GREEN      sim:/fully_connected_all_tb/tb_en_reg_in
add wave -radix binary   -color GREEN      sim:/fully_connected_all_tb/tb_rst_cnt1
add wave -radix binary   -color GREEN      sim:/fully_connected_all_tb/tb_en_cnt1
add wave -radix binary   -color GREEN      sim:/fully_connected_all_tb/tb_rst_cnt2
add wave -radix binary   -color GREEN      sim:/fully_connected_all_tb/tb_en_cnt2
add wave -radix binary   -color GREEN      sim:/fully_connected_all_tb/tb_rst_fsm
add wave -radix binary   -color GREEN      sim:/fully_connected_all_tb/tb_start_l1
add wave -radix binary   -color GREEN      sim:/fully_connected_all_tb/tb_start_l2
add wave -radix binary   -color RED        sim:/fully_connected_all_tb/tb_ifmap
add wave -radix binary   -color RED        sim:/fully_connected_all_tb/tb_weights
add wave -radix binary   -color RED        sim:/fully_connected_all_tb/tb_ofmap
add wave -radix binary   -color RED        sim:/fully_connected_all_tb/tb_cnt1
add wave -radix binary   -color RED        sim:/fully_connected_all_tb/tb_cnt2
add wave -radix binary   -color RED        sim:/fully_connected_all_tb/tb_eq
add wave -radix binary   -color RED        sim:/fully_connected_all_tb/tb_eq2
add wave -radix binary   -color RED        sim:/fully_connected_all_tb/tb_layer_fc

run 2500 ns
