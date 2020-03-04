%% THRESHOLD VOLTAGE USING MASTAR EQUATIONS FOR SOI DEVICES
% Implementation of an Vth model for SOI technology with equations derived by Mastar 4 model using OCTAVE. All main contributions to the Vth value are considered (QME, PDE, SCE, DIBL)
%%

%For SOI Xj=Tsi;
 

%% 
% Intrinsic doping calculation.
% Fitting from Mastar
ni_temp = ni /3.79;   % Fitting from Mastar
%%

%%
% Phi_f
Phi_f=Vt*log(Nbulk/ni_temp);
%%

Phi_d = Vt*log(Next*Nbulk/ni^2);
%%

% Flat-band voltage evaluation
Vfb= Phi_m -(Xs + Eg/2 + Phi_f);
%% 	

%%
% Vbi
Vbi=Vt*log(Nbulk*Next/ni_temp^2);
%%

%%
% Depletion charge evaluation
Qdep=sqrt(2*es*e0*q*Nbulk*Phi_d); %changed
%Qdep=sqrt(2*es*e0*q*Nbulk*(2*Phi_f));
%%

%%
% Electrical oxide thickness evaluation considering the effect of Dark Space and Polysilicon depletion
Tox_el = Tox+ Darks+ (esio2/es)*Polyd+ (esio2/es)*Darks; %changed
 %Tox_el = Tox* esio2/es+ Darks+Polyd;
%%

%%
% Oxide capacitance evaluation [F/cm^2]
Cox=esio2*e0/(Tox_el*1e-7);  
%%

%Silicon overlay capacitance evaluation [F/cm^2]
Csi=es*e0/(Tsi*1e-7); 
%%

% Long channel threshold voltage
Vtlong=[Vfb+2*Phi_f+(Qdep/Cox)]

%%
% Channel electric length [nm]
Lel=Lgate-Gamma*Tsi;   

%%
% Depletion depth calculation
%In MASTAR models, Tdep=Tsi
Tdep=7.60;

%%Fitting parameters from MASTAR
eta=1; %for SOI case, =0 for bulk & DG case
beta=0.16;


%% 
% Short Channel Effect (SCE) and Drain Induced Barrier Lowering (DIBL) evaluation

factor=1+(Tsi/Lel)^2; %

% Short Channel Effect (SCE) [V]
SCE=(es/esio2)*(factor*(Tox_el/Lel)*(Tdep/Lel)*Phi_d) %changed

% Drain Induced Barrier Lowering (DIBL) [V]
Tdep_dibl=Tsi+eta*((Lel-Tsi)*3*Tbox)/((Lel-Tsi)+3*Tbox);
Tx= (Tsi+3*Tbox);
Delta_DIBL_box=(Tox_el*Tsi/Lel^2)*(sqrt(Tx^2-Lel^2)/Lel)*Vdd;
DIBL=0.77*(es/esio2)*(factor*(Tox_el/Lel)*(Tdep_dibl/Lel)*Vdd)+(beta*Delta_DIBL_box) %changed

%% 
% Final value of threshold voltage calculation [V]
Vth=Vtlong-SCE-DIBL;    
%% 

%% 
% P and N mos Vth
Vth_n = Vth;  
Vth_p = -Vth; 
%%


