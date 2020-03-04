clear all
clc

%TEST PARAMETERS
%channel length 
L = 1.00E-07;
%transistor width
W = 1.00E-06;
%ratio of mobilities pmos/nmos
Beta = 2;

%FILE PARAMETERS
%output capacitance of the driver driving the gates of the pmos inside the precharge unit	
	C_ext_pu_driver	= 20E-16*L;
%gate capacitante of a pmos inside the precharge unit	
	Cg_pre = Beta*5E-16*L;
%gate capacitance of the pmos equalizer inside the precharge unit	
	Cg_equalizer = Beta*5E-16*L;
%output resistance of the driver driving the gates of the pmos inside the precharge unit	
	R_ext_pu_driver = 50;
%equivalent resistance of the precharge pmos driving the bitline	
	Req_pre_p = 200;
%source capacitance of the precharge pmos driving the bitline	
	Cs_pre = Beta*1.7E-16*L;
%interconnect resistance per unit of length of the bitline	
	BL_r = 1.00E+07;
%interconnect capacitance per unit of length of the bitline	
	BL_c = 3.06E-11;
%interconnect capacitance per unit of length of the wordline	    
    WL_c = 3.06E-11;
%drain capacitance of the sense amplifier p-MOS transistor	
	Cd_sa_p = Beta*1.7E-16*L;
%drain capacitance of the sense amplifier n-MOS transistor	
	Cd_sa_n = 1.7E-16*L;
%gate capacitance of the sense amplifier p-MOS transistor	
	Cg_sa_p = Beta*5E-16*L;
%gate capacitance of the sense amplifier n-MOS transistor	
	Cg_sa_n = 5E-16*L;
%drain capacitance of the evaluation n-mos transistor in the block decoder	
	Cd_bdec_n = 1.7E-16*L;
%drain capacitance of the evaluation n-mos transistor in the row decoder	
	Cd_rdec_n = 1.7E-16*L;
%gate capacitance of a nmos inside the block decoder	
	Cg_bdec_n = 5E-16*L;
%gate capacitance of a nmos inside the row decoder	
	Cg_rdec_n = 5E-16*L;
%drain capacitance of the pass transistor at the end of the bitline and connecting it to the external	
	Cd_blockpass = 1.7E-16*L;
%equivalent resistance of a nmos in the block decoder	
	Req_bdec_n = 200;
%drain capacitance of the precharge pmos inside the dynamic block decoder	
	Cd_bdec_pcharge = Beta*1.7E-16*L;
%gate capacitance of the pmos inside the inverter on the output of the block decoder	
	Cg_bdec_inv_p = Beta*5E-16*L;
%gate capacitance of the nmos inside the inverter on the output of the block decoder	
	Cg_bdec_inv_n = 5E-16*L;
%equivalent resistance of the pmos inside the inverter on the output of the block decoder	
	Req_bdec_inv_p = 200;
%drain resistance of the pmos inside the inverter on the output of the block decoder	
	Cd_bdec_inv_p = Beta*1.7E-16*L;
%drain resistance of the nmos inside the inverter on the output of the block decoder	
	Cd_bdec_inv_n = 1.7E-16*L;
%gate capacitance of a row pass transistor, on the output of the row decoder and connecting it to the wordline	
	Cg_rowpass = 5E-16*L;
%gate capacitance of the pass transistor at the end of the bitline and connecting it to the external	
	Cg_blockpass = 5E-16*L;
%equivalent resistance of a nmos in the row decoder	
	Req_rdec_n = 200;
%drain capacitance of the precharge pmos inside the dynamic row decoder	
	Cd_rdec_pcharge = Beta*1.7E-16*L;
%gate capacitance of the pmos inside the inverter on the output of the row decoder	
	Cg_rdec_inv_p = Beta*5E-16*L;
%gate capacitance of the nmos inside the inverter on the output of the row decoder	
	Cg_rdec_inv_n = 5E-16*L;
%equivalent resistance of the pmos inside the inverter on the output of the row decoder	
	Req_rdec_inv_p = 200;
%drain capacitance of the p_MOS of the inverter on the output of the row decoder	
	Cd_rdec_inv_p = Beta*1.7E-16*L;
%drain capacitance of the n_MOS of the inverter on the output of the row decoder	
	Cd_rdec_inv_n = 1.7E-16*L;
%equivalent resistance of a row pass transistor, on the output of the row decoder and connecting it to the wordline	
	Req_rowpass = 200;
%drain capacitance of a row pass transistor, on the output of the row decoder and connecting it to the wordline	
	Cd_rowpass = 1.7E-16*L;
%equivalent resistance of the pull-down nmos inside the memory cell	
	Req_cell_n = 200;
%equivalent resistance of the memory cell access nmos transistor	
	Req_access_n = 200;
%gate capacitance of the memory cell access nmos transistor	
	Cg_access = 5E-16*L;
%drain capacitance of the memory cell access nmos transistor	
	Cd_access = 1.7E-16*L;
%source capacitance of the memory cell access nmos transistor	
	Cs_access = 1.7E-16*L;
%percentage of voltage swing that makes the sense amplifier switch	
	K_SA = 0.05;
%input sense amplifier resistance	
	Req_sa_mod_parallel = 100;
%equivalent resistance of a column pass transistor, at the end of the bitline and connecting it to the external	
	Req_colpass = 200;
%equivalent resistance of the external driver forcing the value to be written on the bitlines	
	Req_driver = 25;
%output capacitance of the external driver forcing the value to be written on the bitlines	
	C_driver = 40E-16*L;
%equivalent resistance of the pull-up pmos inside the memory cell	
	Req_cell_p = 200;
%gate capacitance of the pull-up pmos inside the memory cell	
	Cg_cell_p = Beta*5E-16*L;
%gate capacitance of the pull-down nmos inside the memory cell	
	Cg_cell_n = 5E-16*L;
%drain capacitance of the pull-up pmos inside the memory cell	
	Cd_cell_p = Beta*1.7E-16*L;
%drain capacitance of the pull-down nmos inside the memory cell	
	Cd_cell_n = 1.7E-16*L;
%number of words in the memory	
	N_word = 128;
%number of bits in each word	
	N_bit_array = [8, 16, 32, 64, 128];
%precharge voltage	
	V_bl_prec = 1.2;
%pass-transistor voltage	
	V_on_pt = 1.2;
%selected wordline voltage	
	V_sel = 1.2;
%unselected wordline voltage	
	V_unsel = 0;
%zero read voltage	
	V_rd_0 = 0.8;
%one read voltage	
	V_rd_1 = 1.2;
%programming bitline voltage	
	V_prog = 1.2;
%unprogramming bitline voltage	
	V_unprog = 0;
%Read frequency
    f_read = 5E6;
%Write frequency
    f_write = 5E6;
%number of write ports	
	N_port_Wr = 1;
%number of read ports	
	N_port_Rd = 2;
	
	Tr_n_Area = W*L;
	
	Tr_p_Area = Beta*Tr_n_Area;
%distance between columns of transistor	
	Pitch_pp = 3.00E-07;
		
		
		
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
	
%%COMPUTATIONS 

for i=1:numel(N_bit_array)
    N_bit = N_bit_array(i);

	[ total_read_power, total_write_power, Total_delay_read,  Total_delay_write] = Register_File (C_ext_pu_driver, ...
	Cg_pre, ...
	Cg_equalizer, ...
	R_ext_pu_driver, ...
	Req_pre_p, ...
	Cs_pre, ...
	BL_r, ...
	BL_c, ...
    WL_c, ...
	Cd_sa_p, ...
	Cd_sa_n, ...
	Cg_sa_p, ...
	Cg_sa_n, ...
	Cd_bdec_n, ...
	Cd_rdec_n, ...
	Cg_bdec_n, ...
	Cg_rdec_n, ...
	Cd_blockpass, ...
	Req_bdec_n, ...
	Cd_bdec_pcharge, ...
	Cg_bdec_inv_p, ...
	Cg_bdec_inv_n, ...
	Req_bdec_inv_p, ...
	Cd_bdec_inv_p, ...
	Cd_bdec_inv_n, ...
	Cg_rowpass, ...
	Cg_blockpass, ...
	Req_rdec_n, ...
	Cd_rdec_pcharge, ...
	Cg_rdec_inv_p, ...
	Cg_rdec_inv_n, ...
	Req_rdec_inv_p, ...
	Cd_rdec_inv_p, ...
	Cd_rdec_inv_n, ...
	Req_rowpass, ...
	Cd_rowpass, ...
	Req_cell_n, ...
	Req_access_n, ...
	Cg_access, ...
	Cd_access, ...
	Cs_access, ...
	K_SA, ...
	Req_sa_mod_parallel, ...
	Req_colpass, ...
	Req_driver, ...
	C_driver, ...
	Req_cell_p, ...
	Cg_cell_p, ...
	Cg_cell_n, ...
	Cd_cell_p, ...
	Cd_cell_n, ...
	N_word, ...
	N_bit,...
    V_bl_prec,...
	V_on_pt,...
	V_sel,...
	V_unsel,...
	V_rd_0,...
	V_rd_1,...
	V_prog,...
	V_unprog,...
    f_read,...
    f_write,...
	N_port_Wr,...			
	N_port_Rd,...			
	Tr_n_Area,...			
	Tr_p_Area,...			 
	Pitch_pp);		
	
	total_read_power_array(i) = total_read_power;
	total_write_power_array(i) =  total_write_power;
	Total_delay_read_array(i) = Total_delay_read;  
	Total_delay_write_array(i) = Total_delay_write;
    Total_area_array(i) = Total_delay_read;  
	Total_volume_array(i) = Total_delay_write;	
		
end
figure(1)
xq= 8:1:128;
s = spline(N_bit_array,Total_delay_read_array,xq); %xq coordinate x punti interpolazione, s coordinate y punti interpolazione
plot(N_bit_array,Total_delay_read_array, '*', xq, s)
title('Total delay - read')
xlabel('N_{bit}')
ylabel('Delay')
grid on
print('delay_read','-depsc')

figure(2)
xq= 8:1:128;
s = spline(N_bit_array,Total_delay_write_array,xq); %xq coordinate x punti interpolazione, s coordinate y punti interpolazione
plot(N_bit_array,Total_delay_write_array, '*', xq, s)
title('Total delay - write')
xlabel('N_{bit}')
ylabel('Delay')
grid on
print('delay_write','-depsc')

figure(3)
xq= 8:1:128;
s = spline(N_bit_array,Total_area_array,xq); %xq coordinate x punti interpolazione, s coordinate y punti interpolazione
plot(N_bit_array,Total_area_array, '*', xq, s)
title('Total area')
xlabel('N_{bit}')
ylabel('Area')
grid on

figure(4)
xq= 8:1:128;
s = spline(N_bit_array,Total_volume_array,xq); %xq coordinate x punti interpolazione, s coordinate y punti interpolazione
plot(N_bit_array,Total_volume_array, '*', xq, s)
title('Total volume')
xlabel('N_{bit}')
ylabel('Volume')
grid on

figure(5)
xq= 8:1:128;
s = spline(N_bit_array,total_read_power_array,xq); %xq coordinate x punti interpolazione, s coordinate y punti interpolazione
plot(N_bit_array,total_read_power_array, '*', xq, s)
title('Read Power')
xlabel('N_{bit}')
ylabel('Power')
grid on

figure(6)
xq= 8:1:128;
s = spline(N_bit_array,total_write_power_array,xq); %xq coordinate x punti interpolazione, s coordinate y punti interpolazione
plot(N_bit_array,total_write_power_array, '*', xq, s)
title('Write Power')
xlabel('N_{bit}')
ylabel('Power')
grid on