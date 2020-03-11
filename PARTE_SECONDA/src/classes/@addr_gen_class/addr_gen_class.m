classdef addr_gen_class < nand2
    % addr_gen_class describes a sequential circuit capable of 
    % providing the correct address. The component is modeled with four adders,
    % five multiplexers, two FFs plus an or gate,
	% everything is obtained with nand2 gates,
    % thus the class inherits properties and methods nand2. The class
    % describes the circuit in terms of delay,power and area. It starts
    % from technological parameters of HP, LOP and LSTP devices, present in
    % IRDS 2010. The user need to specify the pull-down width Wn, followed
    % by  the parallelism of input data and output data. The class models
    % the corresponding addr_gen.vhd component.
    
    properties
        i_o_N {mustBeInteger}; % input and output parallelism
        add; % adder object
        mux; % mux object
		ff; %flip_flop object
        or2_gate; % or object
    end
    
    methods
        % Constructor
        function obj = addr_gen_class(nMOS_width, n_bit_in_out)
            % Constructor of father class
            obj             = obj@nand2(nMOS_width);
            obj.i_o_N       = n_bit_in_out;
            obj.add         = rca(nMOS_width, n_bit_in_out);
            obj.mux         = muxnto1_nbit(nMOS_width, 2, n_bit_in_out);
            obj.ff          = flip_flop(nMOS_width, n_bit_in_out);			
            obj.or2_gate    = or2(nMOS_width, n_bit_in_out);
        end
        
        % Delay evaluation
        function [Tdp_HP_addr_gen, Tdp_LOP_addr_gen, Tdp_LSTP_addr_gen] = delay(obj)
            [Tdp_HP_mux, Tdp_LOP_mux, Tdp_LSTP_mux] = obj.mux.delay;
            [Tdp_HP_add, Tdp_LOP_add, Tdp_LSTP_add] = obj.add.delay;
            [Tdp_HP_ff,  Tdp_LOP_ff,  Tdp_LSTP_ff]  = obj.ff.delay;			
            [Tdp_HP_or,  Tdp_LOP_or,  Tdp_LSTP_or]  = obj.or2_gate.delay;
            % HP
            Tdp_HP_addr_gen     =  Tdp_HP_add + 3 * Tdp_HP_mux; % [s]
            % LOP
            Tdp_LOP_addr_gen    =  Tdp_LOP_add + 3 * Tdp_LOP_mux; % [s]
            % LSTP
            Tdp_LSTP_addr_gen   =  Tdp_LSTP_add + 3 * Tdp_LSTP_mux; % [s]
		end
		
		% Area evaluation
        function [A_HP_addr_gen, A_LOP_addr_gen, A_LSTP_addr_gen] = area(obj)
			[A_HP_mux, A_LOP_mux, A_LSTP_mux] = obj.mux.area;
            [A_HP_add, A_LOP_add, A_LSTP_add] = obj.add.area;
            [A_HP_ff,  A_LOP_ff,  A_LSTP_ff]  = obj.ff.area;
            [A_HP_or,  A_LOP_or,  A_LSTP_or]  = obj.or2_gate.area;
            % HP
            A_HP_addr_gen      = (5 * A_HP_mux) ...
                + (4 * A_HP_add) + A_HP_or + (2 * A_HP_ff); % [um^2]
            % LOP
            A_LOP_addr_gen      = (5 * A_LOP_mux) ...
                + (4 * A_LOP_add) + A_LOP_or + (2 * A_LOP_ff); % [um^2]
            % LSTP
            A_LSTP_addr_gen      = (5 * A_LSTP_mux) ...
                + (4 * A_LSTP_add) + A_LSTP_or + (2 * A_LSTP_ff); % [um^2]
		end
        
		
        % Dynamic power evaluation
        function [Pdyn_HP_addr_gen, Pdyn_LOP_addr_gen, Pdyn_LSTP_addr_gen] = power_dyn(obj)
			[Pdyn_HP_mux, Pdyn_LOP_mux, Pdyn_LSTP_mux] = obj.mux.power_dyn;
            [Pdyn_HP_add, Pdyn_LOP_add, Pdyn_LSTP_add] = obj.add.power_dyn;
            [Pdyn_HP_ff,  Pdyn_LOP_ff,  Pdyn_LSTP_ff]  = obj.ff.power_dyn;
            [Pdyn_HP_or,  Pdyn_LOP_or,  Pdyn_LSTP_or]  = obj.or2_gate.power_dyn;
            % HP
            Pdyn_HP_addr_gen      = (5 * Pdyn_HP_mux) ...
                + (4 * Pdyn_HP_add) + Pdyn_HP_or + (2 * Pdyn_HP_ff); % [um^2]
            % LOP
            Pdyn_LOP_addr_gen      = (5 * Pdyn_LOP_mux) ...
                + (4 * Pdyn_LOP_add) + Pdyn_LOP_or + (2 * Pdyn_LOP_ff); % [um^2]
            % LSTP
            Pdyn_LSTP_addr_gen      = (5 * Pdyn_LSTP_mux) ...
                + (4 * Pdyn_LSTP_add) + Pdyn_LSTP_or + (2 * Pdyn_LSTP_ff); % [um^2]
		end
        
        % Static power evaluation
        function [Pstat_HP_addr_gen, Pstat_LOP_addr_gen, Pstat_LSTP_addr_gen] = power_stat(obj)
			[Pstat_HP_mux, Pstat_LOP_mux, Pstat_LSTP_mux] = obj.mux.power_stat;
            [Pstat_HP_add, Pstat_LOP_add, Pstat_LSTP_add] = obj.add.power_stat;
            [Pstat_HP_ff,  Pstat_LOP_ff,  Pstat_LSTP_ff]  = obj.ff.power_stat;
            [Pstat_HP_or,  Pstat_LOP_or,  Pstat_LSTP_or]  = obj.or2_gate.power_stat;
            % HP
            Pstat_HP_addr_gen      = (5 * Pstat_HP_mux) ...
                + (4 * Pstat_HP_add) + Pstat_HP_or + (2 * Pstat_HP_ff); % [um^2]
            % LOP
            Pstat_LOP_addr_gen     = (5 * Pstat_LOP_mux) ...
                + (4 * Pstat_LOP_add) + Pstat_LOP_or + (2 * Pstat_LOP_ff); % [um^2]
            % LSTP
            Pstat_LSTP_addr_gen    = (5 * Pstat_LSTP_mux) ...
                + (4 * Pstat_LSTP_add) + Pstat_LSTP_or + (2 * Pstat_LSTP_ff); % [um^2]
		end
    end
end

