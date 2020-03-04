function end_wallace_VHDL(mat,height)
%END_WALLACE_VHDL set outputs of the VHDL wallace tree implementation
%   END_WALLACE_VHDL(mat,height,VHDL_file) inputs:
%           mat         => final 2 rows dots matrix
%           height      => final height of the tree (without the last 2 rows)

VHDL_file=fopen('wallace.vhd','a'); % append text to 'wallace.vhd'

index_add1=0;   % bit index of the first output to be added
index_add2=0;   % bit index of the second output to be added
index_res=0;    % bit index of the available part of the addition result
flag=0; % if '1' indicates the starting point for the final 2 rows adder

for j=1:size(mat,2)
    l=find(mat(:,(size(mat,2)-(j-1))));
    if and(length(l)==1,flag==0)    % set bits of the available result
            fprintf(VHDL_file,'res(%d)<=p(%d)(%d);\n',index_res,height,j-1);
            index_res=index_res+1;
    elseif length(l)==2    % set bits to be added by the external 2 row adder
            flag=1; % data to the external 2 row adder
            fprintf(VHDL_file,'add1(%d)<=p(%d)(%d);\n',index_add1,height,j-1);
            fprintf(VHDL_file,'add2(%d)<=p(%d)(%d);\n',index_add2,height+1,j-1);
            index_add1=index_add1+1;    % increment bit index of the first addend
            index_add2=index_add2+1;    % increment bit index of the second addend
    elseif and(length(l)==1,flag==1)   % set bit to be added by the external 2 row adder
                if l==1 % set bit to addend 1
                    fprintf(VHDL_file,'add%d(%d)<=p(%d)(%d);\n',1,index_add1,height,j-1);
                    index_add1=index_add1+1;
                else    % set bit to addend 2
                    fprintf(VHDL_file,'add%d(%d)<=p(%d)(%d);\n',2,index_add2,height+1,j-1);
                    index_add2=index_add2+1;
                end
    end
end

% Write end of the VHDL file
fprintf(VHDL_file,'end architecture behavioural;\n');
fclose(VHDL_file);

% Define the output of the VHDL implementation
% Read VHDL file in A
fp=fopen('wallace.vhd','r');
i=1;
tline=fgetl(fp);
A{i}=tline;
while ischar(tline)
    i=i+1;
    tline=fgetl(fp);
    A{i}=tline;
end
fclose(fp);

% Update A with outputs
A{8}=sprintf('\t\tadd1:OUT std_logic_vector(%d downto 0);',index_add1-1);
A{9}=sprintf('\t\tadd2:OUT std_logic_vector(%d downto 0);',index_add2-1);
A{10}=sprintf('\t\tres:OUT std_logic_vector(%d downto 0));',index_res-1);

% Write A to the VHDL file
fp=fopen('wallace.vhd','w');
for i = 1:numel(A)
        if A{i+1} == -1
             fprintf(fp,'%s', A{i});
             break
        else
             fprintf(fp,'%s\n', A{i});
        end
end
end
