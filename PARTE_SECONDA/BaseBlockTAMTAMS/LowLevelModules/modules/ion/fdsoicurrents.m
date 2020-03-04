%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Initialization
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%Parameters_2;
%Parameters_3;


%% Preliminar Calculation
T=300;
T0=300;
mu_Tamb = 670e-4;
Z = 2; % Empirical coefficient. This value is kept from ref [12,13]
mu_0 = mu_Tamb*(T/T0)^Z; % T0=lattice temperature, T = Ambient Temperature

Vgs = linspace(0.5,Vdd,3);             %Gate to Source bias, V
Vgs_vec = linspace(0,Vdd,100);
Vgst= Vgs - Vth;
mu_n0 = mu_0./(1+theta.*Vgst);
u= mu_n0/vsat;
C_box= eps_ox/t_b;    %Buried oxide capacitance
gamma_sub = sqrt(2*q*eps_Si*Nsub)/C_box;
C_ox = eps_ox/t_f;     %Oxide capacitance [F/m^2]
gamma_prime = gamma_sub*C_box/C_ox;

C_Si = eps_Si/t_Si;    %Silicon capacitance

B = 0.5*gamma_sub*(1+(C_box/C_Si));
Vt= Kb*T/q ; % thermal voltage
phi_f = Vt*log(Nch/ni_Si); % already divided for q
alpha = q*Nch*t_Si^2/(2*eps_Si);

delta= 2*phi_f + n*Vt - alpha +Vsb;
D= B^2 + delta;
 eta= (gamma_prime*delta/(2*B)) - Vt*(1+(gamma_prime/(2*sqrt(D))));
% 
Vgst_eta= Vgst - eta;

Rt= Rs+Rd;

H= W*mu_n0*C_ox;
GAMMA= (u+ H*Rs)./(u-H*Rd);
% 

 G0=(H.*Rt.*Vgst_eta.*GAMMA - L).^2 -(H.*Rt.*Vgst_eta + L).^2 ;
 
 G1= 2*H.*Rt.*(GAMMA+1).*(L - H.*Rt.*Vgst_eta.*GAMMA);
 G2= H.*(GAMMA.^2).*(2.*u + H.*(Rs-Rd)).*Rt;
% 
 Vds_sat= (-G1 + sqrt((G1.^2)-4*G2.*G0))./(2*G2);
 Ids_sat= (Vgst_eta - Vds_sat)./((u./H) - Rd);
Vds = linspace(0,3,100);
for j= 1:length(Vgst_eta)
 for i = 1:length(Vds)
    if (Vds(i) <= Vds_sat(j))
    
    P0= H(j).*(Vgst_eta(j) - Vds(i)/2).*Vds(i);
    P1= -H(j).*Rt.*(Vgst_eta(j) - Vds(i).*(Rd/Rt))- L - Vds(i).*u(j);
    P2= (H(j)*Rt*(Rs-Rd)/2) + (Rt*u(j));

    Ids(i,j) = (-P1 - sqrt((P1.^2)- (4*P2.*P0)))/(2.*P2);
    
    else
        
    Ids(i,j)= Ids_sat(1,j);
    
    end
 end
end

 % %% Improvement in the Current-Voltage MODEL 




P_diss= Vds'.*Ids;
Rth=(1/W) *((t_b/(Kox*Kd*t_Si))^(0.5));
A= Rth/T;


%vsat1= 2.4*1e5/(1+C*exp(T0/600));
vsat1= 2.4*1e5./(1+C*exp((1+10^-2)/2));
%vsat1= 2.4*1e5./(1+C*exp((T+Rth.*P_diss)./(2*T)));

dj= eps_Si*W*L/C_Si; %%junction depth 
la=((0.22*1e-2)^(1/6))*(dj^(0.5))*(t_f^(1/3));

Vds_sat_appr= Xi*Vgst_eta + 8*Vt;
err= (Vds_sat_appr-Vds_sat)*100;

Vds_sat_improve=zeros(length(Vds),length(Vgst_eta));
Vds_sat_improve(1,1)= Vds_sat_appr(1,1);
Vds_sat_improve(1,2)= Vds_sat_appr(1,2);
Vds_sat_improve(1,3)= Vds_sat_appr(1,3);

for j= 1:length(Vgst_eta)
 for i = 1:length(Vds)
     
mu_na(j)= mu_Tamb./(1+theta.*Vgst(j));
mu_n1(j)= mu_na(j).*((1+10^-2).^(-2));
%mu_n1= mu_na.*((1+1e-2).^(-2));

u1(j)= mu_n1(j)./vsat;  %Update of u
H1(j)= W*mu_n1(j)*C_ox; %Update of H

GAMMA1(j)= (u1(j)+ H1(j)*Rs)./(u1(j)-H1(j)*Rd);

deltaL(i,j)= la*log( (1+ (Vds(i)- Vds_sat_improve(i,j))./Ve));
Leff(i,j)= real(L-deltaL(i,j));

G0(i,j)=(H1(j).*Rt.*Vgst_eta(j).*GAMMA1(j) - Leff(i,j)).^2 -(H1(j).*Rt.*Vgst_eta(j) + Leff(i,j)).^2 ;
G1(i,j)= 2*H1(j).*Rt.*(GAMMA1(j)+1).*(Leff(i,j) - H1(j).*Rt.*Vgst_eta(j).*GAMMA1(j));
G2(i,j)= H1(j).*(GAMMA1(j).^2).*(2.*u1(j) + H1(j).*(Rs-Rd)).*Rt;

Vds_sat_improve(i,j)= (-G1(i,j) + sqrt((G1(i,j).^2)-4*G2(i,j).*G0(i,j)))./(2*G2(i,j));

Ids_sat_improve(i,j)= (Vgst_eta(j) -  Vds_sat_improve(i,j))./((u1(j)./H1(j)) - Rd);

   if (Vds(i) <=  Vds_sat_improve(i,j))
    
   P0(i,j)= W*C_ox.*(Vgst_eta(j)- Vds(i)/2)*Vds(i);
   P1(i,j)= - W*C_ox*Rt.*(Vgst_eta(j)- Vds(i)*Rd/Rt) - Leff(i,j)/mu_na(j) - Vds(i)./vsat1;
   P2(i,j)= W *C_ox*Rt*(Rs-Rd)/2 + Rt/vsat1 - 2*A.*Leff(i,j).*Vds(i)/mu_na(j);
 
   Ids_improve(i,j) = (-P1(i,j)-sqrt((P1(i,j).^2)- (4*P2(i,j).*P0(i,j))))./(2*P2(i,j));
    
   else
   Ids_improve(i,j)=  Ids_sat_improve(i,j);
   
   end
 end
end

err1=(Vds_sat_improve-Vds_sat)*100;
% 
% %% Total drain current that includes the effects of impact ionization and parasitic BJT





for j = 1:length(Vds_sat)
 for i = 1:length(Vds)
     
% M parameter 
 M = 1 + (beta1* (Vds(i) - Vds_sat(j)).* exp(- beta2./ (Vds(i) - Vds_sat(j))));

% G parameter 
 G = 1 + ((M-1)*(1 - (1 - K)*alfa0)./...
         (1 - (1 + K*K1*(M - 1))*alfa0));
% F parameter 
 F = (1 + (K1*(M - 1)))/ (1 -(1 + K*K1*(M - 1))*alfa0);
 
%% (Icb0) leakage current across the collector-base junction [A]
 Icb0 = (W * t_Si * Is0)/ (1 + (lambda * Vgst(j)));             
 
%% Id 
 Id = G * Ids + F * Icb0;
 
%% Ich current (triode and saturation) 
 F0 = 1 / (1 - alfa0);
 Id0 = Ids_sat(j) + F0 * Icb0;

 if (Vds(i)<=Vds_sat(j))
    Id_prime= Id0;
 else
    Id_prime= Id;
 end
 
 Ich= Ids/(1+m1*exp((Vds(i)-Vds_sat(j)) /m2*Vt)) + Id_prime/(1+m1*exp( ( Vds(i)-Vds_sat(j) )/m2*Vt));
 end
end

%save('Ion_22.mat','Ids');


%% Subthreshold slope in a fully depleted device

S = Vt*log(10)*( 1 + (1/C_ox) * (C_Si*C_box)/(C_Si+C_box));


Vds=3;
Idsout=Ich(Vds);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


