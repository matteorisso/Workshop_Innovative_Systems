%TVoltage

%% Strong inversion (n-MOS)

Vgs = 0.1;
L1= 200*1e-9;
err=1e-9; 
for i=1:length(L) 
    delta=abs(L(i)-L1); 
    if delta<err 
        err=delta; 
        indice=i;   
    end 
end 



%%%%%%%%%%%%Code for Vth%%%%%%%%%
%Channel_length=45*1e-9; %meters


%%
%length_step = (200-22)/100;
%length_index=round(Channel_length/length_step)+1
%mol_index= 1; %%TODO
%vds_index= 1; %%TODO
%% Loop on the different channel lengths


%%% User Defined Parameters

%% Loop on the different channel lengths

q= 1.602176e-19; %electronic charge

mol= 0.4*q;
 
    
    % Select channel length
    L_ch=L1; 
    
    %% Loop on the different molar fractions
       
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        %% Parameter Varation due to STRAIN
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        % The presence of strain causes the electron affinity of silicon to 
        % increase and the bandgap and the effective mass of carriers to
        % decrease.

        deltaEC_s_Si = 0.57*mol;      %Shift in CB due to strain
        deltaEg_s_Si = 0.4*mol;       %Shift in Energy Gap due to strain

        %strain =(Vt/0.075)*log(mh_eff_Si/mh_eff_s_Si)^1.5;

        % Approximeted strain 
        strain = 0.075*mol;   %Strain approximation
        Eg_Si=1.12*q;
       

Vt= Kb*T/q ; % thermal voltage

hcut = 4.135667662e-15 / (2*pi);
 

chi_Si= 4.05*q;
Nsub = ni_Si;


        
        Vbi_Si = Eg_Si/(2*q) + Vt*log(Na/ni_Si); %Built-in voltage across the source–body and drain–body junctions 
        phi_Si = chi_Si/q + Vbi_Si;                           %Unstrained Si Work Function
        phi_sub= chi_Si/q + Eg_Si/(2*q) + Vt*log(Nsub/ni_Si); % Substrate work function
        
        % Ideal Front and Back Flatband Voltage
        phi_M = 4.35;
        V_FB_ox = phi_M - phi_Si;
      ,
        V_FB_box = phi_sub - phi_Si;
        
        % Flatband Voltage variation
        deltaV_FB_ox = - deltaEC_s_Si/q + deltaEg_s_Si/q - strain;
        deltaV_FB_box = - deltaEC_s_Si/q + deltaEg_s_Si/q - strain;
        
        % NEW Front and BACK Flatband Voltage
        V_FB_ox_s_Si= V_FB_ox + deltaV_FB_ox;
        V_FB_box_s_Si= V_FB_box + deltaV_FB_box;

        % NEW Built-in Voltage
        deltaVbi_s_Si= - deltaEg_s_Si/q + strain;
        Vbi_s_Si= Vbi_Si + deltaVbi_s_Si;
        
        % Effective Gate and Substrate Voltage
        Vgs_eff= Vgs - V_FB_ox_s_Si;    
        Vsub_eff= Vsub - V_FB_box_s_Si; 

        
        %% Surface potential ---> Solving Poisson Equation
        %Empirical parameters
        %%%%%%%%%%%%%%%%%%%%
        ni_Si=1.45e16;      % m^-3
Eg_Si=1.12*q;       % Eg_Si is the bandgap in unstrained-Si, eV
chi_Si= 4.05*q;     %chi_Si is the electron affinity in unstrained-Si

Nsub = ni_Si;         %Assuming intrinsic doping






meff_e = 1.08;      %Electron effectrive mass
meff_h = 0.57;      %Holes effective mass, it stays between 0.57/0.81 


phi_M = 4.35;

%% Capacitances per unit length
C_ox= eps_SiO2/t_f;     %Oxide capacitance [F/m^2]
C_box= eps_SiO2/t_b;    %Buried oxide capacitance
C_Si=eps_Si/t_Si;       %Silicon capacitance
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

        
        alpha = 2*(1+(C_ox/C_box)+(C_ox/C_Si))/(t_Si^2*(1+2*(C_Si/C_box)));
        
%         beta = q*Na/(eps_Si) - 2*Vgs_eff*((C_ox/C_box)+...
%                     (C_ox/C_Si))/(t_Si^2*(1+ 2*(C_Si/C_box)))...
%                         - 2*Vsub_eff/(t_Si^2 *(1+ 2*(C_Si/C_box)));
%         
         lambda= sqrt(alpha);
        
%        sigma= beta/alpha;
%         
%         %Coefficient of PE solution: obtained imposing boundary conditions
%         A = (((Vbi_s_Si+sigma+Vds)-...
%                 (Vbi_s_Si + sigma)*exp(-lambda*L_ch))/...
%                     (1-exp(-2*lambda*L_ch)) )* exp(-lambda*L_ch);
% 
%         B = ((Vbi_s_Si+sigma)-...
%                 (Vbi_s_Si + sigma + Vds)* exp(-lambda*L_ch))/...
%                         (1-exp(-2*lambda*L_ch));
%     
       
          phi_f= (Kb*T/q)*log(Na/Nsub); %Difference between the extrinsic 
%                                       %Fermi level in the bulk region and 
%                                       %the intrinsic Fermi level
%         
%         %phi_M = -Eg_Si/2 - phi_f;                             
          deltaphi_s_Si= deltaVbi_s_Si;
% 
          phi_th = 2*phi_f + deltaphi_s_Si; %value of surface potential at
                                          %which the volumetric inversion 
                                          %electron charge density in the 
                                          %strained-Si device is the same 
                                          %as that in the unstrained-Si at 
                                          %threshold, i.e., equal to the 
                                          %body doping

        
        %% Threshold voltage parameter

        E = 2*cosh(lambda*L_ch)- 2 - sinh(lambda*L_ch).^2;
        k = (1+ (C_ox/C_box)+(C_ox/C_Si))/((C_ox/C_box)+(C_ox/C_Si));
        u = (Vsub_eff/(1+(C_ox/C_box)+(C_ox/C_Si)))-...
                q*Na/(eps_Si*alpha)-(1/k)*V_FB_ox_s_Si;

        Vbi1 = (Vbi_s_Si - u)*(1-exp(-lambda*L_ch))+ Vds;
        Vbi2 = (Vbi_s_Si - u)*(exp(lambda*L_ch)-1) - Vds;        

        V_phi1 = Vbi1*(1-exp(lambda*L_ch))+...
                    ((2*phi_th - 2*u)*sinh(lambda*L_ch)^2)-...
                        Vbi2*(1-exp(-lambda*L_ch));
        V_phi2 = Vbi1.*Vbi2-(phi_th-u)^2 * sinh(lambda*L_ch)^2;
        
        % Final threshold voltage
       
            vth= -k*((-V_phi1 + sqrt((V_phi1).^2 - 4*E*V_phi2))/(2*E));
