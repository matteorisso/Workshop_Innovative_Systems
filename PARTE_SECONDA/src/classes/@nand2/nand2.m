classdef nand2
    % nand2 class describes the elementary gate NAND2 in terms of
    % delay,power and area. It starts from technological parameters of HP,
    % LOP and LSTP devices, present in IRDS 2010.
    % The user need to specify the pull-down width Wn.
    
    % NOTA : HO USATO VALORI E FUNZIONI BASATE SUL MULTIPLEXER FORNITO, DA
    % CAPIRE SE E' OK.
    
    properties (Constant)
        % Permittivity
        eps_0               = 8.854187e-12*1e-9; % [F/nm]
        eps_SiO2            = 3.9*8.854187e-12*1e-9; % [F/nm]

        % Fringe capacitances
        fring_capHP2010     = 1.5e-16*1e-3; % [F/nm]
        fring_capLOP2010    = 2.2e-16*1e-3; % [F/nm]
        fring_capLSTP2010   = 2.4e-16*1e-3; % [F/nm]

        % Oxide thickness
        Tox_HP2010          = 0.65; % [nm]
        Tox_LOP2010         = 0.9; % [nm]
        Tox_LSTP2010        = 1.4; % [nm]

        % Channel length
        L_HP2010            = 18; % [nm]
        L_LOP2010           = 22; % [nm]
        L_LSTP2010          = 28; % [nm]

        % Voltage source
        VDD_HP2010          = 1; % [V]
        VDD_LOP2010         = 0.7; % [V]
        VDD_LSTP2010        = 1.1; % [V]
        
        % Area parameters
        interc_override     = 0.15; % override estimation : 15%
        lambda              = 1;
        
        % Power HP (FO4) data from HP_2010.m
        Pstat_HP_FO4        = 1.8287e-04;		% [W]
        Pdyn_HP_FO4         = 2.1343e-06;		% [W]
        
        % Power LOP (FO4) data from LOP_2010.m
        Pstat_LOP_FO4       = 1.8064e-06;		% [W]
        Pdyn_LOP_FO4        = 8.1353e-07;		% [W]

        % Power LSTP (FO4) data from LSTP_2010.m
        Pstat_LSTP_FO4      = 1.02421e-7;	% [W]
        Pdyn_LSTP_FO4       = 1.242597e-6;	% [W]
        
    end
    
    properties (SetAccess = private)
        
        % HP paramaters
        Vth_nHP;
        Vth_pHP; 
        Ioff_nHP; 
        Ioff_pHP; 
        Igate_nHP; 
        Igate_pHP;
        I_nMOSHP;
        I_pMOSHP; 
        e0;
        C_nd2_HP;
        
        % LOP parameters
        Vth_nLOP;
        Vth_pLOP; 
        Ioff_nLOP; 
        Ioff_pLOP; 
        Igate_nLOP; 
        Igate_pLOP;
        I_nMOSLOP; 
        I_pMOSLOP;
        C_nd2_LOP;
        
        % LSTP parameters
        Vth_nLSTP;
        Vth_pLSTP; 
        Ioff_nLSTP; 
        Ioff_pLSTP; 
        Igate_nLSTP; 
        Igate_pLSTP;
        I_nMOSLSTP; 
        I_pMOSLSTP;
        C_nd2_LSTP;
    end
    
    % User defined
    properties
       Wn {mustBeNumeric}; % [nm]
       Wp {mustBeNumeric}; % [nm]
    end
    
    methods
        % Constructor
        function obj = nand2(nMOS_width)
            % Pull-down width
            obj.Wn = nMOS_width;
            % Pull-up width
            obj.Wp = 1.29*obj.Wn;
            % HP
            [obj.Vth_nHP, obj.Vth_pHP, obj.Ioff_nHP, obj.Ioff_pHP, obj.Igate_nHP, obj.Igate_pHP] ...
                = obj.Mastar4_Vth_Ioff_IgHP2010();
            [obj.I_nMOSHP, obj.I_pMOSHP, obj.e0] ...
                = obj.Ion_Mastar_modelHP2010(obj.Vth_nHP); % [uA/um]
            obj.C_nd2_HP ...
                = 13.74 * (obj.eps_SiO2*obj.L_HP2010/obj.Tox_HP2010 + obj.fring_capHP2010 ...
                + 0.2*obj.eps_SiO2*obj.L_HP2010/obj.Tox_HP2010)*obj.Wn; % [F]
            % LOP
            [obj.Vth_nLOP, obj.Vth_pLOP, obj.Ioff_nLOP, obj.Ioff_pLOP, obj.Igate_nLOP, obj.Igate_pLOP] ...
                = obj.Mastar4_Vth_Ioff_IgLOP2010();
            [obj.I_nMOSLOP, obj.I_pMOSLOP] ...
                = obj.Ion_Mastar_modelLOP2010(obj.Vth_nLOP); % [uA/um]
            obj.C_nd2_LOP ...
                = 13.74 * (obj.eps_SiO2*obj.L_LOP2010/obj.Tox_LOP2010 + obj.fring_capLOP2010 ...
                + 0.2*obj.eps_SiO2*obj.L_LOP2010/obj.Tox_LOP2010)*obj.Wn; % [F]
            % LSTP
            [obj.Vth_nLSTP, obj.Vth_pLSTP, obj.Ioff_nLSTP, obj.Ioff_pLSTP, obj.Igate_nLSTP, obj.Igate_pLSTP] ...
                = obj.Mastar4_Vth_Ioff_IgLSTP2010();
            [obj.I_nMOSLSTP, obj.I_pMOSLSTP] ...
                = obj.Ion_Mastar_modelLSTP2010(obj.Vth_nLSTP); % [uA/um]
            obj.C_nd2_LSTP ...
                = 13.74 * (obj.eps_SiO2 * obj.L_LSTP2010 / obj.Tox_LSTP2010 + obj.fring_capLSTP2010 ...
                + 0.2 * obj.eps_SiO2 * obj.L_LSTP2010 / obj.Tox_LSTP2010) * obj.Wn; % [F]
        end
        
        % Delay evaluation
        function [Tdp_HP_nd2, Tdp_LOP_nd2, Tdp_LSTP_nd2] = delay(obj)
            % HP
            Tdp_HP_nd2      ...
                =  obj.C_nd2_HP * obj.VDD_HP2010 / (obj.I_pMOSHP * obj.Wp * 1e-3 * 1e-6); % [s]
            % LOP
            Tdp_LOP_nd2     ...
                = obj.C_nd2_LOP * obj.VDD_LOP2010 /(obj.I_pMOSLOP * obj.Wp * 1e-3 * 1e-6); % [s]
            % LSTP
            Tdp_LSTP_nd2    ...
                = obj.C_nd2_LSTP * obj.VDD_LSTP2010 / (obj.I_pMOSLSTP * obj.Wp * 1e-3 * 1e-6); % [s]
        end
        
        % Area evaluation
        function [A_HP_nd2, A_LOP_nd2, A_LSTP_nd2] = area(obj)
           % HP
           A_HP_nd2 ...
               = 2 * (obj.Wn + obj.Wp) * (obj.L_HP2010 * (1 + 2 * obj.lambda)) ...
               * (1 + obj.interc_override) * 1e-6; % [um^2]
           % LOP
           A_LOP_nd2 ...
               = 2 * (obj.Wn + obj.Wp) * (obj.L_LOP2010 * (1 + 2 * obj.lambda)) ...
               * (1 + obj.interc_override) * 1e-6; % [um^2]
           % LSTP
           A_LSTP_nd2 ...
               = 2 * (obj.Wn + obj.Wp) * (obj.L_LSTP2010 * (1 + 2 * obj.lambda)) ...
               * (1 + obj.interc_override) * 1e-6; % [um^2]
        end
        
        % Dynamic power evaluation
        function [Pdyn_HP_nd2, Pdyn_LOP_nd2, Pdyn_LSTP_nd2] = power_dyn(obj)
            % HP
            Pdyn_HP_nd2 ....
                = obj.Pdyn_HP_FO4; % [W]
            % LOP
            Pdyn_LOP_nd2 ...
                = obj.Pdyn_LOP_FO4; % [W]
            % LSTP
            Pdyn_LSTP_nd2 ...
                = obj.Pdyn_LSTP_FO4; % [W]
        end
        
        % Static power evaluation
        function [Pstat_HP_nd2, Pstat_LOP_nd2, Pstat_LSTP_nd2] = power_stat(obj)
            % HP
            Pstat_HP_nd2 ...
                = obj.Pstat_HP_FO4; % [W]
            % LOP
            Pstat_LOP_nd2 ...
                = obj.Pstat_LOP_FO4; % [W]
            % LSTP
            Pstat_LSTP_nd2 ...
                = obj.Pstat_LSTP_FO4; % [W]
        end
        
    end
    
    % External functions
    methods (Static)
        % HP
        [Vth_nHP, Vth_pHP, Ioff_nHP, Ioff_pHP, Igate_nHP, Igate_pHP] = ....
            Mastar4_Vth_Ioff_IgHP2010();
        [I_nMOSHP, I_pMOSHP, e0] ...
            = Ion_Mastar_modelHP2010(Vth_nHP); %uA/um 
        % LOP
        [Vth_nLOP, Vth_pLOP, Ioff_nLOP, Ioff_pLOP, Igate_nLOP, Igate_pLOP] = ....
            Mastar4_Vth_Ioff_IgLOP2010();
        [I_nMOSLOP, I_pMOSLOP] ...
            = Ion_Mastar_modelLOP2010(Vth_nLOP); %uA/um 
        % LSTP
        [Vth_nLSTP, Vth_pLSTP, Ioff_nLSTP, Ioff_pLSTP, Igate_nLSTP, Igate_pLSTP] = ...
            Mastar4_Vth_Ioff_IgLSTP2010();
        [I_nMOSLSTP, I_pMOSLSTP] ...
            = Ion_Mastar_modelLSTP2010(Vth_nLSTP); %uA/um
    end
    
end

