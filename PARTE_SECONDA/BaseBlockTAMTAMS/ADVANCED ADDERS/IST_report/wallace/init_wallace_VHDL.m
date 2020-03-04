function init_wallace_VHDL(n,k,length,radix)
%INIT_WALLACE_VHDL Initialize VHDL description of the wallace tree.
%    INIT_WALLACE_VHDL(n,k,lenght,radix) inputs: 
%           n      => number of bits per operand
%           k      => number of operands
%           length => number of column of the dot matrix
%           radix  => radix of the multiplier using the wallace tree to add
%                      partial products

k_init=k;   % number of operands
fp=fopen('wallace.vhd','w');    % open VHDL file

% Library and entity initilization
fprintf(fp,['library IEEE;\nuse IEEE.std_logic_1164.ALL;\n\n',...
    'entity wallace is\n\tport(\n\t\t']);
for i=1:k-1
    fprintf(fp,'in%d,',i-1);    % inputs printing
end

% Entity body and architecture definition
fprintf(fp,['in%d:IN std_logic_vector (%d downto 0);\nclock,reset: IN std_logic;\n\n\n\t);\n',...
    'end wallace;\n\n',...
    'architecture behavioural of wallace is\n'...
    'component HAff is\n\t port(\n\t\tx,y,clock,reset:IN std_logic;\n\t\ts,c:OUT std_logic\n\t);\nend component;\n',...   % Half Adder component definition
    'component FAff is\n\tport(\n\t\tcin,x,y,clock,reset:IN std_logic;\n\t\ts,cout:OUT std_logic\n\t);\nend component;\n'...
    'component HA is\n\t port(\n\t\tx,y:IN std_logic;\n\t\ts,c:OUT std_logic\n\t);\nend component;\n',...   % Half Adder component definition
    'component FA is\n\tport(\n\t\tcin,x,y:IN std_logic;\n\t\ts,cout:OUT std_logic\n\t);\nend component;\n\n'],k-1,n-1);    % Full Adder component definition

height=0; % height of the final tree. This is needed to define the internal signals used to connect inputs, outputs, HAs and FAs
while k>2
    height=height+k;
    k=ceil(k*2/3);
end

% Array type definition: n rows = height of the tree, n columns= lenght of
% the 'mat' matrix
fprintf(fp,['type bidimensional is array (0 to %d) of std_logic_vector(%d downto 0);\n',...
     'signal p:bidimensional;\nbegin\n'],height+1,length-1);
 
% Input assignment to internal signals
for i=1:k_init
    fprintf(fp,'\tp(%d)(%d downto %d)<=in%d;\n',i-1,n-1+floor(log2(radix))*(i-1),floor(log2(radix))*(i-1),i-1);
end

end
