clear all;
close all;
clc
prompt = 'Specify the nMOS channel width Wn (um):  ';
Wn = input(prompt)%um, Gate width of n-MOS.
interc_override=0.15; %we estimate 15% of override
beta =1.29; %is the ratio between Wp/Wn.
gateW_p = beta*Wn; %um, Gate width of p-MOS

%area HP 2010
Lgate =0.018; %um, The effective length of the gate.
Xj = 0.0065; %um, Source/Drain extensions length.
L=Lgate+2*Xj; %um total length.
areaNand2HP=2*( Wn+gateW_p )*L *(1+ interc_override ); % um^2

%area LOP 2010
Lgate =0.022; %um, The effective length of the gate.
Xj = 0.0075; %um, Source/Drain extensions length.
gateW_p = beta*Wn; %um, Gate width of p-MOS
L=Lgate+2*Xj; %um total length.
areaNand2LOP=2*( Wn+gateW_p )*L *(1+ interc_override ); % um^2

%area LSTP 2010
Lgate =0.028; %um, The effective length of the gate.
Xj = 0.0085; %um, Source/Drain extensions length.
gateW_p = beta*Wn; %um, Gate width of p-MOS
L=Lgate+2*Xj; %um total length.
areaNand2LSTP=2*( Wn+gateW_p )*L *(1+ interc_override ); % um^2

prompt = 'Specify the number of inputs:  ';
X = input(prompt);

prompt = 'Specify the size in bit of the word:  ';
%Nbit has a mean only if is 1,2,4,8,16,32,64
Word = input(prompt);

%Number of Nand gates
N_gates1 = 3*Word*(X-1);
B = Word*(X-1)/4;
N_gates2 = floor(B);
decimal = B - floor(B); 

cont_FO2= 0;
cont_FO1= 0;

if (decimal == 0.75)
    cont_FO2= 1;
    cont_FO1= 1;
elseif (decimal == 0.50)
    cont_FO2= 1;
elseif (decimal == 0.25)
    cont_FO1= 1;
end

%%
N_gate = N_gates1 + N_gates2 + cont_FO2 +cont_FO1;
    
%Area evaluation
AreaHP = areaNand2HP*N_gate
AreaLOP = areaNand2LOP*N_gate
AreaLSTP = areaNand2LSTP*N_gate




