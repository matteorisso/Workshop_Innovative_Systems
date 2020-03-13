classdef act_rf < nand2
    % act_rf class describes a sequntial circuit
    % modeled with 896 mux 8to1, 48 mux 2to1, 48 registers
    % and a decoder, everything is obtained with nand2 gates,
    % thus the class inherits properties and methods nand2. The class
    % describes the circuit in terms of delay,power and area. It starts
    % from technological parameters of HP, LOP and LSTP devices, present in
    % IRDS 2010. The user need to specify the pull-down width Wn, followed
    % by activation bits and kernel size. The class models the corresponding
    % act_rf.vhd component.
    
    properties
        N {mustBeInteger}; % activation bits
        K {mustBeInteger}; % kernel size
        mux2to1; % mux object with bit_width N*(K-1)
        mux8to1; % mux object with bit_width N*(K-1)
		reg; % register object
		decoder3to8; %decoder object
    end
    
    methods
        % Constructor
        function obj = act_rf(nMOS_width, N, K)
            % Constructor of father class nand2
            obj            = obj@nand2(nMOS_width);
            obj.mux2to1        = muxnto1_nbit(nMOS_width, 2, N*(K-1));
            obj.mux8to1        = muxnto1_nbit(nMOS_width, 8, N*(K-1));
			obj.reg            = register(nMOS_width, N*(K-1));
            obj.decoder3to8    = decoder(nMOS_width, 3);			
        end
        
        % Delay evaluation
        function [Tdp_HP_act_rf, Tdp_LOP_act_rf, Tdp_LSTP_act_rf] = delay(obj)
            [Tdp_HP_mux2to1, Tdp_LOP_mux2to1, Tdp_LSTP_mux2to1]  = obj.mux2to1.delay;
            [Tdp_HP_mux8to1, Tdp_LOP_mux8to1, Tdp_LSTP_mux8to1]  = obj.mux8to1.delay;			
			[Tdp_HP_decoder3to8,  Tdp_LOP_decoder3to8,  Tdp_LSTP_decoder3to8]  = obj.decoder3to8.delay;
            % HP
            Tdp_HP_act_rf     = Tdp_HP_decoder3to8 + Tdp_HP_mux2to1 + Tdp_HP_mux8to1; % [s]
            % LOP
            Tdp_LOP_act_rf     = Tdp_LOP_decoder3to8 + Tdp_LOP_mux2to1 + Tdp_LOP_mux8to1; % [s]
            % LSTP
            Tdp_LSTP_act_rf     = Tdp_LSTP_decoder3to8 + Tdp_LSTP_mux2to1 + Tdp_LSTP_mux8to1; % [s]
		end
		
		% Area evaluation
        function [A_HP_act_rf, A_LOP_act_rf, A_LSTP_act_rf] = area(obj)
            [A_HP_mux2to1, A_LOP_mux2to1, A_LSTP_mux2to1]  = obj.mux2to1.area;
            [A_HP_mux8to1, A_LOP_mux8to1, A_LSTP_mux8to1]  = obj.mux8to1.area;
            [A_HP_reg, A_LOP_reg, A_LSTP_reg] = obj.reg.area;			
		    [A_HP_decoder3to8,  A_LOP_decoder3to8,  A_LSTP_decoder3to8]  = obj.decoder3to8.area;
            % HP
            A_HP_act_rf      = (48 * A_HP_mux2to1) + A_HP_decoder3to8 + (896 * A_HP_mux8to1) + (48 * A_HP_reg); % [um^2]
            % LOP
            A_LOP_act_rf      = (48 * A_LOP_mux2to1) + A_LOP_decoder3to8 + (896 * A_LOP_mux8to1) + (48 * A_LOP_reg); % [um^2]
            % LSTP
            A_LSTP_act_rf      = (48 * A_LSTP_mux2to1) + A_LSTP_decoder3to8 + (896 * A_LSTP_mux8to1) + (48 * A_LSTP_reg); % [um^2]
		end
        
		
        % Dynamic power evaluation
        function [Pdyn_HP_act_rf, Pdyn_LOP_act_rf, Pdyn_LSTP_act_rf] = power_dyn(obj)
            [Pdyn_HP_mux2to1, Pdyn_LOP_mux2to1, Pdyn_LSTP_mux2to1]  = obj.mux2to1.power_dyn;
            [Pdyn_HP_mux8to1, Pdyn_LOP_mux8to1, Pdyn_LSTP_mux8to1]  = obj.mux8to1.power_dyn;
            [Pdyn_HP_reg, Pdyn_LOP_reg, Pdyn_LSTP_reg] = obj.reg.power_dyn;			
		    [Pdyn_HP_decoder3to8,  Pdyn_LOP_decoder3to8,  Pdyn_LSTP_decoder3to8]  = obj.decoder3to8.power_dyn;			
            % HP
            Pdyn_HP_act_rf      = (48 * Pdyn_HP_mux2to1) + Pdyn_HP_decoder3to8 + (896 * Pdyn_HP_mux8to1) + (48 * Pdyn_HP_reg); % [W]
            % LOP
            Pdyn_LOP_act_rf      = (48 * Pdyn_LOP_mux2to1) + Pdyn_LOP_decoder3to8 + (896 * Pdyn_LOP_mux8to1) + (48 * Pdyn_LOP_reg); % [W]
            % LSTP
            Pdyn_LSTP_act_rf      = (48 * Pdyn_LSTP_mux2to1) + Pdyn_LSTP_decoder3to8 + (896 * Pdyn_LSTP_mux8to1) + (48 * Pdyn_LSTP_reg); % [W]
		end
        
        % Static power evaluation
        function [Pstat_HP_act_rf, Pstat_LOP_act_rf, Pstat_LSTP_act_rf] = power_stat(obj)
            [Pstat_HP_mux2to1, Pstat_LOP_mux2to1, Pstat_LSTP_mux2to1]  = obj.mux2to1.power_stat;
            [Pstat_HP_mux8to1, Pstat_LOP_mux8to1, Pstat_LSTP_mux8to1]  = obj.mux8to1.power_stat;
            [Pstat_HP_reg, Pstat_LOP_reg, Pstat_LSTP_reg] = obj.reg.power_stat;			
		    [Pstat_HP_decoder3to8,  Pstat_LOP_decoder3to8,  Pstat_LSTP_decoder3to8]  = obj.decoder3to8.power_stat;
            % HP
            Pstat_HP_act_rf      = (48 * Pstat_HP_mux2to1) + Pstat_HP_decoder3to8 + (896 * Pstat_HP_mux8to1) + (48 * Pstat_HP_reg); % [W]
            % LOP
            Pstat_LOP_act_rf      = (48 * Pstat_LOP_mux2to1) + Pstat_LOP_decoder3to8 + (896 * Pstat_LOP_mux8to1) + (48 * Pstat_LOP_reg); % [W]
            % LSTP
            Pstat_LSTP_act_rf      = (48 * Pstat_LSTP_mux2to1) + Pstat_LSTP_decoder3to8 + (896 * Pstat_LSTP_mux8to1) + (48 * Pstat_LSTP_reg); % [W]
		end
    end
end

