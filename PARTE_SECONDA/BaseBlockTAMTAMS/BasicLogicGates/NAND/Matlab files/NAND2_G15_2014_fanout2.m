Cox = Cox*1e1;				%pF

Leff=Lgate-Gamma*Xj;        %nm
fs_I=Leff./1000;

% Source and drain diffusion length
lungh_diff=2.5.*fs_I; 		%um

% nMOS source and drain diffusion capacitance
Cbottom_n=lungh_diff.*Cj0n.*(1+Vdd./(2.*Pbn)).^(-Mjn);     		%pF/um

% nMOS source and drain sidewall capacitance
Csidewall_n=1e6.*Cjswn.*(1+Vdd./(2.*Pbswn)).^(-Mswn); 			%pF./um

% pMOS source and drain diffusion capacitance
Cbottom_p=lungh_diff.*Cj0p.*(1+Vdd./(2.*Pbp)).^(-Mjp); 			%pF./um

% pMOS source and drain sidewall capacitance
Csidewall_p=1e6.*Cjswp.*(1+Vdd./(2.*Pbswp)).^(-Mswp);  			%pF./um

WD=k.*fs_I;
perim_N=2.*lungh_diff+WD;
perim_P=2.*lungh_diff+2.*WD;
Cjn=Cbottom_n.*WD+Csidewall_n.*perim_N;		%pF
Cjp=Cbottom_p.*2.*WD+Csidewall_p.*perim_P;	%pF

%pA is the probability that input A is equal to 1
%pB is the probability that input b is equal to 1

Wn = Wgate;          %um
Wp = 1.29*Wgate;     %um

Igate_nmos = Igate_n*Wn;       %nA
Igate_pmos = Igate_p*Wp;       %nA

Ioff_nmos = Ioff_n*Wn;      %nA
Ioff_pmos = Ioff_p*Wp;      %nA

%P_static nand 2-input
Power_static_nd2 = Vdd*((1-pA)*(1-pB)*(Ioff_nmos + 2*Igate_pmos)+(1-pA)*pB*(2*Ioff_nmos + 2*Igate_nmos + Igate_pmos)+(pA*(1-pB)*(2*Ioff_nmos + Igate_pmos))+(pA*pB*(2*Ioff_pmos + 2*2*Igate_nmos)))*1e-9	%W

%%output switching acticity
alpha_a = pA*(1 - pA);
alpha_b = pB*(1 - pB);
P_out = 1 - pA*pB;
alpha_out = P_out*(1 - P_out);
P_x1 = (pA*(1-pB))/(1-(1-pA)*(1-pB));
alpha_x1 = P_x1*(1-P_x1);

%%capacitances
Coverlap_n=1e6.*Cgd0n; %pF/um
Coverlap_p=1e6.*Cgd0p; %pF/um
Cin = Cox*Leff*1e-3*2*Wn + Cox*Leff*1e-3*Wp + 2*Coverlap_n +2*Coverlap_p;	%pF
Cx1 = Cjn;				%pF
Cout = Cjn + 2*Cjp;		%pF

%%total switching capacitance
Cs_nd2 = Cin*(alpha_a + alpha_b)+(Cx1*alpha_x1)+(Cout*alpha_out);	%pF

%%P_dyn nand 2-input
P_dyn = 1/2 * Cs_nd2*1e-12 * freq*1e6 * Vdd^2		%W

%%delay nand 2-input
Cl = Cin*2;		%pF
Cnd2 = Cout + Cl;		%pF
Cf01 = Cox*Leff*1e-3*Wn + Cox*Leff*1e-3*Wp + Coverlap_n + Coverlap_p;	%pF	 Cin inverter
Cinv = Cjn + Cjp + Cf01;			%pF
Cmos = Cox*Leff*1e-3*Wn;	%pF
t_mos = Cmos*1e-12*Vdd/(Ion_n*Wn*1e-6);	%s		MOS delay	
t_inv = t_mos*Cinv/Cmos; %s		inverter delay
t_nd2 = t_inv*Cnd2/Cinv %s		nand 2-input delay
f_max = 1/t_nd2 		%Hz		max frequency nand 2-input

%%delay nand 2-input Elmore model
R = 1/(mueff_n*1e8*Cox*1e-12*(Wn/Leff)*1e3*(Vdd-Vtn));	%Ohm
tpdr = ((2*mueff_p/mueff_n + 2)+4*2)*R*Cout*1e-12;	%s
tpdf = (2*Cout*1e-12)*R/2+(((2*mueff_p/mueff_n) + 2 + 4*2)*Cout*1e-12)*(R/2 + R/2);	%s
tpd = (tpdr + tpdf)/2	%s