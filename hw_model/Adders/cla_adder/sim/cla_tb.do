vcom -93 -work ./work ../src/Partial_Full_Adder.vhd 
vcom -93 -work ./work ../src/Carry_Look_Ahead.vhd

vcom -93 -work ./work ../tb/cla_tb.vhd

vsim -t ns -novopt work.cla_tb

set NumericStdNoWarnings 1 
run 0 ps
set NumericStdNoWarnings 0 

add wave -radix binary   -color GREEN      sim:/cla_tb/A_TB
add wave -radix binary   -color GREEN      sim:/cla_tb/B_TB
add wave -radix binary   -color GREEN      sim:/cla_tb/Ci_TB
add wave -radix binary   -color RED        sim:/cla_tb/S_TB
add wave -radix binary   -color RED        sim:/cla_tb/Co_TB

run 100 ns
