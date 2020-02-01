set NETLIST_DIR "../netlist"
set SAIF_DIR "../saif"
set DESIGN "dp" 
set TB "test"
set DUT "dp_inst"
set CLK 4

file delete -force -- work

file mkdir rpt
file mkdir log

read_verilog -netlist ${NETLIST_DIR}/${DESIGN}.v > log/netlist.log
read_saif -input ${SAIF_DIR}/${DESIGN}.saif -instance ${TB}/${DUT} -unit ns -scale 1 > log/saif.log
create_clock -name MY_CLK -period ${CLK} ck

report_power > rpt/saif-power.rpt

quit
