% UTBB FDSOI Model - Drain Current

%clear all
%close all
%clc
% DEFINITION OF PARAMETERS
%double W;
%double L;
%
k_B = 1.38e-23; % Boltzmann constant [J/K]
T = 300; % room temperature [K]
e = 1.602e-19; % elementary charge [C]

phi_T = k_B*T/e; % thermal voltage [V]
%

%
V_g1 = 1; % front gate voltage [V]
x_g1 = V_g1/phi_T; % dimensionless front gate voltage

V_g2 = -2; % back gate voltage [V]
x_g2 = V_g2/phi_T; % dimensionless back gate voltage
%
y = linspace(0,L,200); % longitudinal coordinate along the channel [m]
V_ds = linspace(0,0.5,200); % drain-source voltage vector [V]

for j = 1:length(V_ds)
    phi_im(j,:) = V_ds(j)*y/L; % carrier quasi-Fermi level [V]
    x_n(j,:) = phi_im(j,:)/phi_T; % dimensionless carrier-quasi Fermi level
end


mu_eff = 300e-4; % effective mobility [cm^2/(V*s)]
v_sat = 10^5; % saturation velocity [m/s]
%

%
eps_r = 11.68; % relative permittivity of silicon
eps_0 = 8.854e-12; % vacuum permittivity [F/m]
eps_ch = eps_0*eps_r; % permittivity of thin body film [F/m]

T_Si = 7e-9; % silicon thin body thickness [m]
C_Si = eps_ch/T_Si; % depleted body capacitance [F/m^2]

eps_SiO2 = 3.9; % relative permittivity of silicon dioxide
eps_ox = eps_0*eps_SiO2; % permittivity of gate oxide [F/m]

T_ox1 = 1e-9; % front gate oxide thickness [m]
C_ox1 = eps_ox/T_ox1; % front gate dielectric capacitance [F/m^2]
k1 = C_ox1/C_Si; % dimensionless front gate dielectric capacitance

T_ox2 = 25e-9; % back gate oxide thickness [m]
C_ox2 = eps_ox/T_ox2; % back gate dielectric capacitance [F/m^2]
k2 = C_ox2/C_Si; % dimensionless back gate dielectric capacitance
%

%
n_i = 1.45e4; % intrinsic carrier concentration of silicon at 300 K [m^3]
A0 = 2*e*n_i*eps_ch/((C_Si^2)*phi_T);
%


%

%INTERFACE POTENTIAL CALCULATION PROCEDURE
% Initial guess
delta_x = log((1+k1)/(1+k2)); % dimensionless difference between saturation values of interface potentials

for j = 1:length(V_ds)
    x1_sat(j,:) = x_n(j,:)+log(4*(k1+k2/(1+k2))/A0)+log((delta_x/2)/tanh(delta_x/2))+3; % dimensionless saturation value of front interface electrostatic potential
    x2_sat(j,:) = x_n(j,:)+log(4*(k2+k1/(1+k1))/A0)+log((delta_x/2)/tanh(delta_x/2))+3; % dimensionless saturation value of front interface electrostatic potential
end

k_eq = 1/(1+1/k1+1/k2); % dimensionless front-to-back gate equivalent capacitance, normalized by C_Si

x1_WI0 = x_g1+k_eq/k1*(x_g2-x_g1); % dimensionless initial guess of front interface potential in subthreshold regime
x2_WI0 = x_g2+k_eq/k2*(x_g1-x_g2); % dimensionless initial guess of back interface potential in subthreshold regime
    
for j = 1:length(V_ds)
    x1_0(j,:) = x1_WI0-3*log(1+exp((x1_WI0-x1_sat(j,:))/3)); % dimensionless initial guess of front interface potential
    x2_0(j,:) = x2_WI0-3*log(1+exp((x2_WI0-x2_sat(j,:))/3)); % dimensionless initial guess of back interface potential

    x1_WI(j,:) = (x2_0(j,:)+k1*x_g1)/(1+k1); % dimensionless front interface potential in subthreshold regime, considering a possible strong inversion at the opposite interface
    x2_WI(j,:) = (x1_0(j,:)+k2*x_g2)/(1+k2); % dimensionless back interface potential in subthreshold regime, considering a possible strong inversion at the opposite interface

    x1(j,:) = x1_WI(j,:)-3*log(1+exp((x1_WI(j,:)-x1_sat(j,:))/3)); % dimensionless front interface potential
    psi_s1(j,:) = x1(j,:)*phi_T; % front interface potential [V]
    x2(j,:) = x2_WI(j,:)-3*log(1+exp((x2_WI(j,:)-x2_sat(j,:))/3)); % dimensionless back interface potential
    psi_s2(j,:) = x2(j,:)*phi_T; % back interface potential [V]

    q1_init(j,:) = x_g1-x1(j,:); % dimensionless initial guess of front gate charge density
    q2_init(j,:) = x_g2-x2(j,:); % dimensionless initial guess of back gate charge density
end
%

% INVERSION CHARGE DENSITY CALCULATION
for j = 1:length(V_ds)
    for m = 1:length(y)
        q_sq(j,m) = k1^2*q1_init(j,m)^2-A0*exp(-x_n(j,m))*exp(x_g1-q1_init(j,m)); % dimensionless coupling charge square
        
        if q_sq(j,m)>=0
            q(j,m) = sqrt(q_sq(j,m)); % dimensionless coupling charge
        else
            q(j,m) = imag(sqrt(q_sq(j,m))); % dimensionless coupling charge
        end
        
        q2(j,m) = x_g2-x_g1+q1_init(j,m)+2*log(k1*q1_init(j,m)+q(j,m)*coth(q(j,m)/2))-log(q(j,m)^2/(sinh(q(j,m)/2))^2);
        
        q_i(j,m) = A0*exp(-x_n(j,m))*exp(x_g1-q1_init(j,m))/(k1*q1_init(j,m)+q(j,m)*coth(q(j,m)/2));
    end
end
%

% DRAIN CURRENT CALCULATION
% Effective electrostatic potential
for j = 1:length(V_ds)
    x_drifts(j) = x_n(j,1)+log(q_i(j,1)); % dimensionless effective electrostatic potential at source
    x_driftd(j) = x_n(j,end)+log(q_i(j,end)); % dimensionless effective electrostatic potential at source
    
    delta_xds(j) = x_driftd(j)-x_drifts(j); % dimensionless difference of effective electrostatic potential between source and drain
end
%

% Inversion charge density and its derivative
for j = 1:length(V_ds)
    eta1(j,:) = A0*exp(x_n(j,:)).*exp(x_g1-q1_init(j,:));
    eta2(j,:) = A0*exp(x_n(j,:)).*exp(x_g2-q2(j,:));
    
    a1(j,:) = 2*k1*q1_init(j,:)+eta1(j,:)/k1;
    a2(j,:) = 2*k2*q2(j,:)+eta2(j,:)/k2;
    
    dq_sq(j,:) = -4*q(j,:).^2.*(a1(j,:)+a2(j,:))./(a1(j,:).*a2(j,:)+2*(2+q2(j,:)).*a1(j,:)+2*(2+q1_init(j,:)).*a2(j,:)); % dimensionless derivative of q^2 w.r.t. quasi-Fermi level
    
    dq_i(j,:) = eta1(j,:)./a1(j,:)+eta2(j,:)./a2(j,:)-dq_sq(j,:).*(a1(j,:)+a2(j,:))./(a1(j,:).*a2(j,:)); % dimensionless derivative of inversion charge density w.r.t. quasi-Fermi level
    
    d(j,:) = -dq_i(j,:)./(1+dq_i(j,:)./(-q_i(j,:))); % dimensionless derivative of inversion charge density w.r.t. effective electrostatic potential
    
    q_is(j) = q_i(j,1); % dimensionless inversion charge density at source
    q_id(j) = q_i(j,end); % dimensionless inversion charge density at drain
    
    d_s(j) = d(j,1); % dimensionless derivative of inversion charge density w.r.t. quasi-Fermi level at source
    d_d(j) = d(j,end); % dimensionless derivative of inversion charge density w.r.t. quasi-Fermi level at drain
end
%

% Drain current
for j = 1:length(V_ds)
    q_im(j) = -(q_is(j)+q_id(j))/2;
    x_driftm(j) = (x_drifts(j)+x_driftd(j))/2;
    
    L_s(j) = -q_is(j)+q_id(j)+d_d(j)*(x_drifts(j)-x_driftd(j));
    L_d(j) = -q_is(j)+q_id(j)-d_s(j)*(x_driftd(j)-x_drifts(j));
    
    U_s(j) = sqrt(L_s(j)^2+36*(d_d(j)-d_s(j))^2);
    U_d(j) = sqrt(L_d(j)^2+36*(d_d(j)-d_s(j))^2);
    
    i_ds(j) = (-q_im(j)-(U_s(j)+U_d(j))/4)*delta_xds(j)+(L_d(j)*U_d(j)+L_s(j)*U_s(j))/(4*(d_d(j)-d_s(j)))+9*(d_d(j)-d_s(j))*log((L_d(j)+U_d(j))/(L_s(j)+U_s(j)))-(-q_is(j)+q_id(j)); % dimensionless drain current
    
    I_ds(j) = W/L*mu_eff/(sqrt(1+(mu_eff*phi_T*delta_xds(j)/(v_sat*L))^2))*C_Si*phi_T^2*i_ds(j) % drain current [A]
end

V_ds=3;
I_ds_out=I_ds(V_ds)
