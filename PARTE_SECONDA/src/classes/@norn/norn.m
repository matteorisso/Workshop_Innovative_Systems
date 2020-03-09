classdef norn < nor2
    % norn class describes a NOR gate with generic fan-in, realized as
    % balanced binary tree of nor2 gates, thus the class inherits
    % properties and methods from father class nor2, which inherits
    % properties and methods from father class nanor2. The class describes
    % the circuit in terms of delay,power and area. It starts from
    % technological parameters of HP, LOP and LSTP devices, present in IRDS
    % 2010. The user need to specify the pull-down width Wn followed by the
    % fan-in.
    
    % User defined
    properties
        N {mustBeInteger}; % fan-in
    end
    
    methods
        % Constructor
        function obj = norn(nMOS_width,fan_in)
            % Constructor of father class nor2
            obj = obj@nor2(nMOS_width);
            obj.N = fan_in;
        end
        
        % Delay evaluation
        function [Tdp_HP_norn, Tdp_LOP_norn, Tdp_LSTP_norn] = delay(obj)
            [Tdp_HP_nor2, Tdp_LOP_nor2, Tdp_LSTP_nor2] = delay@nor2(obj);
            % HP
            Tdp_HP_norn = ceil(log2(obj.N)) * Tdp_HP_nor2; % [s]
            % LOP
            Tdp_LOP_norn = ceil(log2(obj.N)) * Tdp_LOP_nor2; % [s]
            % LSTP
            Tdp_LSTP_norn = ceil(log2(obj.N)) * Tdp_LSTP_nor2; % [s]
        end
        
        % Area evaluation
        function [A_HP_norn, A_LOP_norn, A_LSTP_norn] = area(obj)
            [A_HP_nor2, A_LOP_nor2, A_LSTP_nor2] = area@nor2(obj);
            % HP
            A_HP_norn = (obj.N - 1) * A_HP_nor2; % [um^2]
            % LOP
            A_LOP_norn = (obj.N - 1) * A_LOP_nor2; % [um^2]
            % LSTP
            A_LSTP_norn = (obj.N - 1) * A_LSTP_nor2; % [um^2]
        end
        
        % Dynamic power evaluation
        function [Pdyn_HP_norn, Pdyn_LOP_norn, Pdyn_LSTP_norn] = power_dyn(obj)
            [Pdyn_HP_nor2, Pdyn_LOP_nor2, Pdyn_LSTP_nor2] = power_dyn@nor2(obj);
            % HP
            Pdyn_HP_norn = (obj.N - 1) * Pdyn_HP_nor2; % [W]
            % LOP
            Pdyn_LOP_norn = (obj.N - 1) * Pdyn_LOP_nor2; % [W]
            % LSTP
            Pdyn_LSTP_norn = (obj.N - 1) * Pdyn_LSTP_nor2; % [W]
        end
        
        % Static power evaluation
        function [Pstat_HP_norn, Pstat_LOP_norn, Pstat_LSTP_norn] = power_stat(obj)
            [Pstat_HP_nor2, Pstat_LOP_nor2, Pstat_LSTP_nor2] = power_stat@nor2(obj);
            % HP
            Pstat_HP_norn = (obj.N - 1) * Pstat_HP_nor2; % [W]
            % LOP
            Pstat_LOP_norn = (obj.N - 1) * Pstat_LOP_nor2; % [W]
            % LSTP
            Pstat_LSTP_norn = (obj.N - 1) * Pstat_LSTP_nor2; % [W]
        end
    end
end

