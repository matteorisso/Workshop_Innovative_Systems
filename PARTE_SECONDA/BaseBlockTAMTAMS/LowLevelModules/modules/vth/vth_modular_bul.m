%% THRESHOLD VOLTAGE WITHOUT CORRECTION FACTORS 
% Implementation of an Ion model with equations derived by Mastar 4 model using OCTAVE. Correction factors (QME, PDE, SCE, DIBL) are not considered
%%

%% 
% Intrinsic doping calculation.
% Band Gap Narrowing model
a=log(Nbulk/N_zero);
% Energy gap variation
deltaEg=9*(a+(a.^2+0.5).^0.5);
% Intrinsic doping value
ni_temp=ni_zero*exp(deltaEg*1e-3*q/(2*Kb*Temp));  
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
% Depletion capacitance evaluation
Qdep=sqrt(2*es*e0*q*Nbulk*2*Phi_f);
%% 

%%
% Electrical oxide thickness evaluation
Tox_el = Tox* 3.9/esio2;
%%

%%
% Oxide capacitance evaluation [F/cm^2]
Cox=esio2*e0/(Tox_el*1e-7);
%%

%% 
% Base value of threshold voltage calculation
Vth_base=Vfb+2*Phi_f+Qdep/Cox
%%

%%
% The correction factors calculated by relative modules (if selected) are shown when the option "Print results" is selected
DIBL
SCE
QME
PDE
%%

%%
% Final value of threshold voltage calculation [V]
Vth = Vth_base - DIBL - SCE + QME + PDE;
%%

%% 
% N and P mos Vth
Vth_n = Vth;  
Vth_p = -Vth; 
%%
