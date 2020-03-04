%  SOI case
%% SHORT CHANNEL EFFECT (SCE) CORRECTION FOR THRESHOLD VOLTAGE, MASTAR MODEL
%  This module computes the threshold voltage shift due to SCE using Mastar equations
%%

%For SOI


%% 
% Intrinsic doping calculation.
ni_temp = ni /3.79;   
%%

%%

Phi_d = Vt*log(Next*Nbulk/ni_temp^2);
%%

%%
% Vbi (Built-in Voltage)
Vbi=Vt*log(Nbulk*Next/ni_temp^2);
%%


%%
% Electrical oxide thickness evaluation considering the effect of Dark Space and Polysilicon depletion
Tox_el = Tox+ Darks+ (esio2/es)*Polyd+ (esio2/es)*Darks; %changed

%%


%%
% Channel electric length [nm]
Lel=Lgate-Gamma*Tsi;   

% Depletion depth calculation
%In MASTAR models, Tdep=Tsi
Tdep=7.60;

%% 
% Short Channel Effect (SCE)  evaluation

factor=1+(Tsi/Lel)^2; %

% Short Channel Effect (SCE) [V]
SCE=(es/esio2)*(factor*(Tox_el/Lel)*(Tdep/Lel)*Phi_d) %





