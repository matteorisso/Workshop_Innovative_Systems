%% QUANTUM EFFECT (QME) CORRECTION FOR THRESHOLD VOLTAGE, CHAUDRY-ROY MODEL
% This module computes the threshold voltage shift due to QME using Chaudry-Roy model
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
% Electrical oxide thickness evaluation
Tox_el = Tox* 3.9/esio2;
%%

%% 
% Oxide Capacitance
Cox=esio2*e0/(Tox_el*1e-7)
%%

%% 
% Deplation charge [C/(10*cm^2)]
Q_d = -sqrt(2*es*e0*q*Nbulk*phi_s); 
%%

%% 
% Inversion charge [C/(10*cm^2)]
Q_inv = -Gamma*Cox*(sqrt(phi_s + Vt*exp((phi_s - 2*Phi_f)/Vt)) - sqrt(phi_s));
%%

%% 
% b
b= power((48*(pi^2)*(mS/ 1.6049e-015)*(q^2))*abs(0.33*Q_inv + Q_d)/(es*e0*((ht/1.6e-19)^2)),1/3);
%%

%% 
% Corresponding shift in the sub band electron energy
E_0 = 3*((ht/1.6e-19)^2)*(b^2)/(8*(mS/ 1.6049e-015));  
%%

%% 
% Shift in the surface potential
de_phi = E_0/q;
%%

%% 
% The shift of the threshold voltage due to inversion layer quantization 
QME = (1 + 0.5*sqrt((q*Nbulk*es*e0)/Phi_f)/Cox)*de_phi;
%%
