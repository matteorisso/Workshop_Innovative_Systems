classdef orn < or2
    % orn class describes an OR gate with generic fan-in, realized as
    % balanced binary tree of or2 gates, thus the class inherits properties
    % and methods from father class or2, which inherits properties and
    % methods from father class nanor2. The class describes the circuit in
    % terms of delay,power and area. It starts from technological
    % parameters of HP, LOP and LSTP devices, present in IRDS 2010. The
    % user need to specify the pull-down width Wn followed by the fan-in.
    
    % User defined
    properties
        N {mustBeInteger}; % fan-in
    end
    
    methods
        % Constructor
        function obj = orn(nMOS_width,fan_in)
            % Constructor of father class or2
            obj     = obj@or2(nMOS_width);
            obj.N   = fan_in;
        end
        
        % Delay evaluation
        function [Tdp_HP_orn, Tdp_LOP_orn, Tdp_LSTP_orn] = delay(obj)
            [Tdp_HP_or2, Tdp_LOP_or2, Tdp_LSTP_or2] = delay@or2(obj);
            % HP
            Tdp_HP_orn      = ceil(log2(obj.N)) * Tdp_HP_or2; % [s]
            % LOP
            Tdp_LOP_orn     = ceil(log2(obj.N)) * Tdp_LOP_or2; % [s]
            % LSTP
            Tdp_LSTP_orn    = ceil(log2(obj.N)) * Tdp_LSTP_or2; % [s]
        end
        
        % Area evaluation
        function [A_HP_orn, A_LOP_orn, A_LSTP_orn] = area(obj)
            [A_HP_or2, A_LOP_or2, A_LSTP_or2] = area@or2(obj);
            % HP
            A_HP_orn    = (obj.N - 1) * A_HP_or2; % [um^2]
            % LOP
            A_LOP_orn   = (obj.N - 1) * A_LOP_or2; % [um^2]
            % LSTP
            A_LSTP_orn  = (obj.N - 1) * A_LSTP_or2; % [um^2]
        end
        
        % Dynamic power evaluation
        function [Pdyn_HP_orn, Pdyn_LOP_orn, Pdyn_LSTP_orn] = power_dyn(obj)
            [Pdyn_HP_or2, Pdyn_LOP_or2, Pdyn_LSTP_or2] = power_dyn@or2(obj);
            % HP
            Pdyn_HP_orn     = (obj.N - 1) * Pdyn_HP_or2; % [W]
            % LOP
            Pdyn_LOP_orn    = (obj.N - 1) * Pdyn_LOP_or2; % [W]
            % LSTP
            Pdyn_LSTP_orn   = (obj.N - 1) * Pdyn_LSTP_or2; % [W]
        end
        
        % Static power evaluation
        function [Pstat_HP_orn, Pstat_LOP_orn, Pstat_LSTP_orn] = power_stat(obj)
            [Pstat_HP_or2, Pstat_LOP_or2, Pstat_LSTP_or2] = power_stat@or2(obj);
            % HP
            Pstat_HP_orn    = (obj.N - 1) * Pstat_HP_or2; % [W]
            % LOP
            Pstat_LOP_orn   = (obj.N - 1) * Pstat_LOP_or2; % [W]
            % LSTP
            Pstat_LSTP_orn  = (obj.N - 1) * Pstat_LSTP_or2; % [W]
        end
        
    end
end

