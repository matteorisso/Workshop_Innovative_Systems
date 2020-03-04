%In this code we will calculate Time delay OF MUX  BASED Flipflop and Power
%Dissipation of flipflop in static form.Power Static  and Time delays are
%main role in making flip flop.We will go step by step ,For time delay a
%basic thing which we need is our load capicitance ,for this we will
%calculate source and drain diffusion capacitance,Sidewall capacitance and
%all other capacitance like overlap capacitances which we will be need
%,once load capacitance is calculated we will time delays of inverter and
%in las MUX BASED Flipflop.
%%%%%%%%%%%%%%%%
%For Power Dissipation we will calculate static currents at every state of
%flipflop and this static current will be combinations of some Igates and
%some Ioff currents .

%%%%%%Before Flipflop we will calculate Inverter delays and Power
%%%%%%Dissipation


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
%We are making a MUX BASED Master Slave Flipflop here ,we from circuit that when clock is
%high or low but time delay of flipflop is dependent on series time delay
%of four inverters and two transmission gate ,its means logic will be pass
%from four inverter and two transmission gate totally .Sequence will be
%like below 
%Tinv1+Ttg1+Tinv2+Tinv3+Ttg2+Tinv4


%%%%%%%%%%%%%%%%%%%%Calculation for time delay of transmission gate
%transmission gate is combination of p mosfet and n mosfet which are
%connected parralal.on high clock edge n mosfet will transmit logic and on
%low clock edge p mosfet will transmit logic .Rp and Rn are resistances of p mosfet and n mosfet respectively they are in parralal actually 


Rp=(Vdd-Vout)/Igate_p;
Rn=(Vdd-Vout)/Igate_n;
Req=(Rp*Rn)/(Rp+Rn);

Req=8000,%%%%%%%%%%%This value is calculated in Rabey Book on VLSI 

t_tg=Req*Cmos;%%%%%%%%This is propagation delay for Transmission gate 

tpd=(t_inv)+(t_tg)+(t_inv)+(t_inv)+(t_tg)+(t_inv);%%total Propagation delay of MUX based Master Slave Flipflop


%Static Power Dissipation for MUX BASED Master Slave Flipflop%%For all power dissipation firstly we will calculate Power dissipation of 
%Inverter and Transmission gate,then in MUX BASED Master Slave Flip flop we see that its addition of Power dissipation of Inverter and Transmission gate

Pinv=Vdd*((Ioff_nmos+Igate_pmos+Ioff_pmos+Igate_nmos)/4);

%NO NO NO Static power of Transmission gate 
%Here is concept that our in our transmission gate both p and n mosfet are ON or
%OFF but simultaneously ,so no gate current and no off current,so no static
%surrent and no static power for transmission gate.our Static power of flip flop will be
%just addition of static power of Four inverters 

Pff=Pinv+Pinv+Pinv+Pinv;



