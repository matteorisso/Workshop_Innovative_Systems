%% OFF current of an FD-SOI MOSFET

%% Initialization

%% File needed
%Constants;
%Parameters_3;



%% Preliminar Calculation
mu_0 = mu_Tamb*(T/T0)^Z; % T0=lattice temperature, T = Ambient Temperature

Vgs = linspace(0.5,Vdd,3);             %Gate to Source bias, V
Vgs_vec = linspace(0,Vdd,100);

 mu_n0 = mu_0./(1+theta.*(Vgs_vec-Vth));
% 
 Darks=3.9;
Polyd= 4;

% 
% %% Defintion of the equivalent thickness of the oxide of SOI device.
 Tox_el= t_f+ Darks/10 + Polyd/10 ;                
% 
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%% I_OFF

eps_ox = 3.9*eps_0;
 C_ox = eps_ox/(Tox_el); 

        % Silicon thickness
 C_Si = eps_Si/t_Si;    %Silicon capacitance
 m=1+ C_Si/C_ox; 
 Cdep= (m-1)*C_ox;
 
Vt= Kb*T/q ; % thermal voltage
 Ioff = mu_n0(1,1)*Cdep.*(Vt^2).*exp((Vgs_vec-Vth)./m*Vt);

Vgs_vec=10;
Ioffout=Ioff(Vgs_vec);
% 
% %% Plot section
% figure
% set(gca,'YScale','log');
% semilogy(Vgs_vec,Ioff,'linewidth',2)
% xlabel('\bf V_{GS},[V]')
% ylabel('\bf I_{off},[A/\mum]')
% title('Ioff')
% grid on
