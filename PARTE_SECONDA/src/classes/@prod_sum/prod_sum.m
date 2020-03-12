classdef prod_sum < nand2
    % prod_sum class describes a sequential circuit capable of performing
    % the linear combination of three inputs, thus it is made of one
    % multiplier, one adder, one multiplexer and one register.
	% Everything is obtained with nand2 gates,
    % thus the class inherits properties and methods nand2. The class
    % describes the circuit in terms of delay,power and area. It starts
    % from technological parameters of HP, LOP and LSTP devices, present in
    % IRDS 2010. The user need to specify the pull-down width Wn, followed
    % by the input parallelism . The class models the corresponding
    % prod_sum.vhd component.
   
    properties
        N  {mustBeInteger}; % input parallelism
        mul; % mpy object
        add; % rca object
        reg; % register object
        mux; % mux object
    end
    
    methods
        % Constructor
        function obj = prod_sum(nMOS_width, n_bit)
            % Constructor of father class nand2
            obj             = obj@nand2(nMOS_width);
            obj.N           = n_bit;
            obj.mul         = mpy(nMOS_width, n_bit);
            obj.add         = rca(nMOS_width, 2*n_bit);
            obj.reg         = register(nMOS_width, 2*n_bit);
            obj.mux         = muxnto1_nbit(nMOS_width, 2, 2*n_bit);
        end
        
        % Delay evaluation
        function [Tdp_HP_prod_sum, Tdp_LOP_prod_sum, Tdp_LSTP_prod_sum] = delay(obj)
            %[Tdp_HP_nd2, Tdp_LOP_nd2, Tdp_LSTP_nd2]     = delay@nand2(obj);
            [Tdp_HP_mul,   Tdp_LOP_mul,   Tdp_LSTP_mul]      = obj.mul.delay;
            [Tdp_HP_rca,   Tdp_LOP_rca,   Tdp_LSTP_rca]      = obj.add.delay;
            [Tdp_HP_mux,   Tdp_LOP_mux,   Tdp_LSTP_mux]      = obj.mux.delay;
            [Tdp_HP_reg,   Tdp_LOP_reg,   Tdp_LSTP_reg]      = obj.reg.delay;
            % HP
            Tdp_HP_prod_sum     = Tdp_HP_mul + Tdp_HP_rca + Tdp_HP_mux + ...
                Tdp_HP_reg; % [s]
            % LOP
            Tdp_LOP_prod_sum     = Tdp_LOP_mul + Tdp_LOP_rca + Tdp_LOP_mux + ...
                Tdp_LOP_reg; % [s]
            % LSTP
            Tdp_LSTP_prod_sum     = Tdp_LSTP_mul + Tdp_LSTP_rca + Tdp_LSTP_mux + ...
                Tdp_LSTP_reg;% [s]
		end
		
		% Area evaluation
        function [A_HP_prod_sum, A_LOP_prod_sum, A_LSTP_prod_sum] = area(obj)
			[A_HP_mul,   A_LOP_mul,   A_LSTP_mul]      = obj.mul.area;
            [A_HP_rca,   A_LOP_rca,   A_LSTP_rca]      = obj.rca.area;
            [A_HP_mux,   A_LOP_mux,   A_LSTP_mux]      = obj.mux.area;
            [A_HP_reg,   A_LOP_reg,   A_LSTP_reg]      = obj.reg.area;
            % HP
            A_HP_prod_sum     = A_HP_mul + A_HP_rca + A_HP_mux + ...
                A_HP_reg; % [um^2]
            % LOP
            A_LOP_prod_sum    = A_LOP_mul + A_LOP_rca + A_LOP_mux + ...
                A_LOP_reg; % [um^2]
            % LSTP
            A_LSTP_prod_sum   = A_LSTP_mul + A_LSTP_rca + A_LSTP_mux + ...
                A_LSTP_reg;% [um^2]
		end
        
		
        % Dynamic power evaluation
        function [Pdyn_HP_prod_sum, Pdyn_LOP_prod_sum, Pdyn_LSTP_prod_sum] = power_dyn(obj)
			[Pdyn_HP_mul,   Pdyn_LOP_mul,   Pdyn_LSTP_mul]      = obj.mul.power_dyn;
            [Pdyn_HP_rca,   Pdyn_LOP_rca,   Pdyn_LSTP_rca]      = obj.rca.power_dyn;
            [Pdyn_HP_mux,   Pdyn_LOP_mux,   Pdyn_LSTP_mux]      = obj.mux.power_dyn;
            [Pdyn_HP_reg,   Pdyn_LOP_reg,   Pdyn_LSTP_reg]      = obj.reg.power_dyn;
            % HP
            Pdyn_HP_prod_sum     = Pdyn_HP_mul + Pdyn_HP_rca + Pdyn_HP_mux + ...
                Pdyn_HP_reg; % [W]
            % LOP
            Pdyn_LOP_prod_sum    = Pdyn_LOP_mul + Pdyn_LOP_rca + Pdyn_LOP_mux + ...
                Pdyn_LOP_reg; % [W]
            % LSTP
            Pdyn_LSTP_prod_sum   = Pdyn_LSTP_mul + Pdyn_LSTP_rca + Pdyn_LSTP_mux + ...
                Pdyn_LSTP_reg;% [W]
		end
        
        % Static power evaluation
        function [Pstat_HP_prod_sum, Pstat_LOP_prod_sum, Pstat_LSTP_prod_sum] = power_stat(obj)
			[Pstat_HP_mul,   Pstat_LOP_mul,   Pstat_LSTP_mul]      = obj.mul.power_stat;
            [Pstat_HP_rca,   Pstat_LOP_rca,   Pstat_LSTP_rca]      = obj.rca.power_stat;
            [Pstat_HP_mux,   Pstat_LOP_mux,   Pstat_LSTP_mux]      = obj.mux.power_stat;
            [Pstat_HP_reg,   Pstat_LOP_reg,   Pstat_LSTP_reg]      = obj.reg.power_stat;
            % HP
            Pstat_HP_prod_sum     = Pstat_HP_mul + Pstat_HP_rca + Pstat_HP_mux + ...
                Pstat_HP_reg; % [W]
            % LOP
            Pstat_LOP_prod_sum    = Pstat_LOP_mul + Pstat_LOP_rca + Pstat_LOP_mux + ...
                Pstat_LOP_reg; % [W]
            % LSTP
            Pstat_LSTP_prod_sum   = Pstat_LSTP_mul + Pstat_LSTP_rca + Pstat_LSTP_mux + ...
                Pstat_LSTP_reg;% [W]
		end
    end
end

