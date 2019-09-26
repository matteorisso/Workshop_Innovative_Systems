##src

@*  			: tmp, entity naming
param.pkg		: tmp, locally static bounds -> rm math_real 
weight_buffer	: tmp, constants
mem			: tmp, template
 

##simulation

- open project
- update files with new paths (rm all, add existing files) 

vsim> 	project compileoutofdate

- file->load-> input_pe_wave.do

vsim>		restart
vsim>		run 2 us 

