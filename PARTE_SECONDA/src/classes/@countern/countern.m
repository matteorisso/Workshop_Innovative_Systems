classdef countern < flip_flop
	% countern class describes a synchronous counter with enable signal,
	% asynchronous reset, synchronous clear and programmable terminal
	% count. All is realized with several d-ff in toggle ff configuration,
	% where everything is obtained with nand2 gates,
    % thus the class inherits properties and methods from father class
    % flip_flop which inherits properties and methods from father class
    % nand2. The class describes the circuit in terms of delay,power and
    % area. It starts from technological parameters of HP, LOP and LSTP
    % devices, present in IRDS 2010. The user need to specify the pull-down
    % width Wn, followed by  the parallelism of data.
    % The class models the corresponding countern.vhd component.
	
	properties
		bit_width {mustBeInteger}; % parallelism
        count; % cnt object
        mux; % mux object
        or_gate; % or object
        norn_gate; % nor object
        subtractor; % add_sub object
	end
	
	methods
		% Constructor
        function obj = countern(nMOS_width, n_bit)
            % Constructor of father class flip_flop
            obj             = obj@flip_flop(nMOS_width);
            obj.bit_width   = n_bit;
            obj.count       = cnt(nMOS_width, n_bit);
            obj.mux         = muxnto1_nbit(nMOS_width, 2, 1);
            obj.or_gate     = or2(nMOS_width);
            obj.norn_gate   = norn(nMOS_width, n_bit);
            obj.subtractor  = add_sub(nMOS_width, n_bit);
        end
    
		% Delay evaluation
        function [Tdp_HP_countern, Tdp_LOP_countern, Tdp_LSTP_countern] = delay(obj)
			[Tdp_HP_cnt, Tdp_LOP_cnt, Tdp_LSTP_cnt] = obj.count.delay;
            [Tdp_HP_mux, Tdp_LOP_mux, Tdp_LSTP_mux] = obj.mux.delay;
            [Tdp_HP_sub, Tdp_LOP_sub, Tdp_LSTP_sub] = obj.subtractor.delay;
            [Tdp_HP_nor, Tdp_LOP_nor, Tdp_LSTP_nor] = obj.norn_gate.delay;
            [Tdp_HP_or,  Tdp_LOP_or,  Tdp_LSTP_or]  = obj.or_gate.delay;
            %[Tdp_HP_ff, Tdp_LOP_ff, Tdp_LSTP_ff] = delay@flip_flop(obj);
            % HP
            Tdp_HP_countern     = max( ...
                Tdp_HP_cnt + Tdp_HP_mux, ...
                Tdp_HP_sub + Tdp_HP_nor + Tdp_HP_or); % [s]
            % LOP
            Tdp_LOP_countern    = max( ...
                Tdp_LOP_cnt + Tdp_LOP_mux, ...
                Tdp_LOP_sub + Tdp_LOP_nor + Tdp_LOP_or); % [s]
            % LSTP
            Tdp_LSTP_countern   = max( ...
                Tdp_LSTP_cnt + Tdp_LSTP_mux, ...
                Tdp_LSTP_sub + Tdp_LSTP_nor + Tdp_LSTP_or); % [s]
		end
		
		% Area evaluation
        function [A_HP_countern, A_LOP_countern, A_LSTP_countern] = area(obj)
			[A_HP_cnt, A_LOP_cnt, A_LSTP_cnt] = obj.count.area;
            [A_HP_mux, A_LOP_mux, A_LSTP_mux] = obj.mux.area;
            [A_HP_sub, A_LOP_sub, A_LSTP_sub] = obj.subtractor.area;
            [A_HP_nor, A_LOP_nor, A_LSTP_nor] = obj.norn_gate.area;
            [A_HP_or,  A_LOP_or,  A_LSTP_or]  = obj.or_gate.area;
            % HP
            A_HP_countern   = A_HP_cnt + (obj.bit_width * A_HP_mux) ...
                + A_HP_sub + A_HP_nor + A_HP_or; % [um^2]
            % LOP
            A_LOP_countern   = A_LOP_cnt + (obj.bit_width * A_LOP_mux) ...
                + A_LOP_sub + A_LOP_nor + A_LOP_or; % [um^2]
            % LSTP
            A_LSTP_countern   = A_LSTP_cnt + (obj.bit_width * A_LSTP_mux) ...
                + A_LSTP_sub + A_LSTP_nor + A_LSTP_or; % [um^2]
		end
        
		
        % Dynamic power evaluation
        function [Pdyn_HP_countern, Pdyn_LOP_countern, Pdyn_LSTP_countern] = power_dyn(obj)
			[Pdyn_HP_cnt, Pdyn_LOP_cnt, Pdyn_LSTP_cnt] = obj.count.power_dyn;
            [Pdyn_HP_mux, Pdyn_LOP_mux, Pdyn_LSTP_mux] = obj.mux.power_dyn;
            [Pdyn_HP_sub, Pdyn_LOP_sub, Pdyn_LSTP_sub] = obj.subtractor.power_dyn;
            [Pdyn_HP_nor, Pdyn_LOP_nor, Pdyn_LSTP_nor] = obj.norn_gate.power_dyn;
            [Pdyn_HP_or,  Pdyn_LOP_or,  Pdyn_LSTP_or]  = obj.or_gate.power_dyn;
            % HP
            Pdyn_HP_countern   = Pdyn_HP_cnt + (obj.bit_width * Pdyn_HP_mux) ...
                + Pdyn_HP_sub + Pdyn_HP_nor + Pdyn_HP_or; % [um^2]
            % LOP
            Pdyn_LOP_countern   = Pdyn_LOP_cnt + (obj.bit_width * Pdyn_LOP_mux) ...
                + Pdyn_LOP_sub + Pdyn_LOP_nor + Pdyn_LOP_or; % [um^2]
            % LSTP
            Pdyn_LSTP_countern   = Pdyn_LSTP_cnt + (obj.bit_width * Pdyn_LSTP_mux) ...
                + Pdyn_LSTP_sub + Pdyn_LSTP_nor + Pdyn_LSTP_or; % [um^2]
		end
        
        % Dynamic power evaluation
        function [Pstat_HP_countern, Pstat_LOP_countern, Pstat_LSTP_countern] = power_stat(obj)
			[Pstat_HP_cnt, Pstat_LOP_cnt, Pstat_LSTP_cnt] = obj.count.power_stat;
            [Pstat_HP_mux, Pstat_LOP_mux, Pstat_LSTP_mux] = obj.mux.power_stat;
            [Pstat_HP_sub, Pstat_LOP_sub, Pstat_LSTP_sub] = obj.subtractor.power_stat;
            [Pstat_HP_nor, Pstat_LOP_nor, Pstat_LSTP_nor] = obj.norn_gate.power_stat;
            [Pstat_HP_or,  Pstat_LOP_or,  Pstat_LSTP_or]  = obj.or_gate.power_stat;
            % HP
            Pstat_HP_countern   = Pstat_HP_cnt + (obj.bit_width * Pstat_HP_mux) ...
                + Pstat_HP_sub + Pstat_HP_nor + Pstat_HP_or; % [um^2]
            % LOP
            Pstat_LOP_countern   = Pstat_LOP_cnt + (obj.bit_width * Pstat_LOP_mux) ...
                + Pstat_LOP_sub + Pstat_LOP_nor + Pstat_LOP_or; % [um^2]
            % LSTP
            Pstat_LSTP_countern   = Pstat_LSTP_cnt + (obj.bit_width * Pstat_LSTP_mux) ...
                + Pstat_LSTP_sub + Pstat_LSTP_nor + Pstat_LSTP_or; % [um^2]
		end
		
 	end
end

