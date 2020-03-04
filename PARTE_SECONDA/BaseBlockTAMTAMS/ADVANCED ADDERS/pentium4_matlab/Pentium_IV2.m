clear all
close all

Vdd = 1; %V
Esw = 1;
N = [8,12,16,20,24,28,32];

% INPUT PARAMETERS 

% NAND2
A_nand2 = 0.5; % (um)^2
Cin_nand2 = 4; %fF
tau_int_nand2 = 10.3; %ps
alpha_nand2 = 3; %KOhm
I_leak_nand2 = 200; %nA

% NOR2
A_nor2 = 0.625; % (um)^2
Cin_nor2 = 5; %fF
tau_int_nor2 = 10.7; %ps
alpha_nor2 = 3; %KOhm
I_leak_nor2 = 200; %nA

% INVERTER
A_inv = 0.1875; % (um)^2
Cin_inv = 3; %fF
tau_int_inv = 9; %ps
alpha_inv = 3; %KOhm
I_leak_inv = 100; %nA

% XOR2
A_xor2 = 1.875; % (um)^2
Cin_xor2 = 6; %fF
tau_int_xor2 = 12.6; %ps
alpha_xor2 = 3; %KOhm
I_leak_xor2 = 400; %nA

% TRANSMISSION GATE
A_tgate = 0.1875; % (um)^2
Cin1_tgate = 0.5; %fF
Cin2_tgate = 1; %fF
Cin3_tgate = 2; %fF
tau_int_tgate = 5.8; %ps
alpha_tgate = 3; %KOhm
I_leak_tgate = 50; %nA

% END INPUT PARAMETERS 

% FULL ADDER
A_fa = 2*A_xor2 + 2*A_nand2 + A_nor2 + 3*A_inv;
Cin_fa = Cin_xor2 + Cin_nand2;
I_leak_fa = 2*I_leak_xor2 + 2*I_leak_nand2 + I_leak_nor2 + 3*I_leak_inv;
P_stat_fa = Vdd*I_leak_fa;
E_dyn_fa = (Vdd^2)*Esw*(Cin_xor2 + Cin_nand2 + 3*Cin_inv + 2*Cin_nor2);
tau_int_fa_sum = 2*tau_int_xor2 + alpha_xor2*(Cin_xor2+Cin_nand2);
alpha_fa_sum = alpha_xor2;
tau_int_fa_carry = tau_int_xor2 + alpha_xor2*(Cin_xor2+Cin_nand2) + tau_int_nand2 + alpha_nand2*Cin_inv + tau_int_inv + alpha_inv*Cin_nor2 + tau_int_nor2 + alpha_nor2*Cin_inv + tau_int_inv;
alpha_fa_carry = alpha_inv;

% MULTIPLEXER PARALLELISM 4
M = 4; %parallelism of mux inputs
Cin_inputs_mux_par4 = Cin1_tgate; %for each line of the inputs
Cin_sel_mux_par4 = Cin_inv + M*(Cin2_tgate+Cin3_tgate);
A_mux_par4 = A_inv + 2*M*A_tgate;
P_stat_mux_par4 = Vdd*(I_leak_inv + 2*M*I_leak_tgate);
E_dyn_mux_par4 = (Vdd^2)*Esw*M*(Cin2_tgate+Cin3_tgate);
tau_int_mux_par4 = tau_int_inv + alpha_inv*M*(Cin2_tgate+Cin3_tgate) + tau_int_tgate;
alpha_mux_par4 = alpha_tgate;

% MULTIPLEXER PARALLELISM 33
M = 33; %parallelism of mux inputs
Cin_inputs_mux_par33 = Cin1_tgate; %for each line of the inputs
Cin_sel_mux_par33 = Cin_inv + M*(Cin2_tgate+Cin3_tgate);
A_mux_par33 = A_inv + 2*M*A_tgate;
P_stat_mux_par33 = Vdd*(I_leak_inv + 2*M*I_leak_tgate);
E_dyn_mux_par33 = (Vdd^2)*Esw*M*(Cin2_tgate+Cin3_tgate);
tau_int_mux_par33 = tau_int_inv + alpha_inv*M*(Cin2_tgate+Cin3_tgate) + tau_int_tgate;
alpha_mux_par33 = alpha_tgate;

% RIPPLE CARRY ADDER 4 BITS
Cin_rca4 = Cin_fa; % for the carry input and for each line of the two data inputs
A_rca4 = 4*A_fa;
P_stat_rca4 = 4*P_stat_fa;
E_dyn_rca4 = (Vdd^2)*Esw*(3*Cin_fa) + 4*E_dyn_fa;
tau_int_rca4 = 3*tau_int_fa_carry + 3*alpha_fa_carry*Cin_fa + tau_int_fa_sum;
alpha_rca4 = alpha_fa_sum;

% CARRY-SELECT BLOCK
Cin_inputs_csb = 2*Cin_rca4; % for each line of the inputs
Cin_carry_csb = Cin_sel_mux_par4;
A_csb = 2*A_rca4 + A_mux_par4;
P_stat_csb = 2*P_stat_rca4 + P_stat_mux_par4;
E_dyn_csb = (Vdd^2)*Esw*8*Cin_inputs_mux_par4 + 2*E_dyn_rca4 + E_dyn_mux_par4;
tau_int_csb = tau_int_rca4 + alpha_rca4*Cin_inputs_mux_par4 + tau_int_mux_par4;   
alpha_csb = alpha_mux_par4;

% CARRY-SELECT SUM GENERATOR
Cin_data_inputs_cssg = Cin_inputs_csb; % for each line of the inputs
Cin_carry_cssg = Cin_carry_csb; % for each carry line
A_cssg = (N/4)*A_csb;
P_stat_cssg = (N/4)*P_stat_csb;
E_dyn_cssg = (N/4)*E_dyn_csb;
tau_int_cssg = tau_int_csb;
alpha_cssg = alpha_csb;

% PRE COMPUTATION BLOCK
Cin_pcb = Cin_nand2 + Cin_xor2;
A_pcb = A_nand2 + A_inv + A_xor2;
I_leak_pcb = I_leak_nand2 + I_leak_inv + I_leak_xor2;
P_stat_pcb = Vdd*I_leak_pcb;
E_dyn_pcb = (Vdd^2)*Esw*Cin_inv;
tau_int_pcb_g = tau_int_nand2 + alpha_nand2*Cin_inv + tau_int_inv; % related to g output
alpha_pcb_g = alpha_inv; % related to g output
tau_int_pcb_p = tau_int_xor2; % related to p output
alpha_pcb_p = alpha_xor2; % related to p output

% PROPAGATED AND GENERATED CARRY BLOCK
Cin_pg_p1 = Cin_nand2;
Cin_pg_p2 = 2*Cin_nand2;
Cin_pg_g1 = Cin_nand2;
Cin_pg_g2 = Cin_nor2;
Cin_pg_tot = Cin_pg_p1 + Cin_pg_p2 + Cin_pg_g1 + Cin_pg_g2;
A_pg = 2*A_nand2 + A_nor2 + 3*A_inv;
I_leak_pg = 2*I_leak_nand2 + I_leak_nor2 + 3*I_leak_inv;
P_stat_pg = Vdd*I_leak_pg;
E_dyn_pg = (Vdd^2)*Esw*(3*Cin_inv+Cin_nor2);
tau_int_pg_g = tau_int_nand2 + alpha_nand2*Cin_inv + tau_int_inv + alpha_inv*Cin_nor2 + tau_int_nor2 + alpha_nor2*Cin_inv + tau_int_inv; % related to g output
alpha_pg_g = alpha_inv; % related to g output
tau_int_pg_p = tau_int_nand2 + alpha_nand2*Cin_inv + tau_int_inv; % related to p output
alpha_pg_p = alpha_inv; % related to p output

% ONLY G BLOCK
Cin_gb_p = Cin_nand2;
Cin_gb_c0 = Cin_nand2;
Cin_gb_g = Cin_nor2;
A_gb = A_nand2 + A_nor2 + 2*A_inv;
I_leak_gb = I_leak_nand2 + I_leak_nor2 + 2*I_leak_inv;
P_stat_gb = Vdd*I_leak_gb;
E_dyn_gb = (Vdd^2)*Esw*(2*Cin_inv+Cin_nor2); 
tau_int_gb = tau_int_nand2 + alpha_nand2*Cin_inv + tau_int_inv + alpha_inv*Cin_nor2 + tau_int_nor2 + alpha_nor2*Cin_inv + tau_int_inv;
alpha_gb = alpha_inv;

% TREE
N_of_pcb_block = N;
N_of_pg_block = [7,11,16,20,25,30,36];
N_of_gb_block = N/4;

Cin_data_inputs_tree = Cin_pcb; % for each line of the data inputs A and B
Cin_C0_tree = N_of_gb_block*Cin_gb_c0;

A_tree = N_of_pcb_block*A_pcb + N_of_pg_block*A_pg + N_of_gb_block*A_gb;
P_stat_tree = N_of_pcb_block*P_stat_pcb + N_of_pg_block*P_stat_pg + N_of_gb_block*P_stat_gb;
E_dyn_tree = (Vdd^2)*Esw*(N_of_pg_block*Cin_pg_tot + N_of_gb_block*(Cin_gb_p+Cin_gb_g)) + N_of_pcb_block*E_dyn_pcb + N_of_pg_block*E_dyn_pg + N_of_gb_block*E_dyn_gb;

% delay of a pcb block with one pg block as load
tau_pcb_tree_g = tau_int_pcb_g + alpha_pcb_g*max(Cin_pg_g1,Cin_pg_g2);
tau_pcb_tree_p = tau_int_pcb_p + alpha_pcb_p*max(Cin_pg_p1,Cin_pg_p2);
tau_pcb_tree = max(tau_pcb_tree_g,tau_pcb_tree_p);

% delay of a pg block with 1 pg block and 0 gb block as load
tau_pg_tree_1_0_g = tau_int_pg_g + alpha_pg_g*(1*max(Cin_pg_g1,Cin_pg_g2));
tau_pg_tree_1_0_p = tau_int_pg_p + alpha_pg_p*(1*max(Cin_pg_p1,Cin_pg_p2));
tau_pg_tree_1_0 = max(tau_pg_tree_1_0_g,tau_pg_tree_1_0_p);

% delay of a pg block with 1 pg block and 1 gb block as load
tau_pg_tree_1_1_g = tau_int_pg_g + alpha_pg_g*(1*max(Cin_pg_g1,Cin_pg_g2)+Cin_gb_g);
tau_pg_tree_1_1_p = tau_int_pg_p + alpha_pg_p*(1*max(Cin_pg_p1,Cin_pg_p2)+Cin_gb_p);
tau_pg_tree_1_1 = max(tau_pg_tree_1_1_g,tau_pg_tree_1_1_p);

% delay of a pg block with 2 pg block and 1 gb block as load
tau_pg_tree_2_1_g = tau_int_pg_g + alpha_pg_g*(2*max(Cin_pg_g1,Cin_pg_g2)+Cin_gb_g);
tau_pg_tree_2_1_p = tau_int_pg_p + alpha_pg_p*(2*max(Cin_pg_p1,Cin_pg_p2)+Cin_gb_p);
tau_pg_tree_2_1 = max(tau_pg_tree_2_1_g,tau_pg_tree_2_1_p);

% delay of a pg block with 4 pg block and 1 gb block as load
tau_pg_tree_4_1_g = tau_int_pg_g + alpha_pg_g*(4*max(Cin_pg_g1,Cin_pg_g2)+Cin_gb_g);
tau_pg_tree_4_1_p = tau_int_pg_p + alpha_pg_p*(4*max(Cin_pg_p1,Cin_pg_p2)+Cin_gb_p);
tau_pg_tree_4_1 = max(tau_pg_tree_4_1_g,tau_pg_tree_4_1_p);

% delay of a pg block with 0 pg block and 1 gb block as load
tau_pg_tree_0_1_g = tau_int_pg_g + alpha_pg_g*Cin_gb_g;
tau_pg_tree_0_1_p = tau_int_pg_p + alpha_pg_p*Cin_gb_p;
tau_pg_tree_0_1 = max(tau_pg_tree_0_1_g,tau_pg_tree_0_1_p);

% intrinsic delay of the tree
tau_int_tree(1) = tau_pcb_tree + tau_pg_tree_1_0 + tau_pg_tree_1_1 + tau_pg_tree_0_1 + tau_int_gb; % N=8;
tau_int_tree(2) = tau_pcb_tree + tau_pg_tree_1_0 + tau_pg_tree_1_1 + tau_pg_tree_2_1 + tau_pg_tree_0_1 + tau_int_gb; % N=12;
tau_int_tree(3) = tau_int_tree(2); % N=16
tau_int_tree(4) = tau_pcb_tree + tau_pg_tree_1_0 + tau_pg_tree_1_1 + tau_pg_tree_2_1 + tau_pg_tree_4_1 + tau_int_gb; % N=20;
tau_int_tree(5) = tau_int_tree(4); % N=24
tau_int_tree(6) = tau_int_tree(4); % N=28
tau_int_tree(7) = tau_int_tree(4); % N=32

% the alpha tree in independent of N
alpha_tree = alpha_gb;

% PENTIUM IV
Cin_inputs_pentium = Cin_data_inputs_tree + Cin_data_inputs_cssg; % for each line of the inputs
Cin_C0_pentium = Cin_C0_tree + Cin_carry_cssg;
A_pentium = A_tree + A_cssg;
P_stat_pentium = P_stat_tree + P_stat_cssg; % nW
E_dyn_pentium = (Vdd^2)*Esw*((N/4)-1)*Cin_carry_cssg + E_dyn_tree + E_dyn_cssg; 
tau_int_pentium = max(tau_int_tree + alpha_tree*Cin_carry_cssg + tau_int_mux_par4, tau_int_cssg); % ps
alpha_pentium = alpha_cssg;

% MAXIMUM OPERATING FREQUENCY
fmax = 1./tau_int_pentium; % THz

% DYNAMIC POWER PENTIUM IV
P_dyn_pentium = E_dyn_pentium.*fmax; % mW

% PLOTS

figure(1)
hold on
grid on
plot(N,A_pentium,'.','MarkerSize' ,25);
title('Area Pentium IV as a function of N');
xlabel('N');
ylabel('A  (\mum^2)');

figure(2)
hold on
grid on
plot(N,P_stat_pentium./1000000,'.','MarkerSize' ,25);
title('Static power Pentium IV as a function of N');
xlabel('N');
ylabel('P_{stat}  (mW)');

figure(3)
hold on
grid on
plot(N,P_dyn_pentium,'.','MarkerSize' ,25);
title('Dynamic power Pentium IV as a function of N');
xlabel('N');
ylabel('P_{dyn}  (mW)');

figure(4)
hold on
grid on
plot(N,tau_int_pentium,'.','MarkerSize' ,25);
title('Delay without load Pentium IV as a function of N');
xlabel('N');
ylabel('Delay  (ps)');