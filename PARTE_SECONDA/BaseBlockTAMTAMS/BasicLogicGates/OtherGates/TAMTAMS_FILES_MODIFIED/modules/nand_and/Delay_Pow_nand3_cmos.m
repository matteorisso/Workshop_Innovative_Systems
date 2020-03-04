%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%          ______________________          %
%         |     TAMTAMS WEB      |         %
%         |________2016__________|         %
%                                          %
%%           NAND 3 C-MOS Logic            %
%                                          %
%%   Delay, Dynamic Power, Static Power    %
%                                          %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%------PARAMETERS---------------------------

N = 3;%inputs number
const = 3; %n-MOS dimension
%DIMENSION OF DRAIN/SOURCE AREAS	
Leff=Lgate-Gamma.*Xj;  %nm effective lenght
fs_I=Leff./1000;
WD=fs_I;
lungh_diff=2.5.*fs_I; 	%um Source and drain diffusion length
perim_N=2.*lungh_diff+WD; %nm perimeter nMOS dimension
perim_P=2.*lungh_diff+2.*WD; %nm perimeter pMOS dimension
%DIMENSION OF TRANSISTOR
Wn = Wgate.*1e-3;          		%um
Wp = (mueff_n./mueff_p).*Wgate.*1e-3;	%um
%CAPACITANCES
Cbottom_n=lungh_diff.*Cj0n.*(1+Vdd./(2.*Pbn)).^(-Mjn);  %pF/um nMOS source and drain diffusion capacitance 
Csidewall_n=1e6.*Cjswn.*(1+Vdd./(2.*Pbswn)).^(-Mswn); 	%pF./um nMOS source and drain sidewall capacitance
Cbottom_p=lungh_diff.*Cj0p.*(1+Vdd./(2.*Pbp)).^(-Mjp); 	%pF./um pMOS source and drain diffusion capacitance
Csidewall_p=1e6.*Cjswp.*(1+Vdd./(2.*Pbswp)).^(-Mswp);   %pF./um pMOS source and drain sidewall capacitance
Coverlap_n=1e6.*Cgd0n; %pF/um overlap n capacitance
Coverlap_p=1e6.*Cgd0p; %pF/um overlap p capacitance
Cjn=Cbottom_n.*WD+Csidewall_n.*perim_N;		%pF nMOS junction capacitance 
Cjp=Cbottom_p.*2.*WD+Csidewall_p.*perim_P;	%pF pMOS junction capacitance 
C_ox_n = Cox.*Wn.*Leff.*1e-3;%pF effective nMOS oxide capacitance 
C_ox_p = Cox.*Wp.*Leff.*1e-3;%pF effective pMOS oxide capacitance
%MOS_resistance
Rn = 1/(mueff_n*1e8*Cox*1e-12*(Wgate/Leff)*1e-3*(Vdd-Vth_n))*Wn;	%Ohm nMOS channel resistance
Rp = 1/(mueff_p*1e8*Cox*1e-12*(Wgate/Leff)*1e-3*abs(Vth_p-Vdd))*Wp;	%Ohm pMOS channel resistance
%GATE CURRENTS
Igate_nmos = Igate_n.*Wn;       %nA
Igate_pmos = Igate_p.*Wp;       %nA
%OFF CURRENTS
Ioff_nmos = Ioff_n.*Wn;       %nA
Ioff_pmos = Ioff_p.*Wp;       %nA

%------OUTPUTS COMPUTATION-------------------

%---DYNAMIC POWER 
%switching activity of nodes
alfa_a = 1/2;
alfa_b = 1/2;
alfa_c = 1/2;
alfa_M = 7/32;
alfa_x1 = 3/8;
alfa_x2 = 7/32;
%nodes capacitances
C_in = C_ox_n*const+C_ox_p+2*Coverlap_n+2*Coverlap_p;%pF
C_L =  C_ox_n+C_ox_p+2*Coverlap_n+2*Coverlap_p;%pF
for h=1:4 %loop for each FANOUT
C_M = const*Cjn+const*Cjp+h*C_L;%pF
C_X = const*Cjn; %pF
C_tot=C_in*(alfa_a+alfa_b+alfa_c)+C_M*alfa_M+C_X*(alfa_x1+alfa_x2);  %pF     % tiene già conto della switching activity
dyn_power(h)=0.5*freq*1e6*C_tot*1e-12*(Vdd)^2;  %W
endfor

%---I/O DELAY
for h=1:4 %loop for each FANOUT
CMOS_tpdr=Rp*(N*Cjp+Cjn+h*C_L);
CMOS_tpdf=Rn*(1/2*N*(N+1)*Cjn+N^2*Cjp+N*h*C_L);
t_delay(h)= max(CMOS_tpdr,CMOS_tpdf)/1e3;
endfor;

%---STATIC POWER
static_power= Vdd*0.125*(3*Ioff_pmos+12*Igate_pmos+21*Ioff_nmos+21*Igate_nmos)*1e-9;	%W

%------OUTPUTS STORAGE-----------------------

Pnand_and_dyn(counter_mod_index,counter_tech_index,:)=dyn_power(:);Pnand_and(counter_mod_index,counter_tech_index,:)=[static_power,static_power,static_power,static_power];
Delay_nand_and(counter_mod_index,counter_tech_index,:)=t_delay(:);
