classdef round_class < nand2
    % round_class class describes combinational circuit capable of
    % performing rounding to nearest even. The component is modeled with an
    % adder and three multiplexer plus a multi-input or gate,
	% where everything is obtained with nand2 gates,
    % thus the class inherits properties and methods nand2. The class
    % describes the circuit in terms of delay,power and area. It starts
    % from technological parameters of HP, LOP and LSTP devices, present in
    % IRDS 2010. The user need to specify the pull-down width Wn, followed
    % by  the parallelism of input data and output data. The class models
    % the corresponding round.vhd component.
    
    properties
        i_N {mustBeInteger}; % input parallelism
        o_N {mustBeInteger}; % output parallelism
        add; % adder object
        mux; % mux object
        orn_gate; % or object
    end
    
    methods
        % Constructor
        function obj = round_class(nMOS_width, n_bit_in, n_bit_out)
            % Constructor of father class flip_flop
            obj             = obj@nand2(nMOS_width);
            obj.i_N         = n_bit_in;
            obj.o_N         = n_bit_out;
            obj.add         = rca(nMOS_width, n_bit_out);
            obj.mux         = muxnto1_nbit(nMOS_width, 2, n_bit_out);
            obj.orn_gate    = orn(nMOS_width, n_bit_in);
        end
        
        % Delay evaluation
        function [Tdp_HP_round, Tdp_LOP_round, Tdp_LSTP_round] = delay(obj)
            [Tdp_HP_mux, Tdp_LOP_mux, Tdp_LSTP_mux] = obj.mux.delay;
            [Tdp_HP_add, Tdp_LOP_add, Tdp_LSTP_add] = obj.add.delay;
            [Tdp_HP_or,  Tdp_LOP_or,  Tdp_LSTP_or]  = obj.orn_gate.delay;
            % HP
            Tdp_HP_round     = max( ...
                Tdp_HP_or  + 2 * Tdp_HP_mux, ...
                Tdp_HP_add + 3 * Tdp_HP_mux ); % [s]
            % LOP
            Tdp_LOP_round     = max( ...
                Tdp_LOP_or  + 2 * Tdp_LOP_mux, ...
                Tdp_LOP_add + 3 * Tdp_LOP_mux ); % [s]
            % LSTP
            Tdp_LSTP_round     = max( ...
                Tdp_LSTP_or  + 2 * Tdp_LSTP_mux, ...
                Tdp_LSTP_add + 3 * Tdp_LSTP_mux ); % [s]
		end
		
		% Area evaluation
        function [A_HP_round, A_LOP_round, A_LSTP_round] = area(obj)
			[A_HP_mux, A_LOP_mux, A_LSTP_mux] = obj.mux.area;
            [A_HP_add, A_LOP_add, A_LSTP_add] = obj.add.area;
            [A_HP_or,  A_LOP_or,  A_LSTP_or]  = obj.orn_gate.area;
            % HP
            A_HP_round      = (3 * A_HP_mux) ...
                + A_HP_add + A_HP_or; % [um^2]
            % LOP
            A_LOP_round      = (3 * A_LOP_mux) ...
                + A_LOP_add + A_LOP_or; % [um^2]
            % LSTP
            A_LSTP_round      = (3 * A_LSTP_mux) ...
                + A_LSTP_add + A_LSTP_or; % [um^2]
		end
        
		
        % Dynamic power evaluation
        function [Pdyn_HP_round, Pdyn_LOP_round, Pdyn_LSTP_round] = power_dyn(obj)
			[Pdyn_HP_mux, Pdyn_LOP_mux, Pdyn_LSTP_mux] = obj.mux.power_dyn;
            [Pdyn_HP_add, Pdyn_LOP_add, Pdyn_LSTP_add] = obj.add.power_dyn;
            [Pdyn_HP_or,  Pdyn_LOP_or,  Pdyn_LSTP_or]  = obj.orn_gate.power_dyn;
            % HP
            Pdyn_HP_round      = (3 * Pdyn_HP_mux) ...
                + Pdyn_HP_add + Pdyn_HP_or; % [um^2]
            % LOP
            Pdyn_LOP_round      = (3 * Pdyn_LOP_mux) ...
                + Pdyn_LOP_add + Pdyn_LOP_or; % [um^2]
            % LSTP
            Pdyn_LSTP_round      = (3 * Pdyn_LSTP_mux) ...
                + Pdyn_LSTP_add + Pdyn_LSTP_or; % [um^2]
		end
        
        % Static power evaluation
        function [Pstat_HP_round, Pstat_LOP_round, Pstat_LSTP_round] = power_stat(obj)
			[Pstat_HP_mux, Pstat_LOP_mux, Pstat_LSTP_mux] = obj.mux.power_stat;
            [Pstat_HP_add, Pstat_LOP_add, Pstat_LSTP_add] = obj.add.power_stat;
            [Pstat_HP_or,  Pstat_LOP_or,  Pstat_LSTP_or]  = obj.orn_gate.power_stat;
            % HP
            Pstat_HP_round      = (3 * Pstat_HP_mux) ...
                + Pstat_HP_add + Pstat_HP_or; % [um^2]
            % LOP
            Pstat_LOP_round      = (3 * Pstat_LOP_mux) ...
                + Pstat_LOP_add + Pstat_LOP_or; % [um^2]
            % LSTP
            Pstat_LSTP_round      = (3 * Pstat_LSTP_mux) ...
                + Pstat_LSTP_add + Pstat_LSTP_or; % [um^2]
		end
    end
end

