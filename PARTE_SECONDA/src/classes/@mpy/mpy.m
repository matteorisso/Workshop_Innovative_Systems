classdef mpy < rca
	% mpy class describes a Baugh-Wooley array multiplier with rca as final
	% adder. Everything is obtained with nand2 gates.
    % The class inherits properties and methods from father class rca which
    % inherits properties and methods from father class full_adder which
    % inherits properties and methods from father class nand2. The class
    % describes the circuit in terms of delay,power and area. It starts
    % from technological parameters of HP, LOP and LSTP devices, present in
    % IRDS 2010. The user need to specify the pull-down width Wn, followed
    % by  the parallelism of data.
	
	methods
		% Constructor
        function obj = mpy(nMOS_width, n_bit)
            % Constructor of father class rca
            obj = obj@rca(nMOS_width, n_bit);
		end
		
        % Delay evaluation
        function [Tdp_HP_mpy, Tdp_LOP_mpy, Tdp_LSTP_mpy] = delay(obj)
			[Tdp_HP_nd2, Tdp_LOP_nd2, Tdp_LSTP_nd2] = delay@nand2(obj);
			[Tdp_HP_fa, Tdp_LOP_fa, Tdp_LSTP_fa] = delay@full_adder(obj);
			[Tdp_HP_rca, Tdp_LOP_rca, Tdp_LSTP_rca] = delay@rca(obj);
            % HP
            Tdp_HP_mpy = (2 * (obj.bit_width - 1) * Tdp_HP_nd2) ...
				+ (obj.bit_width * Tdp_HP_fa) ...
				+ Tdp_HP_rca; % [s]
            % LOP
            Tdp_LOP_mpy = (2 * (obj.bit_width - 1) * Tdp_LOP_nd2) ...
				+ (obj.bit_width * Tdp_LOP_fa) ...
				+ Tdp_LOP_rca; % [s]
            % LSTP
            Tdp_LSTP_mpy = (2 * (obj.bit_width - 1) * Tdp_LSTP_nd2) ...
				+ (obj.bit_width * Tdp_LSTP_fa) ...
				+ Tdp_LSTP_rca; % [s]
        end
        
        % Area evaluation
        function [A_HP_mpy, A_LOP_mpy, A_LSTP_mpy] = area(obj)
            [A_HP_nd2, A_LOP_nd2, A_LSTP_nd2] = area@nand2(obj);
			[A_HP_fa, A_LOP_fa, A_LSTP_fa] = area@full_adder(obj);
			[A_HP_rca, A_LOP_rca, A_LSTP_rca] = area@rca(obj);
            % HP
            A_HP_mpy = (2 * (obj.bit_width^2 - obj.bit_width +1) * A_HP_nd2) ...
				+ (obj.bit_width^2 * A_HP_fa)...
				+ A_HP_rca; % [um^2]
            % LOP
            A_LOP_mpy = (2 * (obj.bit_width^2 - obj.bit_width +1) * A_LOP_nd2) ...
				+ (obj.bit_width^2 * A_LOP_fa)...
				+ A_LOP_rca; % [um^2]
            % LSTP
            A_LSTP_mpy = (2 * (obj.bit_width^2 - obj.bit_width +1) * A_LSTP_nd2) ...
				+ (obj.bit_width^2 * A_LSTP_fa)...
				+ A_LSTP_rca; % [um^2]
        end
        
        % Dynamic power evaluation
        function [Pdyn_HP_mpy, Pdyn_LOP_mpy, Pdyn_LSTP_mpy] = power_dyn(obj)
            [Pdyn_HP_nd2, Pdyn_LOP_nd2, Pdyn_LSTP_nd2] = power_dyn@nand2(obj);
			[Pdyn_HP_fa, Pdyn_LOP_fa, Pdyn_LSTP_fa] = power_dyn@full_adder(obj);
			[Pdyn_HP_rca, Pdyn_LOP_rca, Pdyn_LSTP_rca] = power_dyn@rca(obj);
            % HP
            Pdyn_HP_mpy = (2 * (obj.bit_width^2 - obj.bit_width +1) * Pdyn_HP_nd2) ...
				+ (obj.bit_width^2 * Pdyn_HP_fa)...
				+ Pdyn_HP_rca; % [um^2]
            % LOP
            Pdyn_LOP_mpy = (2 * (obj.bit_width^2 - obj.bit_width +1) * Pdyn_LOP_nd2) ...
				+ (obj.bit_width^2 * Pdyn_LOP_fa)...
				+ Pdyn_LOP_rca; % [um^2]
            % LSTP
            Pdyn_LSTP_mpy = (2 * (obj.bit_width^2 - obj.bit_width +1) * Pdyn_LSTP_nd2) ...
				+ (obj.bit_width^2 * Pdyn_LSTP_fa)...
				+ Pdyn_LSTP_rca; % [um^2]
        end
        
        % Static power evaluation
        function [Pstat_HP_mpy, Pstat_LOP_mpy, Pstat_LSTP_mpy] = power_stat(obj)
            [Pstat_HP_nd2, Pstat_LOP_nd2, Pstat_LSTP_nd2] = power_stat@nand2(obj);
			[Pstat_HP_fa, Pstat_LOP_fa, Pstat_LSTP_fa] = power_stat@full_adder(obj);
			[Pstat_HP_rca, Pstat_LOP_rca, Pstat_LSTP_rca] = power_stat@rca(obj);
            % HP
            Pstat_HP_mpy = (2 * (obj.bit_width^2 - obj.bit_width +1) * Pstat_HP_nd2) ...
				+ (obj.bit_width^2 * Pstat_HP_fa)...
				+ Pstat_HP_rca; % [um^2]
            % LOP
            Pstat_LOP_mpy = (2 * (obj.bit_width^2 - obj.bit_width +1) * Pstat_LOP_nd2) ...
				+ (obj.bit_width^2 * Pstat_LOP_fa)...
				+ Pstat_LOP_rca; % [um^2]
            % LSTP
            Pstat_LSTP_mpy = (2 * (obj.bit_width^2 - obj.bit_width +1) * Pstat_LSTP_nd2) ...
				+ (obj.bit_width^2 * Pstat_LSTP_fa)...
				+ Pstat_LSTP_rca; % [um^2]
        end
		
	end
end

