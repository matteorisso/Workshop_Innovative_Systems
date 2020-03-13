classdef addr_gen_o_ctrl < nand2
    % addr_gen_o_ctrl describes a combinatorial circuit  
    % modeled with 8 mux, 10 and gates plus a not gate,
	% everything is obtained with nand2 gates,
    % thus the class inherits properties and methods nand2. The class
    % describes the circuit in terms of delay,power and area. It starts
    % from technological parameters of HP, LOP and LSTP devices, present in
    % IRDS 2010. The user need to specify the pull-down width Wn. The class models
    % the corresponding addr_gen_o_ctrl.vhd component.
    
    properties
        mux; % mux object
    end
    
    methods
        % Constructor
        function obj = addr_gen_o_ctrl(nMOS_width)
            % Constructor of father class
            obj             = obj@nand2(nMOS_width);
            obj.mux         = muxnto1_nbit(nMOS_width, 2, 1);
        end
        
        % Delay evaluation
        function [Tdp_HP_addr_gen_o_ctrl, Tdp_LOP_addr_gen_o_ctrl, Tdp_LSTP_addr_gen_o_ctrl] = delay(obj)
			[Tdp_HP_nd2, Tdp_LOP_nd2, Tdp_LSTP_nd2] = delay@nand2(obj);		
            [Tdp_HP_mux, Tdp_LOP_mux, Tdp_LSTP_mux] = obj.mux.delay;
            % HP
            Tdp_HP_addr_gen_o_ctrl     =  (6 * Tdp_HP_nd2) + Tdp_HP_mux; % [s]
            % LOP
            Tdp_LOP_addr_gen_o_ctrl    =  (6 * Tdp_LOP_nd2) + Tdp_LOP_mux; % [s]
            % LSTP
            Tdp_LSTP_addr_gen_o_ctrl   =  (6 * Tdp_LSTP_nd2) + Tdp_LSTP_mux; % [s]
		end
		
		% Area evaluation
        function [A_HP_addr_gen_o_ctrl, A_LOP_addr_gen_o_ctrl, A_LSTP_addr_gen_o_ctrl] = area(obj)
            [A_HP_nd2, A_LOP_nd2, A_LSTP_nd2] = area@nand2(obj);		
			[A_HP_mux, A_LOP_mux, A_LSTP_mux] = obj.mux.area;
            % HP
            A_HP_addr_gen_o_ctrl      = (8 * A_HP_mux) ...
                + (21 * A_HP_nd2); % [um^2]
            % LOP
            A_LOP_addr_gen_o_ctrl      = (8 * A_LOP_mux) ...
                + (21 * A_LOP_nd2); % [um^2]
            % LSTP
            A_LSTP_addr_gen_o_ctrl      = (8 * A_LSTP_mux) ...
                + (21 * A_LSTP_nd2); % [um^2]
		end
        
		
        % Dynamic power evaluation
        function [Pdyn_HP_addr_gen_o_ctrl, Pdyn_LOP_addr_gen_o_ctrl, Pdyn_LSTP_addr_gen_o_ctrl] = power_dyn(obj)
            [Pdyn_HP_nd2, Pdyn_LOP_nd2, Pdyn_LSTP_nd2] = power_dyn@nand2(obj);		
			[Pdyn_HP_mux, Pdyn_LOP_mux, Pdyn_LSTP_mux] = obj.mux.power_dyn;
            % HP
            Pdyn_HP_addr_gen_o_ctrl      = (8 * Pdyn_HP_mux) ...
                + (21 * Pdyn_HP_nd2); %[W] 
            % LOP
            Pdyn_LOP_addr_gen_o_ctrl      = (8 * Pdyn_LOP_mux) ...
                + (21 * Pdyn_LOP_nd2); %[W] 
            % LSTP
            Pdyn_LSTP_addr_gen_o_ctrl      = (8 * Pdyn_LSTP_mux) ...
                + (21 * Pdyn_LSTP_nd2); %[W]
		end
        
        % Static power evaluation
        function [Pstat_HP_addr_gen_o_ctrl, Pstat_LOP_addr_gen_o_ctrl, Pstat_LSTP_addr_gen_o_ctrl] = power_stat(obj)
            [Pstat_HP_nd2, Pstat_LOP_nd2, Pstat_LSTP_nd2] = power_stat@nand2(obj);		
			[Pstat_HP_mux, Pstat_LOP_mux, Pstat_LSTP_mux] = obj.mux.power_stat;
            % HP
            Pstat_HP_addr_gen_o_ctrl      = (8 * Pstat_HP_mux) ...
                + (21 * Pstat_HP_nd2); %[W]
            % LOP
            Pstat_LOP_addr_gen_o_ctrl     = (8 * Pstat_LOP_mux) ...
                + (21 * Pstat_LOP_nd2); %[W] 
            % LSTP
            Pstat_LSTP_addr_gen_o_ctrl    = (8 * Pstat_LSTP_mux) ...
                + (21 * Pstat_LSTP_nd2); %[W]
		end
    end
end

