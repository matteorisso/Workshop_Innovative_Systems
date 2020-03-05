classdef muxnto1_nbit < nand2
    % muxnto1_nbit class describes a multiplexer with generic parallelism
    % and generic number of inputs, it is realized with
    % nand2 gates, thus the class inherits properties and methods from
    % father class nand2. The class describes the circuit in terms of
    % delay,power and area. It starts from technological parameters of HP,
    % LOP and LSTP devices, present in IRDS 2010. The user need to specify
    % the pull-down width Wn, followed by the number of inputs and the
    % parallelism of data.
    
    % User defined
    properties
        N {mustBeInteger}; % #inputs
        bit_width {mustBeInteger}; % parallelism
    end
    
    methods
        % Constructor
        function obj = muxnto1_nbit(nMOS_width,n_IN, n_bit)
            % Constructor of father class nand2
            obj = obj@nand2(nMOS_width);
            obj.N = n_IN;
            obj.bit_width = n_bit;
        end
        
        % Delay evaluation
        function [Tdp_HP_muxn, Tdp_LOP_muxn, Tdp_LSTP_muxn] = delay(obj)
            [Tdp_HP_nd2, Tdp_LOP_nd2, Tdp_LSTP_nd2] = delay@nand2(obj);
            % HP
            Tdp_HP_muxn = (2 * ceil(log2(obj.N)) + 1) * Tdp_HP_nd2; % [s]
            % LOP
            Tdp_LOP_muxn = (2 * ceil(log2(obj.N)) + 1) * Tdp_LOP_nd2; % [s]
            % LSTP
            Tdp_LSTP_muxn = (2 * ceil(log2(obj.N)) + 1) * Tdp_LSTP_nd2; % [s]
        end
        
        % Area evaluation
        function [A_HP_muxn, A_LOP_muxn, A_LSTP_muxn] = area(obj)
            [A_HP_nd2, A_LOP_nd2, A_LSTP_nd2] = area@nand2(obj);
            % HP
            A_HP_muxn = ((obj.N - 1) * obj.bit_width + ceil(log2(obj.N))) * A_HP_nd2; % [um^2]
            % LOP
            A_LOP_muxn = ((obj.N - 1) * obj.bit_width + ceil(log2(obj.N))) * A_LOP_nd2; % [um^2]
            % LSTP
            A_LSTP_muxn = ((obj.N - 1) * obj.bit_width + ceil(log2(obj.N))) * A_LSTP_nd2; % [um^2]
        end
        
        % Dynamic power evaluation
        function [Pdyn_HP_muxn, Pdyn_LOP_muxn, Pdyn_LSTP_muxn] = power_dyn(obj)
            [Pdyn_HP_nd2, Pdyn_LOP_nd2, Pdyn_LSTP_nd2] = power_dyn@nand2(obj);
            % HP
            Pdyn_HP_muxn = ((obj.N - 1) * obj.bit_width + ceil(log2(obj.N))) * Pdyn_HP_nd2; % [W]
            % LOP
            Pdyn_LOP_muxn = ((obj.N - 1) * obj.bit_width + ceil(log2(obj.N))) * Pdyn_LOP_nd2; % [W]
            % LSTP
            Pdyn_LSTP_muxn = ((obj.N - 1) * obj.bit_width + ceil(log2(obj.N))) * Pdyn_LSTP_nd2; % [W]
        end
        
        % Static power evaluation
        function [Pstat_HP_muxn, Pstat_LOP_muxn, Pstat_LSTP_muxn] = power_stat(obj)
            [Pstat_HP_nd2, Pstat_LOP_nd2, Pstat_LSTP_nd2] = power_stat@nand2(obj);
            % HP
            Pstat_HP_muxn = ((obj.N - 1) * obj.bit_width + ceil(log2(obj.N))) * Pstat_HP_nd2; % [W]
            % LOP
            Pstat_LOP_muxn = ((obj.N - 1) * obj.bit_width + ceil(log2(obj.N))) * Pstat_LOP_nd2; % [W]
            % LSTP 
            Pstat_LSTP_muxn = ((obj.N - 1) * obj.bit_width + ceil(log2(obj.N))) * Pstat_LSTP_nd2; % [W]
        end
        
    end
end

