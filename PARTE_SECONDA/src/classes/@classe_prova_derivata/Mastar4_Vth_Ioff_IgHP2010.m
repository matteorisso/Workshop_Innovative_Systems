function [Vth_n,Vth_p, Ioff_n, Ioff_p, Igate_n, Igate_p]= Mastar4_Vth_Ioff_IgHP2010()


%Please see: https://tamtams.vlsilab.polito.it/Documentation/TechnologyHTML/bulk/HP2010_dev_bul.html

%In order to carry on the power consumption calculations for a single mos
%transistor, the MASTARS model will be used.
%Mastar stands for "Model for Assessment of CMOS Technologies And Roadmaps"
%Please refer to: https://tamtams.vlsilab.polito.it/documentation.php


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                            PARAMETERS                                   %              
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Please, select "Model" value for the technology type
%BULK = 0; FINFET = 1; SOI = 2; GAA = 3; CNT = 4;
Model = 0; 

%Physical parameters
q = 1.6021766208e-19;                   % elementary charge (C)
kB = 1.3806488e-23;                     % Boltzmann constant (J/K)
hbar = 1.054571800e-34;                 % reduced Planck cons tant (Js)
m0 = 9.10938291e-31;                    % electron mass (kg)
clight = 2.99792458e8 ;                 % speed of light (m/s)
mu0 = (4* pi )*1e-7;                    % vacuum magnetic permeability (H/m)
e0 = 1e-2/( clight ^2* mu0 );           % vacuum electric permittivity (F/cm)
es = 11.8;                              % Silicon relative dielectric constant
esio2 = 3.9;                            % Silicon oxide relative dielectric constant
Eg0 = 1.166;                            % Silicon energy gap at 300K (eV)
Alpha = 4.73e-4; Beta = 636;
Temp = 300;                             % Absolute working temperature (K)
Eg = Eg0 - Alpha * Temp^2/(Temp + Beta);%Silicon energy gap (eV)
Vt = kB.*Temp./q;                       %Termal voltage (V)
ni = sqrt(5.85e31*Temp^3*exp(-Eg/Vt));  %Intrinsic carrier concentration (cm^-3)
Xs = 4.003;                             % Silicon affinity (eV)

%Geometrical parameters (HP 2012)
Lgate =18; %nm, The effective length of the gate.
Xj = 6.5; %nm, Source/Drain extensions length.
LDDW = 50; %nm, Doping width of source/drain extension, value used only...
%for transistors image generation.
Tox = 0.65; %nm, Physical gate oxide thickness.
Darks = 0.27; %nm, 2.5 A=0.1nm Dark space length, used in...
%Mastar threshold voltage model.
Polyd = 0; %Poly depletion length, used in Mastar threshold voltage model.
Wt = 1000; %nm, Gate width of n-MOS.
beta =1.29; %is the ratio between Wp/Wn.
gateW_p = beta*Wt; %nm, Gate width of p-MOS
gateH = 40; %nm, Gate thickness, value used only for transistors image generation
DopH = 30; %nm, Doping depth of source/drain, value used only for transistors image generation
DopW = 100; %nm, Doping width of source/drain, value used only for transistors image generation
ContW = 30; %nm, Contact width, value used only for transistors image generation
Diff_ray = 5;%nm, Ray of annealing diffusion, value used only for transistors image generation
Angle = 25; %°, Pocket implantation angle

%Doping parameters (HP 2010)
Nbulk = 7.14e18; %cm^-3, Channel Doping
n_sub = 3.2e18; %cm^-3, Substrate Doping
n_plus_poly = 1e20; %cm^-3, Polysilicon n+ doping
Next = 7.819e18; %cm^-3, Extensions doping
n_source_drain = 1e20; %cm^-3, Source/Drain doping

%Electrical parameters (HP 2010)
rconst_n = 254.61; %Ohm, N-MOS access resistance, fitting from Mastar output values
rconst_p = 254.61; %Ohm, P-MOS access resistance, same value of N-MOS for now
Fring_cap = 1.5e-16; %F/um, Fringe capacitance per unit length
Ith = 5e-7; %A, Id at the threshold voltage (Vth_off)
%??? Delta_Vth = 0.03e-7;???, %Shift between Vth "on" and Vth "off"
Phi_m = 4.15; %V Built-in potential
Kfield = 1; %Effective electric field reduction

%Scaling factors (HP 2010)
Gamma = 0.7; % Scaling factor for lateral diffusion
Zeta = 0.8; %Scaling factor for drain induced lowering barrier (DIBL)
Zeta2 = 0.64; %Scaling factor for short channel effect (SCE)

%Power supply parameters (HP 2010)
Vdd = 1; %V Operation voltage (gate and drain voltages)

%Other parameters(HP 2010)
Cpoches = 5.2e13;
Rp = 10; %nm
Delta_rp = 6; %nm
Delta_rl = 3; %nm
ActivePkt = 0;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                   THRESHOLD VOLTAGE, MASTAR 4 MODEL                     %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% https://tamtams.vlsilab.polito.it/Documentation/ModulesHTML/vth/vth_mas_complete_bul.html

ni_temp = ni /3.79; %Fitting from Mastar
Phi_f = Vt*log(Nbulk/ni_temp); %Surface potential (V)
Vfb= Phi_m -(Xs + Eg/2 + Phi_f);
Vbi=Vt*log(Nbulk*Next/ni_temp^2);
Qdep=sqrt(2*es*e0*q*Nbulk*(2*Phi_f));
Tox_el=Tox*3.9/esio2 + Darks/10 + Polyd/10; %nm, Electrical oxide thickness evaluation 
% %considering the effect of Dark Space and Polysilicon depletion
Cox=esio2*e0/(Tox_el*1e-7); %Oxide capacitance evaluation [F/cm^2]
Vtlong=Vfb+2*Phi_f+Qdep/Cox; %Long channel threshold voltage
Lel=Lgate-Gamma*Xj; %Channel electric length [nm]

%Depletion depth calculation:
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
    end
end

EI=(1+(Xj/Lel)^2)*Tox_el*Tdep/(Lel)^2;
% Short Channel Effect (SCE) [V]
SCE=es/esio2*Zeta2*Vbi*EI;
% Drain Induced Barrier Lowering (DIBL) [V]
DIBL=es/esio2*Zeta*EI*Vdd;
Vth=Vtlong-SCE-DIBL;
Vth_n = Vth;
Vth_p = -Vth;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                SUBTHRESHOLD CURRENT, MASTAR 4 MODEL                     %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% https://tamtams.vlsilab.polito.it/Documentation/ModulesHTML/ioff/Ioff_mas4_bul.html


Npocket=0.5*(Cpoches/((Rp+2*Delta_rp)*10^-7)); 
Lpocket=(Rp+2*Delta_rp)*sin(Angle*pi/180)+ ...
    2*Delta_rl*cos(Angle*pi/180)-(Gamma*Xj)/2;
Lel = Lgate - Gamma * Xj; %Electrical channel length [nm]
Lmin=min(Lel,Lpocket); %Effective channel length
Nch = Nbulk + 2 * Npocket * (Lmin/Lel); %Channel doping
if (ActivePkt==0)
    Ith_new = Ith*Wt/Lel;
else
    Ith_new = Ith*Wt/Lel* 8 * 10^8 * Nch^(-0.4865);
end;

Qdep = sqrt(2*es*e0*q*Nbulk*(2*Phi_f)); %Depletion charge evaluation

%Depletion depth calculation
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
    end
end

SS=Vt*log(10)*(1+((es/esio2)*Kfield*(Tox_el/Tdepbulk))); %V/dec
Ioff_n=Ith_new*10^(-Vth/SS)*10^9;  %nA/um
Ioff_p=Ith_new*10^(-Vth/SS)*10^9;  %nA/um

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                      GATE CURRENT, MASTAR 4 MODEL                       %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% https://tamtams.vlsilab.polito.it/Documentation/ModulesHTML/igate/Igate_Mastar4_bul.html

%a, b, c, d parameters:
ag = 1.44e5;	% A/cm^2
bg = -4.02;		% V^-2
cg = 13.05;		% V^-1
dg = 1.17;		% Angstrom^-1

%Gate current density
Jgate_n = ag*exp(bg*Vdd^2 + cg*Vdd)*exp(-dg*Tox*10)*10;	% nA/um^2
Jgate_p = ag*exp(bg*Vdd^2 + cg*Vdd)*exp(-dg*Tox*10)*10;

Igate_n= Jgate_n*Lgate*1e-3; % [nA/um]
Igate_p= Jgate_p*Lgate*1e-3; % [nA/um]

if (Model==1)
   Igate_n=2*Igate_n;
   Igate_p=2*Igate_p;
end

return


