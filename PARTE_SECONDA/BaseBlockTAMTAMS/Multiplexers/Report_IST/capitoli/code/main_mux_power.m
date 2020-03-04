%MUX static and dynamic power consumption
close all
clear all
clc

%open workspace of the selected technology
prompt = 'Select "1" if HP2010, "2" if LOP2010, "3" if LSTP2010:   ';
selection = input(prompt)
if selection ==1
    load('HP_2010.mat')
elseif selection == 2
    load('LOP_2010.mat')
elseif selection == 3
    load('LSTP_2010.mat')
end

prompt = 'Select number of mux input:      ';
%you can select only power of 2
X = input(prompt)

prompt = 'Select parallelism:      ';
%you can select only power of 2
Word = input(prompt)


N_gates1 = 3*Word*(X-1);
B = Word*(X-1)/4;
cont_FO4 = floor(B); %number of NAND2 FO4
decimal = B - floor(B); 

cont_FO2= 0; %number of NAND2 FO2	
cont_FO1= 0; %number of NAND2 FO1

if (decimal == 0.75)
    cont_FO2= 1;
    cont_FO1= 1;
elseif (decimal == 0.50)
    cont_FO2= 1;
elseif (decimal == 0.25)
    cont_FO1= 1;
end

%Number of Nand gates
N_NAND2_FO1 = N_gates1 + cont_FO1;
N_NAND2_FO2 = cont_FO2;
N_NAND2_FO4 = cont_FO4;

%Power evalutaion [W]
P_stat = N_NAND2_FO1*P_stat_FO1 + N_NAND2_FO2*P_stat_FO2 + ...
    N_NAND2_FO4*P_stat_FO4

N_NAND2_FO1 = 2*Word*(X-1) + cont_FO1;
P_dyn = N_NAND2_FO1*P_dyn_FO1 + N_NAND2_FO2*P_dyn_FO2 + ...
    N_NAND2_FO4*P_dyn_FO4

    
    