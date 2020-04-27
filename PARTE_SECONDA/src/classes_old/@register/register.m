classdef register < flip_flop
    % register class describes a register realized with several d-ff in
    % master slave configuration, everything is obtained with nand2 gates,
    % thus the class inherits properties and methods from father class
    % flip_flop which inherits properties and methods from father class
    % nand2. The class describes the circuit in terms of delay,power and
    % area. It starts from technological parameters of HP, LOP and LSTP
    % devices, present in IRDS 2010. The user need to specify the pull-down
    % width Wn, followed by  the parallelism of data.
    
    properties
        bit_width {mustBeInteger}; % parallelism
	end
	
    methods
        % Constructor
        function obj = register(nMOS_width, n_bit)
            % Constructor of father class flip_flop
            obj             = obj@flip_flop(nMOS_width);
            obj.bit_width   = n_bit;
		end
		
		% Delay evaluation
        function [Tdp_HP_reg, Tdp_LOP_reg, Tdp_LSTP_reg] = delay(obj)
            [Tdp_HP_ff, Tdp_LOP_ff, Tdp_LSTP_ff] = delay@flip_flop(obj);
            % HP
            Tdp_HP_reg      = Tdp_HP_ff; % [s]
            % LOP
            Tdp_LOP_reg     = Tdp_LOP_ff; % [s]
            % LSTP
            Tdp_LSTP_reg    = Tdp_LSTP_ff; % [s]
		end
		
		% Area evaluation
        function [A_HP_reg, A_LOP_reg, A_LSTP_reg] = area(obj)
            [A_HP_ff, A_LOP_ff, A_LSTP_ff] = area@flip_flop(obj);
            % HP
            A_HP_reg    = obj.bit_width * A_HP_ff; % [um^2]
            % LOP
            A_LOP_reg   = obj.bit_width * A_LOP_ff; % [um^2]
            % LSTP
            A_LSTP_reg  = obj.bit_width * A_LSTP_ff; % [um^2]
		end
        
		
        % Dynamic power evaluation
        function [Pdyn_HP_reg, Pdyn_LOP_reg, Pdyn_LSTP_reg] = power_dyn(obj)
            [Pdyn_HP_ff, Pdyn_LOP_ff, Pdyn_LSTP_ff] = power_dyn@flip_flop(obj);
            % HP
            Pdyn_HP_reg     = obj.bit_width * Pdyn_HP_ff; % [W]
            % LOP
            Pdyn_LOP_reg    = obj.bit_width * Pdyn_LOP_ff; % [W]
            % LSTP
            Pdyn_LSTP_reg   = obj.bit_width * Pdyn_LSTP_ff; % [W]
        end
        
        % Static power evaluation
        function [Pstat_HP_reg, Pstat_LOP_reg, Pstat_LSTP_reg] = power_stat(obj)
            [Pstat_HP_ff, Pstat_LOP_ff, Pstat_LSTP_ff] = power_stat@flip_flop(obj);
            % HP
            Pstat_HP_reg    = obj.bit_width * Pstat_HP_ff; % [W]
            % LOP
            Pstat_LOP_reg   = obj.bit_width * Pstat_LOP_ff; % [W]
            % LSTP 
            Pstat_LSTP_reg  = obj.bit_width * Pstat_LSTP_ff; % [W]
        end
        
    end
end

