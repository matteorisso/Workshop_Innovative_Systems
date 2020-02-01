###################################################################

# Created by write_sdc on Fri Jan 31 19:58:27 2020

###################################################################
set sdc_version 1.9

set_units -time ns -resistance MOhm -capacitance fF -voltage V -current mA
set_load -pin_load 3.40189 [get_ports ctrl_en_npu]
set_load -pin_load 3.40189 [get_ports ctrl_en_hmode]
set_load -pin_load 3.40189 [get_ports ctrl_en_vmode]
set_load -pin_load 3.40189 [get_ports ctrl_ldh_v_n]
set_load -pin_load 3.40189 [get_ports ctrl_wr_pipe]
set_load -pin_load 3.40189 [get_ports ctrl_en_p]
set_load -pin_load 3.40189 [get_ports ctrl_wr_mem]
set_load -pin_load 3.40189 [get_ports done]
create_clock [get_ports ck]  -name MY_CLK  -period 4  -waveform {0 2}
set_clock_uncertainty 0.07  [get_clocks MY_CLK]
set_input_delay -clock MY_CLK  -max 0.5  [get_ports rst]
set_input_delay -clock MY_CLK  -max 0.5  [get_ports start]
set_input_delay -clock MY_CLK  -max 0.5  [get_ports s_tc_npu_ptr]
set_input_delay -clock MY_CLK  -max 0.5  [get_ports s_tc_hmode]
set_input_delay -clock MY_CLK  -max 0.5  [get_ports s_tc_vmode]
set_input_delay -clock MY_CLK  -max 0.5  [get_ports s_tc_res]
set_input_delay -clock MY_CLK  -max 0.5  [get_ports s_tc_tilev]
set_input_delay -clock MY_CLK  -max 0.5  [get_ports s_tc_tileh]
set_input_delay -clock MY_CLK  -max 0.5  [get_ports s_tc_ifmaps]
set_input_delay -clock MY_CLK  -max 0.5  [get_ports s_tc_ofmaps]
set_output_delay -clock MY_CLK  -max 0.5  [get_ports ctrl_en_npu]
set_output_delay -clock MY_CLK  -max 0.5  [get_ports ctrl_en_hmode]
set_output_delay -clock MY_CLK  -max 0.5  [get_ports ctrl_en_vmode]
set_output_delay -clock MY_CLK  -max 0.5  [get_ports ctrl_ldh_v_n]
set_output_delay -clock MY_CLK  -max 0.5  [get_ports ctrl_wr_pipe]
set_output_delay -clock MY_CLK  -max 0.5  [get_ports ctrl_en_p]
set_output_delay -clock MY_CLK  -max 0.5  [get_ports ctrl_wr_mem]
set_output_delay -clock MY_CLK  -max 0.5  [get_ports done]
