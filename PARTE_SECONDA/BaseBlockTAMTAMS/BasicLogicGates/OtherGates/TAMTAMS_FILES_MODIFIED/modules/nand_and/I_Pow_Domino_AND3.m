%% DOMINO NAND 3 POWER ANALYSIS
% Implementation of a model for the evaluation of power consumption of 3 inputs DOMINO NAND-AND gates
%%

%%
% Code
%Data taken from: Ilj_nand_junction.m, Ilg_nand_gate.m, Ilo_nand_off.m
% Dependencies: Ibtb_Kaushik.m, Igate, Ioff
% Module name: I_Pow_Domino_and3.m
% Stored informations:  Iand3_dyn_btb, Iand3_dyn_gate, Iand3_dyn_off, Pand3,  Pand3_dyn
% Output: Ibtb_nand_and, Igate_nand_and, Ioff_nand_and, Pnand_and, Pnand_and_dyn

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

% Domino and3 - Ibtb 
% kclock is the ratio between the width of the nMOS clock transistor and nMOS pull-down transistor
% kclock -----> datibase.m

for i=1:4

fan_in=3;Wgate=Wopt{i};
  		
Wn_PD=fan_in.*Wgate;   							% um 
Wn_clk=kclock.*fan_in.*Wgate;						% um
Wp_clk=alpha_W.*Wn_clk;							% um
Wn_inv=Wgate; 								% um
Wp_inv=alpha_W.*Wgate; 							% um 


%Ioff of the inverter
Ibtb_n_inv=Ibtb_nmos.*Wn_inv;      	% nA
Ibtb_p_inv=Ibtb_pmos.*Wp_inv;      	% nA

Ibtb_clk_p_dyn3=Ibtb_pmos.*Wp_clk;      	% nA
Ibtb1_clk_n_dyn3=Ibtb_nmos_1.*Wn_clk;		% nA
Ibtb1_2_clk_n_dyn3=Ibtb_nmos_1_2.*Wn_clk;	% nA
Ibtb1_3_clk_n_dyn3=Ibtb_nmos_1_3.*Wn_clk;	% nA
Ibtb1_4_clk_n_dyn3=Ibtb_nmos_1_4.*Wn_clk;	% nA
Ibtb_n_dyn3=Ibtb_nmos.*Wn_PD;   		% nA
Ibtb1_n_dyn3=Ibtb_nmos_1.*Wn_PD;   		% nA
Ibtb1_2_n_dyn3=Ibtb_nmos_1_2.*Wn_PD;   		% nA
Ibtb1_3_n_dyn3=Ibtb_nmos_1_3.*Wn_PD;   		% nA
Ibtb2_3_n_dyn3=Ibtb_nmos_2_3.*Wn_PD;   		% nA
Ibtb1_4_n_dyn3=Ibtb_nmos_1_4.*Wn_PD;   		% nA
Ibtb3_4_n_dyn3=Ibtb_nmos_3_4.*Wn_PD;   		% nA

% CLOCK = 0 ----> CHARGE PHASE
% There are four different Ioff contributes because we have four transistors in series.

I_0_0_0=Ibtb_n_dyn3+Ibtb3_4_n_dyn3+Ibtb1_2_n_dyn3+Ibtb1_4_n_dyn3+Ibtb1_4_clk_n_dyn3;	%nA
I_0_0_1=Ibtb_n_dyn3+Ibtb2_3_n_dyn3+2.*Ibtb1_3_n_dyn3+Ibtb1_3_clk_n_dyn3;		%nA
I_0_1_0=Ibtb_n_dyn3+2.*Ibtb2_3_n_dyn3+Ibtb1_3_n_dyn3+Ibtb1_3_clk_n_dyn3;		%nA
I_0_1_1=Ibtb_n_dyn3+3.*Ibtb1_2_n_dyn3+Ibtb1_2_clk_n_dyn3;  				%nA
I_1_0_0=Ibtb_n_dyn3+Ibtb1_n_dyn3+Ibtb2_3_n_dyn3+Ibtb1_3_n_dyn3+Ibtb1_3_clk_n_dyn3;	%nA
I_1_0_1=Ibtb_n_dyn3+Ibtb1_n_dyn3+2.*Ibtb1_2_n_dyn3+Ibtb1_2_clk_n_dyn3;			%nA
I_1_1_0=Ibtb_n_dyn3+2.*Ibtb1_n_dyn3+Ibtb1_2_n_dyn3+Ibtb1_2_clk_n_dyn3;			%nA
I_1_1_1=Ibtb_n_dyn3+3.*Ibtb1_n_dyn3+Ibtb1_clk_n_dyn3;  					%nA

Iinv=Ibtb_p_inv;	%nA
%In the all cases we have '1' at the input of the inverter

I0=((I_0_0_0+I_0_0_1+I_0_1_0+I_0_1_1+I_1_0_0+I_1_0_1+I_1_1_0+I_1_1_1)./8)+Iinv;	%nA
%current in the charge phase
  		
% CLOCK = 1 ----> EVALUATION PHASE

I_0_0_0=Ibtb_n_dyn3+Ibtb2_3_n_dyn3+Ibtb1_3_n_dyn3;	%nA
I_0_0_1=Ibtb_n_dyn3+Ibtb1_2_n_dyn3;			%nA
I_0_1_0=Ibtb_n_dyn3+2.*Ibtb1_2_n_dyn3;			%nA
I_0_1_1=Ibtb_n_dyn3;  					%nA
I_1_0_0=Ibtb_n_dyn3+Ibtb1_n_dyn3+Ibtb1_2_n_dyn3;	%nA
I_1_0_1=Ibtb_n_dyn3+Ibtb1_n_dyn3;			%nA
I_1_1_0=Ibtb_n_dyn3+2.*Ibtb1_n_dyn3;			%nA
I_1_1_1=Ibtb_clk_p_dyn3;  				%nA

Iinv=(7/8).*Ibtb_p_inv+(1/8).*Ibtb_n_inv;	%nA
%in seven cases we have 1 as input of inverter and only one 0;

I1=((I_0_0_0+I_0_0_1+I_0_1_0+I_0_1_1+I_1_0_0+I_1_0_1+I_1_1_0+I_1_1_1)./8)+Iinv;	%nA	%nA

%we must divide per 2 because we have two phase clock.  

Iand3_dyn_btb(counter_mod_index, counter_tech_index, i)=(I0+I1)./2;	% nA

Ibtb_nand_and(counter_mod_index, counter_tech_index,i)=Iand3_dyn_btb(counter_mod_index, counter_tech_index,i);

MULTIVDD=[Vdd(counter_tech_index), VDD2]; % V 
% Power supply Vector

Pand3_btb(counter_mod_index,counter_tech_index,i)=0;

for j=1:length(MULTIVDD)
		Pand3_btb(counter_mod_index,counter_tech_index,i)=Pand3_btb(counter_mod_index,counter_tech_index,i)+Iand3_dyn_btb(counter_mod_index,counter_tech_index,i).*MULTIVDD(j).*1e-9; % W

endfor 

endfor

% MODULE BODY 

Igate_nmos=Igate_n(counter_mod_index_tmp(5),counter_tech_index);    % nA/um
Igate_pmos=Igate_p(counter_mod_index_tmp(5),counter_tech_index);    % nA/um

% Domino and3 - Igate 
% kclock is the ratio between the width of the nMOS clock transistor and nMOS pull-down transistor
% kclock -----> datibase.m

for i=1:4

fan_in=3;Wgate=Wopt{i};
  		
Wn_PD=fan_in.*Wgate;   							% um 
Wn_clk=kclock.*fan_in.*Wgate;							% um
Wp_clk=alpha_W.*Wn_clk;							% um
Wn_inv=Wgate; 								% um
Wp_inv=alpha_W.*Wgate; 							% um 


%Igate of the inverter
Igate_n_inv=Igate_nmos.*Wn_inv;    	% nA
Igate_p_inv=Igate_pmos.*Wp_inv;    	% nA

% CLOCK = 0 ----> CHARGE PHASE
% There are four different Ioff contributes because we have four transistors in series.

Igate_clk_p_dyn3=Igate_pmos.*Wp_clk;	%nA

I_0_0_0=Igate_clk_p_dyn3;		%nA
I_0_0_1=Igate_clk_p_dyn3;		%nA
I_0_1_0=Igate_clk_p_dyn3;		%nA
I_0_1_1=Igate_clk_p_dyn3;  		%nA
I_1_0_0=Igate_clk_p_dyn3;		%nA
I_1_0_1=Igate_clk_p_dyn3;		%nA
I_1_1_0=Igate_clk_p_dyn3;		%nA
I_1_1_1=Igate_clk_p_dyn3;  		%nA

Iinv=Igate_n_inv;	%nA
%In the all cases we have '1' at the input of the inverter

I0=((I_0_0_0+I_0_0_1+I_0_1_0+I_0_1_1+I_1_0_0+I_1_0_1+I_1_1_0+I_1_1_1)./8)+Iinv;	%nA
%current in the charge phase
  		
% CLOCK = 1 ----> EVALUATION PHASE

Igate_clk_n_dyn3=Igate_nmos.*Wn_clk;		%nA
Igate_n_dyn3=Igate_nmos.*Wn_PD;			%nA

I_0_0_0=Igate_clk_n_dyn3;			%nA
I_0_0_1=Igate_n_dyn3+Igate_clk_n_dyn3;		%nA
I_0_1_0=Igate_clk_n_dyn3;			%nA
I_0_1_1=2.*Igate_n_dyn3+Igate_clk_n_dyn3;	%nA
I_1_0_0=Igate_clk_n_dyn3;			%nA
I_1_0_1=Igate_n_dyn3+Igate_clk_n_dyn3;		%nA
I_1_1_0=Igate_clk_n_dyn3;			%nA
I_1_1_1=3.*Igate_n_dyn3+Igate_clk_n_dyn3;  	%nA

Iinv=(7/8).*Igate_n_inv+(1/8).*Igate_p_inv;	%nA
%in seven cases we have 1 as input of inverter and only one 0;

I1=((I_0_0_0+I_0_0_1+I_0_1_0+I_0_1_1+I_1_0_0+I_1_0_1+I_1_1_0+I_1_1_1)./8)+Iinv;	%nA	%nA

%we must divide per 2 because we have two phase clock. 

Iand3_dyn_gate(counter_mod_index, counter_tech_index, i)=(I0+I1)./2;	% nA

Igate_nand_and(counter_mod_index, counter_tech_index,i)=Iand3_dyn_gate(counter_mod_index, counter_tech_index,i) ;

MULTIVDD=[Vdd(counter_tech_index), VDD2]; % V 
% Power supply Vector

Pand3_gate(counter_mod_index,counter_tech_index,i)=0;

for j=1:length(MULTIVDD)
		Pand3_gate(counter_mod_index,counter_tech_index,i)=Pand3_gate(counter_mod_index,counter_tech_index,i)+Iand3_dyn_gate(counter_mod_index,counter_tech_index,i).*MULTIVDD(j).*1e-9; % W
		
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

% Domino and3 - Ioff 
% kclock is the ratio between the width of the nMOS clock transistor and nMOS pull-down transistor
% kclock -----> datibase.m

for i=1:4

fan_in=3;Wgate=Wopt{i};
  		
Wn_PD=fan_in.*Wgate;   							% um 
Wn_clk=kclock.*fan_in.*Wgate;						% um
Wp_clk=alpha_W.*Wn_clk;							% um
Wn_inv=Wgate; 								% um
Wp_inv=alpha_W.*Wgate; 							% um 


%Ioff of the inverter
Ioff_n_inv=Ioff_nmos.*Wn_inv;      	% nA
Ioff_p_inv=Ioff_pmos.*Wp_inv;      	% nA

% CLOCK = 0 ----> CHARGE PHASE
% There are four different Ioff contributes because we have four transistors in series.

Ioff_clk_n_dyn3=Ioff_nmos_1.*Wn_clk;	%nA
Ioff2_clk_n_dyn3=Ioff_nmos_2.*Wn_clk;	%nA
Ioff3_clk_n_dyn3=Ioff_nmos_3.*Wn_clk;	%nA
Ioff4_clk_n_dyn3=Ioff_nmos_4.*Wn_clk;	%nA

I_0_0_0=Ioff4_clk_n_dyn3;		%nA
I_0_0_1=Ioff3_clk_n_dyn3;		%nA
I_0_1_0=Ioff3_clk_n_dyn3;		%nA
I_0_1_1=Ioff2_clk_n_dyn3;  		%nA
I_1_0_0=Ioff3_clk_n_dyn3;		%nA
I_1_0_1=Ioff2_clk_n_dyn3;		%nA
I_1_1_0=Ioff2_clk_n_dyn3;		%nA
I_1_1_1=Ioff_clk_n_dyn3;  		%nA

Iinv=Ioff_p_inv;	%nA
%In the all cases we have '1' at the input of the inverter

I0=((I_0_0_0+I_0_0_1+I_0_1_0+I_0_1_1+I_1_0_0+I_1_0_1+I_1_1_0+I_1_1_1)./8)+Iinv;	%nA
%current in the charge phase
  		
% CLOCK = 1 ----> EVALUATION PHASE

Ioff_clk_p_dyn3=Ioff_pmos.*Wp_clk;		%nA
Ioff_n_dyn3=Ioff_nmos_1.*Wn_PD;			%nA
Ioff2_n_dyn3=Ioff_nmos_2.*Wn_PD;			%nA
Ioff3_n_dyn3=Ioff_nmos_3.*Wn_PD;			%nA

I_0_0_0=Ioff3_n_dyn3;		%nA
I_0_0_1=Ioff2_n_dyn3;		%nA
I_0_1_0=Ioff2_n_dyn3;		%nA
I_0_1_1=Ioff_n_dyn3;  		%nA
I_1_0_0=Ioff2_n_dyn3;		%nA
I_1_0_1=Ioff_n_dyn3;		%nA
I_1_1_0=Ioff_n_dyn3;		%nA
I_1_1_1=Ioff_clk_p_dyn3;  	%nA

Iinv=(7/8).*Ioff_p_inv+(1/8).*Ioff_n_inv;	%nA
%in seven cases we have 1 as input of inverter and only one 0;

I1=((I_0_0_0+I_0_0_1+I_0_1_0+I_0_1_1+I_1_0_0+I_1_0_1+I_1_1_0+I_1_1_1)./8)+Iinv;	%nA	%nA

%we must divide per 2 because we have two phase clock.  

Iand3_dyn_off(counter_mod_index, counter_tech_index, i)=(I0+I1)./2;	% nA

Ioff_nand_and(counter_mod_index, counter_tech_index,i)=Iand3_dyn_off(counter_mod_index, counter_tech_index,i);

MULTIVDD=[Vdd(counter_tech_index), VDD2]; % V 
% Power supply Vector

Pand3_off(counter_mod_index,counter_tech_index,i)=0;

for j=1:length(MULTIVDD)
		Pand3_off(counter_mod_index,counter_tech_index,i)=Pand3_off(counter_mod_index,counter_tech_index,i)+Iand3_dyn_off(counter_mod_index,counter_tech_index,i).*MULTIVDD(j).*1e-9; % W 

endfor 

endfor

% POWER STATIC Domino and3 

% Vdd_d is the distribution of Vdd in multi-supply voltage chip
% Vdd_d and VDD2 ---> datibase.m

Pand3(counter_mod_index,counter_tech_index,:)=Pand3_off(counter_mod_index,counter_tech_index,:)+Pand3_gate(counter_mod_index,counter_tech_index,:)+Pand3_btb(counter_mod_index,counter_tech_index,:); % W

Pnand_and(counter_mod_index,counter_tech_index,:)=Pand3(counter_mod_index,counter_tech_index,:);

% POWER DYNAMIC Domino AND3 

for i=1:4

	Pand3_dyn(counter_mod_index,counter_tech_index,i)=0;
	for j=1:length(MULTIVDD)
			Pand3_dyn(counter_mod_index,counter_tech_index,i)=Pand3_dyn(counter_mod_index,counter_tech_index,i)+(Cand3_dyn(counter_mod_index,counter_tech_index,i).*1e-12).*Vdd_d(j).*MULTIVDD(j).^2.*freq(counter_mod_index,counter_tech_index).*1e6; % W 
	endfor

endfor

Pnand_and_dyn(counter_mod_index,counter_tech_index,:)=Pand3_dyn(counter_mod_index,counter_tech_index,:);

Delay_nand_and(counter_mod_index,counter_tech_index,:)= [0, 0, 0, 0];
%%
