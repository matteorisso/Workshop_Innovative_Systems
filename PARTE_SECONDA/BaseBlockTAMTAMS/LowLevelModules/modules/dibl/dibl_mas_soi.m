%  SOI case
%% DRAIN INDUCED BARRIER LOWERING (DIBL) CORRECTION FOR THRESHOLD VOLTAGE, MASTAR MODEL
% This module computes the threshold voltage shift due to DIBL using Mastar equations
%%
%%
% Channel electric length [nm]
Lel=Lgate-Gamma*Tsi;

%%
% Intrinsic doping calculation.
ni_temp = ni /3.79;   

Phi_d = Vt*log(Next*Nbulk/ni_temp^2);
%%

%%
% Electrical oxide thickness evaluation considering the effect of Dark Space and Polysilicon depletion
Tox_el = Tox+ Darks+ (esio2/es)*Polyd+ (esio2/es)*Darks; %changed
 

%%Fitting parameters from MASTAR
%
eta=1; %for SOI case, =0 for bulk & DG case
beta=0.16;




% Drain Induced Barrier Lowering (DIBL) [V]
factor=1+(Tsi/Lel)^2; %
Tdep_dibl=Tsi+eta*((Lel-Tsi)*3*Tbox)/((Lel-Tsi)+3*Tbox);
Tx= (Tsi+3*Tbox);
Delta_DIBL_box=(Tox_el*Tsi/Lel^2)*(sqrt(Tx^2-Lel^2)/Lel)*Vdd;
DIBL=0.77*(es/esio2)*factor*(Tox_el/Lel)*(Tdep_dibl/Lel)*Vdd+(beta*Delta_DIBL_box)



