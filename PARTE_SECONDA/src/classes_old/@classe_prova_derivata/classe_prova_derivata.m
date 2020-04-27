classdef classe_prova_derivata < classe_prova
    % Constant values
    properties (Constant)
        c = 10
    end
    % Variables
    properties
       d {mustBeNumeric}
       Vth_n
       Vth_p
       Ioff_n 
       Ioff_p 
       Igate_n 
       Igate_p
    end
    
    methods
        % Constructor
        function obj = classe_prova_derivata(val_b,val_d)
            obj = obj@classe_prova(val_b);
            obj.d = val_d;
            [obj.Vth_n,obj.Vth_p,obj.Ioff_n,obj.Ioff_p,obj.Igate_n,obj.Igate_p]=obj.Mastar4_Vth_Ioff_IgHP2010();
        end
        % prod function : c*d
        function r = prod(obj)
           r = obj.c*obj.d; 
        end
        
    end
    
    methods (Static)
       % external func
        [Vth_n,Vth_p, Ioff_n, Ioff_p, Igate_n, Igate_p]= Mastar4_Vth_Ioff_IgHP2010(); 
    end
    
end
