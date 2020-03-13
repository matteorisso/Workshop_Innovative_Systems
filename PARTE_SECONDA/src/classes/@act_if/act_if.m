classdef act_if < nand2
    % act_if class describes a combinatorial circuit
    % modeled with 160 mux 8 to 1, everything is obtained with nand2 gates,
    % thus the class inherits properties and methods nand2. The class
    % describes the circuit in terms of delay,power and area. It starts
    % from technological parameters of HP, LOP and LSTP devices, present in
    % IRDS 2010. The user need to specify the pull-down width Wn, followed
    % by activation bits and kernel size. The class models the corresponding
    % act_if.vhd component.
    
    properties
        N {mustBeInteger}; % activation bits
        K {mustBeInteger}; % kernel size
        mux; % mux with bit_width N*(K-1)
    end
    
    methods
        % Constructor
        function obj = act_if(nMOS_width, N, K)
            % Constructor of father class nand2
            obj            = obj@nand2(nMOS_width);
            obj.mux        = muxnto1_nbit(nMOS_width, 8, N*(K-1));
        end
        
        % Delay evaluation
        function [Tdp_HP_act_if, Tdp_LOP_act_if, Tdp_LSTP_act_if] = delay(obj)
            [Tdp_HP_mux, Tdp_LOP_mux, Tdp_LSTP_mux]  = obj.mux.delay;
            % HP
            Tdp_HP_act_if     = 2 * Tdp_HP_mux;% [s]
            % LOP
            Tdp_LOP_act_if     = 2* Tdp_LOP_mux;% [s]
            % LSTP
            Tdp_LSTP_act_if     = 2 * Tdp_LSTP_mux;% [s]
		end
		
		% Area evaluation
        function [A_HP_act_if, A_LOP_act_if, A_LSTP_act_if] = area(obj)
            [A_HP_mux, A_LOP_mux, A_LSTP_mux]  = obj.mux.area;
            % HP
            A_HP_act_if      = 160 * A_HP_mux; % [um^2]
            % LOP
            A_LOP_act_if      = 160 * A_LOP_mux; % [um^2]
            % LSTP
            A_LSTP_act_if      = 160 * A_LSTP_mux; % [um^2]
		end
        
		
        % Dynamic power evaluation
        function [Pdyn_HP_act_if, Pdyn_LOP_act_if, Pdyn_LSTP_act_if] = power_dyn(obj)
            [Pdyn_HP_mux, Pdyn_LOP_mux, Pdyn_LSTP_mux]  = obj.mux.power_dyn;
            % HP
            Pdyn_HP_act_if      = 160 * Pdyn_HP_mux; % [W]
            % LOP
            Pdyn_LOP_act_if      = 160 * Pdyn_LOP_mux; % [W]
            % LSTP
            Pdyn_LSTP_act_if      = 160 * Pdyn_LSTP_mux; % [W]
		end
        
        % Static power evaluation
        function [Pstat_HP_act_if, Pstat_LOP_act_if, Pstat_LSTP_act_if] = power_stat(obj)
            [Pstat_HP_mux, Pstat_LOP_mux, Pstat_LSTP_mux]  = obj.mux.power_stat;
            % HP
            Pstat_HP_act_if      = 160 * Pstat_HP_mux; % [W]
            % LOP
            Pstat_LOP_act_if      = 160 * Pstat_LOP_mux; % [W]
            % LSTP
            Pstat_LSTP_act_if      = 160 * Pstat_LSTP_mux; % [W]
		end
    end
end

