vcom -93 -work ./work ../src/fa.vhd
vcom -93 -work ./work ../src/rca.vhd

vcom -93 -work ./work ../tb/rca_tb_5.vhd

vsim -t ns -novopt work.rca_tb

set NumericStdNoWarnings 1 
run 0 ps
set NumericStdNoWarnings 0 

add wave -radix binary   -color GREEN      sim:/rca_tb/A_TB
add wave -radix binary   -color GREEN      sim:/rca_tb/B_TB
add wave -radix binary    -color GREEN      sim:/rca_tb/Ci_TB
add wave -radix binary   -color RED        sim:/rca_tb/S_TB
add wave -radix binary   -color RED        sim:/rca_tb/Co_TB

run 30 ns
