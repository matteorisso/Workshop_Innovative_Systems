%Output analysis of BULK - HP 2010 - CMOS NAND2

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%	https://tamtams.vlsilab.polito.it/Documentation/TechnologyHTML/bulk/HP2010_dev_bul.html	%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

Cox = 5.3124e-06
Vtlong = 0.56919
SCE = 0.18999
DIBL = 0.21532
mueff_n = 159.99
mueff_p = 51.647
mueff_n_over_mueff_p = 3,098

%%%%%%%%%%%%%%%%%%%%%% Fan Out = 1 %%%%%%%%%%%%%%%%%%%%%%

Igate_FO1 = 1.0147e+05		%%[nA]
Ioff_FO1 = 1.2499e+02		%%[nA]
P_stat_FO1 = 2.0318e-04		%%[W]
P_dyn_FO1 = 2.3776e-06		%%[W]

%%%%%%%%%%%%%%%%%%%%%% Fan Out = 2 %%%%%%%%%%%%%%%%%%%%%%

Igate_FO2 = 9.6394e+04		%%[nA]
Ioff_FO2 = 1.1874e+02		%%[nA]
P_stat_FO2 = 1.9302e-04		%%[W]
P_dyn_FO2 = 2.2560e-06		%%[W]

%%%%%%%%%%%%%%%%%%%%%% Fan Out = 3 %%%%%%%%%%%%%%%%%%%%%%

Igate_FO3= 9.1320e+04		%%[nA]
Ioff_FO3 = 1.1249e+02		%%[nA]
P_stat_FO3 = 1.8287e-04		%%[W]
P_dyn_FO3 = 2.1343e-06		%%[W]

%%%%%%%%%%%%%%%%%%%%%% Fan Out = 4 %%%%%%%%%%%%%%%%%%%%%%

Igate_FO4 = 9.1320e+04		%%[nA]
Ioff_FO4 = 1.1249e+02		%%[nA]
P_stat_FO4 = 1.8287e-04		%%[W]
P_dyn_FO4 = 2.1343e-06		%%[W]

%%%%%%%%%%%%%%%%%%%%%%%%% Area %%%%%%%%%%%%%%%%%%%%%%%%%%


Area_NAND2 = 262144		%%[nm2] 256*1024

%%%%%%%%%%% appunti per Area:

%% 2010 node - 32 nm --> pitch metal 1 = 2*techNode = 64 nm

%% DX = 4*pitch metal 1 	= 4*64 nm = 256 nm
%% DY = 16*pitch metal 1 	= 16*64 nm = 1024 nm
%% gate pitch = sqrt(DX*DY) = 512 nm



