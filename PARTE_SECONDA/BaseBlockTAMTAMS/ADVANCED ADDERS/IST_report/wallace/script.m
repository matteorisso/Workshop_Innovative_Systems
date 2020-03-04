%  Plot wallace_area
close all
clc
clear all

radix=2;    
ND2delay=12.5e-12; % s
ND2area=0.5e-12; % m^2
Wn=0.27e-6; % m
CLND2=15.47e-9; % 15.47e-9*Wn; % F 15.47 fF/um
fck=5e9;  % Hz
Vdd=0.97;   % V
IstND2=226.67e-9; % A
t_setup= 10e-12;
t_clkToOut= 15e-9; %s


INVarea=0.19e-12; % l_inv=l_nand
CLINV=3e-9*Wn; %F

% AREA
n=[4:128]; 
k=[4, 8, 16, 32, 64, 128]; %[4, 8, 16, 32, 64, 128]; %[4:1:64];  %[3:1:8];
ppipe=2;%[0:11]
wallace_area=zeros(length(k),length(n));
Pdyn=zeros(length(k),length(n));
Pstatic=zeros(length(k),length(n));
wallace_delay=zeros(length(k),length(n));
parameters=zeros(length(k),length(n),6);
for i=1:length(k)
    for j=1:length(n)
        
%        [wallace_area(i,j),Pdyn(i,j),Pstatic(i,j),wallace_delay(i,j), pdyn_max]=wallace(n(j), k(i), radix, ND2delay, ND2area,Wn, CLND2, fck, Vdd, IstND2);
           [parameters(i,j,1),parameters(i,j,2),parameters(i,j,3),parameters(i,j,4), parameters(i,j,5), parameters(i,j,6)]=wallace(n(j), k(i), radix, ND2delay, ND2area,Wn, CLND2, fck, Vdd, IstND2,t_setup,t_clkToOut,INVarea,CLINV,ppipe);
           
           % For different ppipe values comparison
           % for w=1:length(ppipe)
           % [parameters(i,w,1),parameters(i,w,2),parameters(i,w,3),parameters(i,w,4), parameters(i,w,5), parameters(i,w,6)]=wallace(n, k, radix, ND2delay, ND2area,Wn, CLND2, fck, Vdd, IstND2,t_setup,t_clkToOut,INVarea,CLINV,ppipe(w));
           % end
    end
end
%pause


%
fclose all;
%%
txt={'Area', 'Dynamic Power', 'Static Power', 'Delay', 'Dynamic Power fmax','F_m_a_x'};
txtpng={"area.png", "p_dyn.png", "p_static.png", "delay.png", "p_dyn_fmax.png","throughput.png"};
txt_z={'Area [m]', 'P_d_y_n [W]', 'P_s_t [W]', 'Delay [s]','P_d_y_n_M_A_X [W]','F_m_a_x [Hz]'};

lg={'k=4', 'k=8', 'k=16', 'k=32', 'k=64', 'k=128'}
for d=1:6
    figure(d)
     hold on
    title(txt(d));
    for i=1:length(k)
     plot(n,parameters(i,:,d));
     hold on
     legend(lg,'Location','NorthWest')
     hold on
    xlabel('n');
    ylabel(txt_z(d));
     grid on
    end
    if (d==1)     
           saveas(gcf,'area');
           saveas(gcf,'area.png');
    elseif(d==2)    
            saveas(gcf,'p_dyn');
           saveas(gcf,'p_dyn.png');
               elseif(d==3)    
            saveas(gcf,'p_static');
           saveas(gcf,'p_static.png');
                          elseif(d==4)    
            saveas(gcf,'delay');
           saveas(gcf,'delay.png');
                                     elseif(d==5)    
            saveas(gcf,'p_dyn_fmax');
           saveas(gcf,'p_dyn_fmax.png');
                                                elseif(d==6)    
            saveas(gcf,'fmax');
           saveas(gcf,'fmax.png');
    end
    hold off
end
%pause
% %************************************************************************
% PRINT 3D Graphs
% %************************************************************************

txt_z={'Area [m]', 'P_d_y_n [W]', 'P_s_t [W]', 'Delay [s]','P_d_y_n_M_A_X [W]','F_m_a_x [Hz]'};

% figure (6)
% subplot(2,2,1)
for i=1:6
    figure
    mesh(n, k, parameters(1:length(k),:,i));
    
    xlabel('n');
    ylabel('k');
    zlabel(txt_z(i));
    title(txt(i));
    if (i==1)     
           saveas(gcf,'area3d');
           saveas(gcf,'area3d.png');
    elseif(i==2)    
            saveas(gcf,'p_dyn3d');
           saveas(gcf,'p_dyn3d.png');
    elseif(i==3)    
            saveas(gcf,'p_static3d');
           saveas(gcf,'p_static3d.png');
    elseif(i==4)    
            saveas(gcf,'delay3d');
           saveas(gcf,'delay3d.png');
    elseif(i==5)    
            saveas(gcf,'p_dyn_fmax3d');
           saveas(gcf,'p_dyn_fmax3d.png');
    elseif(i==5)    
            saveas(gcf,'fmax3d');
           saveas(gcf,'fmax3d.png');
    end

end


hold off

%% For different ppipe values comparison
fclose all;
close all
txt={'Area', 'Dynamic Power', 'Static Power', 'Delay', 'Dynamic Power fmax','F_m_a_x'};
txt_y={'Area [m]', 'P_d_y_n [W]', 'P_s_t [W]', 'Delay [s]','P_d_y_n_M_A_X [W]','F_m_a_x [Hz]'};

for d=1:6
    figure(d)
     hold on
    title(txt(d));
    for i=1:length(ppipe)
     plot(ppipe,parameters(1,:,d))
     hold on
     xlabel('ppipe')
     ylabel(txt_y(d))
     grid on
    end
    hold off
        if (d==1)     
           saveas(gcf,'area_pipe');
           saveas(gcf,'area_pipe.png');
        elseif(d==2)    
            saveas(gcf,'p_dyn_pipe');
           saveas(gcf,'p_dyn_pipe.png');
        elseif(d==3)    
            saveas(gcf,'p_static_pipe');
           saveas(gcf,'p_static_pipe.png');
        elseif(d==4)    
            saveas(gcf,'delay_pipe');
           saveas(gcf,'delay_pipe.png');
        elseif(d==5)    
            saveas(gcf,'p_dyn_fmax_pipe');
           saveas(gcf,'p_dyn_fmax_pipe.png');
        elseif(d==6)    
            saveas(gcf,'fmax_pipe');
           saveas(gcf,'fmax_pipe.png');
    end
end