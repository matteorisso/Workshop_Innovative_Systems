%NOTE(RUN)a matlab file name (soi.m) to run all codes of flipflops.
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
soi;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

 Cox = Cox*1e1;			%pF
% 
 Leff=Lgate-Gamma*Xj;        %nm
 fs_I=Leff./1000;
% % Source and drain diffusion length
 lungh_diff=2.5.*fs_I; 		%um
% 
% % nMOS source and drain diffusion capacitance
 Cbottom_n=lungh_diff.*Cj0n.*(1+Vdd./(2.*Pbn)).^(-Mjn);     		%pF/um
% 
% % nMOS source and drain sidewall capacitance
 Csidewall_n=1e6.*Cjswn.*(1+Vdd./(2.*Pbswn)).^(-Mswn); 			%pF./um
% 
% % pMOS source and drain diffusion capacitance
Cbottom_p=lungh_diff.*Cj0p.*(1+Vdd./(2.*Pbp)).^(-Mjp); 			%pF./um
% 
% % pMOS source and drain sidewall capacitance
 Csidewall_p=1e6.*Cjswp.*(1+Vdd./(2.*Pbswp)).^(-Mswp);  			%pF./um
% 
 WD=k.*fs_I;
 perim_N=2.*lungh_diff+WD;
 perim_P=2.*lungh_diff+2.*WD;
 Cjn=Cbottom_n.*WD+Csidewall_n.*perim_N;		%pF
 Cjp=Cbottom_p.*2.*WD+Csidewall_p.*perim_P;	%pF
% 
 Wn = Wgate;          %um
 Wp = 1.29*Wgate;     %um
% %%capacitances
 Coverlap_n=1e6.*Cgd0n; %pF/um
 Coverlap_p=1e6.*Cgd0p; %pF/um
 Cin = Cox*Leff*1e-3*2*Wn + Cox*Leff*1e-3*Wp + 2*Coverlap_n +2*Coverlap_p;	%pF
 Cx1 = Cjn;				%pF
 Cout = Cjn + 2*Cjp;		%pF
% 
 Cl = Cin;		%pF
 Cnd2 = Cout + Cl;		%pF
 Cf01 = Cox*Leff*1e-3*Wn + Cox*Leff*1e-3*Wp + Coverlap_n + Coverlap_p;	%pF	 Cin inverter
 Cinv = Cjn + Cjp + Cf01;			%pF
 Cmos = Cox*Leff*1e-3*Wn;	%pF
% 
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% %These are equations for Mosfet delay and inverter delay 
 t_mos = Cmos*1e-12*Vdd/(Ion_n*Wn*1e-6)	%s		MOS delay	
 t_inv = t_mos*Cinv/Cmos %s		inverter delay
% 
% 
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% %We are calculating propagation delay of C2MOS DQ flipflop.In this circuit
% %there are master and lave stages.In master stage we see  tri state drivers
% %which will operate different on edges of clock.When clk is 0,so clk bar is
% %1 its mean master stage acts as an inverter and its will store inverted
% %value of D on Load capacitance CL1,and slave side is on hold mode,because
% %M7,M8 are off .When clk is is 1 and clk bar is 0 so M7,M8 will be turn on
% %,slave side inverter will transmit inverted value of D on CL1 to CL2 in
% %inverted form.We will see C2MOS register with CLK-CLK clocking is insensitive to overlap, as long as the rise and
% %fall times of the clock edges are sufficiently small.
% %we will see this DQ flipflop in states of CLK and CLK-,(0,0),(1,1).When
% %(0,0) will comes from master side M3,M7 will be off and D inverted value will
% %be stored on CL1,and in case (1,1),then M4,and M8 will be off and CL1
% %value will be transmitted on CL2 in inverted form.
% %total time delay will be sum of propagation delay of two inverters,Setup
% %time and hold time .
% %
 tsu=3*(t_inv);%%General rule for setup time that setup time should be 3-10X of inverter delay
% %these  ranges are also verified from data sheet of DQ flipflop given by
% %TaxasInstruments 
 th=2*(t_inv);%%General rule for hold time that hold time should be 1-2X of inverter delay
% 
% 
 tpd=(t_inv)+(tsu)+(t_inv)+(th)%%total Propagation delay of MUX based Master Slave Flipflop
% 
% %For Power dissipation we will see that its addition of power dissipation of two inverter   

 Pinv=Vdd*((Ioff_nmos+Igate_pmos+Ioff_pmos+Igate_nmos)/4)*1e-9
 Pff=Pinv+Pinv
% 
% 
% 
% 
