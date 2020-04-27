classdef pe < nand2
    % pe class describes a complex sequential circuit which is the basic
    % processing element (pe) capable of performing the basic operation
    % required by convolutional and fully connected layers, which is a
    % sum_subtiplication by a ternary weight (-1,0,1) and an accusum_subation, thus
    % it is made of one adder/subtractor, one decoder, several registers
    % with different size, several muxes of different type and some nand
    % elementary gates.
	% Everything is obtained with nand2 gates,
    % thus the class inherits properties and methods nand2. The class
    % describes the circuit in terms of delay,power and area. It starts
    % from technological parameters of HP, LOP and LSTP devices, present in
    % IRDS 2010. The user need to specify the pull-down width Wn, followed
    % by the input parallelism and the bit growth of data. The class models
    % the corresponding pe.vhd component.
   
    properties
        N  {mustBeInteger}; % input parallelism
        BG {mustBeInteger}; % bit growth
        sum_sub; % add_sub object
        dec; % decoder object
        regN; % register with N parallelism object 
        reg2; % register with 2 parallelism object 
        regN_BG; % register with N+BG parallelism object 
        muxN; % mux2to1 with N parallelism object
        mux6; % mux2to1 with 6 parallelism object
        muxN_BG1; % mux(N+BG)to1 with 1 parallelism object
        muxN_BG2; % mux2to1 with N+BG parallelism object
    end
    
    methods
        % Constructor
        function obj = pe(nMOS_width, n_bit, bit_growth)
            % Constructor of father class nand2
            obj             = obj@nand2(nMOS_width);
            obj.N           = n_bit;
            obj.BG          = bit_growth;
            obj.sum_sub     = add_sub(nMOS_width, n_bit+bit_growth);
            obj.dec         = decoder(nMOS_width, 3);
            obj.regN        = register(nMOS_width, n_bit);
            obj.reg2        = register(nMOS_width, 2);
            obj.regN_BG     = register(nMOS_width, n_bit+bit_growth);
            obj.muxN        = muxnto1_nbit(nMOS_width, 2, n_bit);
            obj.mux6        = muxnto1_nbit(nMOS_width, 2, 6);
            obj.muxN_BG1    = muxnto1_nbit(nMOS_width, 2*n_bit, 1);
            obj.muxN_BG2    = muxnto1_nbit(nMOS_width, 2, n_bit+bit_growth);
        end
        
        % Delay evaluation
        function [Tdp_HP_pe, Tdp_LOP_pe, Tdp_LSTP_pe] = delay(obj)
            [Tdp_HP_nd2,       Tdp_LOP_nd2,      Tdp_LSTP_nd2]      = delay@nand2(obj);
            [Tdp_HP_sum_sub,   Tdp_LOP_sum_sub,  Tdp_LSTP_sum_sub]  = obj.sum_sub.delay;
            %[Tdp_HP_muxN,      Tdp_LOP_muxN,     Tdp_LSTP_muxN]     = obj.muxN.delay;
            [Tdp_HP_muxN_BG1,  Tdp_LOP_muxN_BG1, Tdp_LSTP_muxN_BG1] = obj.muxN_BG1.delay;
            [Tdp_HP_muxN_BG2,  Tdp_LOP_muxN_BG2, Tdp_LSTP_muxN_BG2] = obj.muxN_BG2.delay;
            %[Tdp_HP_mux6,      Tdp_LOP_mux6,     Tdp_LSTP_mux6]     = obj.mux6.delay;
            %[Tdp_HP_regN,      Tdp_LOP_regN,     Tdp_LSTP_regN]     = obj.regN.delay;
            %[Tdp_HP_reg2,      Tdp_LOP_reg2,     Tdp_LSTP_reg2]     = obj.reg2.delay;
            [Tdp_HP_regN_BG,   Tdp_LOP_regN_BG,  Tdp_LSTP_regN_BG]  = obj.regN_BG.delay;
            % HP
            Tdp_HP_pe     = Tdp_HP_muxN_BG1 + 2*Tdp_HP_nd2 + Tdp_HP_sum_sub + ...
                5*Tdp_HP_muxN_BG2 + Tdp_HP_regN_BG; % [s]
            % LOP
            Tdp_LOP_pe     = Tdp_LOP_muxN_BG1 + 2*Tdp_LOP_nd2 + Tdp_LOP_sum_sub + ...
                5*Tdp_LOP_muxN_BG2 + Tdp_LOP_regN_BG; % [s]
            % LSTP
            Tdp_LSTP_pe     = Tdp_LSTP_muxN_BG1 + 2*Tdp_LSTP_nd2 + Tdp_LSTP_sum_sub + ...
                5*Tdp_LSTP_muxN_BG2 + Tdp_LSTP_regN_BG; % [s]
		end
		
		% Area evaluation
        function [A_HP_pe, A_LOP_pe, A_LSTP_pe] = area(obj)
			[A_HP_nd2,       A_LOP_nd2,      A_LSTP_nd2]      = area@nand2(obj);
            [A_HP_sum_sub,   A_LOP_sum_sub,  A_LSTP_sum_sub]  = obj.sum_sub.area;
            [A_HP_dec,       A_LOP_dec,      A_LSTP_dec]      = obj.dec.area;
            [A_HP_muxN,      A_LOP_muxN,     A_LSTP_muxN]     = obj.muxN.area;
            [A_HP_muxN_BG1,  A_LOP_muxN_BG1, A_LSTP_muxN_BG1] = obj.muxN_BG1.area;
            [A_HP_muxN_BG2,  A_LOP_muxN_BG2, A_LSTP_muxN_BG2] = obj.muxN_BG2.area;
            [A_HP_mux6,      A_LOP_mux6,     A_LSTP_mux6]     = obj.mux6.area;
            [A_HP_regN,      A_LOP_regN,     A_LSTP_regN]     = obj.regN.area;
            [A_HP_reg2,      A_LOP_reg2,     A_LSTP_reg2]     = obj.reg2.area;
            [A_HP_regN_BG,   A_LOP_regN_BG,  A_LSTP_regN_BG]  = obj.regN_BG.area;
            % HP
            A_HP_pe     = A_HP_dec + (12 * A_HP_regN) + A_HP_reg2 + ...
                A_HP_regN_BG + (12 * A_HP_muxN) + (2 * A_HP_mux6) + ...
                (2 * obj.N * A_HP_muxN_BG1) + (5 * A_HP_muxN_BG2) + ...
                (2 * (3*obj.N + obj.BG) * A_HP_nd2) + A_HP_sum_sub; % [um^2]
            % LOP
            A_LOP_pe     = A_LOP_dec + (12 * A_LOP_regN) + A_LOP_reg2 + ...
                A_LOP_regN_BG + (12 * A_LOP_muxN) + (2 * A_LOP_mux6) + ...
                (2 * obj.N * A_LOP_muxN_BG1) + (5 * A_LOP_muxN_BG2) + ...
                (2 * (3*obj.N + obj.BG) * A_LOP_nd2) + A_LOP_sum_sub; % [um^2]
            % LSTP
            A_LSTP_pe     = A_LSTP_dec + (12 * A_LSTP_regN) + A_LSTP_reg2 + ...
                A_LSTP_regN_BG + (12 * A_LSTP_muxN) + (2 * A_LSTP_mux6) + ...
                (2 * obj.N * A_LSTP_muxN_BG1) + (5 * A_LSTP_muxN_BG2) + ...
                (2 * (3*obj.N + obj.BG) * A_LSTP_nd2) + A_LSTP_sum_sub; % [um^2]
		end
        
		
        % Dynamic power evaluation
        function [Pdyn_HP_pe, Pdyn_LOP_pe, Pdyn_LSTP_pe] = power_dyn(obj)
			[Pdyn_HP_nd2,       Pdyn_LOP_nd2,      Pdyn_LSTP_nd2]      = power_dyn@nand2(obj);
            [Pdyn_HP_sum_sub,   Pdyn_LOP_sum_sub,  Pdyn_LSTP_sum_sub]  = obj.sum_sub.power_dyn;
            [Pdyn_HP_dec,       Pdyn_LOP_dec,      Pdyn_LSTP_dec]      = obj.dec.power_dyn;
            [Pdyn_HP_muxN,      Pdyn_LOP_muxN,     Pdyn_LSTP_muxN]     = obj.muxN.power_dyn;
            [Pdyn_HP_muxN_BG1,  Pdyn_LOP_muxN_BG1, Pdyn_LSTP_muxN_BG1] = obj.muxN_BG1.power_dyn;
            [Pdyn_HP_muxN_BG2,  Pdyn_LOP_muxN_BG2, Pdyn_LSTP_muxN_BG2] = obj.muxN_BG2.power_dyn;
            [Pdyn_HP_mux6,      Pdyn_LOP_mux6,     Pdyn_LSTP_mux6]     = obj.mux6.power_dyn;
            [Pdyn_HP_regN,      Pdyn_LOP_regN,     Pdyn_LSTP_regN]     = obj.regN.power_dyn;
            [Pdyn_HP_reg2,      Pdyn_LOP_reg2,     Pdyn_LSTP_reg2]     = obj.reg2.power_dyn;
            [Pdyn_HP_regN_BG,   Pdyn_LOP_regN_BG,  Pdyn_LSTP_regN_BG]  = obj.regN_BG.power_dyn;
            % HP
            Pdyn_HP_pe     = Pdyn_HP_dec + (12 * Pdyn_HP_regN) + Pdyn_HP_reg2 + ...
                Pdyn_HP_regN_BG + (12 * Pdyn_HP_muxN) + (2 * Pdyn_HP_mux6) + ...
                (2 * obj.N * Pdyn_HP_muxN_BG1) + (5 * Pdyn_HP_muxN_BG2) + ...
                (2 * (3*obj.N + obj.BG) * Pdyn_HP_nd2) + Pdyn_HP_sum_sub; % [W]
            % LOP
            Pdyn_LOP_pe     = Pdyn_LOP_dec + (12 * Pdyn_LOP_regN) + Pdyn_LOP_reg2 + ...
                Pdyn_LOP_regN_BG + (12 * Pdyn_LOP_muxN) + (2 * Pdyn_LOP_mux6) + ...
                (2 * obj.N * Pdyn_LOP_muxN_BG1) + (5 * Pdyn_LOP_muxN_BG2) + ...
                (2 * (3*obj.N + obj.BG) * Pdyn_LOP_nd2) + Pdyn_LOP_sum_sub; % [W]
            % LSTP
            Pdyn_LSTP_pe     = Pdyn_LSTP_dec + (12 * Pdyn_LSTP_regN) + Pdyn_LSTP_reg2 + ...
                Pdyn_LSTP_regN_BG + (12 * Pdyn_LSTP_muxN) + (2 * Pdyn_LSTP_mux6) + ...
                (2 * obj.N * Pdyn_LSTP_muxN_BG1) + (5 * Pdyn_LSTP_muxN_BG2) + ...
                (2 * (3*obj.N + obj.BG) * Pdyn_LSTP_nd2) + Pdyn_LSTP_sum_sub; % [W]
		end
        
        % Static power evaluation
        function [Pstat_HP_pe, Pstat_LOP_pe, Pstat_LSTP_pe] = power_stat(obj)
			[Pstat_HP_nd2,       Pstat_LOP_nd2,      Pstat_LSTP_nd2]      = power_stat@nand2(obj);
            [Pstat_HP_sum_sub,   Pstat_LOP_sum_sub,  Pstat_LSTP_sum_sub]  = obj.sum_sub.power_stat;
            [Pstat_HP_dec,       Pstat_LOP_dec,      Pstat_LSTP_dec]      = obj.dec.power_stat;
            [Pstat_HP_muxN,      Pstat_LOP_muxN,     Pstat_LSTP_muxN]     = obj.muxN.power_stat;
            [Pstat_HP_muxN_BG1,  Pstat_LOP_muxN_BG1, Pstat_LSTP_muxN_BG1] = obj.muxN_BG1.power_stat;
            [Pstat_HP_muxN_BG2,  Pstat_LOP_muxN_BG2, Pstat_LSTP_muxN_BG2] = obj.muxN_BG2.power_stat;
            [Pstat_HP_mux6,      Pstat_LOP_mux6,     Pstat_LSTP_mux6]     = obj.mux6.power_stat;
            [Pstat_HP_regN,      Pstat_LOP_regN,     Pstat_LSTP_regN]     = obj.regN.power_stat;
            [Pstat_HP_reg2,      Pstat_LOP_reg2,     Pstat_LSTP_reg2]     = obj.reg2.power_stat;
            [Pstat_HP_regN_BG,   Pstat_LOP_regN_BG,  Pstat_LSTP_regN_BG]  = obj.regN_BG.power_stat;
            % HP
            Pstat_HP_pe     = Pstat_HP_dec + (12 * Pstat_HP_regN) + Pstat_HP_reg2 + ...
                Pstat_HP_regN_BG + (12 * Pstat_HP_muxN) + (2 * Pstat_HP_mux6) + ...
                (2 * obj.N * Pstat_HP_muxN_BG1) + (5 * Pstat_HP_muxN_BG2) + ...
                (2 * (3*obj.N + obj.BG) * Pstat_HP_nd2) + Pstat_HP_sum_sub; % [W]
            % LOP
            Pstat_LOP_pe     = Pstat_LOP_dec + (12 * Pstat_LOP_regN) + Pstat_LOP_reg2 + ...
                Pstat_LOP_regN_BG + (12 * Pstat_LOP_muxN) + (2 * Pstat_LOP_mux6) + ...
                (2 * obj.N * Pstat_LOP_muxN_BG1) + (5 * Pstat_LOP_muxN_BG2) + ...
                (2 * (3*obj.N + obj.BG) * Pstat_LOP_nd2) + Pstat_LOP_sum_sub; % [W]
            % LSTP
            Pstat_LSTP_pe     = Pstat_LSTP_dec + (12 * Pstat_LSTP_regN) + Pstat_LSTP_reg2 + ...
                Pstat_LSTP_regN_BG + (12 * Pstat_LSTP_muxN) + (2 * Pstat_LSTP_mux6) + ...
                (2 * obj.N * Pstat_LSTP_muxN_BG1) + (5 * Pstat_LSTP_muxN_BG2) + ...
                (2 * (3*obj.N + obj.BG) * Pstat_LSTP_nd2) + Pstat_LSTP_sum_sub; % [W]
		end
    end
end

