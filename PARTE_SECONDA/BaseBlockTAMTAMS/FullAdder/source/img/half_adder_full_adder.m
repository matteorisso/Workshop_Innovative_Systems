clc;
close all;
clear all;

%% PARAMETER
%the default values of parameter are referred to the roadmap 2009 , years
%2011
lambda =1;                  %referred to the rules design
L_eff =27*10^( -3);         %um %the effective length of the gate
L_s_d = lambda * L_eff ;    %source length equal to drain length
L = L_eff + 2* L_s_d ;      %total length
interc_override = 0.15;         %15% of interconnetion override       
alpha = 0.15; %activity factor
vdd = 1;                    %V
Wgate = [10*L 10*L*1.2 10*L*1.4 10*L*1.6 10*L*1.8 10*L*2];               
                            %um width of NMOS W_n =10* L;
W_n = Wgate ;               %um
beta =1.29;
W_p = beta * Wgate ;        %um width of PMOS W_p =1.29* W_n ;

Cj0n =2.7*10^(-3);      %pf/um ^2 N- MOS junction capacitance per unit ...
                        % area under zero - bias conditions
Cj0p =3.3*10^(-3);      %pF/um ^2 P- MOS junction capacitance per unit ...
                        % area under zero - bias conditions

Cjswn = 9.2*10^( -10);  %F/m N-MOS sidewall junction capacitance
Cjswp =8*10^( -10);     %F/m P-MOS sidewall junction capacitance
Cgd0n =1.35*10^( -10);  %F/m N-MOS overlap capacitance between gate ...
                        %and drain per unit transistor width

Cgd0p =1*10^( -10);     %F/m P-MOS overlap capacitance between gate and ...
                        % drain per unit transistor width
Mjn = 0.38;
Mjp = 0.45;
Mswn = 0.22;
Mswp = 0.265;
Pbn = 0.85;
Pbp = 0.87;
Pbswn = 0.67;
Pbswp = 0.76;
k = 10;
Cox = 4.6041e-06; %pf/um ^2
n_fan_out = 4; %Nand with two input is loaded with four identical inverter
               %Source and drain diffusion length
lungh_diff =2.5* L_eff ; %um

% nMOS source and drain diffusion capacitance
Cbottom_n = lungh_diff * Cj0n *(1+ vdd /(2* Pbn ))^( - Mjn ); %pF/um

% nMOS source and drain sidewall capacitance
Csidewall_n =1e6* Cjswn *(1+ vdd /(2* Pbswn ))^( - Mswn );   %pF/um

% pMOS source and drain diffusion capacitance
Cbottom_p = lungh_diff * Cj0p *(1+ vdd /(2* Pbp ))^( - Mjp ); %pF/um

% pMOS source and drain sidewall capacitance
Csidewall_p =1e6* Cjswp *(1+ vdd /(2* Pbswp ))^( - Mswp );   %pF/um

WD=k* L_eff ;
perim_N =2* lungh_diff +WD;
perim_P =2* lungh_diff +2* WD;
Cjn= Cbottom_n *WD+ Csidewall_n * perim_N ; %pF
Cjp= Cbottom_p *2* WD+ Csidewall_p * perim_P ; %pF
Coverlap_n =1e6* Cgd0n ; %pF/um
Coverlap_p =1e6* Cgd0p ; %pF/um
Cin = Cox* L_eff*1e-3*2* W_n + Cox * L_eff*1e-3* W_p + ...
2* Coverlap_n +2* Coverlap_p; %pF

Cout = Cjn + 2* Cjp;                    %pF
Cl_nand = Cin* n_fan_out ;              %pF   %NAND load capacitance
cap_nand = ( Cout +Cl_nand )*10^(3);   %fF   %capacitance of NAND2
ioff_n =  26*10^( -1)* W_n;    %uA
ioff_p =  7.9*10^( -1)* W_p;   %uA
igate_n = 22*10^(-2)* W_n ;    %uA
igate_p = 14*10^(-2)* W_p ;    %uA
i_NAND =  4.24* W_n;           %mA

%% HALF ADDER
%% HALF ADDER AREA ANALYSIS

%%%%%%%%%%%%% SINGLE GATES AREA %%%%%%%%%%%%%
%the 2 input NAND gate in CMOS technology comprehends:
%2 nMOS and 2 pMOS
one_nand_area = 2*L.*(W_n + W_p)*(1 + interc_override); %um^2

%the XOR gate - whose output corresponds to the SUM bit
%is equivalent to 4 NAND gates
one_xor_area = 4*one_nand_area; %um^2

%the AND gate - whose output corresponds to the CARRY bit - can be seen as
%2 NAND gates
one_and_area = 2*one_nand_area; %um^2

%%%%%%%%%%%%% HALF ADDER AREA %%%%%%%%%%%%%
%the total area of the half adder with this configuration corresponds to:
area_half_adder = one_xor_area + one_and_area; %um^2

%% HALF ADDER TIMING ANALYSIS

%%%%%%%%%%%%% SUM BIT %%%%%%%%%%%%%

%the critical path of the sum corresponds to the delay of the
%XOR gate (represented as 4 NAND gates)
%with this configuration, the critical path of the XOR gate is the delay
%of 3 NAND gates

%the delay of a single NAND gate is
t_nand = (cap_nand.*vdd)./i_NAND; %ps

%that means that the delay of the XOR gate is
t_xor = 3*t_nand;               %ps
t_half_adder_sum_bit = t_xor;   %ps

%%%%%%%%%%%%% CARRY BIT %%%%%%%%%%%%%

%the delay of the AND gate is then
t_and = 2*t_nand;               %ps
t_half_adder_carry_bit = t_and; %ps

%we assume that the delay of the critical path (which is the inverse of the
%maximum allowed frequency) is the maximum delay between the sum bit path
%and the carry bit path

%%%%%%%%%%%%% MAXIMUM FREQUENCY %%%%%%%%%%%%%
t_max_half_adder = max(t_half_adder_carry_bit, t_half_adder_sum_bit); %ps
freq_allowed_half_adder = 1./t_max_half_adder;

%% HALF ADDER POWER ANALYSIS

%%%%%%%%%%%%% DYNAMIC POWER %%%%%%%%%%%%%

%the power consumption is estimated as the sum of the static power and the
%dynamic power of the circuit

%the dynamic power of the half adder can be estimated as the sum of the
%dynamic power of the XOR gate and the dynamic power of the AND gate

%the dynamic power is defined as the product of the switching activity
%of the gate times the square of the supply voltage, times the
%capacitance of the gate, times the frequency

%the dynamic power of the xor gate is
cap_xor = 4*cap_nand;                                               %pF
P_dyn_xor_half_adder = alpha*vdd^2.*cap_xor.*freq_allowed_half_adder; %uW

%the dynamic power of the and gate is
cap_and = 2*cap_nand;                                               %pF
P_dyn_and_half_adder = alpha*vdd^2.*cap_and.*freq_allowed_half_adder; %uW

%the overall dynamic power of the half adder is
P_dyn_half_adder = P_dyn_xor_half_adder + P_dyn_and_half_adder; %uW

%%%%%%%%%%%%% STATIC POWER %%%%%%%%%%%%%

%the static power is given by two contributions: the subthreshold
%leakage (Ioff) and the gate leakage (Igate).
%assuming that the probability associated to the gate NAND is 25% for each
%case, the static current is given by:
a = 0.25;
i_stat_nand = a*(ioff_n +2*igate_p )+a *(ioff_n + igate_p)+... 
    a*(ioff_n + igate_n+igate_p )+a *(2*ioff_p+2*igate_n ); %uA
%the overall static current of the XOR gate is computed considering 4 NAND
%gates
i_stat_xor = 4*i_stat_nand; %uA

%instead, the overall static current of the AND gate is given by the
%static current of the first NAND gate and the static current of the second
%NAND gate; this one though as only two possible input configuration: 00
%and 11 (it behaves like an inverter gate); 
%therefore, the overall current will be:
b = 0.5;                    %assuming 50% probability for each input 
                            %configuration
i_stat_nand_as_inv = b*(ioff_n + 2*igate_p + 2*ioff_p + 2*igate_n); %uA
i_stat_and = i_stat_nand + i_stat_nand_as_inv;

%the overall static power is computed as the supply voltage times the sum
%of the overall static currents
i_stat_half_adder = i_stat_xor + i_stat_and;
P_stat_half_adder = vdd*i_stat_half_adder; %uW

%the overall power dissipated by the half adder is, as a consequence:
P_tot_half_adder = P_dyn_half_adder + P_stat_half_adder; %uW

%% FULL ADDER
%% FULL ADDER AREA ANALYSIS

%the full adder circuit includes two full adders and an OR gate for the
%computation of the carry bit
%the OR gate is equivalent to three NAND gates
%the area of an OR gate with NAND configuration is
one_or_area = 3*one_nand_area; %um^2

%while the overall area of the full adder is equal to
area_full_adder = 2*area_half_adder + one_or_area; %um^2

%% FULL ADDER TIMING ANALYSIS

%%%%%%%%%%%%% SUM BIT %%%%%%%%%%%%%

%the overall critical path for the computation of the sum bit in a full
%adder is two times the critical path of the half adder for the computation
%of the sum bit
t_full_adder_sum_bit = 2*t_half_adder_sum_bit;    %ps

%%%%%%%%%%%%% CARRY BIT %%%%%%%%%%%%%

%instead, the overall critical path for the computation of the carry bit in
%a full adder is the sum of the delay for the computation of the sum bit
%(first stage), the delay for the computation of the carry bit (second
%stage) and the delay of the OR gate

%the delay of the OR gate with NAND configuration is the delay of 2 NAND
%gates
t_or = 2*t_nand; %ps
t_full_adder_carry_bit = t_half_adder_sum_bit + t_half_adder_carry_bit +...
    t_or;        %ps

%%%%%%%%%%%%% MAXIMUM FREQUENCY %%%%%%%%%%%%%

%the maximum allowed frequency is the inverse of the maximum of the two
%computed delays
t_max_full_adder = max(t_full_adder_carry_bit, t_full_adder_sum_bit); %ps
freq_allowed_full_adder = 1./t_max_full_adder;

%% FULL ADDER POWER ANALYSIS

%%%%%%%%%%%%% DYNAMIC POWER %%%%%%%%%%%%%

%the dynamic power of the full adder is the sum of the dynamic power of the
%two half adders plus the dynamic power of the OR gate

%since the OR gate is formed by 3 NAND gates, the overall capacitance is
cap_or = 3*cap_nand; %pF

%the dynamic power of the OR gate is
P_dyn_or = alpha.*vdd^2.*cap_or.*freq_allowed_full_adder; %uW

%overall, the dynamic power of the full adder is
P_dyn_xor_full_adder = alpha.*vdd^2.*cap_xor.*freq_allowed_full_adder; %uW
P_dyn_and_full_adder = alpha.*vdd^2.*cap_and.*freq_allowed_half_adder; %uW

P_dyn_full_adder = 2*(P_dyn_xor_full_adder + P_dyn_and_full_adder) + ...
                      P_dyn_or; %uW

%%%%%%%%%%%%% STATIC POWER %%%%%%%%%%%%%

%the static current of the full adder is 2 times the static current of a
%single full adder plus the static current of the OR gate with NAND
%configuration

%the OR gate with NAND configuration shows that the first 2 NAND gates
%behave as an inverter (allowing only a 00 or 11 input configuration);
%therefore, the overall static current of the OR gate is
i_stat_or = 2*i_stat_nand_as_inv + i_stat_nand;

%the overall static current is
i_stat_full_adder = 2*i_stat_half_adder + i_stat_or;

%the overall static power is:
P_stat_full_adder = vdd*i_stat_full_adder;

%finally, the overall power dissipated by the full adder is the sum of
%static and dynamic power
P_tot_full_adder = P_dyn_full_adder + P_stat_full_adder;

%% PLOTTING RESULTS

%%%%%%%%%%%%% AREA %%%%%%%%%%%%%

figure;
plot(Wgate, area_half_adder, 'b+:');
hold on;
plot(Wgate, area_full_adder, 'r+:');
grid on;

legend ({'Half adder','Full adder'})
title (' Area Half Adder vs Area Full Adder ')
xlabel (' Gate width [um]')
ylabel (' Area [um^2] ')

%%%%%%%%%%%%% TIMING %%%%%%%%%%%%%

figure;
plot(Wgate, t_max_half_adder, 'b+:');
hold on;
plot(Wgate, t_max_full_adder, 'r+:');
grid on;

legend ({'Half adder','Full adder'})
title (' Delay Half Adder vs Delay Full Adder ')
xlabel (' Gate width [um]')
ylabel (' Delay [ps] ')


figure;
plot(Wgate, freq_allowed_half_adder, 'b+:');
hold on;
plot(Wgate, freq_allowed_full_adder, 'r+:');
grid on;

legend ({'Half adder','Full adder'})
title (' Frequency Half Adder vs Frequency Full Adder ')
xlabel (' Gate width [um]')
ylabel (' Frequency [GHz] ')

%%%%%%%%%%%%% POWER %%%%%%%%%%%%%
%%%%%%%%%%%%% POWER - Fixed alpha %%%%%%%%%%%%%
%%%%%%%%%%%%% Using alpha = 0.15 %%%%%%%%%%%%%
figure;
plot(Wgate, P_tot_half_adder, 'b+:');
hold on;
plot(Wgate, P_tot_full_adder, 'r+:');
grid on;

legend ({'Half adder','Full adder'})
title (' Power Half Adder vs Power Full Adder ')
xlabel (' Gate width [um], alpha = 15%')
ylabel (' Power [uW] ')

%%%%%%%%%%%%% POWER - Fixed width %%%%%%%%%%%%%
%%%%%%%%%%%%% Using Wgate = 10*L %%%%%%%%%%%%%
alpha_array = [0.15 0.3 0.45 0.6 0.75 0.9];
P_dyn_half_adder_new = P_dyn_half_adder(1)/alpha.*alpha_array;
P_dyn_full_adder_new = P_dyn_full_adder(1)/alpha.*alpha_array;

P_tot_half_adder_new = P_dyn_half_adder_new + P_stat_half_adder;
P_tot_full_adder_new = P_dyn_full_adder_new + P_stat_full_adder;

figure;
plot(alpha_array*100, P_tot_half_adder_new, 'b+:');
hold on;
plot(alpha_array*100, P_tot_full_adder_new, 'r+:');
grid on;

legend ({'Half adder','Full adder'})
title (' Power Half Adder vs Power Full Adder ')
xlabel (' Switching activity [%], Gate width = 10*L [um]')
ylabel (' Power [uW] ')
