classdef nor2 < nand2
    % nor2 class describes an elementary NOR gate, realized with nand2
    % gates, thus the class inherits properties and methods from father
    % class nand2. The class describes the circuit in terms of delay,power
    % and area. It starts from technological parameters of HP, LOP and LSTP
    % devices, present in IRDS 2010. The user need to specify the pull-down
    % width Wn followed by the fan-in.
    
    methods
       % Constructor
        function obj = nor2(nMOS_width)
            % Constructor of father class nand2
            obj = obj@nand2(nMOS_width);
        end
        
        
        % Delay evaluation
        function [Tdp_HP_nor2, Tdp_LOP_nor2, Tdp_LSTP_nor2] = delay(obj)
            [Tdp_HP_nd2, Tdp_LOP_nd2, Tdp_LSTP_nd2] = delay@nand2(obj);
            % HP
            Tdp_HP_nor2     = 3 * Tdp_HP_nd2; % [s]
            % LOP
            Tdp_LOP_nor2    = 3 * Tdp_LOP_nd2; % [s]
            % LSTP
            Tdp_LSTP_nor2   = 3 * Tdp_LSTP_nd2; % [s]
        end
        
        % Area evaluation
        function [A_HP_nor2, A_LOP_nor2, A_LSTP_nor2] = area(obj)
            [A_HP_nd2, A_LOP_nd2, A_LSTP_nd2] = area@nand2(obj);
            % HP
            A_HP_nor2       = 4 * A_HP_nd2; % [um^2]
            % LOP
            A_LOP_nor2      = 4 * A_LOP_nd2; % [um^2]
            % LSTP
            A_LSTP_nor2     = 4 * A_LSTP_nd2; % [um^2]
        end
        
        % Dynamic power evaluation
        function [Pdyn_HP_nor2, Pdyn_LOP_nor2, Pdyn_LSTP_nor2] = power_dyn(obj)
            [Pdyn_HP_nd2, Pdyn_LOP_nd2, Pdyn_LSTP_nd2] = power_dyn@nand2(obj);
            % HP
            Pdyn_HP_nor2    = 4 * Pdyn_HP_nd2; % [W]
            % LOP
            Pdyn_LOP_nor2   = 4 * Pdyn_LOP_nd2; % [W]
            % LSTP
            Pdyn_LSTP_nor2  = 4 * Pdyn_LSTP_nd2; % [W]
        end
        
        % Static power evaluation
        function [Pstat_HP_nor2, Pstat_LOP_nor2, Pstat_LSTP_nor2] = power_stat(obj)
            [Pstat_HP_nd2, Pstat_LOP_nd2, Pstat_LSTP_nd2] = power_stat@nand2(obj);
            % HP
            Pstat_HP_nor2       = 4 * Pstat_HP_nd2; % [W]
            % LOP
            Pstat_LOP_nor2      = 4 * Pstat_LOP_nd2; % [W]
            % LSTP
            Pstat_LSTP_nor2     = 4 * Pstat_LSTP_nd2; % [W]
        end
    end
end

