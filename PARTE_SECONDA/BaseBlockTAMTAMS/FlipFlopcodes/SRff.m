%In this code we will calculate Time delay OF SR Flipflop and Power
%Dissipation of flipflop in static form.Power Static  and Time delays are
%main role in making flip flop.We will go step by step ,For time delay a
%basic thing which we need is our load capicitance ,for this we will
%calculate source and drain diffusion capacitance,Sidewall capacitance and
%all other capacitance like overlap capacitances which we will be need
%,once load capacitance is calculated we will time delays of inverter and
%in las SR Flipflop.
%%%%%%%%%%%%%%%%
%For Power Dissipation we will calculate static currents at every state of
%flipflop and this static current will be combinations of some Igates and
%some Ioff currents .

%%%%%%Before Flipflop we will calculate Inverter delays and Power
%%%%%%Dissipation
soi;


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

Wn = Wgate;          %um
Wp = 1.29*Wgate;     %um
%%capacitances
Coverlap_n=1e6.*Cgd0n; %pF/um
Coverlap_p=1e6.*Cgd0p; %pF/um
Cin = Cox*Leff*1e-3*2*Wn + Cox*Leff*1e-3*Wp + 2*Coverlap_n +2*Coverlap_p;	%pF
Cx1 = Cjn;				%pF
Cout = Cjn + 2*Cjp;		%pF

Cl = Cin;		%pF
Cnd2 = Cout + Cl;		%pF
Cf01 = Cox*Leff*1e-3*Wn + Cox*Leff*1e-3*Wp + Coverlap_n + Coverlap_p;	%pF	 Cin inverter
Cinv = Cjn + Cjp + Cf01;			%pF
Cmos = Cox*Leff*1e-3*Wn;	%pF

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%These are equations for Mosfet delay and inverter delay 
t_mos = Cmos*1e-12*Vdd/(Ion_n*Wn*1e-6);	%s		MOS delay	
t_inv = t_mos*Cinv/Cmos; %s		inverter delay 


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Analysis of SR flipflp from book
%(digital-integrated-circuits-a-design-perspective-by-jan-m-rabaey)
%Delay of SR flipflop ,we analyze from circuit behavior that for Q is approximately equal to the delay of the
%pseudo-NMOS inverter formed by (M5-M6) and M2,,, and to obtain the delay for node Q, it is
%sufficient to add the delay of the complementary CMOS inverter M3-M4.

%%delay of SR Flipflop, Elmore model
R = 1/(mueff_n*1e8*Cox*1e-12*(Wn/Leff)*1e3*(Vdd-Vtn));	%Ohm

%For Inverter Capacitance we have calculated it before Cinv which is
%relatingto all our overlap capacitance,Bottom junction
%capacitance,Sidewall junction capacitance ,wire capacitance and gate
%capacitance.
tpdr =((Cinv*1e-12)*2*R)+((Cinv*1e-12)*R)
tpdf =(Cinv*1e-12)*2*R
tpd = (tpdr + tpdf)/2	%s


%Now we will go towards Power Dissipation when our SR flip flop will go
%from one state to other state we take all the states 000,01,10,11,these
%are states of of SR flipflop but we will not come to last state which is
%when SET is 1,and Reset is also 1.This state is forbidden in flip flop.

%P_static of SR flipflop
Pff = Vdd*((3*Ioff_nmos +Ioff_pmos+Igate_pmos+Igate_nmos)+(2*Ioff_nmos+Ioff_pmos+3*Igate_nmos+Igate_pmos)+(2*Ioff_nmos+Ioff_pmos+3*Igate_nmos+Igate_pmos))*(1/3)*1e-9;	%W;






