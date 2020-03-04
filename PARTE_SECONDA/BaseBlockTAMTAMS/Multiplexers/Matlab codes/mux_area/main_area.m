%MUX area calculation

clear all;
close all;
clc
prompt = 'Specify the nMOS channel width Wn (um):  ';
Wn = input(prompt)%um, Gate width of n-MOS.
interc_override=0.15; %we estimate 15% of override
beta =1.29; %is the ratio between Wp/Wn.
gateW_p = beta*Wn; %um, Gate width of p-MOS

lambda = 1; % referred to the design rules 

%area MOS HP 2010
Lgate =0.018; %um, The length of the gate.
L_s_d = lambda*Lgate;
L=Lgate+2*L_s_d; %um total length.
areaNand2HP=2*( Wn+gateW_p )*L *(1+ interc_override ); % um^2

%area MOS LOP 2010
Lgate =0.022; %um, The length of the gate.
L_s_d = lambda*Lgate;
L=Lgate+2*L_s_d; %um total length.
areaNand2LOP=2*( Wn+gateW_p )*L *(1+ interc_override ); % um^2

%area MOS LSTP 2010
Lgate =0.028; %um, The length of the gate.
L_s_d = lambda*Lgate;
L=Lgate+2*L_s_d; %um total length.
areaNand2LSTP=2*( Wn+gateW_p )*L *(1+ interc_override ); % um^2

prompt = 'Specify the number of inputs:  ';
X = input(prompt);

prompt = 'Specify the size in bit of the word:  ';
%Nbit has a mean only if is 1,2,4,8,16,32,64
Word = input(prompt);

%Number of Nand gates
N_gates1 = 3*Word*(X-1);
B = Word*(X-1)/4;
N_gates2 = floor(B); %number of NAND2 FO4
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

%%
N_gate = N_gates1 + N_gates2 + cont_FO2 +cont_FO1;
    
%Area evaluation
AreaHP = areaNand2HP*N_gate
AreaLOP = areaNand2LOP*N_gate
AreaLSTP = areaNand2LSTP*N_gate

%% PLOT 128x1 mux
% Area128x1HP = [253.578, 507.14, 1014.3, 2028.6];
% Area128x1LOP = [309.9189, 619.8378, 1239.7, 2479.4];
% Area128x1LSTP = [394.4423, 788.8845, 1577.8, 3155.5];
% bit = [8, 16, 32, 64]
% figure(1)
% plot(bit,Area128x1HP,'-og',bit,Area128x1LOP,'-or',bit,Area128x1LSTP,'-ob');
% title('Area 128x1 mux ')
% xlabel('Number of bit','FontSize',18)
% ylabel('Area (\mum^2)','FontSize',18)
% set(gca,'LineWidth',2,'FontSize',18,'box','on')
% set(gca, 'xtick', (2.^(3:5))) % set ticks at 1,2,4,8,...
% set(gca, 'xscale', 'log') % scale x-axis logarithmic
% axis([0 64 0 3500 ])
% legend('HP','LOP','LSTP')
% grid on


