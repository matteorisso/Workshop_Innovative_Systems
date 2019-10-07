transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vcom -93 -work work {C:/Users/Antonio/Desktop/npu/regn.vhd}
vcom -93 -work work {C:/Users/Antonio/Desktop/npu/fulladder.vhd}
vcom -93 -work work {C:/Users/Antonio/Desktop/npu/pe.vhd}
vcom -93 -work work {C:/Users/Antonio/Desktop/npu/adder_subn.vhd}
vcom -93 -work work {C:/Users/Antonio/Desktop/npu/pe_block_param.vhd}
vcom -93 -work work {C:/Users/Antonio/Desktop/npu/regfile.vhd}
vcom -93 -work work {C:/Users/Antonio/Desktop/npu/pe_block.vhd}
vcom -93 -work work {C:/Users/Antonio/Desktop/npu/main_wrap.vhd}
vcom -93 -work work {C:/Users/Antonio/Desktop/npu/shifter.vhd}

