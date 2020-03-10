classdef rca < full_adder
	% rca class describes a ripple carry adder realized with several fa,
	% everything is obtained with nand2 gates,
    % thus the class inherits properties and methods from father class
    % full_adder which inherits properties and methods from father class
    % nand2. The class describes the circuit in terms of delay,power and
    % area. It starts from technological parameters of HP, LOP and LSTP
    % devices, present in IRDS 2010. The user need to specify the pull-down
    % width Wn, followed by  the parallelism of data.
	
	properties
		 bit_width {mustBeInteger}; % parallelism
	end
	
	methods
		% Constructor
        function obj = rca(nMOS_width, n_bit)
            % Constructor of father class full_adder
            obj             = obj@full_adder(nMOS_width);
            obj.bit_width   = n_bit;
		end
		
        % Delay evaluation
        function [Tdp_HP_rca, Tdp_LOP_rca, Tdp_LSTP_rca] = delay(obj)
            [Tdp_HP_nd2, Tdp_LOP_nd2, Tdp_LSTP_nd2] = delay@nand2(obj);
            % HP
            Tdp_HP_rca      = (2 * (obj.bit_width - 1) + 3) * Tdp_HP_nd2; % [s]
            % LOP
            Tdp_LOP_rca     = (2 * (obj.bit_width - 1) + 3) * Tdp_LOP_nd2; % [s]
            % LSTP
            Tdp_LSTP_rca    = (2 * (obj.bit_width - 1) + 3) * Tdp_LSTP_nd2; % [s]
        end
        
        % Area evaluation
        function [A_HP_rca, A_LOP_rca, A_LSTP_rca] = area(obj)
            [A_HP_fa, A_LOP_fa, A_LSTP_fa] = area@full_adder(obj);
            % HP
            A_HP_rca    = obj.bit_width * A_HP_fa; % [um^2]
            % LOP
            A_LOP_rca   = obj.bit_width * A_LOP_fa; % [um^2]
            % LSTP
            A_LSTP_rca  = obj.bit_width * A_LSTP_fa; % [um^2]
        end
        
        % Dynamic power evaluation
        function [Pdyn_HP_rca, Pdyn_LOP_rca, Pdyn_LSTP_rca] = power_dyn(obj)
            [Pdyn_HP_fa, Pdyn_LOP_fa, Pdyn_LSTP_fa] = power_dyn@full_adder(obj);
            % HP
            Pdyn_HP_rca     = obj.bit_width * Pdyn_HP_fa; % [W]
            % LOP
            Pdyn_LOP_rca    = obj.bit_width * Pdyn_LOP_fa; % [W]
            % LSTP
            Pdyn_LSTP_rca   = obj.bit_width * Pdyn_LSTP_fa; % [W]
        end
        
        % Static power evaluation
        function [Pstat_HP_rca, Pstat_LOP_rca, Pstat_LSTP_rca] = power_stat(obj)
            [Pstat_HP_fa, Pstat_LOP_fa, Pstat_LSTP_fa] = power_stat@full_adder(obj);
            % HP
            Pstat_HP_rca    = obj.bit_width * Pstat_HP_fa; % [W]
            % LOP
            Pstat_LOP_rca   = obj.bit_width * Pstat_LOP_fa; % [W]
            % LSTP 
            Pstat_LSTP_rca  = obj.bit_width * Pstat_LSTP_fa; % [W]
        end
		
	end
end

