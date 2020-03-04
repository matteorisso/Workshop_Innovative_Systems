close all
clear all
clc

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%__________________ Multiplier performance estimator ______________________
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%             *Reference technology node: HP 2010                        
%     ,   ,   *Hypothesis: - only NAND2, INV gates 
%    /////|                - Wn = 10*Lg
%   ///// |                - activity_factor = 0.5                               
%  |~~~|  |                - no logical effort theory                    
%  |===|  |    *The user specifies:                                       
%  | m |  |          - "N", multiplier width (NxN)                  
%  | p |  |          - "a", multiplier type (related to pp generation)                             
%  | y | /             +--+------------------------+                      
%  |===|/              |1 | Baugh-Wooley (array)   |                      
%  '---'               |2 | Dadda                  |                      
%                      |3 | Wallace                |                      
%                      |4 | Modified Booth (MBE)   |
%                      |5 | Even-Odd               |
%                      +--+------------------------+                      
%                    - "b", reduction tree type                          
%                      +--+------------------------+                    
%                      |0 | None                   |
%                      |1 | Dadda                  |
%                      |2 | Wallace                |
%                      +--+------------------------+
%                    - "c", two-operator adder type
%                      +--+------------------------+
%                      |0 | None                   |
%                      |1 | Ripple carry adder     |
%                      |2 | PPA: Ladner-Fischer    |
%                      |3 | PPA: Brent-Kung        |
%                      |4 | PPA: Kogge-Stone       |
%                      |5 | Carry Look-Ahead       |
%                      +--+------------------------+
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%__________________ Input parameters ______________________________________
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% - The standard multiplier is Baugh-Wooley, so if a = 0 => b = 0, c = 0;
% - If Dadda or Wallace multiplier is chosen: - "b" must be equal to "a";
%                                             - "c" must belong to [1:4];
% - If MBE multiplier is chosen: - "b" must belong to [1:2];
%                                - "c" must belong to [1:4];
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Multiplier inputs size
Mpy_width = input('Input data width:\n N = ');

if Mpy_width > 200
    disp("Too wide multiplier! Please reduce N");
    return
end
N = Mpy_width;


%% Multiplier type 
a_mult = [ "Baugh-Wooley" ,"Dadda","Wallace","MBE", "Even-Odd"];
a = input(['Multiplier type:\n 1 => Baugh-Wooley \n 2 => Dadda'... 
           '\n 3 => Wallace \n 4 => MBE \n 5 => Even-Odd \n']);
       
if a < 2 || a > 5
    if a ~= 1
        disp("Wrong input, default multiplier selected (Baugh-Wooley)");
    else
        disp("You have selected Baugh-Wooley multiplier!");
    end
    a = 1;  % default multiplier : Baugh-Wooley
    b = 0;  % to avoid an error in line 93
    c = 0;  % to avoid an error in line 112
else
    disp("You have selected "+  a_mult(a)  +" multiplier!");
end


%% Reduction tree type
if a == 2 || a == 3
    b = a-1;
elseif a == 5  %% even-odd multiplier
    b = 0;
elseif a ~= 1
    b = input('Reduction tree type:\n 1 => Dadda \n 2 => Wallace \n');
end


%% Two-operator adder 
if (b == 0 || b > 2) && a ~= 1
    if a == 5
    c = input(['Final adder type:\n 1 => RCA \n 2 => PPA, '... 
     'Ladner-Fischer \n 3 => PPA, Brent-Kung\n 4 => PPA, '...
     'Kogge-Stone \n 5 => Carry Look-Ahead \n']);
    else
    b = 1;  % default reduction tree : Dadda
    disp("Wrong input, default reduction tree selected (Dadda)");
     c = input(['Final adder type:\n 1 => RCA \n 2 => PPA, '... 
     'Ladner-Fischer \n 3 => PPA, Brent-Kung\n 4 => PPA,'...
     'Kogge-Stone \n 5 => Carry Look-Ahead \n']);
    end
    
elseif b == 1 || b == 2
     c = input(['Final adder type:\n 1 => RCA \n 2 => PPA, '... 
     'Ladner-Fischer \n 3 => PPA, Brent-Kung\n 4 => PPA, '...
     'Kogge-Stone \n 5 => Carry Look-Ahead \n']);
end

if (c == 0 || c > 5) && a ~= 1
    c = 1;
    disp("Wrong input, default two-input adder selected (RCA)");
end




%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%_________ Technological parameters - ITRS 2009 edition ___________________
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Orders of magnitude
giga = 1e9;
mega = 1e6;
kilo = 1e3;
milli = 1e-3;
micro = 1e-6;
nano = 1e-9;
pico = 1e-12;
femto = 1e-15;

% Parameters
Lg = 27*nano;                       % effective channel length, [m]
Vdd = 0.97;                         % power supply voltage, [V]
Ion = 1200*micro/micro;             % saturation current with Rs!=0, [A/m]
MP1_half = 45*nano;                 % half metal pitch @ metal1, [m]
beta = 1.29;                        % electron/hole mobility ratio
Cg_ideal = 0.73*femto/micro;        % gate capacitance, [F/m]
Cg_fringing = 0.25*femto/micro;     % fringing capacitance, [F/m]
I_leak = 100*nano/micro;            % leakage current (S/D), [A/m]
Jg_max = 0.83*kilo/((10*milli)^2);    % w.c. gate current density, [A/m^2]
Covl = 0.2*Cg_ideal;                % overlap capacitance (S/G, D/G), [F/m]
Cj0 = 1*femto/(micro^2);            % junction cap. (no bias), [F/m^2]
L_SD = Lg;                          % source/drain region length, [m]
M = 1.5;                            % interc./avg gate output cap. overhead

% Assumptions
freq = 100*mega;             % reference clock frequency
activity = 0.5;              % gates switch every 2 clock cycles
Wn = 10*Lg;




%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%_______________ reference nMOS parameters computation ____________________
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

Cg_total = Cg_ideal + Cg_fringing + Covl;   % total gate capacitance, [F/m]
tau = Cg_total*Vdd/Ion;                     % intrinsic delay, [s]
Lnmos = Lg + 2*L_SD;                        % total length, [m]
area_NMOS_min = Wn*Lnmos;                   % total area, [m^2]
Ig_max = Jg_max*Lg;                         % gate current, [A/m]




%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%________________ basic GATES parameters computation ______________________
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% reference (minimum) INVERTER
C_FO1 = Cg_total*(1 + beta);                % cap. seen from input, [F/m]
Ld = 4*MP1_half;                            % diffusion length, [m]
Cj_n = Cj0*Ld;                              % nMOS junction cap., [F/m]
Cj_INV = Cj_n*(1 + beta);                   % inverter junction cap., [F/m]
Cl_INV = C_FO1 + Cj_INV;                    % total cap., [F/m]
tau_INV = tau*Cl_INV/Cg_total;              % ref. inverter delay, [s]
area_INV = area_NMOS_min*(1 + beta);        % ref. inverter area, [m^2]
Is_INV = (1+beta)/2*(I_leak + Ig_max)*Wn;   % ref. inv static current, [A],
                                            % equiprobable inputs
Ps_INV = Is_INV*Vdd;                        % ref. inv static power, [W]
Pdyn_INV = Cl_INV*Wn*(Vdd^2)/2;             % ref. inv dynamic power, [W]

% NAND2 (average gate)
C_FO4 = 4*C_FO1;                            % avg load, no overhead, [F/m]
Cl_NAND2 = M*C_FO4;                         % with interc. overhead, [F/m]
tau_NAND2 = tau_INV*Cl_NAND2/Cl_INV;        % avg gate delay, [s]
area_NAND2 = 2*area_NMOS_min*(2 + beta);    % avg gate area, [m^2]
% avg gate static current, [A], assuming equiprobable inputs
Is_NAND2 = ((6 + 2*beta)*I_leak + (6 + 4*beta)*Ig_max)*Wn/4;
Ps_NAND2 = Is_NAND2*Vdd;                    % avg gate static power, [W]
Pdyn_NAND2 = Cl_NAND2*Wn*Vdd^2/2;           % avg gate dynamic power, [W]




%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%________________ basic BLOCKS parameters computation _____________________
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% AND2 is obtained with a NAND2 gate in series with an INVERTER
tau_AND2 = tau_NAND2 + tau_INV;             % AND2 delay, [s]
area_AND2 = area_NAND2 + area_INV;          % AND2 area, [m^2]
Ps_AND2 = Ps_NAND2 + Ps_INV;                % AND2 static power, [W]
Pdyn_AND2 = Pdyn_NAND2 + Pdyn_INV;          % AND2 dynamic power, [W]

% XOR2 can be obtained with 4 NAND2 gates
tau_XOR2 = 3*tau_NAND2;                     % XOR2 delay, [s]
area_XOR2 = 2*area_NAND2;                   % XOR2 area, [m^2]
Ps_XOR2 = 4*Ps_NAND2;                       % XOR2 static power, [W]
Pdyn_XOR2 = 4*Pdyn_NAND2;                   % XOR2 dynamic power, [W]

% HA is obtained with 4 NAND2 gates and one INVERTER
tau_HA_s = 3*tau_NAND2;                     % HA sum bit delay, [s]
tau_HA_c = tau_INV + tau_NAND2;             % HA carry bit delay, [s]
area_HA = area_INV + 4*area_NAND2;          % HA area, [m^2]
Ps_HA = Ps_INV + 4*Ps_NAND2;                % HA static power, [W]
Pdyn_HA = Pdyn_INV + 4*Pdyn_NAND2;          % HA dynamic power, [W]

% FA is obtained with 9 NAND2 GATES
tau_FA_s = 6*tau_NAND2;                     % FA sum bit delay, [s]
tau_FA_c = 5*tau_NAND2;                     % FA carry bit delay, [s]
area_FA = 9*area_NAND2;                     % FA area, [m^2]
Ps_FA = 9*Ps_NAND2;                         % FA static power, [W]
Pdyn_FA = 9*Pdyn_NAND2;                     % FA dynamic power, [W]




%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%________________ PARTIAL PRODUCT BLOCKS ESTIMATIONS ______________________
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% The quantities Tcp, Area, Pstatic and Pdyn are updated at each of the
% following steps:  - Partial products network
%                   - Reduction tree
%                   - Final adder
% In this section partial product circuits are analyzed. 
% In the case of a = 1 (reference multiplier, Baugh-Wooley) the OVERALL
% area / critical path / static and dynamic power estimations are performed
% altogether,since the regular structure allows rather simple computations.

flag = 0;   
for j=1:20  % every parameter (critical path, area, static and dynamic 
            % power) is estimated for 20 different values of N 
    
    if Mpy_width > (j+1)*10
        N = (j+1)*10;
    elseif Mpy_width <= (j+1)*10 && flag == 0
        N = Mpy_width;
        flag = 1;
    else
        N = j*10;
    end
 
N_vector(j) = N;    % values of N used to compute all parameters


switch a 
    
    case 1 %Baugh-Wooley multiplier
%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%________________ BAUGH-WOOLEY multiplier estimations _____________________
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Basic Array multiplier can operate on UNSIGNED input operands, so it was
% chosen as reference multiplier the Baugh-Wooley architecture since it can
% operate on SIGNED operands. Partial products (PPs) are obtained doing the
% logical AND of a_i, b_j (a_i is a bit of operand a, b_j is a bit of
% operand b). PPs involving a_(N-1) and b_(N-1) are complemented according
% to the Baugh-Wooley theory, in order to avoid full sign-extensions.
% This architecture consists of 3 types of basic blocks:
%         - "grey blocks", that handle complemented PPs;
%         - "white blocks", that handle not complemented PPs;
%         - full adders for computing the N MSBs of the product.
% To compute parameters such as critical path and number of basic blocks
% general formulas were exploited.

        %"Grey blocks": FA + NAND2
        area_GB = area_NAND2 + area_FA;         % G.b. area, [m^2]
        n_GB = 2*(N-1);                         % G.b. number
        Ps_GB = Ps_NAND2 + Ps_FA;               % G.b. static power, [W]
        Pdyn_GB = Pdyn_NAND2 + Pdyn_FA;         % G.b. dynamic power, [W]

        %"White blocks": FA + AND2 (AND2 = NAND2 + INV)
        area_WB = area_AND2 + area_FA;          % W.b. area, [m^2]
        n_WB = N^2 - n_GB;                      % W.b. number
        Ps_WB = Ps_AND2 + Ps_FA;                % W.b. static power, [W]
        Pdyn_WB = Pdyn_AND2 + Pdyn_FA;          % W.b. dynamic power, [W]
        
        n_FA = N;                               % number of FAs
        
        % critical path estimation, [s]
        Tcp(j) = tau_INV + tau_AND2 + N*tau_FA_s + N*tau_FA_c;
        % maximum frequency, [Hz]
        Fmax(j) = 1/Tcp(j);
        % area estimation, [m^2]
        Area(j) = n_GB*area_GB + n_WB*area_WB + n_FA*area_FA;
        % static power estimation, [W]
        Pstatic(j) = n_GB*Ps_GB + n_WB*Ps_WB + n_FA*Ps_FA;
        % dynamic power estimation, [W]
        Pdyn(j)=(n_GB*Pdyn_GB+n_WB*Pdyn_WB+ n_FA*Pdyn_FA)*freq*activity;
        
    case {2,3} % PPs network estimations for Dadda, Wallace multipliers
        % The following parameters will be updated in the reduction tree/
        % final adder parameters estimation sections.
        
        Tcp(j) = tau_AND2;                          %[s]
        Fmax(j) = 1/Tcp(j);                         %[Hz]
        Area(j) = (N^2)*area_AND2;                  %[m^2]
        Pstatic(j) = (N^2)*Ps_AND2;                 %[W]
        Pdyn(j) = (N^2)*Pdyn_AND2*freq*activity;    %[W]
        
    case 4 % PPs network estimation for Modified Booth multiplier.
        % A radix-4 multiplier reduces the number of rows (operands) having
        % to be reduced by the reduction tree. Booth's algorithm exploits
        % the mathematical property of being able to express a sequence of
        % additions as a subtraction: the latter can be executed faster.
        
        % Regarding partial products generation encoders and decoders are
        % used. - Enc: 2 XNOR2, 1 XOR2, 1 INV = 12 NAND2 + 3 INV
        %       - Dec: 2 XNOR2, 2 OR2, 1 INV =  10 NAND2 + 7 INV
        
        % Encoder
        area_ENC = 12*area_NAND2 + 3*area_INV;
        n_ENC = ceil(N/2);
        Ps_E = 12*Ps_NAND2 + 3*Ps_INV;
        Pd_E = 12*Pdyn_NAND2 + 3*Pdyn_INV;
        
        % Decoder
        area_DEC = 10*area_NAND2 + 7*area_INV;
        tau_DEC = 5*tau_NAND2 + 2*tau_INV;  % series of XNOR, OR, NAND
        n_DEC = n_ENC*(N+1);
        Ps_D = 10*Ps_NAND2 + 7*Ps_INV;
        Pd_D = 10*Pdyn_NAND2 + 7*Pdyn_INV;
        
        
        % critical path estimation, [s]
        Tcp(j) = tau_DEC + tau_INV;       
        % maximum frequency, [Hz]
        Fmax(j) = 1/Tcp(j);
        % area estimation, [m^2]
        Area(j) = n_ENC*area_ENC + n_DEC*area_DEC + (n_ENC - 1)*area_NAND2;
        % static power estimation, [W]
        Pstatic(j) = n_ENC*Ps_E + n_DEC*Ps_D + (n_ENC - 1)*Ps_NAND2;
        % dynamic power estimation, [W]
        Pdyn(j)=(n_ENC*Pd_E+n_DEC*Pd_D+(n_ENC-1)*Pdyn_NAND2)*freq*activity;
             
    case 5 % PPs network estimation for Even-Odd multiplier and CSA tree
        
        n_nand_CSA = 9*N;               % Number of nand for each CSA block
        h_tree = ceil(N);               % Height of the tree
        n_CSA_blocks = 2*h_tree - 2;    % Total number of CSA blocks
        n_nand_tree = n_nand_CSA*n_CSA_blocks;      % Total number of NAND2
        
        
        Tcp(j) = h_tree*tau_FA_c;            % critical path, [s]
        Fmax(j) = 1/Tcp(j);                  % maximum frequency, [Hz]
        Area(j) = n_nand_tree*area_NAND2;    % total area , [m^2]
        Pstatic(j) = n_nand_tree*Ps_NAND2;   % static power, [W]
        Pdyn(j) = n_nand_tree*Pdyn_NAND2*freq*activity; % dyn. power, [W]

end %switch a




%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%____________________ REDUCTION TREE ESTIMATIONS __________________________
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    switch b
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    case 1 %____________Dadda reduction tree_______________________________
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
        % stage height computed as Xi = floor(1.5*X(i-1))
        stage_h_vector = ([2 3 4 6 9 13 19 28 42 63 94 141 211 316 ...
                              474 711 1066 1599 2398 3597 5395 8093]);
                          
        if a == 4                              % delay matrix, MBE case
            tau_mat = zeros(ceil(N/2), 2*N);
            tree_height = ceil(N/2);
            for i = 1:ceil(N/2)                % initialization, MBE case
                for x = i:i+N-1
                    tau_mat(i,x) = 10e-20;     % low value, negligible 
                                               % w.r.t. multiplier delay
                end
            end
        else
            tau_mat = zeros(N, 2*N);           % delay matrix, generic case
            tree_height = N;
            for i = 1:N                         
                for x = i:i+N-1 
                    tau_mat(i,x) = 10e-20;
                end
            end
        end
        
        %tree_height = N;
        column_fa = zeros(1, 2*N);              % init FA counter
        column_ha = zeros(1, 2*N);              % init HA counter
        
        % find current stage
        i = 1;
        while(stage_h_vector(i) < tree_height)
             i = i + 1;
        end
        
        % init column heights
        cheight = zeros(1, 2*N);
        for k = 1:2*N
            cheight(k) = nnz( tau_mat(:,k) );
        end
        
        % sort delay_matrix in descending order for the first time
        tau_mat = sort(tau_mat, 'descend');
        
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%        
%%%%%%%%% cycle over all stages %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        for current_stage_idx = i:-1:2
            % define desired height
            desired_h = stage_h_vector(current_stage_idx-1);
            % init row pointer for each column of updated_delay_matrix
            urow_ptr = ones(1, 2*N);
            % init updated_delay_matrix for next stage
            utau_mat = zeros(desired_h, 2*N);
            % cycle over all columns
            
            for cidx = 1:2*N-1
                % delay_matrix is sorted in descending order thus row_ptr
                % points to the lower non-zero value in this column
                row_ptr = nnz( tau_mat(:,cidx) );
                % compute distance from current column h. to desired one
                cheight_diff = cheight(cidx) - desired_h;
                
                % iterate process until desired height is reached
                while (cheight_diff > 0)
                   % check if FA is needed and 3 inputs are available
                    
                   if ( cheight_diff > 1 && row_ptr > 2)
                      % inc. FA count and dec. column height by 2
                      column_fa(cidx) = column_fa(cidx) + 1;
                      cheight(cidx) = cheight(cidx) - 2;

                      % extract "slowest" input among 3 "fastest" bits
                      row_ptr = row_ptr - 2;
                      in_delay = tau_mat(row_ptr, cidx);

                      % compute sum delay and store in this column
                      utau_mat(urow_ptr(cidx), cidx) = in_delay + tau_FA_s;
                      % compute carry delay and store it in next column
                      utau_mat(urow_ptr(cidx+1), cidx+1) = in_delay + ...
                                                           tau_FA_c;

                   else % HA needed
                      % inc. HA count and decrease this column height by 1
                      column_ha(cidx) = column_ha(cidx) + 1;
                      cheight(cidx) = cheight(cidx) - 1;

                      % extract "slowest" input delay among 2 fastest bits
                      row_ptr = row_ptr - 1;
                      in_delay = tau_mat(row_ptr, cidx);

                      % compute sum delay and store in this column
                      utau_mat(urow_ptr(cidx), cidx) = in_delay + tau_HA_s;
                      % compute carry delay and store it in next column
                      utau_mat(urow_ptr(cidx+1), cidx+1) = in_delay + ...
                                                           tau_HA_c;
                   end
                % row_ptr is moved to the next available input in the col.
                row_ptr = row_ptr - 1;
                % a value has been added to both this column and the next
                % one so updated_row_ptr must be updated
                urow_ptr(cidx) = urow_ptr(cidx) + 1;
                urow_ptr(cidx+1) = urow_ptr(cidx+1) + 1;

                % add carry bit in next column height count
                cheight(cidx+1) = cheight(cidx+1) +  1;
                cheight_diff = cheight(cidx) - desired_h;
                end

                % transfer unused delay values in this column from delay
                % matrix to updated delay matrix
                while ( row_ptr > 0 )
                    utau_mat(urow_ptr(cidx), cidx) =tau_mat(row_ptr, cidx);
                    urow_ptr(cidx) = urow_ptr(cidx) + 1;
                    row_ptr = row_ptr - 1;
                end

            end

            % update delay matrix (sorted in descending order)
            tau_mat = sort(utau_mat, 'descend');

        end
        
        % count total # FAs and # HAs in Dadda tree
        count_fa = sum(column_fa);
        count_ha = sum(column_ha);
        % identify slowest bit in the 2 final operands
        redtree_delay = max( max(tau_mat) );
        
        % critical path estimation, [s]
        Tcp(j) = Tcp(j) + redtree_delay;         
        % maximum frequency, [Hz]
        Fmax(j) = 1/Tcp(j);
        % area estimation, [m^2]
        Area(j) = Area(j) + count_fa*area_FA + count_ha*area_HA;
        % static power estimation, [W]
        Pstatic(j) = Pstatic(j) + count_fa*Ps_FA + count_ha*Ps_HA;
        % dynamic power estimation, [W]
        Pdyn(j)= Pdyn(j) + (count_fa*Pdyn_FA + ...
                 count_ha*Pdyn_HA)*freq*activity;
 
        
             
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    case 2 %____________Wallace reduction tree_____________________________
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
    % stage height computed as Xi = floor(1.5*X(i-1))
        stage_h_vector = ([2 3 4 6 9 13 19 28 42 63 94 141 211 316 ...
                              474 711 1066 1599 2398 3597 5395 8093]);
                          
        if a == 4                              % delay matrix, MBE case
            tau_mat = zeros(ceil(N/2), 2*N);
            tree_height = ceil(N/2);
            for i = 1:ceil(N/2)                % initialization, MBE case
                for x = i:i+N-1
                    tau_mat(i,x) = 10e-20;     % low value, negligible 
                                               % w.r.t. multiplier delay
                end
            end
        else
            tau_mat = zeros(N, 2*N);           % delay matrix, generic case
            tree_height = N;
            for i = 1:N                         
                for x = i:i+N-1 
                    tau_mat(i,x) = 10e-20;
                end
            end
        end
        
        %tree_height = N;
        column_fa = zeros(1, 2*N);              % init FA counter
        column_ha = zeros(1, 2*N);              % init HA counter
        
        % find current stage
        i = 1;
        while(stage_h_vector(i) < tree_height)
             i = i + 1;
        end
        
        % init column heights
        cheight = zeros(1, 2*N);
        for k = 1:2*N
            cheight(k) = nnz( tau_mat(:,k) );
        end
        
        % sort delay_matrix in descending order for the first time
        tau_mat = sort(tau_mat, 'descend');
        
        
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%        
%%%%%%%%% cycle over all stages %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        for current_stage_idx = i:-1:2
            desired_h = stage_h_vector(current_stage_idx-1);
            % init row pointer for each column of updated_delay_matrix
            urow_ptr = ones(1, 2*N);
            % init updated_delay_matrix for next stage
            utau_mat = zeros(desired_h, 2*N);
             
            % to get maximum n. of employable FAs
            coverable_dots = zeros(1,2*N);
            carry = zeros (1, 2*N);
            % cycle over all columns
            for cidx = 1:2*N-1
                % delay_matrix is sorted in descending order thus row_ptr
                % points to the lower non-zero value in this column
                row_ptr = nnz( tau_mat(:,cidx) )+1;
                
                if(cidx < N+1)
                    coverable_dots(cidx) = cheight(cidx);
                else
                    coverable_dots(cidx) = cheight(cidx) +N+1 - cidx + ...
                                           carry(cidx);
                end
                
                
                while(coverable_dots(cidx)>1 && row_ptr > 1)
                   % check if FA is needed and 3 inputs are available
                   if (coverable_dots(cidx) >2 && row_ptr >2)
                      % inc. FA count and dec. column height by 2
                      column_fa(cidx) = column_fa(cidx) + 1;
                      coverable_dots(cidx) = coverable_dots(cidx) - 3;
                    
                      % extract "slowest" input among 3 "fastest" bits
                      row_ptr = row_ptr - 2;
                      in_delay = tau_mat(row_ptr, cidx);

                      % compute sum delay and store in this column
                      utau_mat(urow_ptr(cidx), cidx) = in_delay + tau_FA_s;
                      % compute carry delay and store it in next column
                      utau_mat(urow_ptr(cidx+1), cidx+1) = in_delay + ...
                                                           tau_FA_c;
                      % add carry bit in next column height count
                      carry(cidx + 1) = carry(cidx +1) + 1;
          
                        % HA needed
                   elseif(coverable_dots(cidx)>1 && row_ptr >1)
                      % inc. HA count and decrease this column height by 1
                      column_ha(cidx) = column_ha(cidx) + 1;
                      coverable_dots(cidx) = coverable_dots(cidx) - 2;

                      % extract "slowest" input delay among 2 fastest bits
                      %row_ptr = row_ptr - 1;
                      in_delay = tau_mat(row_ptr, cidx);

                      % compute sum delay and store in this column
                      utau_mat(urow_ptr(cidx), cidx) = in_delay + tau_HA_s;
                      % compute carry delay and store it in next column
                      utau_mat(urow_ptr(cidx+1), cidx+1) = in_delay + ...
                                                           tau_HA_c;
                      % add carry bit in next column height count
                      carry(cidx + 1) = carry(cidx +1) + 1;
                   else
                       break;
                   end
                % row_ptr is moved to the next available input in the col.
                row_ptr = row_ptr - 1;
                % a value has been added to both this column and the next
                % one so updated_row_ptr must be updated
                urow_ptr(cidx) = urow_ptr(cidx) + 1;
                urow_ptr(cidx+1) = urow_ptr(cidx+1) + 1;

                end

                % transfer unused delay values in this column from delay
                % matrix to updated delay matrix
                while ( row_ptr > 0 )
                    utau_mat(urow_ptr(cidx), cidx) =tau_mat(row_ptr, cidx);
                    urow_ptr(cidx) = urow_ptr(cidx) + 1;
                    row_ptr = row_ptr - 1;
                end

            end
            % update delay matrix (sorted in descending order)
            tau_mat = sort(utau_mat, 'descend');

        end
    
        % count total # FAs and # HAs in Wallace tree
        count_fa = sum(column_fa);
        count_ha = sum(column_ha);
        count_fa_vector(1,j) = count_fa;        %% debug purposes
        count_fa_vector(2,j) = count_ha;
        count_fa_vector(3,j) = 2^(j+1);
        % identify slowest bit in the 2 final operands
        redtree_delay = max( max(tau_mat) );
        
        % critical path estimation, [s]
        Tcp(j) = Tcp(j) + redtree_delay;         
        % maximum frequency, [Hz]
        Fmax(j) = 1/Tcp(j);
        % area estimation, [m^2]
        Area(j) = Area(j) + count_fa*area_FA + count_ha*area_HA;
        % static power estimation, [W]
        Pstatic(j) = Pstatic(j) + count_fa*Ps_FA + count_ha*Ps_HA;
        % dynamic power estimation, [W]
        Pdyn(j)= Pdyn(j) + (count_fa*Pdyn_FA + ...
                 count_ha*Pdyn_HA)*freq*activity;
    end

    
    
    
%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%____________________ FINAL ADDER ESTIMATIONS _____________________________
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Parallel prefix approach precomputations
if a == 5 || b == 1
    num_g_block = 2*N - 2;
    num_precomputation = (2*N-2)*(4+2); % comput. of blocks in prefix stage
    num_result = (2*N-2)*4+5;           % generation of sum bits, carry out
elseif b == 2
    num_g_block = 2*N - i;
    num_precomputation = (2*N-i)*(4+2);
    num_result = (2*N-i)*4+5;           
end
b_block = 7;            % each b block has two AND and one OR gate (7 NAND)
g_block = 5;            % each g block has one AND and one OR gate (5 NAND)
tau_b_block = 4*tau_NAND2;              % critical path of black block
tau_g_block = 4*tau_NAND2;              % critical path of grey block

switch c
    
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    case 1 %____________RCA (Ripple-Carry Adder)___________________________
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        if b == 1 || a == 5               % full-length RCA, Dadda/Even-Odd
            n_nand_RCA = 9*(2*N-3) + 5;   % 2N-3 FAs, 1 HA
            
            Tcp(j) = Tcp(j) + (2*N-4)*tau_FA_c + tau_FA_s; % crit.path, [s]
            Fmax(j) = 1/Tcp(j);                            % max.freq, [Hz]
            Area(j) = Area(j) + n_nand_RCA*area_NAND2;     % t.area, [m^2]
            Pstatic(j) = Pstatic(j) + n_nand_RCA*Ps_NAND2; % s.power, [W]
            Pdyn(j) = Pdyn(j) + n_nand_RCA*Pdyn_NAND2;     % dyn.power, [W]
            
        elseif b == 2
            n_nand_RCA = 9*(2*N-3) + 5 - 9*(i-2);      % reduced length RCA
            %(Wallace reduction tree), i-2 is the number of reduction steps
            
            Tcp(j) = Tcp(j) +(2*N-2-i)*tau_FA_c +tau_FA_s; % crit.path, [s]
            Fmax(j) = 1/Tcp(j);                            % max.freq, [Hz]
            Area(j) = Area(j) + n_nand_RCA*area_NAND2;     % t.area, [m^2]
            Pstatic(j) = Pstatic(j) + n_nand_RCA*Ps_NAND2; % s.power, [W]
            Pdyn(j) = Pdyn(j) + n_nand_RCA*Pdyn_NAND2*freq*activity; % [W]
        end
        
        
        
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%            
    case 2  %___________Parallel Prefix: Ladner-Fischer____________________
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        if b == 1 || a == 5
            % total number of NAND2 gates
            num_b_block = (2*N-2)/2 * log2(2*N-2);
            N_NAND_Ladner = b_block*num_b_block + g_block*num_g_block;
            % n. of NAND2: precomputation + prefix stage + final step
            N_NAND_total = num_precomputation + N_NAND_Ladner + num_result;
            
            
            Tcp(j) = Tcp(j) + (log2(2*N-2))*tau_b_block + ...
                     tau_g_block*tau_XOR2*2;               % crit.path,[s]
            Fmax(j) = 1/Tcp(j);                            % max.freq.,[Hz]
            Area(j) = Area(j)+ N_NAND_total*area_NAND2;    % tot.area,[m^2]
            Pstatic(j) = Pstatic(j)+N_NAND_total*Ps_NAND2; % p.static, [W]
            Pdyn(j) = Pdyn(j) + N_NAND_total*Pdyn_NAND2*freq*activity; %[W]
            
        elseif b == 2
            % total number of NAND2 gates
            num_b_block = (2*N-i)/2 * log2(2*N-i);
            N_NAND_Ladner = b_block*num_b_block + g_block*num_g_block;
            % n. of NAND2: precomputation + prefix stage + final step
            N_NAND_total = num_precomputation + N_NAND_Ladner + num_result;
            
            
            Tcp(j) = Tcp(j) + (log2(2*N-i))*tau_b_block + ...
                     tau_g_block*tau_XOR2*2;               % crit.path,[s]
            Fmax(j) = 1/Tcp(j);                            % max.freq.,[Hz]
            Area(j) = Area(j)+ N_NAND_total*area_NAND2;    % tot.area,[m^2]
            Pstatic(j) = Pstatic(j)+N_NAND_total*Ps_NAND2; % p.static, [W]
            Pdyn(j) = Pdyn(j) + N_NAND_total*Pdyn_NAND2*freq*activity; %[W]
            
        end
    
        
        
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    case 3  %___________Parallel Prefix: Brent-Kung________________________
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        if b == 1 || a == 5
            % total number of NAND2 gates
            num_b_block = 2*(2*N-2)-2  -log2(2*N-2);
            N_NAND_BK = b_block*num_b_block + g_block*num_g_block;
            % n. of NAND2: precomputation + prefix stage + final step
            N_NAND_total = num_precomputation + N_NAND_BK + num_result;
            
            
            Tcp(j) = Tcp(j) + (2*log2(2*N-2)-2)*tau_b_block + ...
                     tau_g_block*tau_XOR2*2;               % crit.path,[s]
            Fmax(j) = 1/Tcp(j);                            % max.freq.,[Hz]
            Area(j) = Area(j)+ N_NAND_total*area_NAND2;    % tot.area,[m^2]
            Pstatic(j) = Pstatic(j)+N_NAND_total*Ps_NAND2; % p.static, [W]
            Pdyn(j) = Pdyn(j) + N_NAND_total*Pdyn_NAND2*freq*activity; %[W]
            
        elseif b == 2
            % total number of NAND2 gates
            num_b_block = 2*(2*N-i)-2 * -log2(2*N-i);
            N_NAND_BK = b_block*num_b_block + g_block*num_g_block;
            % n. of NAND2: precomputation + prefix stage + final step
            N_NAND_total = num_precomputation + N_NAND_BK + num_result;
            
            
            Tcp(j) = Tcp(j) + (2*log2(2*N-i)-2)*tau_b_block + ...
                     tau_g_block*tau_XOR2*2;               % crit.path,[s]
            Fmax(j) = 1/Tcp(j);                            % max.freq.,[Hz]
            Area(j) = Area(j)+ N_NAND_total*area_NAND2;    % tot.area,[m^2]
            Pstatic(j) = Pstatic(j)+N_NAND_total*Ps_NAND2; % p.static, [W]
            Pdyn(j) = Pdyn(j) + N_NAND_total*Pdyn_NAND2*freq*activity; %[W]
        end
        
        
        
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    case 4  %___________Parallel Prefix: Kogge-Stone_______________________
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        if b == 1 || a == 5
            % total number of NAND2 gates
            num_b_block = (2*N-2)*log2(2*N-2) - (2*N-2) + 1;
            N_NAND_KS = b_block*num_b_block + g_block*num_g_block;
            % n. of NAND2: precomputation + prefix stage + final step
            N_NAND_total = num_precomputation + N_NAND_KS + num_result;
            
            
            Tcp(j) = Tcp(j) + (log2(2*N-2))*tau_b_block + ...
                     tau_g_block*tau_XOR2*2;               % crit.path,[s]
            Fmax(j) = 1/Tcp(j);                            % max.freq.,[Hz]
            Area(j) = Area(j)+ N_NAND_total*area_NAND2;    % tot.area,[m^2]
            Pstatic(j) = Pstatic(j)+N_NAND_total*Ps_NAND2; % p.static, [W]
            Pdyn(j) = Pdyn(j) + N_NAND_total*Pdyn_NAND2*freq*activity; %[W]
            
        elseif b == 2
            % total number of NAND2 gates
            num_b_block = (2*N-i)*log2(2*N-i) - (2*N-i) + 1;
            N_NAND_KS = b_block*num_b_block + g_block*num_g_block;
            % n. of NAND2: precomputation + prefix stage + final step
            N_NAND_total = num_precomputation + N_NAND_KS + num_result;
            
            
            Tcp(j) = Tcp(j) + (log2(2*N-i))*tau_b_block + ...
                     tau_g_block*tau_XOR2*2;               % crit.path,[s]
            Fmax(j) = 1/Tcp(j);                            % max.freq.,[Hz]
            Area(j) = Area(j)+ N_NAND_total*area_NAND2;    % tot.area,[m^2]
            Pstatic(j) = Pstatic(j)+N_NAND_total*Ps_NAND2; % p.static, [W]
            Pdyn(j) = Pdyn(j) + N_NAND_total*Pdyn_NAND2*freq*activity; %[W]
        end
    
        
        
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    case 5 %____________CLA (Carry Look-Ahead)_____________________________
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        
        % A-type blocks
        n_nand_gen_A = 1;
        n_inv_gen_A = 1;
        n_nand_prop_A = 1;
        n_inv_prop_A = 2;
        n_nand_sum_A = 8;
        n_nand_A = n_nand_gen_A + n_nand_prop_A + n_nand_sum_A;
        n_inv_A = n_inv_gen_A + n_inv_prop_A;
        
        %Delays related to the Block A
        tau_generate_A = n_nand_gen_A*tau_NAND2 + n_inv_gen_A*tau_INV;
        tau_propagate_A = n_nand_prop_A*tau_NAND2 + tau_INV; 
        tau_sum = (n_nand_sum_A-2)*tau_NAND2;
        tau_A_up = tau_sum;
        tau_A_down = tau_generate_A; 
        
        
        % B-type blocks
        n_nand_gen_B = 2;
        n_inv_gen_B = 1;
        n_nand_prop_B = 1;
        n_inv_prop_B = 1;
        n_nand_carry_B = 2;
        n_inv_carry_B = 1;
        n_nand_B = n_nand_gen_B + n_nand_prop_B + n_nand_carry_B;
        n_inv_B = n_inv_gen_B + n_inv_prop_B + n_inv_carry_B;
        
        %Delays related to the Block B
        tau_generate_B = n_nand_gen_B*tau_NAND2;
        tau_propagate_B = n_nand_prop_A*tau_NAND2 + n_inv_prop_A*tau_INV;
        tau_carry = n_nand_carry_B*tau_NAND2;
        tau_B_up = tau_carry;
        tau_B_down = tau_generate_B;

       if b == 1 || a == 5
           n_A = 2*N-2;                     % number of A-type blocks
           n_B = 2*N-3;                     % number of B-type blocks
           
           % critical path, [s]
           Tcp(j) = Tcp(j)+ tau_A_down + (log2(2*N-2) - 1)*tau_B_down + ...
                    (log2(2*N-2))*tau_B_up + tau_A_up;
                
           % maximum frequency, [Hz]
           Fmax(j) = 1/Tcp(j);
           
           % total area, [s]
           Area(j) = Area(j) + (n_A*n_nand_A + n_B*n_nand_B)*area_NAND2 ...
                    + (n_A*n_inv_A+n_B*n_inv_B)*area_INV;
                
           % static power, [W]
           Pstatic(j)= Pstatic(j)+ (n_A*n_nand_A+n_B*n_nand_B)*Ps_NAND2 ...
                    + (n_A*n_inv_A+n_B*n_inv_B)*Ps_INV;
                
           % dynamic power, [W]
           Pdyn(j) = Pdyn(j) + ((n_A*n_nand_A + n_B*n_nand_B)*Pdyn_NAND2...
                     + (n_A*n_inv_A + n_B*n_inv_B)*Pdyn_INV)*freq*activity;
           
       elseif b == 2       % reduced length final adder operators (Wallace)
           n_A = 2*N - i;                         % number of A-type blocks
           n_B = 2*N -1 - i;                      % number of B-type blocks
           
           % critical path, [s]
           Tcp(j) = Tcp(j)+ tau_A_down + (log2(2*N-2) - 1)*tau_B_down + ...
                    (log2(2*N-2))*tau_B_up + tau_A_up;
                
           % maximum frequency, [Hz]
           Fmax(j) = 1/Tcp(j);
           
           % total area, [s]
           Area(j) = Area(j) + (n_A*n_nand_A + n_B*n_nand_B)*area_NAND2 ...
                    + (n_A*n_inv_A+n_B*n_inv_B)*area_INV;
                
           % static power, [W]
           Pstatic(j)= Pstatic(j)+ (n_A*n_nand_A+n_B*n_nand_B)*Ps_NAND2 ...
                    + (n_A*n_inv_A+n_B*n_inv_B)*Ps_INV;
                
           % dynamic power, [W]
           Pdyn(j) = Pdyn(j) + ((n_A*n_nand_A + n_B*n_nand_B)*Pdyn_NAND2...
                     + (n_A*n_inv_A + n_B*n_inv_B)*Pdyn_INV)*freq*activity;

       end
         
end

end % for cycle end 



%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%___________________________PLOT SECTION___________________________________
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% scale for plot
Area_micro2 = Area./micro^2;
Tcp_nano = Tcp./nano;
Fmax_giga = Fmax./giga;
Pstatic_milli = Pstatic./milli;
Pdyn_milli = Pdyn./milli;

% get index of user-defined N
index = 0;
for i=1:20
    index = index + 1;
    if N_vector(i) == Mpy_width
        break;  
    end
end
    
user_value_area = Area_micro2(index);
user_value_tcp = Tcp_nano(index);
user_value_fmax = Fmax_giga(index);
user_value_pstatic = Pstatic_milli(index);
user_value_pdyn = Pdyn_milli(index);


figure
plot(N_vector, Area_micro2,'b-', Mpy_width, user_value_area ,'b*'); hold on
grid on
legend("For N = "+ Mpy_width +" Area = "+ Area_micro2(index) + " um^2")
title("Area of an NxN "+  a_mult(a) + " multiplier ")
xlabel('N')
ylabel('Area, um^2')


figure
% subplot(1,2,1)
plot(N_vector, Tcp_nano, 'g-',Mpy_width, user_value_tcp , 'g*'); hold on
grid on
legend("For N = "+ Mpy_width +" Tcp = "+ Tcp_nano(index) + " ns")
title("Critical path of an NxN "+  a_mult(a) + " multiplier")
xlabel('N')
ylabel('Tcp, ns')


figure
% subplot(1,2,2)
plot(N_vector, Fmax_giga, 'r-',Mpy_width, user_value_fmax , 'r*'); hold on
grid on
legend("For N = "+ Mpy_width +" Fmax = "+ Fmax_giga(index) + " GHz")
title("Maximum frequency of an NxN "+  a_mult(a) + " multiplier")
xlabel('N')
ylabel('Fmax, GHz')


figure
plot(N_vector,Pstatic_milli,'b-', N_vector, Pdyn_milli,'g-', ...
 Mpy_width,user_value_pstatic,'b*',Mpy_width,user_value_pdyn,'g*'); hold on
grid on
legend("For N = "+ Mpy_width +" Ps = "+ Pstatic_milli(index) + " mW", ...
        "For N = "+ Mpy_width +" Pdyn = "+ Pdyn_milli(index) + " mW")
title({"Power (static, dynamic) dissipated by a NxN "+ a_mult(a)...
      + " Multiplier"; "Assumptions: activity = 0.5, frequency = 100 MHz"})
xlabel('N')
ylabel('P, mW')

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%