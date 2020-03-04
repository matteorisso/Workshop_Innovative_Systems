%% POLY DEPLETION EFFECT (PDE) CORRECTION FOR THRESHOLD VOLTAGE, ARORA AND RIOS MODEL
% This module computes the threshold voltage shift due to PDE using sing D. % Arora and R. Rios formulation ("Modeling the polysilicon depletion effect and its impact on submicrometer CMOS circuit performance" 1995)
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
% Oxide capacitance [F/cm^2]
Cox = esio2*e0/(Tox_el*1e-7);
%%

%%
% Polydepletion correction factor
a_v = q * e0 * es * Nd/Cox^2;
%%

%%
% Bulk charge density at threshold
Qdep = sqrt(2*es*e0 * q * Nbulk * 2*Phi_f);
%%

%% 
% Polydepletion shift of Vth
PDE = (1/2*a_v) * (Qdep/Cox)^2;
%%
