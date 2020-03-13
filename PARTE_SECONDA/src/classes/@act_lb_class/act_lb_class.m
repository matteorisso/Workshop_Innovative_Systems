classdef act_lb_class < nand2
    % act_lb_class class describes a sequential circuit circuit
    % modeled with a decoder, 97 registers and 129 mux,
	% where everything is obtained with nand2 gates,
    % thus the class inherits properties and methods nand2. The class
    % describes the circuit in terms of delay,power and area. It starts
    % from technological parameters of HP, LOP and LSTP devices, present in
    % IRDS 2010. The user need to specify the pull-down width Wn.
    % The class models the cdecoder7to128responding act_lb.vhd component.
    
    properties
        reg; % register object
        mux2to1; % mux2to1 object
        mux128to1; % mux128to1 object
        decoder7to128; % decoder object
    end
    
    methods
        % Constructdecoder7to128
        function obj = act_lb_class(nMOS_width)
            % Constructdecoder7to128 of father class
            obj                  = obj@nand2(nMOS_width);
            obj.reg              = register(nMOS_width, 32);
            obj.mux2to1          = muxnto1_nbit(nMOS_width, 2, 32);
            obj.mux128to1        = muxnto1_nbit(nMOS_width, 128, 1);
            obj.decoder7to128    = decoder(nMOS_width, 7);
        end
        
        % Delay evaluation
        function [Tdp_HP_act_lb_class, Tdp_LOP_act_lb_class, Tdp_LSTP_act_lb_class] = delay(obj)
            [Tdp_HP_mux2to1, Tdp_LOP_mux2to1, Tdp_LSTP_mux2to1] = obj.mux2to1.delay;
            [Tdp_HP_mux128to1, Tdp_LOP_mux128to1, Tdp_LSTP_mux128to1] = obj.mux128to1.delay;
            [Tdp_HP_decoder7to128,  Tdp_LOP_decoder7to128,  Tdp_LSTP_decoder7to128]  = obj.decoder7to128.delay;
            % HP
            Tdp_HP_act_lb_class     = max( ...
                Tdp_HP_decoder7to128  + Tdp_HP_mux2to1, ...
                Tdp_HP_mux128to1 ); % [s]
            % LOP
            Tdp_LOP_act_lb_class     = max( ...
                Tdp_LOP_decoder7to128  + Tdp_LOP_mux2to1, ...
                Tdp_LOP_mux128to1 ); % [s]
            % LSTP
            Tdp_LSTP_act_lb_class     = max( ...
                Tdp_LSTP_decoder7to128  + Tdp_LSTP_mux2to1, ...
                Tdp_LSTP_mux128to1 ); % [s]
		end
		
		% Area evaluation
        function [A_HP_act_lb_class, A_LOP_act_lb_class, A_LSTP_act_lb_class] = area(obj)
			[A_HP_mux2to1, A_LOP_mux2to1, A_LSTP_mux2to1] = obj.mux2to1.area;
			[A_HP_mux128to1, A_LOP_mux128to1, A_LSTP_mux128to1] = obj.mux128to1.area;
            [A_HP_reg, A_LOP_reg, A_LSTP_reg] = obj.reg.area;
            [A_HP_decoder7to128,  A_LOP_decoder7to128,  A_LSTP_decoder7to128]  = obj.decoder7to128.area;
            % HP
            A_HP_act_lb_class      = (97 * A_HP_mux2to1) ...
                (32 * A_HP_mux128to1) + (97 * A_HP_reg) + A_HP_decoder7to128; % [um^2]
            % LOP
            A_LOP_act_lb_class      = (97 * A_LOP_mux2to1) ...
                (32 * A_LOP_mux128to1) + (97 * A_LOP_reg) + A_LOP_decoder7to128; % [um^2]
            % LSTP
            A_LSTP_act_lb_class      = (97 * A_LSTP_mux2to1) ...
                (32 * A_LSTP_mux128to1) + (97 * A_LSTP_reg) + A_LSTP_decoder7to128; % [um^2]
		end
        
		
        % Dynamic power evaluation
        function [Pdyn_HP_act_lb_class, Pdyn_LOP_act_lb_class, Pdyn_LSTP_act_lb_class] = power_dyn(obj)
			[Pdyn_HP_mux2to1, Pdyn_LOP_mux2to1, Pdyn_LSTP_mux2to1] = obj.mux2to1.power_dyn;
			[Pdyn_HP_mux128to1, Pdyn_LOP_mux128to1, Pdyn_LSTP_mux128to1] = obj.mux128to1.power_dyn;
            [Pdyn_HP_reg, Pdyn_LOP_reg, Pdyn_LSTP_reg] = obj.reg.power_dyn;
            [Pdyn_HP_decoder7to128,  Pdyn_LOP_decoder7to128,  Pdyn_LSTP_decoder7to128]  = obj.decoder7to128.power_dyn;
            % HP
            Pdyn_HP_act_lb_class      = (97 * Pdyn_HP_mux2to1) ...
                (32 * Pdyn_HP_mux128to1) + (97 * Pdyn_HP_reg) + Pdyn_HP_decoder7to128; %[W]
            % LOP
            Pdyn_LOP_act_lb_class      = (97 * Pdyn_LOP_mux2to1) ...
                (32 * Pdyn_LOP_mux128to1) + (97 * Pdyn_LOP_reg) + Pdyn_LOP_decoder7to128; %[W]
            % LSTP
            Pdyn_LSTP_act_lb_class      = (97 * Pdyn_LSTP_mux2to1) ...
                (32 * Pdyn_LSTP_mux128to1) + (97 * Pdyn_LSTP_reg) + Pdyn_LSTP_decoder7to128; %[W]
		end
        
        % Static power evaluation
        function [Pstat_HP_act_lb_class, Pstat_LOP_act_lb_class, Pstat_LSTP_act_lb_class] = power_stat(obj)
			[Pstat_HP_mux2to1, Pstat_LOP_mux2to1, Pstat_LSTP_mux2to1] = obj.mux2to1.power_stat;
			[Pstat_HP_mux128to1, Pstat_LOP_mux128to1, Pstat_LSTP_mux128to1] = obj.mux128to1.power_stat;
            [Pstat_HP_reg, Pstat_LOP_reg, Pstat_LSTP_reg] = obj.reg.power_stat;
            [Pstat_HP_decoder7to128,  Pstat_LOP_decoder7to128,  Pstat_LSTP_decoder7to128]  = obj.decoder7to128.power_stat;
            % HP
            Pstat_HP_act_lb_class      = (97 * Pstat_HP_mux2to1) ...
                (32 * Pstat_HP_mux128to1) + (97 * Pstat_HP_reg) + Pstat_HP_decoder7to128; %[W]
            % LOP
            Pstat_LOP_act_lb_class      = (97 * Pstat_LOP_mux2to1) ...
                (32 * Pstat_LOP_mux128to1) + (97 * Pstat_LOP_reg) + Pstat_LOP_decoder7to128; %[W]
            % LSTP
            Pstat_LSTP_act_lb_class      = (97 * Pstat_LSTP_mux2to1) ...
                (32 * Pstat_LSTP_mux128to1) + (97 * Pstat_LSTP_reg) + Pstat_LSTP_decoder7to128; %[W]
		end
    end
end

