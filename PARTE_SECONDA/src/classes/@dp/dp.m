classdef dp < nand2
    % dp class describes the complete datapath that realizes an accelerator
    % for a ternary weight quantized neural network .
	% Everything is obtained with nand2 gates,
    % thus the class inherits properties and methods from father class
    % nand2. The class describes the circuit in terms of delay,power and
    % area. It starts from technological parameters of HP, LOP and LSTP
    % devices, present in IRDS 2010. The user need to specify the pull-down
    % width Wn, followed by the input parallelism (activation bits), the bit growth of data
    % the size of the array and the size of the kernel. The class models the corresponding dp.vhd
    % component.
   
    properties
        N {mustBeInteger}; % activation bits
        BG {mustBeInteger}; % bit growth
        W  {mustBeInteger}; % array size
        K {mustBeInteger}; % kernel size
        act_lb; % act_lb_class object
        act_buffer; % act_buffer object
        npu; % npu object
        ppu; % ppu object
        cnt3; % countern on 3 bits object
        cnt4; % countern on 4 bits object
        addr_gen12; % addr_gen_class on 12 bits object
        addr_gen10; % addr_gen_class on 10 bits object
        addr_gen_o_ctrl; % addr_gen_o_ctrl object
        reg4; % register on 4 bits object
        reg10; % register on 10 bits object
        reg3; % register on 3 bits object
        reg2; % register on 2 bits object
        reg1; % register on 1 bit object
        add10; % rca on 10 bits object
        add5; % rca on 5 bits object
        mux8_1; % mux8to1 on 1 bits object
        mux4_1; % mux4to1 on 1 bits object
        mux2_3; % mux2to1 on 3 bits object
        mux2_7; % mux2to1 on 7 bits object
        mux2_10; % mux2to1 on 10 bits object
        mux2_32; % mux2to1 on 32 bits object
        mux2_5; % mux2to1 on 5 bits object
        nand3; % nandn on 3 bits object
        or_gate; % or2  object
    end
    
    methods
        % Constructor
        function obj = dp(nMOS_width, n_bit, bit_growth, array_size, kernel_size)
            % Constructor of father class nand2
            obj                     = obj@nand2(nMOS_width);
            obj.N                   = n_bit;
            obj.BG                  = bit_growth;
            obj.W                   = array_size;
            obj.K                   = kernel_size;
            obj.act_lb              = act_lb_class(nMOS_width, n_bit, array_size); 		
            obj.act_buffer          = act_buffer(nMOS_width, n_bit, kernel_size,array_size);
            obj.npu                 = npu(nMOS_width, n_bit, bit_growth, array_size); 			
            obj.ppu                 = ppu(nMOS_width, n_bit, bit_growth, array_size); 			
            obj.cnt3                = countern(nMOS_width, 3); 			
            obj.cnt4                = countern(nMOS_width, 4);			
            obj.addr_gen12          = addr_gen_class(nMOS_width, 12); 	
            obj.addr_gen10          = addr_gen_class(nMOS_width, 10); 	
            obj.addr_gen_o_ctrl     = addr_gen_o_ctrl(nMOS_width);
            obj.reg4                = register(nMOS_width, 4); 			
            obj.reg10               = register(nMOS_width, 10); 				
            obj.reg3                = register(nMOS_width, 3); 			
            obj.reg2                = register(nMOS_width, 2); 			
            obj.reg1                = register(nMOS_width, 1); 			
            obj.add10               = rca(nMOS_width, 10); 			
            obj.add5                = rca(nMOS_width, 5); 			
            obj.mux8_1              = muxnto1_nbit(nMOS_width, 8, 1); 		
            obj.mux4_1              = muxnto1_nbit(nMOS_width, 4, 1); 		
            obj.mux2_3              = muxnto1_nbit(nMOS_width, 2, 3); 		
            obj.mux2_7              = muxnto1_nbit(nMOS_width, 2, 7); 		
            obj.mux2_10             = muxnto1_nbit(nMOS_width, 2, 10); 		
            obj.mux2_32             = muxnto1_nbit(nMOS_width, 2, 32); 		
            obj.mux2_5              = muxnto1_nbit(nMOS_width, 2, 5); 		
            obj.nand3               = nandn(nMOS_width,3); 	 		
            obj.or_gate             = or2(nMOS_width); 		
        end
        
        % Delay evaluation
        function [Tdp_HP_dp, Tdp_LOP_dp, Tdp_LSTP_dp] = delay(obj)
            [Tdp_HP_addr_gen10, Tdp_LOP_addr_gen10, Tdp_LSTP_addr_gen10]   = obj.addr_gen10.delay;
            [Tdp_HP_add5,       Tdp_LOP_add5,       Tdp_LSTP_add5]         = obj.add5.delay;
            [Tdp_HP_add10,      Tdp_LOP_add10,      Tdp_LSTP_add10]        = obj.add10.delay;
            [Tdp_HP_mux2_5,     Tdp_LOP_mux2_5,     Tdp_LSTP_mux2_5]       = obj.mux2_5.delay;
            [Tdp_HP_mux2_10,    Tdp_LOP_mux2_10,    Tdp_LSTP_mux2_10]      = obj.mux2_10.delay;
            [Tdp_HP_npu,        Tdp_LOP_npu,        Tdp_LSTP_npu]          = obj.npu.delay;
            % HP
            Tdp_HP_dp      = max(Tdp_HP_add5 + Tdp_HP_mux2_5 + Tdp_HP_addr_gen10, ...
                max(Tdp_HP_add10 + 3*Tdp_HP_mux2_10, Tdp_HP_npu)); % [s]
            % LOP
            Tdp_LOP_dp      = max(Tdp_LOP_add5 + Tdp_LOP_mux2_5 + Tdp_LOP_addr_gen10, ...
                max(Tdp_LOP_add10 + 3*Tdp_LOP_mux2_10, Tdp_LOP_npu)); % [s]
            % LSTP
            Tdp_LSTP_dp      = max(Tdp_LSTP_add5 + Tdp_LSTP_mux2_5 + Tdp_LSTP_addr_gen10, ...
                max(Tdp_LSTP_add10 + 3*Tdp_LSTP_mux2_10, Tdp_LSTP_npu)); % [s]
		end
		
		% Area evaluation
        function [A_HP_dp, A_LOP_dp, A_LSTP_dp] = area(obj)
            [A_HP_act_lb,          A_LOP_act_lb,          A_LSTP_act_lb]            = obj.act_lb.area;
            [A_HP_act_buffer,      A_LOP_act_buffer,      A_LSTP_act_buffer]        = obj.act_buffer.area;
            [A_HP_npu,             A_LOP_npu,             A_LSTP_npu]               = obj.npu.area;
            [A_HP_ppu,             A_LOP_ppu,             A_LSTP_ppu]               = obj.ppu.area;
            [A_HP_cnt3,            A_LOP_cnt3,            A_LSTP_cnt3]              = obj.cnt3.area;
            [A_HP_cnt4,            A_LOP_cnt4,            A_LSTP_cnt4]              = obj.cnt4.area;
            [A_HP_addr_gen12,      A_LOP_addr_gen12,      A_LSTP_addr_gen12]        = obj.addr_gen12.area;
            [A_HP_addr_gen10,      A_LOP_addr_gen10,      A_LSTP_addr_gen10]        = obj.addr_gen10.area;
            [A_HP_addr_gen_o_ctrl, A_LOP_addr_gen_o_ctrl, A_LSTP_addr_gen_o_ctrl]   = obj.addr_gen_o_ctrl.area;
            [A_HP_reg4,            A_LOP_reg4,            A_LSTP_reg4]              = obj.reg4.area;
            [A_HP_reg10,           A_LOP_reg10,           A_LSTP_reg10]             = obj.reg10.area;
            [A_HP_reg3,            A_LOP_reg3,            A_LSTP_reg3]              = obj.reg3.area;
            [A_HP_reg2,            A_LOP_reg2,            A_LSTP_reg2]              = obj.reg2.area;
            [A_HP_reg1,            A_LOP_reg1,            A_LSTP_reg1]              = obj.reg1.area;
            [A_HP_add5,            A_LOP_add5,            A_LSTP_add5]              = obj.add5.area;
            [A_HP_add10,           A_LOP_add10,           A_LSTP_add10]             = obj.add10.area;
            [A_HP_mux8_1,          A_LOP_mux8_1,          A_LSTP_mux8_1]            = obj.mux8_1.area;
            [A_HP_mux4_1,          A_LOP_mux4_1,          A_LSTP_mux4_1]            = obj.mux4_1.area;
            [A_HP_mux2_3,          A_LOP_mux2_3,          A_LSTP_mux2_3]            = obj.mux2_3.area;
            [A_HP_mux2_7,          A_LOP_mux2_7,          A_LSTP_mux2_7]            = obj.mux2_7.area;
            [A_HP_mux2_10,         A_LOP_mux2_10,         A_LSTP_mux2_10]           = obj.mux2_10.area;
            [A_HP_mux2_32,         A_LOP_mux2_32,         A_LSTP_mux2_32]           = obj.mux2_32.area;
            [A_HP_mux2_5,          A_LOP_mux2_5,          A_LSTP_mux2_5]            = obj.mux2_5.area;
            [A_HP_nand3,           A_LOP_nand3,           A_LSTP_nand3]             = obj.nand3.area;
            [A_HP_nd2,             A_LOP_nd2,             A_LSTP_nd2]               = area@nand2(obj);
            [A_HP_or,              A_LOP_or,              A_LSTP_or]                = obj.or_gate.area;
            % HP
            A_HP_dp    = A_HP_act_lb + A_HP_act_buffer + A_HP_npu + A_HP_ppu + ...
                3*A_HP_cnt3 + 5*A_HP_cnt4 + A_HP_addr_gen12 + 2*A_HP_addr_gen10 + ...
                A_HP_addr_gen_o_ctrl + A_HP_reg4 + 3*A_HP_reg10 + 3*A_HP_reg3 + ...
                A_HP_reg2 + 11*A_HP_reg1 + 3*A_HP_add10 + A_HP_add5 + 4*A_HP_mux8_1 + ...
                2*A_HP_mux4_1 + A_HP_mux2_3 + 2*A_HP_mux2_7 + 8*A_HP_mux2_10 + ...
                A_HP_mux2_32 + A_HP_mux2_5 + 2*A_HP_nand3 + 16*A_HP_nd2 + A_HP_or; % [um^2]
            % LOP
            A_LOP_dp    = A_LOP_act_lb + A_LOP_act_buffer + A_LOP_npu + A_LOP_ppu + ...
                3*A_LOP_cnt3 + 5*A_LOP_cnt4 + A_LOP_addr_gen12 + 2*A_LOP_addr_gen10 + ...
                A_LOP_addr_gen_o_ctrl + A_LOP_reg4 + 3*A_LOP_reg10 + 3*A_LOP_reg3 + ...
                A_LOP_reg2 + 11*A_LOP_reg1 + 3*A_LOP_add10 + A_LOP_add5 + 4*A_LOP_mux8_1 + ...
                2*A_LOP_mux4_1 + A_LOP_mux2_3 + 2*A_LOP_mux2_7 + 8*A_LOP_mux2_10 + ...
                A_LOP_mux2_32 + A_LOP_mux2_5 + 2*A_LOP_nand3 + 16*A_LOP_nd2 + A_LOP_or; % [um^2]
            % LSTP
            A_LSTP_dp    = A_LSTP_act_lb + A_LSTP_act_buffer + A_LSTP_npu + A_LSTP_ppu + ...
                3*A_LSTP_cnt3 + 5*A_LSTP_cnt4 + A_LSTP_addr_gen12 + 2*A_LSTP_addr_gen10 + ...
                A_LSTP_addr_gen_o_ctrl + A_LSTP_reg4 + 3*A_LSTP_reg10 + 3*A_LSTP_reg3 + ...
                A_LSTP_reg2 + 11*A_LSTP_reg1 + 3*A_LSTP_add10 + A_LSTP_add5 + 4*A_LSTP_mux8_1 + ...
                2*A_LSTP_mux4_1 + A_LSTP_mux2_3 + 2*A_LSTP_mux2_7 + 8*A_LSTP_mux2_10 + ...
                A_LSTP_mux2_32 + A_LSTP_mux2_5 + 2*A_LSTP_nand3 + 16*A_LSTP_nd2 + A_LSTP_or; % [um^2]
		end
        
		
        % Dynamic power evaluation
        function [Pdyn_HP_dp, Pdyn_LOP_dp, Pdyn_LSTP_dp] = power_dyn(obj)
			[Pdyn_HP_act_lb,          Pdyn_LOP_act_lb,          Pdyn_LSTP_act_lb]            = obj.act_lb.power_dyn;
            [Pdyn_HP_act_buffer,      Pdyn_LOP_act_buffer,      Pdyn_LSTP_act_buffer]        = obj.act_buffer.power_dyn;
            [Pdyn_HP_npu,             Pdyn_LOP_npu,             Pdyn_LSTP_npu]               = obj.npu.power_dyn;
            [Pdyn_HP_ppu,             Pdyn_LOP_ppu,             Pdyn_LSTP_ppu]               = obj.ppu.power_dyn;
            [Pdyn_HP_cnt3,            Pdyn_LOP_cnt3,            Pdyn_LSTP_cnt3]              = obj.cnt3.power_dyn;
            [Pdyn_HP_cnt4,            Pdyn_LOP_cnt4,            Pdyn_LSTP_cnt4]              = obj.cnt4.power_dyn;
            [Pdyn_HP_addr_gen12,      Pdyn_LOP_addr_gen12,      Pdyn_LSTP_addr_gen12]        = obj.addr_gen12.power_dyn;
            [Pdyn_HP_addr_gen10,      Pdyn_LOP_addr_gen10,      Pdyn_LSTP_addr_gen10]        = obj.addr_gen10.power_dyn;
            [Pdyn_HP_addr_gen_o_ctrl, Pdyn_LOP_addr_gen_o_ctrl, Pdyn_LSTP_addr_gen_o_ctrl]   = obj.addr_gen_o_ctrl.power_dyn;
            [Pdyn_HP_reg4,            Pdyn_LOP_reg4,            Pdyn_LSTP_reg4]              = obj.reg4.power_dyn;
            [Pdyn_HP_reg10,           Pdyn_LOP_reg10,           Pdyn_LSTP_reg10]             = obj.reg10.power_dyn;
            [Pdyn_HP_reg3,            Pdyn_LOP_reg3,            Pdyn_LSTP_reg3]              = obj.reg3.power_dyn;
            [Pdyn_HP_reg2,            Pdyn_LOP_reg2,            Pdyn_LSTP_reg2]              = obj.reg2.power_dyn;
            [Pdyn_HP_reg1,            Pdyn_LOP_reg1,            Pdyn_LSTP_reg1]              = obj.reg1.power_dyn;
            [Pdyn_HP_add5,            Pdyn_LOP_add5,            Pdyn_LSTP_add5]              = obj.add5.power_dyn;
            [Pdyn_HP_add10,           Pdyn_LOP_add10,           Pdyn_LSTP_add10]             = obj.add10.power_dyn;
            [Pdyn_HP_mux8_1,          Pdyn_LOP_mux8_1,          Pdyn_LSTP_mux8_1]            = obj.mux8_1.power_dyn;
            [Pdyn_HP_mux4_1,          Pdyn_LOP_mux4_1,          Pdyn_LSTP_mux4_1]            = obj.mux4_1.power_dyn;
            [Pdyn_HP_mux2_3,          Pdyn_LOP_mux2_3,          Pdyn_LSTP_mux2_3]            = obj.mux2_3.power_dyn;
            [Pdyn_HP_mux2_7,          Pdyn_LOP_mux2_7,          Pdyn_LSTP_mux2_7]            = obj.mux2_7.power_dyn;
            [Pdyn_HP_mux2_10,         Pdyn_LOP_mux2_10,         Pdyn_LSTP_mux2_10]           = obj.mux2_10.power_dyn;
            [Pdyn_HP_mux2_32,         Pdyn_LOP_mux2_32,         Pdyn_LSTP_mux2_32]           = obj.mux2_32.power_dyn;
            [Pdyn_HP_mux2_5,          Pdyn_LOP_mux2_5,          Pdyn_LSTP_mux2_5]            = obj.mux2_5.power_dyn;
            [Pdyn_HP_nand3,           Pdyn_LOP_nand3,           Pdyn_LSTP_nand3]             = obj.nand3.power_dyn;
            [Pdyn_HP_nd2,             Pdyn_LOP_nd2,             Pdyn_LSTP_nd2]               = power_dyn@nand2(obj);
            [Pdyn_HP_or,              Pdyn_LOP_or,              Pdyn_LSTP_or]                = obj.or_gate.power_dyn;
            % HP
            Pdyn_HP_dp    = Pdyn_HP_act_lb + Pdyn_HP_act_buffer + Pdyn_HP_npu + Pdyn_HP_ppu + ...
                3*Pdyn_HP_cnt3 + 5*Pdyn_HP_cnt4 + Pdyn_HP_addr_gen12 + 2*Pdyn_HP_addr_gen10 + ...
                Pdyn_HP_addr_gen_o_ctrl + Pdyn_HP_reg4 + 3*Pdyn_HP_reg10 + 3*Pdyn_HP_reg3 + ...
                Pdyn_HP_reg2 + 11*Pdyn_HP_reg1 + 3*Pdyn_HP_add10 + Pdyn_HP_add5 + 4*Pdyn_HP_mux8_1 + ...
                2*Pdyn_HP_mux4_1 + Pdyn_HP_mux2_3 + 2*Pdyn_HP_mux2_7 + 8*Pdyn_HP_mux2_10 + ...
                Pdyn_HP_mux2_32 + Pdyn_HP_mux2_5 + 2*Pdyn_HP_nand3 + 16*Pdyn_HP_nd2 + Pdyn_HP_or; % [W]
            % LOP
            Pdyn_LOP_dp    = Pdyn_LOP_act_lb + Pdyn_LOP_act_buffer + Pdyn_LOP_npu + Pdyn_LOP_ppu + ...
                3*Pdyn_LOP_cnt3 + 5*Pdyn_LOP_cnt4 + Pdyn_LOP_addr_gen12 + 2*Pdyn_LOP_addr_gen10 + ...
                Pdyn_LOP_addr_gen_o_ctrl + Pdyn_LOP_reg4 + 3*Pdyn_LOP_reg10 + 3*Pdyn_LOP_reg3 + ...
                Pdyn_LOP_reg2 + 11*Pdyn_LOP_reg1 + 3*Pdyn_LOP_add10 + Pdyn_LOP_add5 + 4*Pdyn_LOP_mux8_1 + ...
                2*Pdyn_LOP_mux4_1 + Pdyn_LOP_mux2_3 + 2*Pdyn_LOP_mux2_7 + 8*Pdyn_LOP_mux2_10 + ...
                Pdyn_LOP_mux2_32 + Pdyn_LOP_mux2_5 + 2*Pdyn_LOP_nand3 + 16*Pdyn_LOP_nd2 + Pdyn_LOP_or; % [W]
            % LSTP
            Pdyn_LSTP_dp    = Pdyn_LSTP_act_lb + Pdyn_LSTP_act_buffer + Pdyn_LSTP_npu + Pdyn_LSTP_ppu + ...
                3*Pdyn_LSTP_cnt3 + 5*Pdyn_LSTP_cnt4 + Pdyn_LSTP_addr_gen12 + 2*Pdyn_LSTP_addr_gen10 + ...
                Pdyn_LSTP_addr_gen_o_ctrl + Pdyn_LSTP_reg4 + 3*Pdyn_LSTP_reg10 + 3*Pdyn_LSTP_reg3 + ...
                Pdyn_LSTP_reg2 + 11*Pdyn_LSTP_reg1 + 3*Pdyn_LSTP_add10 + Pdyn_LSTP_add5 + 4*Pdyn_LSTP_mux8_1 + ...
                2*Pdyn_LSTP_mux4_1 + Pdyn_LSTP_mux2_3 + 2*Pdyn_LSTP_mux2_7 + 8*Pdyn_LSTP_mux2_10 + ...
                Pdyn_LSTP_mux2_32 + Pdyn_LSTP_mux2_5 + 2*Pdyn_LSTP_nand3 + 16*Pdyn_LSTP_nd2 + Pdyn_LSTP_or; % [W]
		end
        
        % Static power evaluation
        function [Pstat_HP_dp, Pstat_LOP_dp, Pstat_LSTP_dp] = power_stat(obj)
			[Pstat_HP_act_lb,          Pstat_LOP_act_lb,          Pstat_LSTP_act_lb]            = obj.act_lb.power_stat;
            [Pstat_HP_act_buffer,      Pstat_LOP_act_buffer,      Pstat_LSTP_act_buffer]        = obj.act_buffer.power_stat;
            [Pstat_HP_npu,             Pstat_LOP_npu,             Pstat_LSTP_npu]               = obj.npu.power_stat;
            [Pstat_HP_ppu,             Pstat_LOP_ppu,             Pstat_LSTP_ppu]               = obj.ppu.power_stat;
            [Pstat_HP_cnt3,            Pstat_LOP_cnt3,            Pstat_LSTP_cnt3]              = obj.cnt3.power_stat;
            [Pstat_HP_cnt4,            Pstat_LOP_cnt4,            Pstat_LSTP_cnt4]              = obj.cnt4.power_stat;
            [Pstat_HP_addr_gen12,      Pstat_LOP_addr_gen12,      Pstat_LSTP_addr_gen12]        = obj.addr_gen12.power_stat;
            [Pstat_HP_addr_gen10,      Pstat_LOP_addr_gen10,      Pstat_LSTP_addr_gen10]        = obj.addr_gen10.power_stat;
            [Pstat_HP_addr_gen_o_ctrl, Pstat_LOP_addr_gen_o_ctrl, Pstat_LSTP_addr_gen_o_ctrl]   = obj.addr_gen_o_ctrl.power_stat;
            [Pstat_HP_reg4,            Pstat_LOP_reg4,            Pstat_LSTP_reg4]              = obj.reg4.power_stat;
            [Pstat_HP_reg10,           Pstat_LOP_reg10,           Pstat_LSTP_reg10]             = obj.reg10.power_stat;
            [Pstat_HP_reg3,            Pstat_LOP_reg3,            Pstat_LSTP_reg3]              = obj.reg3.power_stat;
            [Pstat_HP_reg2,            Pstat_LOP_reg2,            Pstat_LSTP_reg2]              = obj.reg2.power_stat;
            [Pstat_HP_reg1,            Pstat_LOP_reg1,            Pstat_LSTP_reg1]              = obj.reg1.power_stat;
            [Pstat_HP_add5,            Pstat_LOP_add5,            Pstat_LSTP_add5]              = obj.add5.power_stat;
            [Pstat_HP_add10,           Pstat_LOP_add10,           Pstat_LSTP_add10]             = obj.add10.power_stat;
            [Pstat_HP_mux8_1,          Pstat_LOP_mux8_1,          Pstat_LSTP_mux8_1]            = obj.mux8_1.power_stat;
            [Pstat_HP_mux4_1,          Pstat_LOP_mux4_1,          Pstat_LSTP_mux4_1]            = obj.mux4_1.power_stat;
            [Pstat_HP_mux2_3,          Pstat_LOP_mux2_3,          Pstat_LSTP_mux2_3]            = obj.mux2_3.power_stat;
            [Pstat_HP_mux2_7,          Pstat_LOP_mux2_7,          Pstat_LSTP_mux2_7]            = obj.mux2_7.power_stat;
            [Pstat_HP_mux2_10,         Pstat_LOP_mux2_10,         Pstat_LSTP_mux2_10]           = obj.mux2_10.power_stat;
            [Pstat_HP_mux2_32,         Pstat_LOP_mux2_32,         Pstat_LSTP_mux2_32]           = obj.mux2_32.power_stat;
            [Pstat_HP_mux2_5,          Pstat_LOP_mux2_5,          Pstat_LSTP_mux2_5]            = obj.mux2_5.power_stat;
            [Pstat_HP_nand3,           Pstat_LOP_nand3,           Pstat_LSTP_nand3]             = obj.nand3.power_stat;
            [Pstat_HP_nd2,             Pstat_LOP_nd2,             Pstat_LSTP_nd2]               = power_stat@nand2(obj);
            [Pstat_HP_or,              Pstat_LOP_or,              Pstat_LSTP_or]                = obj.or_gate.power_stat;
            % HP
            Pstat_HP_dp    = Pstat_HP_act_lb + Pstat_HP_act_buffer + Pstat_HP_npu + Pstat_HP_ppu + ...
                3*Pstat_HP_cnt3 + 5*Pstat_HP_cnt4 + Pstat_HP_addr_gen12 + 2*Pstat_HP_addr_gen10 + ...
                Pstat_HP_addr_gen_o_ctrl + Pstat_HP_reg4 + 3*Pstat_HP_reg10 + 3*Pstat_HP_reg3 + ...
                Pstat_HP_reg2 + 11*Pstat_HP_reg1 + 3*Pstat_HP_add10 + Pstat_HP_add5 + 4*Pstat_HP_mux8_1 + ...
                2*Pstat_HP_mux4_1 + Pstat_HP_mux2_3 + 2*Pstat_HP_mux2_7 + 8*Pstat_HP_mux2_10 + ...
                Pstat_HP_mux2_32 + Pstat_HP_mux2_5 + 2*Pstat_HP_nand3 + 16*Pstat_HP_nd2 + Pstat_HP_or; % [W]
            % LOP
            Pstat_LOP_dp    = Pstat_LOP_act_lb + Pstat_LOP_act_buffer + Pstat_LOP_npu + Pstat_LOP_ppu + ...
                3*Pstat_LOP_cnt3 + 5*Pstat_LOP_cnt4 + Pstat_LOP_addr_gen12 + 2*Pstat_LOP_addr_gen10 + ...
                Pstat_LOP_addr_gen_o_ctrl + Pstat_LOP_reg4 + 3*Pstat_LOP_reg10 + 3*Pstat_LOP_reg3 + ...
                Pstat_LOP_reg2 + 11*Pstat_LOP_reg1 + 3*Pstat_LOP_add10 + Pstat_LOP_add5 + 4*Pstat_LOP_mux8_1 + ...
                2*Pstat_LOP_mux4_1 + Pstat_LOP_mux2_3 + 2*Pstat_LOP_mux2_7 + 8*Pstat_LOP_mux2_10 + ...
                Pstat_LOP_mux2_32 + Pstat_LOP_mux2_5 + 2*Pstat_LOP_nand3 + 16*Pstat_LOP_nd2 + Pstat_LOP_or; % [W]
            % LSTP
            Pstat_LSTP_dp    = Pstat_LSTP_act_lb + Pstat_LSTP_act_buffer + Pstat_LSTP_npu + Pstat_LSTP_ppu + ...
                3*Pstat_LSTP_cnt3 + 5*Pstat_LSTP_cnt4 + Pstat_LSTP_addr_gen12 + 2*Pstat_LSTP_addr_gen10 + ...
                Pstat_LSTP_addr_gen_o_ctrl + Pstat_LSTP_reg4 + 3*Pstat_LSTP_reg10 + 3*Pstat_LSTP_reg3 + ...
                Pstat_LSTP_reg2 + 11*Pstat_LSTP_reg1 + 3*Pstat_LSTP_add10 + Pstat_LSTP_add5 + 4*Pstat_LSTP_mux8_1 + ...
                2*Pstat_LSTP_mux4_1 + Pstat_LSTP_mux2_3 + 2*Pstat_LSTP_mux2_7 + 8*Pstat_LSTP_mux2_10 + ...
                Pstat_LSTP_mux2_32 + Pstat_LSTP_mux2_5 + 2*Pstat_LSTP_nand3 + 16*Pstat_LSTP_nd2 + Pstat_LSTP_or; % [W]
        end 
    end
end

