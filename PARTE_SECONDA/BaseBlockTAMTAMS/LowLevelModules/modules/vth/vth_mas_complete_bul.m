%% THRESHOLD VOLTAGE USING MASTAR EQUATIONS
% Implementation of an Vth model with equations derived by Mastar 4 model using OCTAVE. All main contributions to the Vth value are considered (QME, PDE, SCE, DIBL)
%%

%% 
% Intrinsic doping calculation.
% Fitting from Mastar
ni_temp = ni /3.79;   % Fitting from Mastar
%%

%%
% Phi_f
Phi_f=Vt*log(Nbulk/ni_temp);
%%

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
Qdep=sqrt(2*es*e0*q*Nbulk*(2*Phi_f));
%%

%%
% Electrical oxide thickness evaluation considering the effect of Dark Space and Polysilicon depletion
Tox_el=Tox*3.9/esio2 + Darks/10 + Polyd/10;  
%%

%%
% Oxide capacitance evaluation [F/cm^2]
Cox=esio2*e0/(Tox_el*1e-7);  
%%

%%
% Long channel threshold voltage
Vtlong=Vfb+2*Phi_f+Qdep/Cox  
%%

%%
% Channel electric length [nm]
Lel=Lgate-Gamma*Xj;   

%%
% Depletion depth calculation
Tdepbulk=1e7*Qdep/(q*Nbulk);
% for BULK transistors
if(Model==0)
    Tdep=Tdepbulk;
% for Double Gate transistors
elseif(Model==1)
    Tdep=Xj/2;
    Xj=Xj/2;
% for SOI transistors
else if (Tdepbulk<Xj)
        Tdep=Tdepbulk;
     else 
	Tdep=Xj;
	endif
endif
%%

%% 
% Short Channel Effect (SCE) and Drain Induced Barrier Lowering (DIBL) evaluation
EI=(1+(Xj/Lel)^2)*Tox_el*Tdep/(Lel)^2;
% Short Channel Effect (SCE) [V]
SCE=es/esio2*Zeta2*Vbi*EI			
% Drain Induced Barrier Lowering (DIBL) [V]
DIBL=es/esio2*Zeta*EI*Vdd
%% 			

%% 
% Final value of threshold voltage calculation [V]
Vth=Vtlong-SCE-DIBL;    
%% 

%% 
% P and N mos Vth
Vth_n = Vth;  
Vth_p = -Vth; 
%% 
