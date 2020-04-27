classdef classe_prova
    % Constant values Constant is an attribute, another attributes is : 
    % (SetAccess = private), the defined variables will be read-only and it
    % is written only by the constructor.
    properties (Constant)
        a = 5
    end
    % Variables
    properties
       b {mustBeNumeric}
    end
    
    methods
        % Constructor
        function obj = classe_prova(val_b)
            obj.b = val_b;
        end
        % Comb_lin function : a*in+b
        function r = comb_lin(obj,in)
           r = obj.a*in + obj.b; 
        end
    end
    
    
end
