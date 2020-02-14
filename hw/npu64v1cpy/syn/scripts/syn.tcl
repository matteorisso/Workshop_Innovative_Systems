set DIR "../"
set DESIGN "dp" 
set CLK 4

pwd 

file delete -force -- work
file delete -force -- rpt
file delete -force -- log

file mkdir rpt
file mkdir log

# Analyze source files

analyze -f vhdl -l work ${DIR}/src/pkg/globals.pkg.vhd

set f [open ${DIR}/src/hier.txt r]
foreach src [split [read $f] "\n"] {
	if { $src ne "" } { 
	    analyze -f vhdl -l work ${DIR}/src/${src}
	}
}
set power_preserve_rtl_hier_names true
set power_cg_flatten true 

# Elaborate design

elaborate -lib work ${DESIGN} > log/elaborate.log 

uniquify 
link

create_clock -name MY_CLK -period ${CLK} ck

set_dont_touch_network MY_CLK
#set_dont_touch [get_cells "*/p_unit*"]


# Set constraints

# clock jitter
set_clock_uncertainty 0.07 [get_clocks MY_CLK] 


# input signal delay
set_input_delay 0.5 -max -clock MY_CLK [remove_from_collection [all_inputs] ck]


# output signal delay
set_output_delay 0.5 -max -clock MY_CLK [all_outputs]


# output load 
set OLOAD [load_of NangateOpenCellLibrary/BUF_X4/A]
set_load $OLOAD [all_outputs]

# Compile 

compile -gate_clock  > log/compile.log
#compile_ultra -gate_clock -no_autoungroup > log/compile.log

# Reports

report_clock > rpt/clock.rpt
report_resources > rpt/resources.rpt
report_area > rpt/area.rpt
report_timing > rpt/timing.rpt
report_power > rpt/power.rpt

# Verilog netlist

ungroup -all -flatten
# verilog rules for the names of the internal signals
change_names -hierarchy -rules verilog

# save netlist delay 
write_sdf ${DIR}/netlist/${DESIGN}.sdf

# save netlist
write -f verilog -output ${DIR}/netlist/${DESIGN}.v

# save i/o constraints
write_sdc ${DIR}/netlist/${DESIGN}.sdc

#quit
