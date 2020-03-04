function [ P_read, P_write, P_erase, Total_area, Total_volume, Total_delay ] = Memories3D (	N_slice,...
	C_g_fg,...
	C_d_fg,...
	C_g_pt,...
	C_d_pt,...
	C_wl_wire,...
	C_bl_wire,...
	C_ssl_wire,...	
	N_bl,...
	N_wl,...
	N_bit_word,...
	V_on_pt,...
	V_bl_prec,...
    V_bl_erase,...
	p_0,...
	E_tunnel,... 
	V_prog,...
	V_rd_sel,... 
	V_rd_unsel,... 
	V_rd_1,... 
	V_rd_0,...
	V_inhibit,...
	f_read,... 
	f_write,...
	f_erase,...
	R,...	
	C,... 
	I_on_driver,... 	
	C_ext_pu_driver,...
	Cg_pre,...
	R_ext_pu_driver,...
	Cg_sdec_n,...
	Cg_rdec_n,...
	Cg_cdec_n,...
	Cd_sdec_n,...
	Cd_rdec_n,...
	Cd_cdec_n,...
	Req_sdec_n,...			
	Cd_sdec_pcharge,...				
	Cg_sdec_inv_p,...
	Cg_sdec_inv_n,...
	Req_sdec_inv_p,...
	Cd_sdec_inv_p,...
	Cd_sdec_inv_n,...
	Req_rdec_n,...
	Cd_rdec_pcharge,...
	Cg_rdec_inv_p,...
	Cg_rdec_inv_n,...
	Req_rdec_inv_p,...
	Cd_rdec_inv_p,...
	Cd_rdec_inv_n,...
	Cd_cdec_pcharge,...
	Cg_cdec_inv_p,...
	Cg_cdec_inv_n,...
	Cd_sa_p,...
	Cd_sa_n,...
	Cg_sa_p,...
	Cg_sa_n,...
	Req_sa_mod_parallel,...
	K_SA,...	
	Req_slice,...
	Cd_slice,...
	Cg_slice,...
	Req_rowpass,...
	Cg_rowpass,...
	Cd_rowpass,...
	Req_colpass,...
	Cg_colpass,...
	Cd_colpass,...
	N_erase,... 	
	Tr_n_Area,...
	Tr_p_Area,...
	Pitch_pp,...
	Pitch_contact_PT,...
	Pitch_FGT_FGT,...
	Pitch_PT_FGT,...
	H_contact)
	


%% MEMORY PARAMETERS - COMPUTED %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% GEOMETRY PARAMETERS - COMPUTED
% width of the array of memory 
	W=N_bl*Pitch_pp;
% length of the array of memory 
	L=N_slice*Pitch_pp;
% height of the array of memory
	H=2*Pitch_contact_PT+((N_wl+2)-1)*Pitch_FGT_FGT+2*Pitch_PT_FGT+2*H_contact;
% length of bitline 
	L_bl=H;
% length of wordline 
	L_wl=W;
% Number of bit of the addresses
	Block_Address= ceil(log2(N_slice));
	Row_Address= ceil(log2(N_wl));
	Column_Address= ceil(log2(N_bl/N_bit_word));

%% COMMON PARAMETERS - COMPUTED
% wordline capacitance
	C_wl=Cd_rowpass + C_g_fg * N_bl + C_wl_wire * L_wl;
% bitline capacitance
	C_SA_in=Cd_sa_p+Cd_sa_n+Cg_sa_p+Cg_sa_n;
	C_bl=2*C_d_pt+N_wl*C_d_fg+C_bl_wire*L_bl+C_SA_in;
	C_SA=Cd_colpass+Cd_slice;
% decoder capacitance
	C_slice_stack=0.5*Cg_sdec_n*Block_Address*N_slice;
	C_row_stack=0.5*Cg_rdec_n*Row_Address*N_wl;
	C_col_stack=0.5*Cg_cdec_n*Column_Address*N_bl;
	Cd_sdec_eval=Block_Address*Cd_sdec_n;
	Cd_rdec_eval=Row_Address*Cd_rdec_n;
	Cd_cdec_eval=Column_Address*Cd_cdec_n;
	C_slice_dec=Cd_sdec_pcharge+Cd_sdec_eval+Cg_sdec_inv_p+Cg_sdec_inv_n;
	C_row_dec=Cd_rdec_pcharge+Cd_rdec_eval+Cg_rdec_inv_p+Cg_rdec_inv_n;
	C_col_dec=Cd_cdec_pcharge+Cd_cdec_eval+Cg_cdec_inv_p+Cg_cdec_inv_n;
	
	
%% READ POWER %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Slice decoder evaluation stack charge energy
	E_stack_sdec=0.5*C_slice_stack*(V_on_pt^2);
	
% Slice decoder energy
	E_slice_dec= 0.5*C_slice_dec*(V_on_pt)^2;

% energy to activate the selected slice
	E_row_pt= 0.5*(Cg_rowpass*(N_wl+2)+Cg_slice*N_bit_word)*V_on_pt^2;

%Row decoder evaluation stack charge energy
	E_stack_rdec=0.5*C_row_stack*(V_on_pt^2)*N_slice;
	
% Row decoder energy
	E_row_dec= 0.5*C_row_dec*((V_rd_sel)^2 + ((V_rd_unsel)^2)*(N_wl-1) + 2*(V_on_pt^2))*N_slice;

%Column decoder evaluation stack charge energy
	E_stack_cdec=0.5*C_col_stack*(V_on_pt^2)*N_slice;
	
% Column decoder energy
	E_col_dec= 0.5*C_col_dec*(V_on_pt)^2*N_slice;

% dissipated energy in the precharge block
	E_pre= 0.5*(C_ext_pu_driver+Cg_pre)*(V_bl_prec^2)*N_bl;
	
% dissipated energy in the precharge phase BL
	E_bl= 0.5*C_bl_wire*L_bl*(V_bl_prec^2)*N_bl;

% energy to switch the selected wordline WL
	E_sel= 0.5*C_wl*((V_rd_sel)^2);

% energy to switch the unselected wordlines WL
	E_unsel= 0.5*C_wl*((V_rd_unsel)^2)*(N_wl-1);

% energy to read a 1
	E_1=0.5*C_bl*((V_bl_prec-V_rd_1)^2)*N_bl*(1-p_0);

% energy to read a 0
	E_0=0.5*C_bl*((V_bl_prec-V_rd_0)^2)*N_bl*p_0;

% energy to activate SST and GST
	E_pt= 2*(0.5*C_g_pt*V_on_pt^2)*N_bl;

% energy on the string select line and ground select  line
	E_sl= 2*(0.5*(C_ssl_wire*L_wl)* V_on_pt^2);

% energy of the sense amplifier
	E_SA= 0.5*C_SA*V_bl_prec*((V_bl_prec-V_rd_0)*p_0+(V_bl_prec-V_rd_1))*(1-p_0)*N_bl;

% energy to read the selected bitline
	E_col_pt= 0.5*N_bit_word*Cg_colpass*V_on_pt^2;
	
%total read energy
	E_read=E_stack_sdec+E_slice_dec+E_row_pt+E_stack_rdec+E_row_dec+E_stack_cdec+E_col_dec+E_pre+E_bl+E_sel+E_unsel+E_0+E_1+E_pt+E_sl+E_SA+E_col_pt;
	
% total read power
	P_read=E_read*f_read;           %output of the function

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% WRITE POWER %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Slice decoder evaluation stack charge energy
	E_stack_sdec=0.5*C_slice_stack*(V_on_pt^2);
	
% Slice decoder energy
	E_slice_dec= 0.5*C_slice_dec*(V_on_pt)^2;

% energy to activate the selected slice
	E_row_pt= 0.5*(Cg_rowpass*(N_wl+2)+Cg_slice*N_bit_word)*V_on_pt^2;

%Row decoder evaluation stack charge energy
	E_stack_rdec=0.5*C_row_stack*(V_on_pt^2)*N_slice;
	
% Row decoder energy
	E_row_dec= 0.5*C_row_dec*((V_prog)^2 + ((V_inhibit)^2)*(N_wl-1) + 2*(V_on_pt^2))*N_slice;

% dissipated energy in the precharge block
	E_pre= 0.5*(C_ext_pu_driver+Cg_pre)*(V_bl_prec^2)*N_bl;
	
% energy to precharge the bitlines
	E_bl= 0.5*C_bl_wire*L_bl*(V_bl_prec^2)*N_bl;
	
% energy to switch the selected wordline
	E_sel=0.5*C_wl*(V_prog)^2;

% energy to switch unselected wordlines
	E_unsel=0.5*C_wl*(V_inhibit)^2*(N_wl-1);

% inhibit energy (to mantain 1)										
	E_bl_inhibit=0.5*(C_bl-C_d_fg*N_wl)*((0.8*V_inhibit)^2)*N_bl*(1-p_0);

% write energy (to write 0)
	E_bl_sel=(0.5*(C_bl-C_d_fg*N_wl)*(0-V_bl_prec)^2 + E_tunnel)*N_bl*p_0;

% SST/GST energy
	E_pt= 2*(0.5*C_g_pt*V_on_pt^2)*N_bl;

% energy on the string select line and ground select  line
	E_sl= 2*(0.5*(C_ssl_wire*L_wl)* V_on_pt^2);

% total write energy
	E_write=E_stack_sdec+E_slice_dec+E_row_pt+E_stack_rdec+E_row_dec+E_pre+E_bl+E_sel+E_unsel+E_bl_inhibit+E_bl_sel+E_pt+E_sl;

% total write power
P_write=E_write*f_write;            %output of the function

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% ERASE POWER %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Slice decoder evaluation stack charge energy
	E_stack_sdec=0.5*C_slice_stack*(V_on_pt^2);
	
% Slice decoder energy
	E_slice_dec= 0.5*C_slice_dec*(V_on_pt)^2;

% energy to activate the selected slice
	E_row_pt= 0.5*(Cg_rowpass*(N_wl+2)+Cg_slice*N_bit_word)*V_on_pt^2;

%Row decoder evaluation stack charge energy
	E_stack_rdec=0.5*C_row_stack*(V_on_pt^2)*N_slice;
	
% Row decoder energy
	E_row_dec= 0.5*C_row_dec*((V_bl_erase)^2*N_wl+2*(V_on_pt^2))*N_slice;

% dissipated energy in the precharge block
	E_pre= 0.5*(C_ext_pu_driver+Cg_pre)*(V_bl_prec^2)*N_bl;
	
% energy to precharge the bitline
	E_bl= 0.5*C_bl_wire*L_bl*(V_bl_prec^2)*N_bl;

% energy to start erasing the block
	E_erase_slice=0.5*(C_bl)*((V_bl_erase-V_bl_prec)^2)*N_bl+E_tunnel*N_bl*N_wl;

% SST/GST energy
	E_pt= 2*(0.5*C_g_pt*V_on_pt^2)*N_bl;

% energy on the string select line and ground select  line
	E_sl= 2*(0.5*(C_ssl_wire*L_wl)* V_on_pt^2);

% total erase energy
	E_erase=E_stack_sdec+E_slice_dec+E_row_pt+E_stack_rdec+E_row_dec+E_pre+E_bl+(E_erase_slice+E_pt+E_sl)*N_erase;

% total erase power
P_erase=E_erase*f_erase;            %output of the function

%% DELAY %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%total delay: computed in a read operation (which includes also a precharge operation)
del=0;

%Delay to activate precharge unit - RC delay 
    del = (C_ext_pu_driver+Cg_pre)*R_ext_pu_driver + del;

%Precharge delay
    del = ((C_bl_wire*L_bl)*V_bl_prec)/I_on_driver + del;

%Block decoder delay - Gate delay
	Req_n=Req_sdec_n;
	Cd=Cd_sdec_pcharge+Cd_sdec_eval;
	Cl=Cg_sdec_inv_p+Cg_sdec_inv_n;
	Stack_n=Block_Address;
	R_n=Stack_n*Req_n;
    del_block_dec=R_n*(Cd+Cl);
	
%Inverter on block decoder's output delay - Gate delay
	Req_p=Req_sdec_inv_p;
	Cd=Cd_sdec_inv_p+Cd_sdec_inv_n;
	Cl=Cg_rowpass*(N_wl+2)+Cg_slice*N_bit_word;
	Stack_p=1;
	R_p=Stack_p*Req_p;
	del_block_inv=R_p*(Cd+Cl);

%Row decoder delay - Gate delay
	Req_n=Req_rdec_n;
	Cd=Cd_rdec_pcharge+Cd_rdec_eval;
	Cl=Cg_rdec_inv_p+Cg_rdec_inv_n;
	Stack_n=Row_Address;
	R_n=Stack_n*Req_n;
    del_row_dec=R_n*(Cd+Cl);

%Word line charge delay - Elmore delay
	Req_inv=Req_rdec_inv_p;
	Cd_inv=Cd_rdec_inv_p+Cd_rdec_inv_n;
	Req_pass=Req_rowpass;
	Cd_pass=Cd_rowpass;
	Cl=C_g_pt*N_bl;
	del_row_inv = (Req_inv*(Cd_inv+Cd_pass+Cl)+Req_pass*(Cd_pass+Cl));

%Bit line delay (the K_SA factor is the fraction of the bit line
%delay that influences the total delay, because afterwards the sense
%amplifier is triggered. About 5-10 mV should be the initial differential
%signal for the sense amplifier) - Elmore delay
	k=0;
	tau_eval=0;
	% evaluation delay
	for i=1:length(R)
		k=k+R(i);
		tau_eval=tau_eval+C(i)*k;
	end
	del=K_SA*tau_eval + del;

%Sense amplifier delay
    del=Req_sa_mod_parallel*(Cd_sa_p+Cd_sa_n+Cg_sa_p+Cg_sa_n+(C_bl_wire*L_bl)+Cd_colpass) + del;
	
%Column pass transistor and slice transistor delay (after switching of SA) - Elmore delay
	Req_pass=Req_colpass;
	Cd_pass=Cd_colpass;
	Cl=0;	%empty load condition
	del = (Req_pass*(Cd_pass+Cd_slice+Cl)+Req_slice*(Cd_slice+Cl)) + del;

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

Total_delay=0.69*del;

%% AREA AND VOLUME %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% block decoder
	n_Tr_n_Block_Dec = Block_Address*N_slice+N_slice+Block_Address;
	n_Tr_p_Block_Dec = 2*N_slice+ Block_Address;
	Block_Dec_Area = n_Tr_n_Block_Dec*Tr_n_Area + n_Tr_p_Block_Dec*Tr_p_Area;
% row decoder
	n_Tr_n_Row_Dec = Row_Address*(N_wl+2)+(N_wl+2)+Row_Address;
	n_Tr_p_Row_Dec = 2*(N_wl+2)+ Row_Address;
	Row_Dec_Area = n_Tr_n_Row_Dec*Tr_n_Area + n_Tr_p_Row_Dec*Tr_p_Area;			
% colum decoder
	n_Tr_n_Column_Dec = Column_Address*N_bl+N_bl+Column_Address;
	n_Tr_p_Column_Dec = 2*N_bl+ Column_Address;
	Column_Dec_Area = n_Tr_n_Column_Dec*Tr_n_Area + n_Tr_p_Column_Dec*Tr_p_Area;	
%pass_block_row
	n_Tr_n_pass_row_Area = (N_wl+2)*Tr_n_Area;										
%pass_block_column post-sense
	n_Tr_n_pass_column_Area = N_bl*Tr_n_Area;									
%pass_block_slice
	n_Tr_n_pass_slice_Area = N_bit_word*Tr_n_Area;											
%precharge_p_mos
	n_Tr_p_precharge_Area = N_bl*Tr_p_Area;										
% sense amplifier
	n_Tr_n_SA = N_bl*3;
	n_Tr_p_SA = N_bl*3;
	SA_Area = n_Tr_n_SA*Tr_n_Area + n_Tr_p_SA*Tr_p_Area;							       

%Boundary component area (block decoder, row decoder, colum decoder, sence amplifier, pass transistors, precharge_p_mos)
	Area_bound_comp = Block_Dec_Area + Row_Dec_Area + Column_Dec_Area + SA_Area + n_Tr_n_pass_row_Area + n_Tr_n_pass_column_Area + n_Tr_n_pass_slice_Area + n_Tr_p_precharge_Area; 
%Boundary component Volume (block decoder, row decoder, colum decoder, sence amplifier, pass transistors, precharge_p_mos)
	Volume_bound_comp = Area_bound_comp*L;		

% array area
	Area_memory=H*W;
% array volume
	Volume_memory=Area_memory*L;         					
	
% total area (total number of transistor * area of single transistor)
    Total_area = Area_memory + Area_bound_comp;				%output of the function
% total volume (sum of volumes memory and boundary component)
	Total_volume = Volume_memory + Volume_bound_comp;		%output of the function

end