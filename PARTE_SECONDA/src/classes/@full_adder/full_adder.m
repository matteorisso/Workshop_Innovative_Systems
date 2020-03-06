classdef full_adder < nand2
	% full_adder class describes a fa realized with nand2 gates, thus
    % the class inherits properties and methods from father class nand2.
    % The class describes the circuit in terms of delay,power and area. It
    % starts from technological parameters of HP, LOP and LSTP devices,
    % present in IRDS 2010. The user need to specify the pull-down width
    % Wn.
	
	methods
		% Constructor
        function obj = full_adder(nMOS_width)
            % Constructor of father class nand2
            obj = obj@nand2(nMOS_width);
		end
		
		
        % Delay evaluation
        function [Tdp_HP_fa, Tdp_LOP_fa, Tdp_LSTP_fa] = delay(obj)
            [Tdp_HP_nd2, Tdp_LOP_nd2, Tdp_LSTP_nd2] = delay@nand2(obj);
            % HP
            Tdp_HP_fa = 6 * Tdp_HP_nd2; % [s]
            % LOP
            Tdp_LOP_fa = 6 * Tdp_LOP_nd2; % [s]
            % LSTP
            Tdp_LSTP_fa = 6 * Tdp_LSTP_nd2; % [s]
        end
        
        % Area evaluation
        function [A_HP_fa, A_LOP_fa, A_LSTP_fa] = area(obj)
            [A_HP_nd2, A_LOP_nd2, A_LSTP_nd2] = area@nand2(obj);
            % HP
            A_HP_fa = 9 * A_HP_nd2; % [um^2]
            % LOP
            A_LOP_fa = 9 * A_LOP_nd2; % [um^2]
            % LSTP
            A_LSTP_fa = 9 * A_LSTP_nd2; % [um^2]
        end
        
        % Dynamic power evaluation
        function [Pdyn_HP_fa, Pdyn_LOP_fa, Pdyn_LSTP_fa] = power_dyn(obj)
            [Pdyn_HP_nd2, Pdyn_LOP_nd2, Pdyn_LSTP_nd2] = power_dyn@nand2(obj);
            % HP
            Pdyn_HP_fa = 9 * Pdyn_HP_nd2; % [W]
            % LOP
            Pdyn_LOP_fa = 9 * Pdyn_LOP_nd2; % [W]
            % LSTP
            Pdyn_LSTP_fa = 9 * Pdyn_LSTP_nd2; % [W]
        end
        
        % Static power evaluation
        function [Pstat_HP_fa, Pstat_LOP_fa, Pstat_LSTP_fa] = power_stat(obj)
            [Pstat_HP_nd2, Pstat_LOP_nd2, Pstat_LSTP_nd2] = power_stat@nand2(obj);
            % HP
            Pstat_HP_fa = 9 * Pstat_HP_nd2; % [W]
            % LOP
            Pstat_LOP_fa = 9 * Pstat_LOP_nd2; % [W]
            % LSTP 
            Pstat_LSTP_fa = 9 * Pstat_LSTP_nd2; % [W]
        end
		
	end
end

