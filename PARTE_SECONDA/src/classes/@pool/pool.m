classdef pool < nand2
    % pool class describes sequential circuit capable of performing sum of
    % four inputs in three clock cycle. The component is modeled with two
    % adders and three registers with enable signal obtained usign a mux,
	% everything is obtained with nand2 gates,
    % thus the class inherits properties and methods nand2. The class
    % describes the circuit in terms of delay,power and area. It starts
    % from technological parameters of HP, LOP and LSTP devices, present in
    % IRDS 2010. The user need to specify the pull-down width Wn, followed
    % by  the parallelism of data. The class models the corresponding
    % pool.vhd component.
    
    properties
        bit_width {mustBeInteger}; % parallelism
        add1; % adder with bit_width+1 parallelism object
        add2; % adder with bit_width+2 parallelism object
        reg1; % register with bit_width+1 parallelism object
        reg2; % register with bit_width+2 parallelism object
        mux1; % mux with bit_width+1 parallelism object
        mux2; % mux with bit_width+2 parallelism object
    end
    
    methods
        % Constructor
        function obj = pool(nMOS_width, n_bit)
            % Constructor of father class nand2
            obj             = obj@nand2(nMOS_width);
            obj.bit_width   = n_bit;
            obj.add1        = rca(nMOS_width, n_bit+1);
            obj.add2        = rca(nMOS_width, n_bit+2);
            obj.reg1        = register(nMOS_width, n_bit+1);
            obj.reg2        = register(nMOS_width, n_bit+2);
            obj.mux1        = muxnto1_nbit(nMOS_width, 2, n_bit+1);
            obj.mux2        = muxnto1_nbit(nMOS_width, 2, n_bit+2);
        end
        
        % Delay evaluation
        function [Tdp_HP_pool, Tdp_LOP_pool, Tdp_LSTP_pool] = delay(obj)
            %[Tdp_HP_nd2, Tdp_LOP_nd2, Tdp_LSTP_nd2]     = delay@nand2(obj);
            [Tdp_HP_add2, Tdp_LOP_add2, Tdp_LSTP_add2]  = obj.add2.delay;
            [Tdp_HP_mux2, Tdp_LOP_mux2, Tdp_LSTP_mux2]  = obj.mux2.delay;
            [Tdp_HP_reg2, Tdp_LOP_reg2, Tdp_LSTP_reg2]  = obj.reg2.delay;
            % HP
            Tdp_HP_pool     = Tdp_HP_add2 + Tdp_HP_reg2 ...
                + Tdp_HP_mux2;% [s]
            % LOP
            Tdp_LOP_pool     = Tdp_LOP_add2 + Tdp_LOP_reg2 ...
                + Tdp_LOP_mux2;% [s]
            % LSTP
            Tdp_LSTP_pool     = Tdp_LSTP_add2 + Tdp_LSTP_reg2 ...
                + Tdp_LSTP_mux2;% [s]
		end
		
		% Area evaluation
        function [A_HP_pool, A_LOP_pool, A_LSTP_pool] = area(obj)
			[A_HP_add1, A_LOP_add1, A_LSTP_add1]  = obj.add1.area;
            [A_HP_mux1, A_LOP_mux1, A_LSTP_mux1]  = obj.mux1.area;
            [A_HP_reg1, A_LOP_reg1, A_LSTP_reg1]  = obj.reg1.area;
            [A_HP_add2, A_LOP_add2, A_LSTP_add2]  = obj.add2.area;
            [A_HP_mux2, A_LOP_mux2, A_LSTP_mux2]  = obj.mux2.area;
            [A_HP_reg2, A_LOP_reg2, A_LSTP_reg2]  = obj.reg2.area;
            % HP
            A_HP_pool      = (2 * A_HP_reg1) + A_HP_reg2...
                + A_HP_add1 + A_HP_add2 + (2 * A_HP_mux1) + A_HP_mux2; % [um^2]
            % LOP
            A_LOP_pool      = (2 * A_LOP_reg1) + A_LOP_reg2...
                + A_LOP_add1 + A_LOP_add2 + (2 * A_LOP_mux1) + A_LOP_mux2; % [um^2]
            % LSTP
            A_LSTP_pool      = (2 * A_LSTP_reg1) + A_LSTP_reg2...
                + A_LSTP_add1 + A_LSTP_add2 + (2 * A_LSTP_mux1) + A_LSTP_mux2; % [um^2]
		end
        
		
        % Dynamic power evaluation
        function [Pdyn_HP_pool, Pdyn_LOP_pool, Pdyn_LSTP_pool] = power_dyn(obj)
			[Pdyn_HP_add1, Pdyn_LOP_add1, Pdyn_LSTP_add1]  = obj.add1.power_dyn;
            [Pdyn_HP_mux1, Pdyn_LOP_mux1, Pdyn_LSTP_mux1]  = obj.mux1.power_dyn;
            [Pdyn_HP_reg1, Pdyn_LOP_reg1, Pdyn_LSTP_reg1]  = obj.reg1.power_dyn;
            [Pdyn_HP_add2, Pdyn_LOP_add2, Pdyn_LSTP_add2]  = obj.add2.power_dyn;
            [Pdyn_HP_mux2, Pdyn_LOP_mux2, Pdyn_LSTP_mux2]  = obj.mux2.power_dyn;
            [Pdyn_HP_reg2, Pdyn_LOP_reg2, Pdyn_LSTP_reg2]  = obj.reg2.power_dyn;
            % HP
            Pdyn_HP_pool      = (2 * Pdyn_HP_reg1) + Pdyn_HP_reg2 ...
                + Pdyn_HP_add1 + Pdyn_HP_add2 + (2 * Pdyn_HP_mux1) ...
                + Pdyn_HP_mux2; % [W]
            % LOP
            Pdyn_LOP_pool      = (2 * Pdyn_LOP_reg1) + Pdyn_LOP_reg2 ...
                + Pdyn_LOP_add1 + Pdyn_LOP_add2 + (2 * Pdyn_LOP_mux1) ...
                + Pdyn_LOP_mux2; % [W]
            % LSTP
            Pdyn_LSTP_pool      = (2 * Pdyn_LSTP_reg1) + Pdyn_LSTP_reg2 ...
                + Pdyn_LSTP_add1 + Pdyn_LSTP_add2 + (2 * Pdyn_LSTP_mux1) ...
                + Pdyn_LSTP_mux2; % [W]
		end
        
        % Static power evaluation
        function [Pstat_HP_pool, Pstat_LOP_pool, Pstat_LSTP_pool] = power_stat(obj)
			[Pstat_HP_add1, Pstat_LOP_add1, Pstat_LSTP_add1]  = obj.add1.power_stat;
            [Pstat_HP_mux1, Pstat_LOP_mux1, Pstat_LSTP_mux1]  = obj.mux1.power_stat;
            [Pstat_HP_reg1, Pstat_LOP_reg1, Pstat_LSTP_reg1]  = obj.reg1.power_stat;
            [Pstat_HP_add2, Pstat_LOP_add2, Pstat_LSTP_add2]  = obj.add2.power_stat;
            [Pstat_HP_mux2, Pstat_LOP_mux2, Pstat_LSTP_mux2]  = obj.mux2.power_stat;
            [Pstat_HP_reg2, Pstat_LOP_reg2, Pstat_LSTP_reg2]  = obj.reg2.power_stat;
            % HP
            Pstat_HP_pool      = (2 * Pstat_HP_reg1) + Pstat_HP_reg2 ...
                + Pstat_HP_add1 + Pstat_HP_add2 + (2 * Pstat_HP_mux1) ...
                + Pstat_HP_mux2; % [W]
            % LOP
            Pstat_LOP_pool      = (2 * Pstat_LOP_reg1) + Pstat_LOP_reg2 ...
                + Pstat_LOP_add1 + Pstat_LOP_add2 + (2 * Pstat_LOP_mux1) ...
                + Pstat_LOP_mux2; % [W]
            % LSTP
            Pstat_LSTP_pool      = (2 * Pstat_LSTP_reg1) + Pstat_LSTP_reg2 ...
                + Pstat_LSTP_add1 + Pstat_LSTP_add2 + (2 * Pstat_LSTP_mux1) ...
                + Pstat_LSTP_mux2; % [W]
		end
    end
end

