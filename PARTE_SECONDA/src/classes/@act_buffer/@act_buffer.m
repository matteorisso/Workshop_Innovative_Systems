classdef  act_buffer < nand2
    % act_buffer class describes a sequential circuit
    % modeled with an act_if and an act_rf block plus a single register.
	% Everything is obtained with nand2 gates,
    % thus the class inherits properties and methods nand2. The class
    % describes the circuit in terms of delay,power and area. It starts
    % from technological parameters of HP, LOP and LSTP devices, present in
    % IRDS 2010. The user need to specify the pull-down width Wn,
    % followed by activation bits and kernel size.
    % The class models the corresponding act_buffer.vhd component.
    
    properties
        N {mustBeInteger}; % activation bits
        K {mustBeInteger}; % kernel size
        act_rf; % act_rf object
        act_if; % act_if object
        reg; % register object
    end
    
    methods
        % Constructor
        function obj = act_buffer(nMOS_width, N, K)
            % Constructor of father class nand2
            obj             = obj@nand2(nMOS_width);
            obj.act_rf     =  act_rf(nMOS_width, N, K);
            obj.act_if      =  act_if(nMOS_width, N, K);
            obj.reg         = register(nMOS_width, 32);
        end
        
        % Delay evaluation
        function [Tdp_HP_act_buffer, Tdp_LOP_act_buffer, Tdp_LSTP_act_buffer] = delay(obj)
            [Tdp_HP_act_if,       Tdp_LOP_act_if,       Tdp_LSTP_act_if]      = obj.act_if.delay;
            [Tdp_HP_act_rf,       Tdp_LOP_act_rf,       Tdp_LSTP_act_rf]      = obj.act_rf.delay;
            % HP
            Tdp_HP_act_buffer     = max(Tdp_HP_act_if, ...
                Tdp_HP_act_rf); % [s]
            % LOP
            Tdp_LOP_act_buffer     = max(Tdp_LOP_act_if, ...
                Tdp_LOP_act_rf); % [s]
            % LSTP
            Tdp_LSTP_act_buffer     = max(Tdp_LSTP_act_if, ...
                Tdp_LSTP_act_rf); % [s]
		end
		
		% Area evaluation
        function [A_HP_act_buffer, A_LOP_act_buffer, A_LSTP_act_buffer] = area(obj)
			[A_HP_act_if,       A_LOP_act_if,       A_LSTP_act_if]      = obj.act_if.area;
            [A_HP_act_rf,       A_LOP_act_rf,       A_LSTP_act_rf]      = obj.act_rf.area;
            [A_HP_reg,        A_LOP_reg,        A_LSTP_reg]       = obj.reg.area;
            % HP
            A_HP_act_buffer    = A_HP_act_if + A_HP_act_rf + A_HP_reg; % [um^2]
            % LOP
            A_LOP_act_buffer    = A_LOP_act_if + A_LOP_act_rf + A_LOP_reg; % [um^2]
            % LSTP
            A_LSTP_act_buffer    = A_LSTP_act_if + A_LSTP_act_rf + A_LSTP_reg; % [um^2]
		end
        
		
        % Dynamic power evaluation
        function [Pdyn_HP_act_buffer, Pdyn_LOP_act_buffer, Pdyn_LSTP_act_buffer] = power_dyn(obj)
			[Pdyn_HP_act_if,       Pdyn_LOP_act_if,       Pdyn_LSTP_act_if]      = obj.act_if.power_dyn;
            [Pdyn_HP_act_rf,       Pdyn_LOP_act_rf,       Pdyn_LSTP_act_rf]      = obj.act_rf.power_dyn;
            [Pdyn_HP_reg,        Pdyn_LOP_reg,        Pdyn_LSTP_reg]       = obj.reg.power_dyn;
            % HP
            Pdyn_HP_act_buffer    = Pdyn_HP_act_if + Pdyn_HP_act_rf + Pdyn_HP_reg; % [W]
            % LOP
            Pdyn_LOP_act_buffer    = Pdyn_LOP_act_if + Pdyn_LOP_act_rf + Pdyn_LOP_reg; % [W]
            % LSTP
            Pdyn_LSTP_act_buffer    = Pdyn_LSTP_act_if + Pdyn_LSTP_act_rf + Pdyn_LSTP_reg; % [W]
		end
        
        % Static power evaluation
        function [Pstat_HP_act_buffer, Pstat_LOP_act_buffer, Pstat_LSTP_act_buffer] = power_stat(obj)
			[Pstat_HP_act_if,       Pstat_LOP_act_if,       Pstat_LSTP_act_if]      = obj.act_if.power_stat;
            [Pstat_HP_act_rf,       Pstat_LOP_act_rf,       Pstat_LSTP_act_rf]      = obj.act_rf.power_stat;
            [Pstat_HP_reg,        Pstat_LOP_reg,        Pstat_LSTP_reg]       = obj.reg.power_stat;
            % HP
            Pstat_HP_act_buffer    = Pstat_HP_act_if + Pstat_HP_act_rf + Pstat_HP_reg; % [W]
            % LOP
            Pstat_LOP_act_buffer    = Pstat_LOP_act_if + Pstat_LOP_act_rf + Pstat_LOP_reg; % [W]
            % LSTP
            Pstat_LSTP_act_buffer    =  Pstat_LSTP_act_if + Pstat_LSTP_act_rf + Pstat_LSTP_reg; % [W]
		end
    end
end

