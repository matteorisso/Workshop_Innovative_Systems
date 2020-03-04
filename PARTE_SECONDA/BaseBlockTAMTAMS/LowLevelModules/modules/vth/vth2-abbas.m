ln = @(x) log(x);

%% Threshold voltage module

%% Physical constants (2019 update)

eps0 = 8.8541878128e-14; % vacuum permittivity [F * cm^-1]
h = 6.62607015e-34; % Planck constant [J * s]
kB = 1.3806485279e-23; % Boltzmann constant [J * K^-1]
m0 = 9.1093837015e-31; % electron mass [kg]
q = 1.602176634e-19; % elementary charge [C]

%% Definitions

T = 300; % room temperature [K]

epsox = 3.9*eps0; % gate oxide permittivity
epsSi = 11.7*eps0; % silicon permittivity

ni = 1.45e10; % intrinsic carrier concentration in silicon [cm^-3]
NA = 1.45e10; % acceptor concentration [cm^-3]
ND = 1e20; % donor concentration [cm^-3]

l = (2*Wfinbot + Wfintop)/(2*Wfintop + Wfinbot);
Wfin = Wfintop + (l/(l + 1))*(Wfinbot - Wfintop);
W = Hfin + Wfin/2; 
Weff = 2*W;

VT = kB*T/q; % thermal voltage
Vbi = VT*(ln(ND/ni) + ln(NA/ni)); % built-in voltage

phiM = 4.52; % metal workfunction (mean value) over elementary charge [V]
phiP = VT*ln(NA/ni); % Fermi potential
chi = 4.05; % electron affinity over elementary charge [V]
Eg = 1.12*q; % energy gap
Nv = 1.04e19; % effective density of states in the valence band [cm^-3]
Nc = 2.8e19; % effective density of states in the valence band [cm^-3]
VFB = phiM - chi - Eg/(2*q) + (VT/2)*ln(Nv/Nc) - phiP; % flat-band voltage

VGC = 0.2; % fixed gate voltage before strong inversion
VDS = 0.05; % VDS reference value for Vth evaluation

%% Quantum effects on Vth

QME = 1; % Quantum-mechanical effects flag

alfa = 1.5; % parameter which takes into account the non-square geometry of the TG FinFET's cross-section
dz = 2e-7; % dark space (typical value) [cm]
meff = 0.7*m0; % electron effective mass

VthQM = alfa*((0.5*h)^2)/(2*q*meff*(Wfin*1e-2)^2); % Wfin has to be in 'metres'
tox_eff = tox + QME*dz*epsox/epsSi;

%% Vth computation

Cox = (1/Weff)*(3.02*1.5*epsox/ln(1 + 1.5*tox_eff/Hfin) - (5/4)*epsox/ln(1 + (5/4)*tox_eff/Hfin) + (5/4)*epsox/ln(1 + (5/4)*tox_eff/Wfin));
CSi = (1/Weff)*(Wfin*epsSi/Hfin + 2*Hfin*epsSi/Wfin);
Qth = (2*VT/q)*(Cox^2)/CSi;

lambda = sqrt(0.5*Wfin*tox_eff*(epsSi/epsox)*(1 + (epsox/epsSi)*3*Wfin/(16*tox_eff))); 
VG1 = VGC - VFB;
ym1 = 0.5*L - 0.5*lambda*ln(((Vbi - VG1)*(exp(L/lambda) - 1) + VDS*exp(L/lambda))/((Vbi - VG1)*(exp(L/lambda) - 1) - VDS));

lambdasym = 0.5*sqrt(Wfin*(tox_eff*epsSi/epsox + 3*Wfin/16));
lambdaasym = 0.5*sqrt(Hfin*(2*tox_eff*epsSi/epsox + 7*Hfin/16));

A1sym = (exp((L + ym1)/lambdasym) - exp((L - ym1)/lambdasym))/(exp(2*L/lambdasym) - 1);
A2sym = (exp((2*L - ym1)/lambdasym) - exp(ym1/lambdasym))/(exp(2*L/lambdasym) - 1);
A1asym = (exp((L + ym1)/lambdaasym) - exp((L - ym1)/lambdaasym))/(exp(2*L/lambdaasym) - 1); 
A2asym = (exp((2*L - ym1)/lambdaasym) - exp(ym1/lambdaasym))/(exp(2*L/lambdaasym) - 1);

A1TG = (2*Hfin*A1sym + Wfin*A1asym)/Weff;
A2TG = (2*Hfin*A2sym + Wfin*A2asym)/Weff;

Vth = VFB - (A1TG*(Vbi + VDS) + A2TG*Vbi)/(1 - (A1TG + A2TG)) + (VT/(1 - (A1TG + A2TG)))*ln(Qth*NA/((ni^2)*Wfin));
Vth = Vth + QME*VthQM % [V]
