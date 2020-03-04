clear all
close all
clc

%Constants and physical parameters

Vdd     = 0.97; %V
Vth_n   = 0; %V
Vth_p   = 0; %V
Cox     = 2.6562e-6; %pF/um^2
Lgate   = 27; %nm
Wgate_n = 270; %nm for nMOS
Xj      = 0; %nm
Cj0n    = 2.7e-3; %pF/um^2
Cj0p    = 3.3e-3; %pF/um^2
Cjswn   = 9.2e-4; %pF/um
Cjswp   = 8e-4; %pF/um
Cgd0n   = 1.35e-4; %pF/um
Cgd0p   = 1e-4; %pF/um
Ion_n   = 1200; %uA/um
Ion_p   = 0; %nA/um
Ioff_n  = 100; %nA/um
Ioff_p  = 129; %nA/um
Igate_n = 224; %nA/um
Igate_p = 290; %nA/um
mueff_n = 1.4*1e11; %um^2/Vs %%%%verificare
mueff_p = 0.45*1e11; %um^2/Vs
Gamma   = 0; %um^2/Vs
Mjn     = 0.38; % %
Mjp     = 0.45; % %
Mswn    = 0.22; % %
Mswp    = 0.265; % %
Pbn     = 0.85; %V
Pbp     = 0.87; %V
Pbswn   = 0.67; %V
Pbswp   = 0.76; %V
Pa      = 0.5; %Probability input signal A is equal to 1
Pb      = 0.5; %Probability input signal B is equal to 1
freq    = 1;    %GHz
const   = 2;

% Transistor dimensions	um

	Wn4 			= 4*Wgate_n; %nm %abbiamo tolto 1e-3        		
	Wp 			= 1.29.*Wgate_n; %nm %abbiamo tolto 1e-3	


% D/S dimensions
	
	Leff		=	Lgate-Gamma.*Xj;  %nm effective lenght
	fs_I		=	Leff./1000;       %to move from nm to um
	WD			=	fs_I;
	lungh_diff	=	2.5.*fs_I;        %um Source and drain diffusion length
	
    %perim_N		=	2.*lungh_diff+WD; %nm perimeter nMOS dimension
	%perim_P		=	2.*lungh_diff+1.29.*WD; %nm perimeter pMOS dimension
    
    perim_N = 2*lungh_diff*1e3 + Wn4;     %nm = [um]*1000+[nm]
    perim_P = 2*lungh_diff*1e3 + Wp;      %nm = [um]*1000+[nm]



% Capacitances

	Cbottom_n	=	lungh_diff.*Cj0n.*(1+Vdd./(2.*Pbn)).^(-Mjn);  %pF/um nMOS source and drain diffusion capacitance 
	Csidewall_n	=	Cjswn.*(1+Vdd./(2.*Pbswn)).^(-Mswn); 	%pF./um nMOS source and drain sidewall capacitance
	Cbottom_p	=	lungh_diff.*Cj0p.*(1+Vdd./(2.*Pbp)).^(-Mjp); 	%pF./um pMOS source and drain diffusion capacitance
	Csidewall_p	=	Cjswp.*(1+Vdd./(2.*Pbswp)).^(-Mswp);   %pF./um pMOS source and drain sidewall capacitance
    Coverlap_n  =   Cgd0n.*Wn4*1e-3; %pF 
    Coverlap_p  =   Cgd0n.*Wp*1e-3; %pF
	Cjn			=	Cbottom_n.*WD+Csidewall_n.*perim_N/1000;		%pF nMOS junction capacitance 
	Cjp			=	Cbottom_p.*2.*WD+Csidewall_p.*perim_P/1000;	    %pF pMOS junction capacitance 
	C_ox_n 		= 	Cox.*Wn4.*Leff.*1e-6;%pF effective nMOS oxide capacitance 
	C_ox_p 		= 	Cox.*Wp.*Leff.*1e-6;%pF effective pMOS oxide capacitance

% MOS resistances for delay

	Rn 			= 	1/(mueff_n*Cox*(Wn4/Leff)*(Vdd-Vth_n))*1e12;	%Ohm nMOS channel resistance
	Rp			= 	1/(mueff_p*Cox*( Wp/Leff)*abs(Vth_p-Vdd))*1e12;	%Ohm pMOS channel resistance

% Ig

	Igate_nmos 	= 	Igate_n.*Wn4/1000;    %nA=[nA/um]*(nm/1000);
	Igate_pmos 	= 	Igate_p.*Wp/1000;     %nA=[nA/um]*(nm/1000);

% Ioff

	Ioff_nmos 	= 	Ioff_n.*Wn4/1000;          %nA=[nA/um]*(nm/1000);
	Ioff_pmos 	= 	Ioff_p.*Wp/1000;           %nA=[nA/um]*(nm/1000);

% Outputs

% Dynamic power

	Cin 		= 	C_ox_n*const+C_ox_p+2*Coverlap_n+2*Coverlap_p;  %pF
	Cl 			=  	C_ox_n+C_ox_p+2*Coverlap_n+2*Coverlap_p;        %pF
	Cjn			=	(Cbottom_n.*Wn4+Csidewall_n.*perim_N)*1e-3;		%pF
	Cjp			=	(Cbottom_p.*Wp +Csidewall_p.*perim_P)*1e-3;	    %pF
	CinN 		= 	Cox*Leff*1e-6*Wn4 + 2*Coverlap_n ;	%pF
	CinP 		= 	Cox*Leff*1e-6*Wp + 2*Coverlap_p ;
	Cx1 		=	Cjn; %since we are assuming interdigitated structure
	Cx2 		= 	Cjn; %since the Nmos are in series
    Cx          =   Cx1; %since Cx1=Cx2. 
    
    figure;
	for h=1:4 % Different fanouts
		i(h) = h;
        Cy = Cjp + Cjn + h*Cl;
		Calpha = 3*CinN + 5.25*Cx + 1.75*Cy +  2*CinP;
		Power_dynamic_nd3(h) = 0.5*freq*Calpha*Vdd^2*1e3; % microW	
        hold on
        plot(h,Power_dynamic_nd3(h),'*')
        title('Dynamic power NAND3 computed with different fanout values');
        xlabel('Fanout');
        ylabel('Dynamic Power [\muW]');
        grid on
    end ;
    p = polyfit(i,Power_dynamic_nd3,1);
    x1 = linspace(0,4,41);
    y1 = polyval(p,x1);
    plot(x1,y1);
    legend('h = 1', 'h = 2', 'h = 3', 'h = 4', 'Location', 'SouthEast');

% Delay
    figure;
	for h=1:4 % Different fanouts
		i(h) = h;
        CMOS_tpdr = Rp*(Cjp + Cjn + h*Cl);
		CMOS_tpdf = Rn*(10*Cjn + 4*Cjp + 4*h*Cl);
	    t_delay(h)= max(CMOS_tpdr,CMOS_tpdf)/1e3; % ps
        hold on
        plot(h,t_delay(h),'*')
        title('Max rise/fall time delay NAND3 computed with different fanout values');
        xlabel('Fanout');
        ylabel('Gate delay [ns]');
        grid on
    end ;
    p = polyfit(i,t_delay,1);
    x1 = linspace(0,4,41);
    y1 = polyval(p,x1);
    plot(x1,y1);
    legend('h = 1', 'h = 2', 'h = 3', 'h = 4', 'Location', 'SouthEast');
    
% Static power

	I_leak = (1/16)*( 8*Igate_pmos + Ioff_pmos + 64*Igate_nmos + 60*Ioff_nmos); % nA
	Power_static_nand3 = Vdd*I_leak %nW


