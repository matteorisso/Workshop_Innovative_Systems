vsim -L /software/dk/nangate45/verilog/msim6.2g work.tb_fc
vsim -L /software/dk/nangate45/verilog/msim6.2g -sdftyp /tb_fc/UUT=../netlist/fully_connected_all.sdf work.tb_fc
vcd file ../vcd/fully_connected_all_syn.vcd
vcd add /tb_fc/UUT/*

