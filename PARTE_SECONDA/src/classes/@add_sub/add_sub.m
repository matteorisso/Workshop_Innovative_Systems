classdef add_sub < rca
	% add_sub class describes an adder/subtractor ripple carry adder
	% realized with several fa, everything is obtained with nand2 gates,
    % thus the class inherits properties and methods from father class rca
    % which inherits properties and methods from father class full_adder
    % which inherits properties and methods from father class nand2. The
    % class describes the circuit in terms of delay,power and area. It
    % starts from technological parameters of HP, LOP and LSTP devices,
    % present in IRDS 2010. The user need to specify the pull-down width
    % Wn, followed by  the parallelism of data.
	
	
	methods
		% Constructor
        function obj = add_sub(nMOS_width, n_bit)
            % Constructor of father class rca
            obj = obj@rca(nMOS_width, n_bit);
		end
		
		
        % Delay evaluation
        function [Tdp_HP_add_sub, Tdp_LOP_add_sub, Tdp_LSTP_add_sub] = delay(obj)
			[Tdp_HP_nd2, Tdp_LOP_nd2, Tdp_LSTP_nd2] = delay@nand2(obj);
            % HP
            Tdp_HP_add_sub      = (2 * (obj.bit_width - 2) + 8) * Tdp_HP_nd2; % [s]
            % LOP
            Tdp_LOP_add_sub     = (2 * (obj.bit_width - 2) + 8) * Tdp_LOP_nd2; % [s]
            % LSTP
            Tdp_LSTP_add_sub    = (2 * (obj.bit_width - 2) + 8) * Tdp_LSTP_nd2; % [s]
        end
        
        % Area evaluation
        function [A_HP_add_sub, A_LOP_add_sub, A_LSTP_add_sub] = area(obj)
            [A_HP_nd2, A_LOP_nd2, A_LSTP_nd2] = area@nand2(obj);
			[A_HP_rca, A_LOP_rca, A_LSTP_rca] = area@rca(obj);
            % HP
            A_HP_add_sub    = A_HP_rca + 3 * obj.bit_width * A_HP_nd2; % [um^2]
            % LOP
            A_LOP_add_sub   = A_LOP_rca + 3 * obj.bit_width * A_LOP_nd2; % [um^2]
            % LSTP
            A_LSTP_add_sub  = A_LSTP_rca + 3 * obj.bit_width * A_LSTP_nd2; % [um^2]
        end
        
        % Dynamic power evaluation
        function [Pdyn_HP_add_sub, Pdyn_LOP_add_sub, Pdyn_LSTP_add_sub] = power_dyn(obj)
            [Pdyn_HP_nd2, Pdyn_LOP_nd2, Pdyn_LSTP_nd2] = power_dyn@nand2(obj);
			[Pdyn_HP_rca, Pdyn_LOP_rca, Pdyn_LSTP_rca] = power_dyn@rca(obj);
            % HP
            Pdyn_HP_add_sub     = Pdyn_HP_rca + 3 * obj.bit_width * Pdyn_HP_nd2; % [W]
            % LOP
            Pdyn_LOP_add_sub    = Pdyn_LOP_rca + 3 * obj.bit_width * Pdyn_LOP_nd2; % [W]
            % LSTP
            Pdyn_LSTP_add_sub   = Pdyn_LSTP_rca + 3* obj.bit_width * Pdyn_LSTP_nd2; % [W]
        end
        
        % Static power evaluation
        function [Pstat_HP_add_sub, Pstat_LOP_add_sub, Pstat_LSTP_add_sub] = power_stat(obj)
            [Pstat_HP_nd2, Pstat_LOP_nd2, Pstat_LSTP_nd2] = power_stat@nand2(obj);
			[Pstat_HP_rca, Pstat_LOP_rca, Pstat_LSTP_rca] = power_stat@rca(obj);
            % HP
            Pstat_HP_add_sub    = Pstat_HP_rca + 3 * obj.bit_width * Pstat_HP_nd2; % [W]
            % LOP
            Pstat_LOP_add_sub   = Pstat_LOP_rca + 3 * obj.bit_width * Pstat_LOP_nd2; % [W]
            % LSTP
            Pstat_LSTP_add_sub  = Pstat_LSTP_rca + 3* obj.bit_width * Pstat_LSTP_nd2; % [W]
        end
		
	end
end

