%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                       MAIN Nand2 time delay                             %              
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear all
close all
clc

%Permittivity
eps_0 = 8.854187e-12 *1e-9; %F/nm
eps_SiO2 = 3.9*eps_0; %F/nm

%Fringe capacitances
 fring_capHP2010 = 1.5e-16*1e-3; %F/nm
 fring_capLOP2010 = 2.2e-16*1e-3;
 fring_capLSTP2010 = 2.4e-16*1e-3;
 
 %Oxide thickness
 Tox_HP2010 = 0.65; %nm
 Tox_LOP2010 = 0.9;
 Tox_LSTP2010 = 1.4;
 
 %Channel length
 L_HP2010 = 18; %nm
 L_LOP2010 = 22;
 L_LSTP2010 = 28;
 
 %Voltage source
 VDD_HP2010 = 1; %V
 VDD_LOP2010 = 0.7;
 VDD_LSTP2010 = 1.1;
 
 prompt = 'Specify the nMOS channel width Wn (nm):  ';
Wn = input(prompt) %nm
 
%Total capacitance on output node of the Nand2 gate
 C_nd2_HP = 13.74 *(eps_SiO2*L_HP2010/Tox_HP2010 + fring_capHP2010 ...
     + 0.2*eps_SiO2*L_HP2010/Tox_HP2010)*Wn; %F
 C_nd2_LOP = 13.74 *(eps_SiO2*L_LOP2010/Tox_LOP2010 + fring_capLOP2010 ...
     + 0.2*eps_SiO2*L_LOP2010/Tox_LOP2010)*Wn; %F
 C_nd2_LSTP = 13.74 *(eps_SiO2*L_LSTP2010/Tox_LSTP2010 + fring_capLSTP2010 ...
     + 0.2*eps_SiO2*L_LSTP2010/Tox_LSTP2010)*Wn; %F
 
%  %Total capacitance on output node of the Inverter gate
%  C_inv_HP = 13.74 *(eps_SiO2*L_HP2010/Tox_HP2010 + fring_capHP2010 ...
%      + 0.2*eps_SiO2*L_HP2010/Tox_HP2010)*Wn/4;
%  C_inv_LOP = 13.74 *(eps_SiO2*L_LOP2010/Tox_LOP2010 + fring_capLOP2010 ...
%      + 0.2*eps_SiO2*L_LOP2010/Tox_LOP2010)*Wn/4;
%  C_inv_LSTP = 13.74 *(eps_SiO2*L_LSTP2010/Tox_LSTP2010 + fring_capLSTP2010 ...
%      + 0.2*eps_SiO2*L_LSTP2010/Tox_LSTP2010)*Wn/4;
%  
[Vth_nHP,Vth_pHP, Ioff_nHP, Ioff_pHP, Igate_nHP, Igate_pHP]= Mastar4_Vth_Ioff_IgHP2010();
[I_nMOSHP, I_pMOSHP, e0]= Ion_Mastar_modelHP2010(Vth_nHP); %uA/um

[Vth_nLOP,Vth_pLOP, Ioff_nLOP, Ioff_pLOP, Igate_nLOP, Igate_pLOP]= Mastar4_Vth_Ioff_IgLOP2010();
[I_nMOSLOP, I_pMOSLOP]= Ion_Mastar_modelLOP2010(Vth_nLOP); %uA/um

[Vth_nLSTP,Vth_pLSTP, Ioff_nLSTP, Ioff_pLSTP, Igate_nLSTP, Igate_pLSTP]= Mastar4_Vth_Ioff_IgLSTP2010();
[I_nMOSLSTP, I_pMOSLSTP]= Ion_Mastar_modelLSTP2010(Vth_nLSTP); %uA/um

%NAND2 delay evaluation
Wp = 1.29*Wn;
Tdp_HP_nd2 =  C_nd2_HP*VDD_HP2010/(I_pMOSHP*Wp*1e-3*1e-6); %s
Tdp_LOP_nd2 = C_nd2_LOP*VDD_LOP2010/(I_pMOSLOP*Wp*1e-3*1e-6); %s
Tdp_LSTP_nd2 = C_nd2_LSTP*VDD_LSTP2010/(I_pMOSLSTP*Wp*1e-3*1e-6); %s

% %Inverter delay evaluation
% Tdp_HP_inv =  C_inv_HP*VDD_HP2010/(I_pMOSHP*Wp*1e-3*1e-6);
% Tdp_LOP_inv = C_inv_LOP*VDD_LOP2010/(I_pMOSLOP*Wp*1e-3*1e-6);
% Tdp_LSTP_inv = C_inv_LSTP*VDD_LSTP2010/(I_pMOSLSTP*Wp*1e-3*1e-6);

%%
prompt = 'Specify the number of channel inputs:  ';
%select only powers of 2
Ninput = input(prompt);

%Time delay evaluation, s
tautotalHP =log2(Ninput)*2*Tdp_HP_nd2+Tdp_HP_nd2 %s
tautotalLOP =log2(Ninput)*2*Tdp_LOP_nd2+Tdp_LOP_nd2 %s
tautotalLSTP =log2(Ninput)*2*Tdp_LSTP_nd2+Tdp_LSTP_nd2 %s


 
 
 
 
