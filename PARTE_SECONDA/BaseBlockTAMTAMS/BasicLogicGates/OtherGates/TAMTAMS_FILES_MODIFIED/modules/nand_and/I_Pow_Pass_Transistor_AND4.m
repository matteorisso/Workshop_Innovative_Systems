%% PASS-TRANSISTOR AND 4 POWER ANALYSIS
% Implementation of a model for the evaluation of power consumption of 4 inputs PASS-TRANSISTOR NAND-AND gates
%%

%%
% Code
%Data taken from: Ilj_nand_junction.m, Ilg_nand_gate.m, Ilo_nand_off.m	
% Dependencies: Ibtb_Kaushik.m, Igate, Ioff
% Module name: I_Pow_Pass_Transistor_and4.m
% Stored informations:  Iand4_pass_btb, Iand4_pass_gate, Iand4_pass_off, Pand4, Pand4_dyn
% Output: Ibtb_nand_and, Igate_nand_and, Ioff_nand_and, Pnand_and,  Pnand_and_dyn

Vtn=Vth(counter_tech_index);     		% V    
% Vth in mastar
Vtp=-Vth(counter_tech_index); ;    		% V    
% -Vth in mastar
Leff=Lgate(counter_tech_index)-Gamma(counter_tech_index)*Xj(counter_tech_index);    		% nm   
% Lel in mastar
tox_el=10*Tox_el(counter_tech_index);         	
pitch_met1=P(1,(counter_tech_index));
Rmet=res(counter_mod_index_tmp(2),counter_tech_index,:);
Cmet=cap(counter_mod_index_tmp(3),counter_tech_index,:);

Idsatn=Ion_n(counter_mod_index_tmp(4),counter_tech_index);
Idsatp=Ion_p(counter_mod_index_tmp(4),counter_tech_index);

% Changes the variable name to have a good readability of the code
Ibtb_nmos=Ibtb_n(counter_mod_index_tmp(5),counter_tech_index);      	% nA/um
%It's the junction current if the drain/source voltage is VDD
Ibtb_nmos_1=Ibtb_nmos;							% nA/um
%It's the junction current if the drain/source voltage is little less than VDD
Ibtb_nmos_1_2=Ibtb_nmos;						% nA/um
%It's the junction current if the drain/source voltage is VDD/2
Ibtb_nmos_1_3=Ibtb_nmos;						% nA/um
%It's the junction current if the drain/source voltage is VDD/3
Ibtb_nmos_2_3=Ibtb_nmos;						% nA/um
%It's the junction current if the drain/source voltage is (2/3)*VDD
Ibtb_nmos_1_4=Ibtb_nmos;						% nA/um
%It's the junction current if the drain/source voltage is VDD/4
Ibtb_nmos_3_4=Ibtb_nmos;						% nA/um
%It's the junction current if the drain/source voltage is (3/4)*VDD; we don't define for (2/4)*VDD because it's eaqual to VDD/2
Ibtb_nmos_1_5=Ibtb_nmos;						% nA/um
%It's the junction current if the drain/source voltage is VDD/5
Ibtb_nmos_2_5=Ibtb_nmos;						% nA/um
%It's the junction current if the drain/source voltage is (2/5)*VDD
Ibtb_nmos_3_5=Ibtb_nmos;						% nA/um
%It's the junction current if the drain/source voltage is (3/5)*VDD
Ibtb_nmos_4_5=Ibtb_nmos;						% nA/um
%It's the junction current if the drain/source voltage is (4/5)*VDD
Ibtb_pmos=Ibtb_p(counter_mod_index_tmp(5),counter_tech_index);      	% nA/um
%It's the junction current if the drain/source voltage is -VDD
Ibtb_pmos_1=Ibtb_pmos;      						% nA/um
%It's the junction current if the drain/source voltage is little more than -VDD
Ibtb_pmos_1_2=Ibtb_pmos;  						% nA/um
%It's the junction current if the drain/source voltage is -VDD/2

fs_I=Leff(counter_tech_index)./1000;  

% Device parameters

Coverlap_n=1e6.*(Cgd0n(counter_tech_index));              		% pf/um
% Overlap Capacitance in nMOS

Coverlap_p=1e6.*(Cgd0p(counter_tech_index));              		% pf/um
% Overlap Capacitance in pMOS

Cin_N=Cox(counter_tech_index)+2.*Coverlap_n;				% pF/um 
% nMOS input capacitance

Cin_P=Cox(counter_tech_index)+2.*Coverlap_p;				% pF/um 
% pMOS input capacitance   

lungh_diff=2.5.*fs_I; 							% um
% Source and drain diffusion length

Cbottom_n=lungh_diff.*Cj0n(counter_tech_index).*(1+Vdd(counter_tech_index)./(2.*Pbn(counter_tech_index))).^(-Mjn(counter_tech_index));     		%pF/um 
% nMOS source and drain diffusion capacitance

Csidewall_n=1e6.*Cjswn(counter_tech_index).*(1+Vdd(counter_tech_index)./(2.*Pbswn(counter_tech_index))).^(-Mswn(counter_tech_index)); 			%pF./um 
% nMOS source and drain sidewall capacitance

Cbottom_p=lungh_diff.*Cj0p(counter_tech_index).*(1+Vdd(counter_tech_index)./(2.*Pbp(counter_tech_index))).^(-Mjp(counter_tech_index)); 			%pF./um 
% pMOS source and drain diffusion capacitance

Csidewall_p=1e6.*Cjswp(counter_tech_index).*(1+Vdd(counter_tech_index)./(2.*Pbswp(counter_tech_index))).^(-Mswp(counter_tech_index));  			%pF./um 
% pMOS source and drain sidewall capacitance

if(p!=0.5)
Ravg=2./9.*(7.*(Ng.^(p-0.5)-1)./(4.^(p-0.5)-1)-(1-Ng.^(p-1.5))./(1-4.^(p-1.5)) ).*(1-4.^(p-1))./(1-Ng.^(p-1));
else
Ravg=2./9.*(7.*log(Ng)./log(4)-(1-Ng.^(p-1.5))./(1-4.^(p-1.5)) ).*(1-4.^(p-1))./(1-Ng.^(p-1));
endif

fan_in=2;

Pg=8.*pitch_met1./sqrt(se);  			% um

Lavg1=Pg.*Ravg;   				% um

Rorg=0.806.*1e6.*Vdd.*2./(Idsatn./fan_in+Idsatp);  	% Ohm*um


for fo=1:4

Lavg{fo}=Lavg1.*(1+0.4.*(fo-1));

T2(counter_tech_index)=1e6;
T1(counter_tech_index)=30e3;
k=1;

Rw=Rmet(:,:,1).*Lavg{fo}.*1e-4;  		% Ohm
Cw=Cmet(:,:,1).*1e12.*Lavg{fo}.*1e-4; 		% pF
%Rw=Rmet1.*Lavg{fo}*1e-4;  			% Ohm
%Cw=Cmet1.*1e12*Lavg{fo}*1e-4; 			% pF


% gate sizing 
while((T1(counter_tech_index)<T2(counter_tech_index).*(1-gate_criteria)) && (k<50))

T2=T1;
WD=k.*fs_I;

perim_N=2.*lungh_diff+WD; 
perim_P=2.*lungh_diff+2.*WD./fan_in;
CjN=Cbottom_n.*WD+Csidewall_n.*perim_N;
CjP=Cbottom_p.*2.*WD./fan_in+Csidewall_p.*perim_P;
Cj=CjN+CjP;

Cfo=fo.*WD.*(Cin_N+Cin_P);
Rdev=Rorg./WD;

R10_90=0.6.*Rorg./(0.806.*WD);
Tdin=(0.5-(1-Vtn./Vdd)./(1+a)).*(0.879.*Rw.*Cw+2.197.*(R10_90.*(Cj+Cfo+Cw)+Rw.*Cfo));  % 10/90 delay time
T1=0.377.*Rw.*Cw+0.693.*(Rdev.*(Cfo+Cj)+Rdev.*Cw+Rw.*Cfo)+Tdin;
k=k+1;

endwhile

Wopt{fo}=WD;
Tdelay{fo}=T1;

endfor

% Pass Transistor and4 - Ibtb  
%alpha_pass is the ratio between the pMOS and the nMOS width in pass transistor logic
%alpha_pass ---> datibase_modified.m
%We consider the same sizing for inverter and pass transistors.
for i=1:4

fan_in=4;Wgate=Wopt{i};

Wn=Wgate; 						% um
Wp=alpha_pass.*Wgate;					% um
  		
Ibtb_n_pass4=Ibtb_nmos.*Wn;      % nA
Ibtb_p_pass4=Ibtb_pmos.*Wp;      % nA

I_0_0_0_0=3.*Ibtb_n_pass4+12.*Ibtb_p_pass4;	%nA
I_0_0_0_1=2.*Ibtb_n_pass4+13.*Ibtb_p_pass4;	%nA
I_0_0_1_0=4.*Ibtb_n_pass4+11.*Ibtb_p_pass4;	%nA
I_0_0_1_1=4.*Ibtb_n_pass4+11.*Ibtb_p_pass4;	%nA
I_0_1_0_0=2.*Ibtb_n_pass4+13.*Ibtb_p_pass4;	%nA
I_0_1_0_1=Ibtb_n_pass4+14.*Ibtb_p_pass4;	%nA
I_0_1_1_0=3.*Ibtb_n_pass4+12.*Ibtb_p_pass4;	%nA
I_0_1_1_1=6.*Ibtb_n_pass4+9.*Ibtb_p_pass4;	%nA
I_1_0_0_0=4.*Ibtb_n_pass4+11.*Ibtb_p_pass4;	%nA
I_1_0_0_1=3.*Ibtb_n_pass4+12.*Ibtb_p_pass4;	%nA
I_1_0_1_0=5.*Ibtb_n_pass4+10.*Ibtb_p_pass4;	%nA
I_1_0_1_1=5.*Ibtb_n_pass4+10.*Ibtb_p_pass4;	%nA
I_1_1_0_0=6.*Ibtb_n_pass4+9.*Ibtb_p_pass4;	%nA
I_1_1_0_1=5.*Ibtb_n_pass4+10.*Ibtb_p_pass4;	%nA
I_1_1_1_0=7.*Ibtb_n_pass4+8.*Ibtb_p_pass4;	%nA
I_1_1_1_1=3.*Ibtb_n_pass4+12.*Ibtb_p_pass4;	%nA

Iand4_pass_btb(counter_mod_index, counter_tech_index, i)=(I_0_0_0_0+I_0_0_0_1+I_0_0_1_0+I_0_0_1_1+I_0_1_0_0+I_0_1_0_1+I_0_1_1_0+I_0_1_1_1+I_1_0_0_0+I_1_0_0_1+I_1_0_1_0+I_1_0_1_0+I_1_0_1_1+I_1_1_0_0+I_1_1_0_1+I_1_1_1_0+I_1_1_1_1)./16;	% nA

Ibtb_nand_and(counter_mod_index, counter_tech_index,i)=Iand4_pass_btb(counter_mod_index, counter_tech_index,i);

MULTIVDD=[Vdd(counter_tech_index), VDD2]; % V 
% Power supply Vector

Pand4_btb(counter_mod_index,counter_tech_index,i)=0;

for j=1:length(MULTIVDD)
		Pand4_btb(counter_mod_index,counter_tech_index,i)=Pand4_btb(counter_mod_index,counter_tech_index,i)+Iand4_pass_btb(counter_mod_index,counter_tech_index,i).*MULTIVDD(j).*1e-9; % W

endfor  

endfor

Igate_nmos=Igate_n(counter_mod_index_tmp(5),counter_tech_index);    % nA/um
Igate_pmos=Igate_p(counter_mod_index_tmp(5),counter_tech_index);    % nA/um

% Pass Transistor and4 - Igate 
% kclock is the ratio between the width of the nMOS clock transistor and nMOS pull-down transistor
% kclock -----> datibase.m

for i=1:4

fan_in=4;Wgate=Wopt{i};

Wn=Wgate; 						% um
Wp=alpha_pass.*Wgate;					% um
  		
Igate_n_pass4=Igate_nmos.*Wn;    % nA
Igate_p_pass4=Igate_pmos.*Wp;    % nA

I_0_0_0_0=3.*(2.*Igate_p_pass4+Igate_n_pass4);		%nA
I_0_0_0_1=4.*Igate_n_pass4+5.*Igate_p_pass4;		%nA
I_0_0_1_0=3.*Igate_n_pass4+5.*Igate_p_pass4;		%nA
I_0_0_1_1=4.*Igate_n_pass4+4.*Igate_p_pass4;		%nA
I_0_1_0_0=4.*Igate_n_pass4+5.*Igate_p_pass4;		%nA
I_0_1_0_1=5.*Igate_n_pass4+4.*Igate_p_pass4;		%nA
I_0_1_1_0=4.*(Igate_n_pass4+Igate_p_pass4);		%nA
I_0_1_1_1=5.*Igate_n_pass4+3.*Igate_p_pass4;		%nA
I_1_0_0_0=3.*Igate_n_pass4+5.*Igate_p_pass4;		%nA
I_1_0_0_1=2.*(2.*Igate_n_pass4+2.*Igate_p_pass4);	%nA
I_1_0_1_0=3.*Igate_n_pass4+4.*Igate_p_pass4;		%nA
I_1_0_1_1=4.*Igate_n_pass4+3.*Igate_p_pass4;		%nA
I_1_1_0_0=3.*Igate_n_pass4+4.*Igate_p_pass4;		%nA
I_1_1_0_1=4.*Igate_n_pass4+3.*Igate_p_pass4;		%nA
I_1_1_1_0=3.*(2.*Igate_p_pass4+Igate_n_pass4);		%nA
I_1_1_1_1=3.*(Igate_n_pass4+Igate_p_pass4);		%nA

Iand4_pass_gate(counter_mod_index, counter_tech_index, i)=(I_0_0_0_0+I_0_0_0_1+I_0_0_1_0+I_0_0_1_1+I_0_1_0_0+I_0_1_0_1+I_0_1_1_0+I_0_1_1_1+I_1_0_0_0+I_1_0_0_1+I_1_0_1_0+I_1_0_1_0+I_1_0_1_1+I_1_1_0_0+I_1_1_0_1+I_1_1_1_0+I_1_1_1_1)./16;	% nA

Igate_nand_and(counter_mod_index, counter_tech_index,i)=Iand4_pass_gate(counter_mod_index, counter_tech_index,i) ;

MULTIVDD=[Vdd(counter_tech_index), VDD2]; % V 
% Power supply Vector

Pand4_gate(counter_mod_index,counter_tech_index,i)=0;

for j=1:length(MULTIVDD)
		Pand4_gate(counter_mod_index,counter_tech_index,i)=Pand4_gate(counter_mod_index,counter_tech_index,i)+Iand4_pass_gate(counter_mod_index,counter_tech_index,i).*MULTIVDD(j).*1e-9; % W
		
endfor  

endfor

%We define the voltage drop (VDS) when the transistors,in series, are switched off.
%In our case we divide the output voltage, that is equal to Vdd, many times to correspond to the number of transistors off.
Vds_2=Vdd(counter_tech_index)./2; 	%V
%Voltage Drop when two transistors in series are switched off
Vds_3=Vdd(counter_tech_index)./3; 	%V
%Voltage Drop when three transistors in series are switched off
Vds_4=Vdd(counter_tech_index)./4; 	%V
%Voltage Drop when four transistors in series are switched off
Vds_5=Vdd(counter_tech_index)./5; 	%V
%Voltage Drop when five transistors in series are switched off

% Changes the variable name to have a good readability of the code
Ioff_nmos=Ioff_n(counter_mod_index_tmp(5),counter_tech_index);      	% nA/um
Ioff_nmos_1=Ioff_nmos.*(1-exp(-Vdd(counter_tech_index)./(Vt)));		% nA/um
%It's the sunbthreshold current in the case of one nMOS in series are swithed off
Ioff_nmos_2=Ioff_nmos.*(1-exp(-Vds_2./(Vt)));				% nA/um
%It's the sunbthreshold current in the case of two nMOSs in series are swithed off
Ioff_nmos_3=Ioff_nmos.*(1-exp(-Vds_3./(Vt))); 				% nA/um
%It's the sunbthreshold current in the case of three nMOSs in series are swithed off
Ioff_nmos_4=Ioff_nmos.*(1-exp(-Vds_4./(Vt))); 				% nA/um
%It's the sunbthreshold current in the case of four nMOSs in series are swithed off
Ioff_nmos_5=Ioff_nmos.*(1-exp(-Vds_5./(Vt))); 				% nA/um
%It's the sunbthreshold current in the case of five nMOSs in series in domino log are swithed off
Ioff_pmos=Ioff_p(counter_mod_index_tmp(5),counter_tech_index);      	% nA/um
Ioff_pmos_1=Ioff_pmos.*(1-exp(-Vdd(counter_tech_index)./(Vt)));		% nA/um
%It's the sunbthreshold current in the case of one pMOS in series are swithed off
Ioff_pmos_2=Ioff_pmos.*(1-exp(-Vds_2./(Vt)));  				% nA/um
%It's the sunbthreshold current in the case of two pMOSs in series are swithed off

% Pass Transistor and4 - Ioff 
% kclock is the ratio between the width of the nMOS clock transistor and nMOS pull-down transistor
% kclock -----> datibase.m

for i=1:4

fan_in=4;Wgate=Wopt{i};

Wn=Wgate; 						% um
Wp=alpha_pass.*Wgate;					% um
  		
Ioff_n_pass4=Ioff_nmos.*Wn;      % nA
Ioff_p_pass4=Ioff_pmos.*Wp;      % nA

I_0_0_0_0=3.*Ioff_n_pass4;			%nA
I_0_0_0_1=2.*Ioff_n_pass4+Ioff_p_pass4;		%nA
I_0_0_1_0=3.*Ioff_n_pass4+Ioff_p_pass4;		%nA
I_0_0_1_1=2.*Ioff_p_pass4+2.*Ioff_n_pass4;	%nA
I_0_1_0_0=2.*Ioff_n_pass4+Ioff_p_pass4;		%nA
I_0_1_0_1=Ioff_n_pass4+2.*Ioff_p_pass4;		%nA
I_0_1_1_0=2.*(Ioff_n_pass4+Ioff_p_pass4);	%nA
I_0_1_1_1=Ioff_n_pass4+3.*Ioff_p_pass4;		%nA
I_1_0_0_0=3.*Ioff_n_pass4+Ioff_p_pass4;		%nA
I_1_0_0_1=2.*(Ioff_n_pass4+Ioff_p_pass4);	%nA
I_1_0_1_0=3.*Ioff_n_pass4+2.*Ioff_p_pass4;	%nA
I_1_0_1_1=2.*Ioff_n_pass4+3.*Ioff_p_pass4;	%nA
I_1_1_0_0=3.*Ioff_n_pass4+2.*Ioff_p_pass4;	%nA
I_1_1_0_1=2.*Ioff_n_pass4+3.*Ioff_p_pass4;	%nA
I_1_1_1_0=3.*Ioff_n_pass4;			%nA
I_1_1_1_1=3.*(Ioff_p_pass4+Ioff_n_pass4);	%nA

Iand4_pass_off(counter_mod_index, counter_tech_index, i)=(I_0_0_0_0+I_0_0_0_1+I_0_0_1_0+I_0_0_1_1+I_0_1_0_0+I_0_1_0_1+I_0_1_1_0+I_0_1_1_1+I_1_0_0_0+I_1_0_0_1+I_1_0_1_0+I_1_0_1_0+I_1_0_1_1+I_1_1_0_0+I_1_1_0_1+I_1_1_1_0+I_1_1_1_1)./16;	% nA

Ioff_nand_and(counter_mod_index, counter_tech_index,i)=Iand4_pass_off(counter_mod_index, counter_tech_index,i);

MULTIVDD=[Vdd(counter_tech_index), VDD2]; % V 
% Power supply Vector

Pand4_off(counter_mod_index,counter_tech_index,i)=0;

for j=1:length(MULTIVDD)
		Pand4_off(counter_mod_index,counter_tech_index,i)=Pand4_off(counter_mod_index,counter_tech_index,i)+Iand4_pass_off(counter_mod_index,counter_tech_index,i).*MULTIVDD(j).*1e-9; % W 

endfor 

endfor

% POWER Pass Transistor and4 

% Vdd_d is the distribution of Vdd in multi-supply voltage chip
% Vdd_d and VDD2 ---> datibase.m

Pand4(counter_mod_index,counter_tech_index,:)=Pand4_off(counter_mod_index,counter_tech_index,:)+Pand4_gate(counter_mod_index,counter_tech_index,:)+Pand4_btb(counter_mod_index,counter_tech_index,:); % W

Pnand_and(counter_mod_index,counter_tech_index,:)=Pand4(counter_mod_index,counter_tech_index,:);

for i=1:4

	Pand4_dyn(counter_mod_index,counter_tech_index,i)=0;
	for j=1:length(MULTIVDD)
			Pand4_dyn(counter_mod_index,counter_tech_index,i)=Pand4_dyn(counter_mod_index,counter_tech_index,i)+(Cand4_pass(counter_mod_index,counter_tech_index,i).*1e-12).*Vdd_d(j).*MULTIVDD(j).^2.*freq(counter_mod_index,counter_tech_index).*1e6; % W 
	endfor

endfor

Pnand_and_dyn(counter_mod_index,counter_tech_index,:)=Pand4_dyn(counter_mod_index,counter_tech_index,:);

Delay_nand_and(counter_mod_index,counter_tech_index,:)= [0, 0, 0, 0];
%%
