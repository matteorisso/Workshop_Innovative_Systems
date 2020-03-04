function[wallace_area,Pdyn,Pstatic,wallace_delay,Pdyn_max,f_max]=wallace(n, k, radix, ND2delay, ND2area,Wn, CLND2, fck, Vdd, IstND2,t_setup,t_clkToOut,INVarea,CLINV,ppipe)
% Wallace tree design
% Note: decomment lines 45, 46, 47, 90 to generate FidoCadJ code, decomment
% lines 50, 53, 63, 81, 84, 96 to generate VHDL code.

% Inputs parameters
%n=8;    % number of input bits
%k=8;    % number of operands
%ppipe=2 % every how many levels of the tree a pipe stage is introduced
%radix=1; % radix of the multiplier usign the wallace tree to sum partial products
%ND2area=0.5e-12; % m^2
%Wn=0.27e-6; % m
%ClND2=15.47e-9*Wn; % F 15.47 fF/um
%fck=6.2e9;  % Hz
%Vdd=0.97;   % V
%IstND2=226.67e-9; % A static current
%Ion=1200;   % A/m
ClND2= CLND2*Wn; % 15.47e-9*Wn; % F 15.47 fF/um
%t_setup= 5e-9; % s 
%t_clkToOut= 15e-9; %s
ClINV=CLINV*Wn;
IstINV=IstND2; 
% INVarea=0.19e-12; % l_inv=l_nand
% ClINV=3e-9*Wn; %F

error='Error radix should be power of 2';
if floor(log2(radix))~= log2(radix)
    disp(error);
    radix=1;
end

% step 1 multioperand adder matrix
mat=zeros(k,n+log2(radix)*k+ceil(log2(k))); 
for i=1:k
    mat(i,(size(mat,2)-(n-1+(floor(log2(radix)))*(i-1))):(size(mat,2)-(floor(log2(radix)))*(i-1)))=ones(1,n);   % step 1 multioperand adder matrix
end

fa=0;   % number of full adder
ha=0;   % number of half adder
ff=0;   % number of flip-flops
n_stage=0;  % number of stage

fp=fopen('code_fidoCadJ.fcd','w');
new_origin=[245 75];    % origin of the FidoCadJ code
old_origin=new_origin;

 %%%%%%height=0;%% (VHDL) height of the tree
 %%%%%%init_wallace_VHDL(n,k,size(mat,2),radix);%%(VHDL) VHDL file initialization

s_matrix=zeros(1,size(mat,2));  % matrix of s for ha and fa allocation
 %%%%%%[new_origin,old_origin]=dotNotation(mat,new_origin,s_matrix,old_origin);
    
while k>2 % At each level of the tree we divide dots in three-dots-wide stripes and each stripe is filled with the maximum possible amount of FAs and HAs. Stripes that are composed of only one or two operands are forwarded to the next level.
    n_subm=floor(k/3);  % number of 3 operands groups
    s_matrix=zeros(n_subm,size(mat,2));
    
    for t=1:n_subm
        if t==1 ff_(n_stage+1)=0; end
        s=sum(mat(3*t-2:3*t,:));    % 3 -> full adder, 2 -> half adder, 1 -> dot to be moved to the next stage
        
        %%%%%% gen_FAHA_VHDL(mat,t,fa,ha,height,ppipe,n_stage); %% (VHDL) allocate FAs and HAs
        fa_level=sum(s>2);
        ha_level=sum(s>1)-sum(s>2);
        fa=fa+sum(s>2); % accumulate number of FA
        ha=ha+sum(s>1)-sum(s>2); % accumulate number of HA
        
        %ff=ff+2*fa_level+2*ha_level;
        ff_(n_stage+1)=ff_(n_stage+1)+2*fa_level+2*ha_level; % 2 flip flops for each adder output (sum and carry)
        %%%%
        mat(2*t-1:2*t,:)=0;
        new_line=s>1;   % matrix line to update
        mat(2*t-1,:)=new_line;
        mat(2*t,:)=[new_line(2:end) 0];
        dotTomv=(s>0)-(s>1);    % dot to move to the next step
        mat(2*t-1,:)=or(mat(2*t-1,:),dotTomv);
        %%%%
        s_matrix(t,:)=s;    % update row of s_matrix with s
    end
     %%%%%%height=height+k;%% (VHDL) update the height of the tree
    n_rowTomv=k-n_subm*3;
    if n_rowTomv>0
         %%%%%%mv_row_VHDL(n_rowTomv,height,size(mat,2),k); %% (VHDL) move out of 3 rows groups dots to the next step
        mat(ceil(k*2/3)-(n_rowTomv-1):ceil(k*2/3),:)=mat(k-(n_rowTomv-1):k,:);
    end
    k=ceil(k*2/3);      % number of operands of the next step
    mat=mat(1:k,:);     % next step dot matrix

    %%%%%%[new_origin,old_origin]=dotNotation(mat,new_origin,s_matrix,old_origin);
    
    n_stage=n_stage+1;
    
end

 %%%%%%end_wallace_VHDL(mat,height); %% (VHDL) end the VHDL file and set the outputs

  ff=sum(ff_(ppipe:ppipe:n_stage));
 
if ppipe>n_stage
    ppipe=0;
end
%%%%% Delay evaluation
%ND2delay=Vdd*ClND2/(Ion*Wn);    % s delay of a nand2 gate
t_clkToOut=3*ND2delay
fa_delay=6*ND2delay;    % fa critical path
if ppipe~=0
    t_min=fa_delay*ppipe+t_setup+t_clkToOut % critical path
    f_max=1/t_min
    wallace_delay=floor(n_stage/ppipe)*(t_min)+fa_delay*mod(n_stage,ppipe)
else  
    wallace_delay=n_stage*fa_delay % critical path
    f_max=1/wallace_delay   % maximum frequency
end


if ppipe==0
    ff=0;
end
%%%%% Area
fa_area=9*ND2area;
ha_area=5*ND2area;
ff_area=8*ND2area+2*INVarea;
wallace_area=fa*fa_area+ha*ha_area+ff*ff_area % m^2 

%%%%% Power
n_ND2=9*fa+5*ha+8*ff;    % number of ND2
PdynND2=0.5*ClND2*fck*Vdd^2;    % W dynamic power of a ND2
PdynND2_max=0.5*ClND2*f_max*Vdd^2;% W dynamic power of a ND2 with f_max
PstaticND2=IstND2*Vdd;  % W static power of a ND2

n_INV=2*ff; %number of INV
PdynINV=0.5*ClINV*fck*Vdd^2;% W worst case dynamic power of a INV  (switching activity=1)
PdynINV_max=0.5*ClINV*f_max*Vdd^2;% W worst case dynamic power of a INV with f_max  (switching activity=1)
PstaticINV=IstINV*Vdd;  % static power of a INV

Pdyn=PdynND2*n_ND2+PdynINV*n_INV % W worst case dynamic power (switching activity=1)
Pdyn_max=PdynND2_max*n_ND2+PdynINV_max*n_INV % W worst case dynamic power with f_max (switching activity=1)
Pstatic=PstaticND2*n_ND2+PstaticINV*n_INV  % static power