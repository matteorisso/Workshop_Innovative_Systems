%% Drain Induced Barrier Lowering (DIBL)
% This module computes the threshold voltage shift due to DIBL effect using Zhi-Hong Liu (1993) equations.
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
% Electrical channel length [m]
Lel = (Lgate - 0.8* Xj)*10^(-9);  
%%

%%
% Surface potential [V]
phi_ss = Vt*log(Nbulk*10^6/(ni_temp*10^6));
%%

%%
% Built-in potential  [v]
Vbi=Vt*log(Nbulk*Next*10^12/((ni*10^6)^2));
%%

%%
% Depletion region  [m]
Xdep=sqrt((2*es*e0*phi_ss)/(q*Nbulk*10^6)); 
%%

%%
% Characteristic lenght [m]
l=sqrt((es*Tox*10^(-9)*Xdep)/(esio2));
%%
 
%%  MODULE BODY
% Drain Induced Barrier Lowering
DIBL=(2.*(Vbi-phi_ss)+(Vdd+(Vbi-phi_ss)).*(1-exp(-Lel/l))+2.*sqrt((Vbi-phi_ss)^2+(Vbi-phi_ss).*((Vbi-phi_ss)+Vdd).*(exp(Lel/l)-1)))./(4.*sinh(Lel/(2*l)).*sinh(Lel/(2*l)))*10;
%%
