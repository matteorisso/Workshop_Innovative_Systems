t_f=10e-9;
eps_0=8.85e-12;
eps_ox=3.9*eps_0;
Cox=eps_ox/t_f;
k=1;
Wgate=6;
%%From International road maps some values of gate current 
Ion_n=400; %%uA
Igate_nmos=224e-3;  %224
Igate_pmos=1.29*Igate_nmos;
Ioff_nmos=0.027;
Ioff_pmos=1.29*Iof_nmos;
mueff_n=6.37e-1;
Vtn=0.7;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Model=2; %%SOI         Type
%%year      =2020; %%             Year
Lgate=12; %%nm           Physical Gate Length 
Ldraw=35; %% NON SICURO: lo stesso valore di hp_2007 perché non sono riuscito a trovarlo
Tox=0.8; %%nm            Physical Gate Oxide Thickness 
Nbulk=1e17; %%cm^-3        Channel Doping (w/o Pockets)             
Nd=3e20; %% NON SICURO:Ho usato Npoly da GateStack; potrebbe essere quelo di Ngp cm^-3        drogaggio polisilicio n+	
Next=7.819e18; %% NON SICUR0: valore di HP_2007 cm^-3	  extensions doping  
Nc=3.2e18; %% NON SICURO:Ho usato Nsub da Pockets cm^-3        source/drain doping - non sono sicuro che il valore sia corretto altrimenti uguale a Ngp
Xj=2.1; %%nm
Tsi=2.1; %%nm
Tbox=10; %%nm Buried Oxide Thickness
Ngp=1e20; %%cm^-3 Ground Plain doping level
Vdd=1; %%V            Operation Voltage (Gate and Drain Voltage) 
Darks=5.3; %%[Å = 0.1nm]  Extension of the Dark Space (in EOT). 
Polyd=4.0; %%[Å = 0.1nm]  Extension of the poly-depletion (in EOT)
Rconst_n=163.46; %%Ohm        These values are simply the result from a fitting of Mastar's outputs. 
Rconst_p=216.1; %%Ohm     Racc for pMOS
X=0; %%/ CHE COSA E'?
Cpoches=5.2e13; %%at/cm²
Angle=25; %%°            Pocket Implantation Angle 
Rp=10; %% NON SICURO: lasciato valore di hp_2007 non avendolo trovato. 	nm
Delta_rp=6; %% NON SICURO: lasciato valore di hp_2007 non avendolo trovato. 	nm
Delta_rl=3; %% NON SICURO: lasciato valore di hp_2007 non avendolo trovato. 	nm
ActivePkt=0; %% NON SICURO: lasciato valore di hp_2007 non avendolo trovato. 	nm
Wt=1000; %%nm           Width       
Phi_m=4.65; %% NON SICURO: valore di mastar
Nsub=3.2e18; %%cm^-3        drogaggio Si
Kp=1; %%  Stress enhancement on pocket region When > 1 corresponds to strained silicon (1.801)
Kvs=1; %% Saturation velocity
Kfield=1; %%             Effective electric field reduction 
Fring_cap=1.6e-16; %%F/um
Gamma=0.6; %%             Scaling Factor for the Lateral Diffusion: Lelec=Lgate-gamma*Xj   
phi_s=1.6185; %% ricavato dal file phi_compute.m      
Zeta=0.77; %%             Scaling Factor for the DIBL (Drain Induced Barrier Lowering) 
%%kappa     =79; %% NON SICURO: lasciato il valore di hp_2005 non avendolo trovato
Zeta2=1; %%             Scaling Factor for the SCE (Short Channel Effect) 
Ith=5e-7; %%A            Id at the threshold voltage used to calculate S Ithnew activates the doping dependence of Ith calculation. 
%%delta     =0.03; %%             Shift between Vth “on�? and Vth �?off�? Is replaced by a QM estimation when “Vthon QM confin. hint�? is activated 
Sigma=1; %% NON SICURO: lasciato il valore di hp_2007 non avendolo trovato
%%ig_improve=1; %% NON SICURO: lasciato il valore di hp_2007 non avendolo trovato
es= 11.8;
esio2= 3.9;
%%DopH 		= 30; %% doping depth of source/drain
%%DopW		= 100; %% doping width of source/drain
%%LDDW		= 50; %% doping width of source/drain extension
%%GateH		= 40; %% gate thickness
%%ContW		= 30; %% contact width
%%Diff		= 5; %% ray of annealing diffusion
VddIO    =1;   %added to integrate bacpac and mastar; it's the Vdd of the previous node of the considered one

rh=2.2e-6;   % Resistivity Ohm*cm for Cu(used by BacPac original Rmet calculation) 

Cj0n=2.7e-3;    %F/m2 = pF/um2	 Junction capacitance per unit area under zero-bias conditions  
Cj0p=3.3e-3;    %F/m2 = pf/um2	 Junction capacitance per unit area under zero-bias conditions  

Cjswn=9.2e-10;  %F/m			     Sidewall junction capacitance  
Cjswp=8e-10;    %F/m			     Sidewall junction capacitance  

Cgd0n=1.35e-10; %F/m			     Overlap capacitance between gate and drain per unit transistor width  
Cgd0p=1.00e-10; %F/m			     Overlap capacitance between gate and drain per unit transistor width  

 
Mjn  = 0.38;			
Mjp  = 0.45;			
Mswn = 0.22;			
Mswp = 0.265;			

Pbn = 0.85;			%V 
Pbp = 0.87;			%V 
Pbswn = 0.67;			%V 
Pbswp = 0.76;			%V 

% % parametri di interconnessione
% 
% rho(counter_tech)=2.2e-6;   % Ohm*cm for Cu(used by BacPac original Rmet calculation) 
% 
% num_level_met(counter_tech)= 13; %                                                       % Number of stack interconnection (metal)
% num_level_IMD   (counter_tech)= 13;                                                       % Number of stack interconnection (IMD dielectric)
% num_level_ILD   (counter_tech)= 14;                                                       % Number of stack interconnection (ILD dielectric)
% global_lay(counter_tech)=7;
% %number of global level
% 
% %% Input Width K coefficient, Pitch, AR
% 
% %AspectRatio's from ROADMAP
% met_ARloc=2; %
% met_ARint=2; %
% met_ARglob=2.34; %
% 
% ILD_ARloc=2;
% ILD_ARint=1.8;
% ILD_ARglob=1.5;
% 
% 
% Pitch           (:,counter_tech)= [36, 36, 36, 36, 36, 36, 54, 54, 54, 54, 54, 54, 54];    % Minimum Pitch [nm]                  % Pitch variation Metal [nm]
% Pi_var_metal    (:,counter_tech)= [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];  % Pitch variation Metal [nm]
% 
% %NB width of metal is assumed to be equal to via thickness; width of metal is calculated via PITCH, assuming an half occupation
% 
% Width(:,counter_tech)=Pitch(:,counter_tech)./2; %can be inserted manually; assumed to be equal to half a pitch for simplicity
% 
% IN_K_Width      (:,counter_tech)= [1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1];                         % K Width Coefficient         % Our Extimation
% Wi_var_metal    (:,counter_tech)= [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];  
% 
% % calculated as AR*Width(AR is different for every level, see ROADMAP)
% %can be inserted manually, if real data are avalaible
% 
% Th_Metal(1,counter_tech)=met_ARloc.*Width(1,counter_tech);
% Th_Metal(2:num_level_met(counter_tech)-global_lay(counter_tech),counter_tech)=met_ARint.*Width(2:num_level_met(counter_tech)-global_lay(counter_tech),counter_tech);
% Th_Metal(num_level_met(counter_tech)-global_lay(counter_tech)+1:num_level_met(counter_tech),counter_tech)=met_ARglob.*Width(num_level_met(counter_tech)-global_lay(counter_tech)+1:num_level_met(counter_tech),counter_tech);
% Th_var_metal    (:,counter_tech)= [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
% 
% rhoCub          (:,counter_tech)= [6.35e-6, 6.35e-6, 6.35e-6, 6.35e-6, 6.35e-6, 6.35e-6, 5.31e-6, 5.31e-6, 5.31e-6, 5.31e-6, 5.31e-6, 5.31e-6, 5.31e-6];    
% % Ohm*cm for Cu with cladding barrier
% 
% plc        (:,counter_tech)= [0.5, 0.2, 0.15, 0.05, 0.05, 0.025, 0.015, 0.010]; %NON puÃ² funzionre 
% % percentage of local connession per level( 'local' are the first num_level_met-global_lay layers) used for an UNTESTED version of the module FREQ_POWER
% 
% 
% % via assumed to be thick as ILD, with an width equal to metal one.So the via thick is calculated using the ILD_AR and width data
% 
% v_Th_ILD_diel     (:,counter_tech)= [72, 65, 65, 65, 65, 65, 81, 81, 81, 81, 81, 81, 81, 81]; % [nm]
% v_Th_ILD_diel=v_Th_ILD_diel./2;
% Th_ILD_diel(1,counter_tech)=ILD_ARloc.*Width(1,counter_tech);
% Th_ILD_diel(2:num_level_met(counter_tech)-global_lay(counter_tech),counter_tech)=ILD_ARint.*Width(2:num_level_met(counter_tech)-global_lay(counter_tech),counter_tech);
% Th_ILD_diel(num_level_met(counter_tech)-global_lay(counter_tech)+1:num_level_met(counter_tech),counter_tech)=ILD_ARglob.*Width(num_level_met(counter_tech)-global_lay(counter_tech)+1:num_level_met(counter_tech),counter_tech);
% Th_ILD_diel(num_level_ILD)=Th_ILD_diel(num_level_ILD-1);
% Th_var_ILD_diel (:,counter_tech)= [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];  
% K_ILD_diel      (:,counter_tech)= [2.47, 2.47, 2.47, 2.47, 2.47, 2.47, 2.47, 2.47, 2.47, 2.47, 2.47, 2.47, 2.47, 2.47];    %ILD effective dielectric constant
% Th_via (:,counter_tech)=Th_ILD_diel (:,counter_tech);
% Th_var_via      (:,counter_tech)= [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]; 
% 
% % IMD thick is assumed equal to met_thick
% Th_IMD_diel(:,counter_tech)=Th_Metal(:,counter_tech); 
% Th_var_IMD_diel (:,counter_tech)= [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
% K_IMD_diel      (:,counter_tech)= [2.15, 2.15, 2.15, 2.15, 2.15, 2.15, 2.15, 2.15, 2.15, 2.15, 2.15, 2.15, 2.15];    %IMD effective dielectric constant
% 
% %% Input Process Variation Parameters
% IN_alfa_pitch_metal  (:,counter_tech)= [0.15, 0.47, 0.10, -0.30, -0.67, 0.25, -0.52, 0.74, 0.25, -0.52, 0.74, 0.44, 0.07, 0.25];         % Our Extimation
% IN_alfa_width_metal  (:,counter_tech)= [0.15, 0.47, 0.10, -0.30, -0.67, 0.25, -0.52, 0.74, 0.25, -0.52, 0.74, 0.44, 0.07, 0.25];         % Our Extimation
% IN_alfa_thick_metal  (:,counter_tech)= [0.10, 0.25, 0.10, -0.22, -0.37, 0.12, -0.45, 0.61, 0.12, -0.45, 0.61, 0.31, 0.01, 0.18];         % Our Extimation
% IN_alfa_thick_diel   (:,counter_tech)= [0.10, 0.25, 0.10, -0.22, -0.37, 0.12, -0.45, 0.02, 0.49, -0.45, 0.02, 0.49, 0.19, 0.08, 0.11];   % Our Extimation
% IN_alfa_thick_via    (:,counter_tech)= [0.10, 0.25, 0.10, -0.22, -0.37, 0.12, -0.45, 0.61, -0.45, 0.61, 0.61, 0.31, 0.01, 0.15];         % Our Extimation
% 
% %% Input tipology percentage of interconnection lines (for every level of metal)
% 
% % Our extimation
% perc_parallel_2gp      (:,counter_tech)= [0.60, 0.60, 0.60, 0.60, 0.60, 0.60, 0.60, 0.60, 0.60, 0.60, 0.60, 0.60, 0.00];  % Ex. Bus
% perc_parallel_1gp      (:,counter_tech)= [0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.70];  % Ex. Top Level Interconnect
% 
% %% Vectors Definition
% 
% for i = 1:num_level_met(counter_tech)              % [um] Effective Pitch
%     P(i,counter_tech) = (Pitch(i,counter_tech) + IN_alfa_pitch_metal(i,counter_tech)*Pi_var_metal(i,counter_tech))*10^(-3);
% end
% 
% for i = 1:num_level_met(counter_tech)                                 % [um] Effective Width Line
%     W(i,counter_tech) = (Width(i,counter_tech)*IN_K_Width(i,counter_tech) + IN_alfa_width_metal(i,counter_tech)*Wi_var_metal(i,counter_tech))*10^(-3);
% end
% 
% for i = 1:num_level_met(counter_tech)                                 % [um] Effective Thickness Line
%     T(i,counter_tech) = (Th_Metal(i,counter_tech) + IN_alfa_thick_metal(i,counter_tech)*Th_var_metal(i,counter_tech))*10^(-3);
% end
% 
% for i = 1:num_level_ILD                                 % [um] Effective Thickness ILD Dielectric
%     H(i,counter_tech) = (Th_ILD_diel(i,counter_tech) + IN_alfa_thick_diel(i,counter_tech)*Th_var_ILD_diel(i,counter_tech))*10^(-3);
% end
% 
% for i = 1:num_level_IMD                                 % [um] Effective Thickness IMD Dielectric
%     H_IMD(i,counter_tech) = (Th_IMD_diel(i,counter_tech) + IN_alfa_thick_diel(i,counter_tech)*Th_var_IMD_diel(i,counter_tech))*10^(-3);
% end
% 
% for i = 1:num_level_met(counter_tech)                                 % [um] Effective Thickness Via 
%     V(i,counter_tech) = (Th_via(i,counter_tech) + IN_alfa_thick_via(i,counter_tech)*Th_var_via(i,counter_tech))*10^(-3);
% end
% 
% for i = 1:num_level_met(counter_tech)                                 % [um] Effective Space Line (Pitch - Width)
%     S(i,counter_tech) = P(i,counter_tech)-W(i,counter_tech);
% end
% 
