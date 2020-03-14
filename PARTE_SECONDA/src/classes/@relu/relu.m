classdef relu < nand2
    % relu class describes combinational circuit capable of performing
    % quantization. The component is modeled with a number of multiplexer
    % euqal to the output number of bit plus a multi-input or gate, a nor
    % gate and some nand2 gate,
	% everything is obtained with nand2 gates,
    % thus the class inherits properties and methods nand2. The class
    % describes the circuit in terms of delay,power and area. It starts
    % from technological parameters of HP, LOP and LSTP devices, present in
    % IRDS 2010. The user need to specify the pull-down width Wn, followed
    % by  the parallelism of input data and the bit growth of data. The
    % class models the corresponding relu.vhd component.
    
    properties
        N {mustBeInteger}; % in/out parallelism
        BG {mustBeInteger}; % bit growth
        nor_gate; % nor object
        mux; % mux object
        orn_gate; % or object
    end
    
    methods
        % Constructor
        function obj = relu(nMOS_width, n_bit, bit_growth)
            % Constructor of father class nand2
            obj             = obj@nand2(nMOS_width);
            obj.N           = n_bit;
            obj.BG          = bit_growth;
            obj.mux         = muxnto1_nbit(nMOS_width, 2, 1);
            obj.nor_gate    = nor2(nMOS_width);
            obj.orn_gate    = orn(nMOS_width, bit_growth);
        end
        
        % Delay evaluation
        function [Tdp_HP_relu, Tdp_LOP_relu, Tdp_LSTP_relu] = delay(obj)
            [Tdp_HP_nd2, Tdp_LOP_nd2, Tdp_LSTP_nd2]     = delay@nand2(obj);
            [Tdp_HP_mux, Tdp_LOP_mux, Tdp_LSTP_mux]     = obj.mux.delay;
            %[Tdp_HP_nor,  Tdp_LOP_nor,  Tdp_LSTP_nor]   = obj.nor_gate.delay;
            [Tdp_HP_or,  Tdp_LOP_or,  Tdp_LSTP_or]      = obj.orn_gate.delay;
            % HP
            Tdp_HP_relu     = Tdp_HP_or + (3 * Tdp_HP_nd2) ....
                + Tdp_HP_mux;% [s]
            % LOP
            Tdp_LOP_relu     = Tdp_LOP_or + (3 * Tdp_LOP_nd2) ...
                + Tdp_LOP_mux;% [s]
            % LSTP
            Tdp_LSTP_relu     = Tdp_LSTP_or + (3 * Tdp_LSTP_nd2) ...
                + Tdp_LSTP_mux;% [s]
		end
		
		% Area evaluation
        function [A_HP_relu, A_LOP_relu, A_LSTP_relu] = area(obj)
			[A_HP_nd2, A_LOP_nd2, A_LSTP_nd2]     = area@nand2(obj);
            [A_HP_mux, A_LOP_mux, A_LSTP_mux]     = obj.mux.area;
            [A_HP_nor, A_LOP_nor, A_LSTP_nor]     = obj.nor_gate.area;
            [A_HP_or,  A_LOP_or,  A_LSTP_or]      = obj.orn_gate.area;
            % HP
            A_HP_relu      = (3 * A_HP_nd2) ...
                + A_HP_nor + A_HP_or + (obj.N * A_HP_mux); % [um^2]
            % LOP
            A_LOP_relu      = (3 * A_LOP_nd2) ...
                + A_LOP_nor + A_LOP_or + (obj.N * A_LOP_mux); % [um^2]
            % LSTP
            A_LSTP_relu      = (3 * A_LSTP_nd2) ...
                + A_LSTP_nor + A_LSTP_or + (obj.N * A_LSTP_mux); % [um^2]
		end
        
		
        % Dynamic power evaluation
        function [Pdyn_HP_relu, Pdyn_LOP_relu, Pdyn_LSTP_relu] = power_dyn(obj)
			[Pdyn_HP_nd2, Pdyn_LOP_nd2, Pdyn_LSTP_nd2]     = power_dyn@nand2(obj);
            [Pdyn_HP_mux, Pdyn_LOP_mux, Pdyn_LSTP_mux]     = obj.mux.power_dyn;
            [Pdyn_HP_nor, Pdyn_LOP_nor, Pdyn_LSTP_nor]     = obj.nor_gate.power_dyn;
            [Pdyn_HP_or,  Pdyn_LOP_or,  Pdyn_LSTP_or]      = obj.orn_gate.power_dyn;
            % HP
            Pdyn_HP_relu      = (3 * Pdyn_HP_nd2) ...
                + Pdyn_HP_nor + Pdyn_HP_or + (obj.N * Pdyn_HP_mux); % [W]
            % LOP
            Pdyn_LOP_relu      = (3 * Pdyn_LOP_nd2) ...
                + Pdyn_LOP_nor + Pdyn_LOP_or + (obj.N * Pdyn_LOP_mux); % [W]
            % LSTP
            Pdyn_LSTP_relu      = (3 * Pdyn_LSTP_nd2) ...
                + Pdyn_LSTP_nor + Pdyn_LSTP_or + (obj.N * Pdyn_LSTP_mux); % [W]
		end
        
        % Static power evaluation
        function [Pstat_HP_relu, Pstat_LOP_relu, Pstat_LSTP_relu] = power_stat(obj)
			[Pstat_HP_nd2, Pstat_LOP_nd2, Pstat_LSTP_nd2]     = power_stat@nand2(obj);
            [Pstat_HP_mux, Pstat_LOP_mux, Pstat_LSTP_mux]     = obj.mux.power_stat;
            [Pstat_HP_nor, Pstat_LOP_nor, Pstat_LSTP_nor]     = obj.nor_gate.power_stat;
            [Pstat_HP_or,  Pstat_LOP_or,  Pstat_LSTP_or]      = obj.orn_gate.power_stat;
            % HP
            Pstat_HP_relu      = (3 * Pstat_HP_nd2) ...
                + Pstat_HP_nor + Pstat_HP_or + (obj.N * Pstat_HP_mux); % [W]
            % LOP
            Pstat_LOP_relu      = (3 * Pstat_LOP_nd2) ...
                + Pstat_LOP_nor + Pstat_LOP_or + (obj.N * Pstat_LOP_mux); % [W]
            % LSTP
            Pstat_LSTP_relu      = (3 * Pstat_LSTP_nd2) ...
                + Pstat_LSTP_nor + Pstat_LSTP_or + (obj.N * Pstat_LSTP_mux); % [W]
		end
    end
end

