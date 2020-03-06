classdef flip_flop < nand2
    % flip_flop class describes a ff realized with two d-latch in master
    % slave configuration, everything is obtained with nand2 gates, thus
    % the class inherits properties and methods from father class nand2.
    % The class describes the circuit in terms of delay,power and area. It
    % starts from technological parameters of HP, LOP and LSTP devices,
    % present in IRDS 2010. The user need to specify the pull-down width
    % Wn.
    
    methods
		% Constructor
        function obj = flip_flop(nMOS_width)
            % Constructor of father class nand2
            obj = obj@nand2(nMOS_width);
        end
		
        % Delay evaluation
        function [Tdp_HP_ff, Tdp_LOP_ff, Tdp_LSTP_ff] = delay(obj)
            [Tdp_HP_nd2, Tdp_LOP_nd2, Tdp_LSTP_nd2] = delay@nand2(obj);
            % HP
            Tdp_HP_ff = 8 * Tdp_HP_nd2; % [s]
            % LOP
            Tdp_LOP_ff = 8 * Tdp_LOP_nd2; % [s]
            % LSTP
            Tdp_LSTP_ff = 8 * Tdp_LSTP_nd2; % [s]
        end
        
        % Area evaluation
        function [A_HP_ff, A_LOP_ff, A_LSTP_ff] = area(obj)
            [A_HP_nd2, A_LOP_nd2, A_LSTP_nd2] = area@nand2(obj);
            % HP
            A_HP_ff = 11 * A_HP_nd2; % [um^2]
            % LOP
            A_LOP_ff = 11 * A_LOP_nd2; % [um^2]
            % LSTP
            A_LSTP_ff = 11 * A_LSTP_nd2; % [um^2]
        end
        
        % Dynamic power evaluation
        function [Pdyn_HP_ff, Pdyn_LOP_ff, Pdyn_LSTP_ff] = power_dyn(obj)
            [Pdyn_HP_nd2, Pdyn_LOP_nd2, Pdyn_LSTP_nd2] = power_dyn@nand2(obj);
            % HP
            Pdyn_HP_ff = 11 * Pdyn_HP_nd2; % [W]
            % LOP
            Pdyn_LOP_ff = 11 * Pdyn_LOP_nd2; % [W]
            % LSTP
            Pdyn_LSTP_ff = 11 * Pdyn_LSTP_nd2; % [W]
        end
        
        % Static power evaluation
        function [Pstat_HP_ff, Pstat_LOP_ff, Pstat_LSTP_ff] = power_stat(obj)
            [Pstat_HP_nd2, Pstat_LOP_nd2, Pstat_LSTP_nd2] = power_stat@nand2(obj);
            % HP
            Pstat_HP_ff = 11 * Pstat_HP_nd2; % [W]
            % LOP
            Pstat_LOP_ff = 11 * Pstat_LOP_nd2; % [W]
            % LSTP 
            Pstat_LSTP_ff = 11 * Pstat_LSTP_nd2; % [W]
        end
        
    end
end

