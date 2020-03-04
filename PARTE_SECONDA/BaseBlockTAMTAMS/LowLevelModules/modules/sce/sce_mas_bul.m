%% SHORT CHANNEL EFFECT (SCE) CORRECTION FOR THRESHOLD VOLTAGE, MASTAR MODEL
% This module computes the threshold voltage shift due to SCE using Mastar equations
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
% Electrical channel length [nm]
Lel = Lgate - Gamma * Xj;  
%%

%%
% Bulk charge density at threshold
Qdep = sqrt(2*es*e0 * q * Nbulk * 2*Phi_f);
%%

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
% Vbi
Vbi = Vt * log(Nbulk * Nd/ni_temp^2);
%%

%%
% EI
EI = (1+(Xj/Lel)^2)*Tox_el*Tdep/Lel^2;
%%

%% 
% Short channel effect evaluation
SCE = es/esio2 * Zeta2 * Vbi * EI;
%%
