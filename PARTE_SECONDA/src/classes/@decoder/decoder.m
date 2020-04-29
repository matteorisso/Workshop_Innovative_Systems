classdef decoder < nand2
    % decoder class describes a decoder with generic number of inputs,
    % it is realized with nand2 gates according to a 3 stages implementation
	% (INV+NAND_N+INV) where inverters are also realized with nand2 gates,
	% thus the class inherits properties and methods from
    % father class nand2. The class describes the circuit in terms of
    % delay, power and area. It starts from technological parameters of HP,
    % LOP and LSTP devices, present in IRDS 2010. The user need to specify
    % the pull-down width Wn, followed by the number of inputs.
    
    % User defined
    properties
        N {mustBeInteger}; % #inputs
		nandN; % nandN object
    end
    
    methods
        % Constructor
        function obj = decoder(nMOS_width,n_IN)
            % Constructor of father class nand2
            obj             = obj@nand2(nMOS_width);
            obj.N           = n_IN;			
            obj.nandN       = nandn(nMOS_width, n_IN);
        end
        
        % Delay evaluation
        function [Tdp_HP_decoder, Tdp_LOP_decoder, Tdp_LSTP_decoder] = delay(obj)
            [Tdp_HP_nd2, Tdp_LOP_nd2, Tdp_LSTP_nd2] = delay@nand2(obj);
			[Tdp_HP_ndN, Tdp_LOP_ndN, Tdp_LSTP_ndN] = obj.nandN.delay;
            % HP
            Tdp_HP_decoder     = Tdp_HP_ndN + (2 * Tdp_HP_nd2); % [s]
            % LOP
            Tdp_LOP_decoder    = Tdp_LOP_ndN + (2 * Tdp_LOP_nd2); % [s]
            % LSTP
            Tdp_LSTP_decoder   = Tdp_LSTP_ndN + (2 * Tdp_LSTP_nd2); % [s]
        end
        
        % Area evaluation
        function [A_HP_decoder, A_LOP_decoder, A_LSTP_decoder] = area(obj)
            [A_HP_nd2, A_LOP_nd2, A_LSTP_nd2] = area@nand2(obj);
            [A_HP_ndN, A_LOP_ndN, A_LSTP_ndN] = obj.nandN.area;
            % HP
            A_HP_decoder       = (obj.N * A_HP_nd2) + 2^(obj.N) * A_HP_ndN + 2^(obj.N) * A_HP_nd2; % [um^2]
            % LOP
            A_LOP_decoder      = (obj.N * A_LOP_nd2) + 2^(obj.N) * A_LOP_ndN + 2^(obj.N) * A_LOP_nd2; % [um^2]
            % LSTP
            A_LSTP_decoder     = (obj.N * A_LSTP_nd2) + 2^(obj.N) * A_LSTP_ndN + 2^(obj.N) * A_LSTP_nd2; % [um^2]
        end
        
        % Dynamic power evaluation
        function [Pdyn_HP_decoder, Pdyn_LOP_decoder, Pdyn_LSTP_decoder] = power_dyn(obj)
            [Pdyn_HP_nd2, Pdyn_LOP_nd2, Pdyn_LSTP_nd2] = power_dyn@nand2(obj);
            [Pdyn_HP_ndN, Pdyn_LOP_ndN, Pdyn_LSTP_ndN] = obj.nandN.power_dyn;
            % HP
            Pdyn_HP_decoder    = (obj.N * Pdyn_HP_nd2) + 2^(obj.N) * Pdyn_HP_ndN + 2^(obj.N) * Pdyn_HP_nd2; % [W]
            % LOP
            Pdyn_LOP_decoder   = (obj.N * Pdyn_LOP_nd2) + 2^(obj.N) * Pdyn_LOP_ndN + 2^(obj.N) * Pdyn_LOP_nd2; % [W]
            % LSTP
            Pdyn_LSTP_decoder  = (obj.N * Pdyn_LSTP_nd2) + 2^(obj.N) * Pdyn_LSTP_ndN + 2^(obj.N) * Pdyn_LSTP_nd2; % [W]
        end
        
        % Static power evaluation
        function [Pstat_HP_decoder, Pstat_LOP_decoder, Pstat_LSTP_decoder] = power_stat(obj)
            [Pstat_HP_nd2, Pstat_LOP_nd2, Pstat_LSTP_nd2] = power_stat@nand2(obj);
            [Pstat_HP_ndN, Pstat_LOP_ndN, Pstat_LSTP_ndN] = obj.nandN.power_stat;
            % HP
            Pstat_HP_decoder       = (obj.N * Pstat_HP_nd2) + 2^(obj.N) * Pstat_HP_ndN + 2^(obj.N) * Pstat_HP_nd2; % [W]
            % LOP
            Pstat_LOP_decoder      = (obj.N * Pstat_LOP_nd2) + 2^(obj.N) * Pstat_LOP_ndN + 2^(obj.N) * Pstat_LOP_nd2; % [W]
            % LSTP 
            Pstat_LSTP_decoder     = (obj.N * Pstat_LSTP_nd2) + 2^(obj.N) * Pstat_LSTP_ndN + 2^(obj.N) * Pstat_LSTP_nd2; % [W]
        end
        
    end
end

