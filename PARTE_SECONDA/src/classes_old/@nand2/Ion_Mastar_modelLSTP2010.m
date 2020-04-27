function [Ion_n, Ion_p]= Ion_Mastar_modelLSTP2010(Vth)


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

%Geometrical parameters (LSTP 2010)
Lgate =28; %nm, The effective length of the gate.
Xj = 8.5; %nm, Source/Drain extensions length.
LDDW = 50; %nm, Doping width of source/drain extension, value used only...
%for transistors image generation.
Tox = 1.4; %nm, Physical gate oxide thickness.
Darks = 0.31; %nm, 2.5 A=0.1nm Dark space length, used in...
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

%Doping parameters (LSTP 2010)
Nbulk = 4.87e18; %cm^-3, Channel Doping
n_sub = 3.2e18; %cm^-3, Substrate Doping
n_plus_poly = 1e20; %cm^-3, Polysilicon n+ doping
Next = 7.819e18; %cm^-3, Extensions doping
n_source_drain = 1e20; %cm^-3, Source/Drain doping

%Electrical parameters (LSTP 2010)
rconst_n = 213.93; %Ohm, N-MOS access resistance, fitting from Mastar output values
rconst_p = 213.93; %Ohm, P-MOS access resistance, same value of N-MOS for now
Fring_cap = 2.4e-16; %F/um, Fringe capacitance per unit length
Ith = 5e-7; %A, Id at the threshold voltage (Vth_off)
%??? Delta_Vth = 0.03e-7;???, %Shift between Vth "on" and Vth "off"
Phi_m = 4.15; %V Built-in potential
Kfield = 1; %Effective electric field reduction

%Scaling factors (LSTP 2010)
Gamma = 0.8; % Scaling factor for lateral diffusion
Zeta = 0.8; %Scaling factor for drain induced lowering barrier (DIBL)
Zeta2 = 0.64; %Scaling factor for short channel effect (SCE)

%Power supply parameters (LSTP 2010)
Vdd = 1.1; %V Operation voltage (gate and drain voltages)

%Other parameters(LSTP 2010)
Cpoches = 2.06e15;
Rp = 10; %nm
Delta_rp = 6; %nm
Delta_rl = 3; %nm
ActivePkt = 0;

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
Model = 0;
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
Sigma = 1;
Gamma = 0.7;
Xj = 6.5; %nm
d=Sigma*q*Nbulk*Tdep/(2*Cox*(2*Phi_f))*1e-7;

%Electrical channel length [nm]
Lel = Lgate - Gamma * Xj;

%Evaluation of the value of E critic field for...
%the electrons and holes with the approximation of...
%saturation velocity of carriers
Kvs = 1.1;
vsat = 1e7; %cm/s
%Effective electric field
%https://tamtams.vlsilab.polito.it/Documentation/ModulesHTML/mobility/mobility_mas_bul.html
Kfield = 1;
Eeff_n=Kfield*(1e-6*(Vdd+Vth-2*(Vfb+2*Phi_f)))/(6*Tox_el*1e-7);
Eeff_p=Kfield*(1e-6*(Vdd+2*Vth-3*(Vfb+2*Phi_f)))/(9*Tox_el*1e-7);
%Mobility in normal conditions
muac_n=330*Eeff_n^(-0.3);
muac_p=90*Eeff_p^(-0.3);
%Mobility in high electric field conditions
musr_n=1450*Eeff_n^(-2.9);
musr_p=140*Eeff_p^(-1);
%Effective mobility calculation [cm2 V-1 s-1]
Kp = 1;
mueff_n=Kp*muac_n*musr_n/(muac_n+musr_n)
mueff_p=Kp*muac_p*musr_p/(muac_p+musr_p)



%Evaluation of the value of E critic field for the electrons and holes with the approximation of saturation velocity of carriers
Ecrit_n=2*Kvs*vsat/mueff_n;
Ecrit_p=2*Kvs*vsat/mueff_p;
%Evaluation of Vdsat with approssimation of high field and body linearization of the Qn charge
Vdsat_n=(1/(Lel*1e-7*Ecrit_n)+(1+d)/(Vdd-Vth))^-1;
Vdsat_p=(1/(Lel*1e-7*Ecrit_p)+(1+d)/(Vdd-Vth))^-1;

%Evaluation of the saturation current without the channel resistance
Idsat0_n=0.5*mueff_n*Cox*(Wt/Lel)*(Vdd-Vth)*Vdsat_n;
Idsat0_p=0.5*mueff_p*Cox*(Wt/Lel)*(Vdd-Vth)*Vdsat_p;

%Evaluation of the Ion current by adding the contribute of channel resistance
Rconst_n = 256.61; %Ohm
Rconst_p = 256.61; %N-MOS access resistance, fitting from Mastar output values
Ion_n=Idsat0_n/(1+(2*Rconst_n*Idsat0_n/(Vdd-Vth))-Rconst_n*Idsat0_n/(Vdd-Vth+Lel*1e-7*Ecrit_n*(1+d)))*1e6; %uA/um
Ion_p=Idsat0_p/(1+(2*Rconst_p*Idsat0_p/(Vdd-Vth))-Rconst_p*Idsat0_p/(Vdd-Vth+Lel*1e-7*Ecrit_p*(1+d)))*1e6; %uA/um





