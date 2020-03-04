%% The module MUST be empty
% Physical %

 pi= 3.1416;
 h=6.626e-34;
 ht=h/(2*pi);
 e0=8.854e-14;   %F/cm 
 u0= 1.257e-8;  % H/cm
 q=1.602e-19;    %electron charge

 N_zero=2e17;     % Constant for evaluation of Band Gap Narrowing effect on ni
 ni_zero=1.017e10;    % Constant for evaluation of Band Gap Narrowing effect on ni 
 
 Xs=4.003 ;   %Affinità elettronica del silicio  %4.05 originally, adjusted from mastar
 vsat=1e7 ;   %cm/s
 m0=9.1e-31;  %electron mass
 mo_n=0.4*m0;  %effective electron mass in SiO2 for ECB
 mo_p=0.32*m0; %effective electron mass in SiO2 for HVB
 mS = 0.98*m0;     % Massa efficace dell'e- nel Si
 mc=0.19*m0; %effective electron mass in conduction band
 mh=0.49*m0; %effective hole mass in conduction band
 mnbtb=0.19*m0;   %Kg    Effective electron mass for tunneling calculation
 mhbtb=0.49*m0;   %Kg    Effective hole mass for tunneling calculation

 Phi_ox_n=3.1 ;   %barrier for electron in NMOS
 Phi_ox_p=4.5 ;    %barrier for electron in PMOS
 
 Kb=1.380658e-23; %Boltzmann constant
 An=4*pi*q*mc*(Kb^2)/(h^3);   % Richardson electron constant
 Ap=4*pi*q*mh*(Kb^2)/(h^3);   % Richardson hole constant
 alfa0  = 0.68e-6;   % Ohm*cm/°C

 Vt=Kb.*Temp./q;

 zep=0.5;            % Pheripheral exponent factor
 Eg0 = 1.166;  		 % Energy gap at 300k [eV]
 Alpha = 4.73e-4; 	 % [eV/K]
 Beta = 636; 		 % [K]
 %Eg=1.034;
 %Eg=1.17-4.73e-4*Temp^2/(Temp+636);
 Eg= Eg0 - Alpha * Temp^2/(Temp + Beta); % Energy gap [eV]
 %Ns = (mo_n / m0 )^(3/2) * 2.5*10^25;  
 %ni = Ns * exp(-(Eg)/(2*Vt)); %Intrinsic concentration carriers in Si
 ni=sqrt(5.85e31*Temp^3*exp(-Eg/Vt));
 mu0= 0.1;		%Low field mobility [m^2 / Vs] for silicon
 Ab=sqrt(2*mc)*q^3/(4*pi^3*ht^2);
 Bb=4*sqrt(2*mc)/(3*q*ht);

 a=1.3;   %velocity saturation index



% System + Pwr %

Nreg=Ng/logic_depth;  %number of register in a module  

Nglogic  = Ntot*(1-mem)*(Ncmos*(fi2/4+fi3/6+fi4/8)+Ndyn*(fi2/6+fi3/7+fi4/8)+Npass*(fi2/6+fi3/12+fi4/18));  % Total number of logic gates for global interconnect 

Nblock = Nglogic/Ng;      	%Number of blocks for global interconnect


L_DIE = sqrt(DIE_AREA);	%ipotizzando il chip quadrato, il lato del chip si calcola facendo la radice quadrata dell'area dal chip
n_CLUSTER = 2^n_LEVEL;	%CLUSTER = aree che ricevono il clock dalle singole foglie dell'H-tree quindi n_CLUSTER=numero di foglie dell'albero

Vdd_d=[1 0];

pglob = p-0.1;     % Internal Rent's exponent (for MPU) for global interconnect
