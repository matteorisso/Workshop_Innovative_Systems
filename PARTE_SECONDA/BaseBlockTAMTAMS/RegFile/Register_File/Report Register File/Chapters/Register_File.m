function [ total_read_power, total_write_power, Total_delay_read,  Total_delay_write,Total_area, Total_volume] = Register_File (C_ext_pu_driver, ...
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
Pitch_pp)				

%% MEMORY PARAMETERS - COMPUTED %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

N_block = ceil(N_word/N_bit);
N_wl=min(N_word,N_bit);
Block_Address= ceil(log2(N_block));
Row_Address= ceil(log2(N_wl));


%% GEOMETRY PARAMETERS - COMPUTED
% width of the array of memory 
	Area_BitCell=2*(N_port_Wr+N_port_Rd)*Tr_n_Area+2*(Tr_n_Area+Tr_p_Area);
	W=(2*(N_port_Wr+N_port_Rd)*Pitch_pp+sqrt(Area_BitCell))*N_bit+Pitch_pp*(N_bit-1);
% length of the array of memory 
	L=N_block*Pitch_pp; %ok
% height of the array of memory
	H=((N_port_Wr+N_port_Rd)*Pitch_pp+sqrt(Area_BitCell))*N_bit+Pitch_pp*(N_bit-1);
% length of bitline 
    BL_length=H;
% length of wordline 
	WL_length=W;
	
%% COMMON PARAMETERS - COMPUTED
	Cd_bdec_eval=Block_Address*Cd_bdec_n;
	Cd_rdec_eval=Row_Address*Cd_rdec_n;


	
%Computed Capacitances
Cd_access_l=(Cd_access*N_wl)/BL_length;
Cg_access_l=2*(Cg_access*N_bit)/WL_length;
C_prec=C_ext_pu_driver+2*Cg_pre+Cg_equalizer;
C_SA_in=Cd_sa_p+Cd_sa_n+Cg_sa_p+Cg_sa_n;
C_bl=Cs_pre+BL_length*BL_c+Cd_access*N_wl+C_SA_in;
C_bl_write=C_ext_pu_driver+BL_length*BL_c+Cd_access*N_wl;
C_wl=Cd_rowpass+WL_c*WL_length+2*Cg_access*N_bit; 
C_block_stack=Cg_bdec_n*Block_Address*N_block;
Cd_block_dec=Cd_bdec_pcharge+Cd_bdec_eval+Cg_bdec_inv_p+Cg_bdec_inv_n;
C_row_stack=Cg_rdec_n*Row_Address*N_wl;
Cd_row_dec=Cd_rdec_pcharge+Cd_rdec_eval+Cg_rdec_inv_p+Cg_rdec_inv_n;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%READ ENERGY
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
total_read_energy=0;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Precharge path
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Precharge unit energy
	total_read_energy=0.5*C_prec*((V_on_pt)^2)*N_bit+total_read_energy;
    
%Bit line charge energy
	total_read_energy=0.5*C_bl*(2*(V_bl_prec)^2)*N_bit+total_read_energy;  %for both bit lines
 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%    
%Cell selecting path (DECODERS)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Block decoder evaluation stack charge energy
	total_read_energy=0.5*C_block_stack*(V_on_pt^2)+total_read_energy;
	
%Block decoder energy
	total_read_energy=0.5*Cd_block_dec*(V_on_pt^2)+total_read_energy;

%Row decoder evaluation stack charge energy
	total_read_energy=0.5*C_row_stack*(V_on_pt^2)*N_block+total_read_energy;
	
%Row decoder energy
	total_read_energy=0.5*Cd_row_dec*(V_sel^2+(N_wl-1)*V_unsel^2)*N_block+total_read_energy;

%Selection block energy
	total_read_energy= 0.5*(Cg_rowpass*N_wl+Cg_blockpass*N_bit)*V_on_pt^2+total_read_energy;

%Selected and Unselected Word lines energy
	total_read_energy=0.5*C_wl*(V_sel^2+(N_wl-1)*V_unsel^2)+total_read_energy;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Sensing path
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Bit line discharge energy (sensing energy is included)
	total_read_energy=0.5*C_bl*V_bl_prec*(abs(V_bl_prec-V_rd_0)+abs(V_bl_prec-V_rd_1))*N_bit+total_read_energy;

% energy of the sense amplifier
	total_read_energy= 0.5*Cd_blockpass*V_bl_prec*(abs(V_bl_prec-V_rd_0)+abs(V_bl_prec-V_rd_1))*N_bit+total_read_energy;

 total_read_power = total_read_energy*f_read;


 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%WRITE ENERGY
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Precharge path
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
total_write_energy=0;
%Load charge energy
	total_write_energy=0.5*C_bl_write*((V_prog)^2+(V_unprog)^2)*N_bit+total_write_energy;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%    
%Cell selecting path (DECODERS)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Block decoder evaluation stack charge energy
	total_write_energy=0.5*C_block_stack*(V_on_pt^2)+total_write_energy;
	
%Block decoder energy
	total_write_energy=0.5*Cd_block_dec*(V_on_pt^2)+total_write_energy;

%Row decoder evaluation stack charge energy
	total_write_energy=0.5*C_row_stack*(V_on_pt^2)*N_block+total_write_energy;
	
%Row decoder energy
	total_write_energy=0.5*Cd_row_dec*(V_sel^2+(N_wl-1)*V_unsel^2)*N_block+total_write_energy;

%Selection block energy
	total_write_energy= 0.5*(Cg_rowpass*N_wl)*(V_on_pt^2)+total_write_energy;
	
%Selected and Unselected Word lines energy
	total_write_energy=0.5*C_wl*(V_sel^2+(N_wl-1)*V_unsel^2)+total_write_energy;

 total_write_power = total_write_energy*f_write;
 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
%% DELAY 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%READ DELAY
%total delay: computed in a read operation (which includes also a precharge
%operation)
del=0;

%Delay to activate precharge unit - RC delay 
    del = del + R_ext_pu_driver*(C_ext_pu_driver+2*Cg_pre+Cg_equalizer);

%Precharge delay - Bakoglu delay
	Rd=Req_pre_p;
	Cd=Cs_pre;
	r=BL_r;
	c=BL_c+Cd_access_l;
	l=BL_length;
	Cl=(Cd_sa_p+Cd_sa_n+Cg_sa_p+Cg_sa_n)+Cd_blockpass;
    del = del + ((Rd*(Cd+c*l+Cl)+r*l*Cl)+0.377/0.69*(r*c*l^2));

%Block decoder delay - Gate delay
	Req_n=Req_bdec_n;
	Cd=Cd_bdec_pcharge+Cd_bdec_eval;
	Cl=Cg_bdec_inv_p+Cg_bdec_inv_n;
	Stack_n=Block_Address;
	R_n=Stack_n*Req_n;
    del_block_dec=R_n*(Cd+Cl);
	
%Inverter on block decoder's output delay - Gate delay
	Req_p=Req_bdec_inv_p;
	Cd=Cd_bdec_inv_p+Cd_bdec_inv_n;
	Cl=N_wl*Cg_rowpass+2*N_bit*Cg_blockpass;
	Stack_p=1;
	R_p=Stack_p*Req_p;
	del_block_inv = R_p*(Cd+Cl);

%Row decoder delay - Gate delay
	Req_n=Req_rdec_n;
	Cd=Cd_rdec_pcharge+Cd_rdec_eval;
	Cl=Cg_rdec_inv_p+Cg_rdec_inv_n;
	Stack_n=Row_Address;
	R_n=Stack_n*Req_n;
    del_row_dec=R_n*(Cd+Cl);

%Word line charge delay - Elmore delay (l'inverter del decoder di riga lo considero qui)
	Req_inv=Req_rdec_inv_p;
	Cd_inv=Cd_rdec_inv_p+Cd_rdec_inv_n;
	Req_pass=Req_rowpass;
	Cd_pass=Cd_rowpass;
	Cl=2*Cg_access_l*WL_length;	
	del_row_inv = (Req_inv*(Cd_inv+Cd_pass+Cl)+Req_pass*(Cd_pass+Cl));

%Bit line discharge delay (the 0.05 factor is the fraction of the bit line
%delay that influences the total delay, because afterwards the sense
%amplifier is triggered. About 5-10 mV should be the initial differential
%signal for the sense amplifier) - Distributed delay
	Rd=Req_cell_n+Req_access_n;
	Cd=Cd_access;
	r=BL_r;
	c=BL_c+Cd_access_l;
	l=BL_length;
	Cl=Cd_sa_p+Cd_sa_n+Cg_sa_p+Cg_sa_n+Cd_blockpass;
	del= del + K_SA*((Rd*(Cd+c*l+Cl)+r*l*Cl)+0.377/0.69*(r*c*l^2));
	
%Sense amplifier delay
    del= del + Req_sa_mod_parallel*(Cd_sa_p+Cd_sa_n+Cg_sa_p+Cg_sa_n+(BL_c*BL_length)+Cd_blockpass);
	
%Column pass transistor and block transistor delay (after switching of SA) - Elmore delay
	Req_pass=Req_colpass;
	Cd_pass=Cd_blockpass;
	Cl=0;	%assumo condizione a vuoto
	del = del + (Req_pass*(Cd_pass+Cl)); 

if(del_block_dec>del_row_dec) 
	del=del_block_dec+del;
else
	del=del_row_dec+del;
end

if(del_block_inv>del_row_inv) 
	del=del_block_inv+del;
else
	del=del_row_inv+del;
end

Total_delay_read=0.69*del;

%WRITE DELAY
%Block decoder delay - Gate delay
	Req_n=Req_bdec_n;
	Cd=Cd_bdec_pcharge+Cd_bdec_eval;
	Cl=Cg_bdec_inv_p+Cg_bdec_inv_n;
	Stack_n=Block_Address;
	R_n=Stack_n*Req_n;
    del_block_dec=R_n*(Cd+Cl);

%Inverter on block decoder's output delay - Gate delay
	Req_p=Req_bdec_inv_p;
	Cd=Cd_bdec_inv_p+Cd_bdec_inv_n;
	Cl=N_wl*Cg_rowpass;
	Stack_p=1;
	R_p=Stack_p*Req_p;
	del_block_inv = R_p*(Cd+Cl);
	
%Row decoder delay - Gate delay
	Req_n=Req_rdec_n;
	Cd=Cd_rdec_pcharge+Cd_rdec_eval;
	Cl=Cg_rdec_inv_p+Cg_rdec_inv_n;
	Stack_n=Row_Address;
	R_n=Stack_n*Req_n;
    del_row_dec=R_n*(Cd+Cl);

%Word line charge delay - Elmore delay (l'inverter del decoder di riga lo considero qui)
	Req_inv=Req_rdec_inv_p;
	Cd_inv=Cd_rdec_inv_p+Cd_rdec_inv_n;
	Req_pass=Req_rowpass;
	Cd_pass=Cd_rowpass;
	Cl=2*Cg_access_l*WL_length;	
	del_row_inv = (Req_inv*(Cd_inv+Cd_pass+Cl)+Req_pass*(Cd_pass+Cl));
	
if(del_block_dec>del_row_dec) 
	del=del_block_dec;
else
	del=del_row_dec;
end

if(del_block_inv>del_row_inv) 
	del=del_block_inv+del;
else
	del=del_row_inv+del;
end
	
%Driver delay - Bakoglu delay
	Rd=Req_driver;
	Cd=C_driver;
	r=BL_r;
	c=BL_c+Cd_access_l;
	l=BL_length;
	Cl=0;
    del = del + ((Rd*(Cd+c*l+Cl)+r*l*Cl)+0.377/0.69*(r*c*l^2));
	
%Cell delay
tau_1=1/(1/Req_cell_p+1/Req_access_n)*(Cg_cell_p+Cg_cell_n+Cd_cell_p+Cd_cell_n+Cs_access);
tau_2=Req_cell_p*(Cg_cell_p+Cg_cell_n+Cd_cell_p+Cd_cell_n+Cs_access);
del= del + 4*tau_1 + tau_2;
	
Total_delay_write=0.69*del;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% AREA AND VOLUME
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% block decoder
	n_Tr_n_Block_Dec = Block_Address*N_block+N_block+Block_Address;
	n_Tr_p_Block_Dec = 2*N_block+Block_Address;
	Block_Dec_Area = n_Tr_n_Block_Dec*Tr_n_Area + n_Tr_p_Block_Dec*Tr_p_Area;
% row decoder
	n_Tr_n_Row_Dec = Row_Address*N_wl+N_wl+Row_Address;									
	n_Tr_p_Row_Dec = 2*N_wl+ Row_Address;
	Row_Dec_Area = (N_port_Wr+N_port_Rd)*(n_Tr_n_Row_Dec*Tr_n_Area + n_Tr_p_Row_Dec*Tr_p_Area);				
% inverter bitline
	Inv_bl_Area = (N_port_Wr+N_port_Rd)*(N_bit*Tr_n_Area + N_bit*Tr_p_Area);										
% pass_block_row
	n_Tr_n_pass_row_Area = (N_port_Wr+N_port_Rd)*N_wl*Tr_n_Area;										
% pass_block_block
	n_Tr_n_pass_block_Area = N_block*N_port_Rd*Tr_n_Area;											
% precharge_p_mos
	n_Tr_p_precharge_Area = N_port_Rd*N_bit*(3*Tr_p_Area);										
% sense amplifier
	n_Tr_n_SA = N_bit*3;
	n_Tr_p_SA = N_bit*3;
	SA_Area = N_port_Rd*(n_Tr_n_SA*Tr_n_Area + n_Tr_p_SA*Tr_p_Area);							       

%Boundary component area (block decoder, row decoder, sense amplifier, pass transistors, precharge_p_mos)
	Area_bound_comp = 	Block_Dec_Area + Row_Dec_Area + SA_Area +...
						n_Tr_n_pass_row_Area  + n_Tr_n_pass_block_Area +...
						n_Tr_p_precharge_Area + Inv_bl_Area; 			
%Boundary component Volume (block decoder, row decoder, colum decoder, sense amplifier, pass transistors, precharge_p_mos)
	Volume_bound_comp = Area_bound_comp*L;		%first output from the function

% array area
	Area_memory=H*W; 
% array volume
	Volume_memory=Area_memory*L;         					%Second output from the function
	
% total area (total number of transistor * area of single transistor)
    Total_area = Area_memory + Area_bound_comp;
% total volume (sum of volumes memory and boundary component)
	Total_volume = Volume_memory + Volume_bound_comp;		%Third output from the function

end

