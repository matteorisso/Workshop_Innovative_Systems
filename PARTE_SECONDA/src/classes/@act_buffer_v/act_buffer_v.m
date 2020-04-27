classdef act_buffer_v < nand2
    % act_buffer_v class describes a sequential circuit
    % modeled with 4 mux 8 to 1, a register and 40 and gates, everything 
	% is obtained with nand2 gates, thus the class inherits properties and methods nand2. 
	% The class describes the circuit in terms of delay,power and area. It starts
    % from technological parameters of HP, LOP and LSTP devices, present in
    % IRDS 2010. The user need to specify the pull-down width Wn, followed
    % by activation bits and kernel size. The class models the corresponding
    % act_buffer_v.vhd component.
    
    properties
        N {mustBeInteger}; % activation bits
        K {mustBeInteger}; % kernel size
        mux; % mux with bit_width N*(K-1)
		reg;
		nand2;
    end
    
    methods
        % Constructor
        function obj = act_buffer_v(nMOS_width, n_bit, kernel_size)
            % Constructor of father class nand2
            obj            = obj@nand2(nMOS_width);
            obj.N          = n_bit;
            obj.K          = kernel_size;			
            obj.mux        = muxnto1_nbit(nMOS_width, 8, 1);
            obj.reg        = register(nMOS_width, n_bit*kernel_size);
            obj.nand2      = nand2(nMOS_width);
        end
        
        % Delay evaluation
        function [Tdp_HP_act_buffer_v, Tdp_LOP_act_buffer_v, Tdp_LSTP_act_buffer_v] = delay(obj)
            [Tdp_HP_mux, Tdp_LOP_mux, Tdp_LSTP_mux]  = obj.mux.delay;
            % HP
            Tdp_HP_act_buffer_v     = Tdp_HP_mux;% [s]
            % LOP
            Tdp_LOP_act_buffer_v     = Tdp_LOP_mux;% [s]
            % LSTP
            Tdp_LSTP_act_buffer_v     = Tdp_LSTP_mux;% [s]
		end
		
		% Area evaluation
        function [A_HP_act_buffer_v, A_LOP_act_buffer_v, A_LSTP_act_buffer_v] = area(obj)
            [A_HP_mux, A_LOP_mux, A_LSTP_mux]  = obj.mux.area;
            [A_HP_nand2, A_LOP_nand2, A_LSTP_nand2]  = obj.nand2.area;
            [A_HP_reg, A_LOP_reg, A_LSTP_reg]  = obj.reg.area;
            % HP
            A_HP_act_buffer_v      = 4 * A_HP_mux + 72 * A_HP_nand2 + A_HP_reg; % [um^2]
            % LOP
            A_LOP_act_buffer_v      = 4 * A_LOP_mux + 72 * A_LOP_nand2 + A_LOP_reg; % [um^2]
            % LSTP
            A_LSTP_act_buffer_v      = 4 * A_LSTP_mux + 72 * A_LSTP_nand2 + A_LSTP_reg; % [um^2]
		end
        
		
        % Dynamic power evaluation
        function [Pdyn_HP_act_buffer_v, Pdyn_LOP_act_buffer_v, Pdyn_LSTP_act_buffer_v] = power_dyn(obj)
            [Pdyn_HP_mux, Pdyn_LOP_mux, Pdyn_LSTP_mux]  = obj.mux.power_dyn;
			[Pdyn_HP_nand2, Pdyn_LOP_nand2, Pdyn_LSTP_nand2]  = obj.nand2.power_dyn;
            [Pdyn_HP_reg, Pdyn_LOP_reg, Pdyn_LSTP_reg]  = obj.reg.power_dyn;
            % HP
            Pdyn_HP_act_buffer_v      = 4 * Pdyn_HP_mux + 72 * Pdyn_HP_nand2 + Pdyn_HP_reg; % [W]
            % LOP
            Pdyn_LOP_act_buffer_v      = 4 * Pdyn_LOP_mux + 72 * Pdyn_LOP_nand2 + Pdyn_LOP_reg; % [W]
            % LSTP
            Pdyn_LSTP_act_buffer_v      = 4 * Pdyn_LSTP_mux + 72 * Pdyn_LSTP_nand2 + Pdyn_LSTP_reg; % [W]
		end
        
        % Static power evaluation
        function [Pstat_HP_act_buffer_v, Pstat_LOP_act_buffer_v, Pstat_LSTP_act_buffer_v] = power_stat(obj)
            [Pstat_HP_mux, Pstat_LOP_mux, Pstat_LSTP_mux]  = obj.mux.power_stat;
			[Pstat_HP_nand2, Pstat_LOP_nand2, Pstat_LSTP_nand2]  = obj.nand2.power_dyn;
            [Pstat_HP_reg, Pstat_LOP_reg, Pstat_LSTP_reg]  = obj.reg.power_dyn;
            % HP
            Pstat_HP_act_buffer_v      = 4 * Pstat_HP_mux + 72 * Pstat_HP_nand2 + Pstat_HP_reg; % [W]
            % LOP
            Pstat_LOP_act_buffer_v      = 4 * Pstat_LOP_mux + 72 * Pstat_LOP_nand2 + Pstat_LOP_reg; % [W]
            % LSTP
            Pstat_LSTP_act_buffer_v      = 4 * Pstat_LSTP_mux + 72 * Pstat_LSTP_nand2 + Pstat_LSTP_reg; % [W]
		end
    end
end

