%% MOBILITY
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


          



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

phi_s = 2*phi_f*q;  %Surface potential in SI, J
% 
 Q_dep = sqrt(2*q*Na*eps_Si*phi_s);
% 
 eta = 0.5; %For the electron, for holes =1/3
 beta = q/(Kb*T);
 Delta = 2e-10; %Surface roughness, m
 theta = beta*eta*Delta*C_ox/eps_Si;
% %     
% % 
  mu_b = mu_0*exp(-beta*Delta*Q_dep/eps_Si); %low gate voltage mobility
mu_eff = mu_b./(1+theta*(Vgs-Vth)+(theta^2*(Vgs-Vth).^2)/2); % m^2 V^-1 s^-1
% % % 
% figure
% hold on 
% grid on
% plot(Vgs,mu_eff)
% 
% xlabel('\bf Gate Voltage V_{gs}, [V]')
% ylabel('\bf Effective Mobility mu_{eff}, [Cm^2 V^{-1} s^{-1}]')
% title('\bf Mobility')

% 
% 
% 
% 
% 
% 
% 
% 
% 
% 
% 
% 
% 
% 
% 
% 
% 
% 
% 
% 


