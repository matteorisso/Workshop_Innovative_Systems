classdef p_2_2 < nand2
    % ppu class describes a sequential circuit capable of perform the rounding. 
	% The component is modeled with a round block, three adders and five registers. 
	% Everything is obtained with nand2 gates,
    % thus the class inherits properties and methods nand2. The class
    % describes the circuit in terms of delay,power and area. It starts
    % from technological parameters of HP, LOP and LSTP devices, present in
    % IRDS 2010. The user need to specify the pull-down width Wn, followed
    % by N. The class models the corresponding ppu.vhd component.
    
    properties
        N  {mustBeInteger}; % activation bits
        round; % round object
        reg; % register object
		rca; % rca object
    end
    
    methods
        % Constructor
        function obj = p_2_2(nMOS_width, n_bit)
            % Constructor of father class nand2
            obj             = obj@nand2(nMOS_width);
            obj.N           = n_bit;
            obj.round       = round_class(nMOS_width, n_bit+2, n_bit);
            obj.reg         = register(nMOS_width, n_bit);
            obj.add5         = rca(nMOS_width, 5);
            obj.add6         = rca(nMOS_width, 6);

        end
        
        % Delay evaluation
        function [Tdp_HP_p_2_2, Tdp_LOP_p_2_2, Tdp_LSTP_p_2_2] = delay(obj)
            %[Tdp_HP_nd2, Tdp_LOP_nd2, Tdp_LSTP_nd2]     = delay@nand2(obj);
            [Tdp_HP_round,      Tdp_LOP_round,      Tdp_LSTP_round]     = obj.round.delay;
            [Tdp_HP_reg,        Tdp_LOP_reg,        Tdp_LSTP_reg]       = obj.reg.delay;
            [Tdp_HP_add5,        Tdp_LOP_add5,        Tdp_LSTP_add5]       = obj.add5.delay;
            [Tdp_HP_add6,        Tdp_LOP_add6,        Tdp_LSTP_add6]       = obj.add6.delay;
            % HP
            Tdp_HP_p_2_2     = max(2*Tdp_HP_add6 + Tdp_HP_add5, Tdp_HP_round);% [s]
            % LOP
            Tdp_LOP_p_2_2     = max(2*Tdp_LOP_add6 + Tdp_LOP_add5, Tdp_LOP_round);% [s]
            % LSTP
            Tdp_LSTP_p_2_2     = max(2*Tdp_LSTP_add6 + Tdp_LSTP_add5, Tdp_LSTP_round);% [s]
		end
		
		% Area evaluation
        function [A_HP_p_2_2, A_LOP_p_2_2, A_LSTP_p_2_2] = area(obj)
            [A_HP_round,      A_LOP_round,      A_LSTP_round]     = obj.round.area;
            [A_HP_reg,        A_LOP_reg,        A_LSTP_reg]       = obj.reg.area;
            [A_HP_add5,        A_LOP_add5,        A_LSTP_add5]       = obj.add5.area;
            [A_HP_add6,        A_LOP_add6,        A_LSTP_add6]       = obj.add6.area;
            % HP
            A_HP_p_2_2    =  A_HP_add5 + A_HP_round + (2 * A_HP_add6) + 5 * A_HP_reg; % [um^2]
            % LOP
           A_LOP_p_2_2    =  A_LOP_add5 + A_LOP_round + (2 * A_LOP_add6) + 5 * A_LOP_reg; % [um^2]
            % LSTP
           A_LSTP_p_2_2    =  A_LSTP_add5 + A_LSTP_round + (2 * A_LSTP_add6) + 5 * A_LSTP_reg; % [um^2]
		end
        
		
        % Dynamic power evaluation
        function [Pdyn_HP_p_2_2, Pdyn_LOP_p_2_2, Pdyn_LSTP_p_2_2] = power_dyn(obj)
            [Pdyn_HP_round,      Pdyn_LOP_round,      Pdyn_LSTP_round]     = obj.round.power_dyn;
            [Pdyn_HP_reg,        Pdyn_LOP_reg,        Pdyn_LSTP_reg]       = obj.reg.power_dyn;
            [Pdyn_HP_add5,        Pdyn_LOP_add5,      Pdyn_LSTP_add5]       = obj.add5.power_dyn;
            [Pdyn_HP_add6,        Pdyn_LOP_add6,        Pdyn_LSTP_add6]       = obj.add6.power_dyn;			
            % HP
            Pdyn_HP_p_2_2    =  Pdyn_HP_add5 + Pdyn_HP_round + (2 * Pdyn_HP_add6) + 5 * Pdyn_HP_reg; % [W]
            % LOP
            Pdyn_LOP_p_2_2    =  Pdyn_LOP_add5 + Pdyn_LOP_round + (2 * Pdyn_LOP_add6) + 5 * Pdyn_LOP_reg; % [W]
            % LSTP
            Pdyn_LSTP_p_2_2    =  Pdyn_LSTP_add5 + Pdyn_LSTP_round + (2 * Pdyn_LSTP_add6) + 5 * Pdyn_LSTP_reg; % [W]
		end
        
        % Static power evaluation
        function [Pstat_HP_p_2_2, Pstat_LOP_p_2_2, Pstat_LSTP_p_2_2] = power_stat(obj)
            [Pstat_HP_round,      Pstat_LOP_round,      Pstat_LSTP_round]     = obj.round.power_stat;
            [Pstat_HP_reg,        Pstat_LOP_reg,        Pstat_LSTP_reg]       = obj.reg.power_stat;
            [Pstat_HP_add5,        Pstat_LOP_add5,      Pstat_LSTP_add5]       = obj.add5.power_stat;
            [Pstat_HP_add6,        Pstat_LOP_add6,        Pstat_LSTP_add6]       = obj.add6.power_stat;				
            % HP
            Pstat_HP_p_2_2    =  Pstat_HP_add5 + Pstat_HP_round + (2 * Pstat_HP_add6) + 5 * Pstat_HP_reg; % [W]
            % LOP
            Pstat_LOP_p_2_2    =  Pstat_LOP_add5 + Pstat_LOP_round + (2 * Pstat_LOP_add6) + 5 * Pstat_LOP_reg; % [W]
            % LSTP
            Pstat_LSTP_p_2_2    =  Pstat_LSTP_add5 + Pstat_LSTP_round + (2 * Pstat_LSTP_add6) + 5 * Pstat_LSTP_reg; % [W]
		end
    end
end

