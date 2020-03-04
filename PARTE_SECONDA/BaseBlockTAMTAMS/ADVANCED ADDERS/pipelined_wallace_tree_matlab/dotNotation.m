function [new_origin,old_origin] = dotNotation(mat,new_origin,s_matrix,old_origin)  
% DOTNOTATION returns a FidoCadJ code to show the tree using dot notation.
% FAs are represented as solid 3 dots blocks and HAs are represented as dashed 2 dots blocks.
%	DOTNOTATION(mat,new_origin,s_matrix,old_origin) inputs:
%           mat         => current dots matrix
%			new_origin	=> next step starting point for the FidoCadJ drawing
%			s_matrix	=> matrix of s vectors (3 -> full adder, 2 -> half adder, 1 -> dot to be moved to the next stage)
%			old_origin	=> current step starting point for the FidoCadJ drawing

[n_row, n_column]=size(mat);
fp=fopen('code_fidoCadJ.fcd','a');

for i=1:size(s_matrix,1)
    for j=1:size(s_matrix,2)
        if s_matrix(i,size(s_matrix,2)-j+1)>1	%to detect full adder and half adder and to put the blocks
            fprintf(fp,'RV ');	%FidoCadJ code
            fprintf(fp,'%d ',old_origin(1)-10*(j-1)-3);
            fprintf(fp,'%d ',(old_origin(2)+30*(i-1)-5));
            fprintf(fp,'%d ',old_origin(1)-10*(j-1)+3);
            fprintf(fp,'%d ',(old_origin(2)+30*(i-1)-5+30));
            fprintf(fp,'%d\n', ones);
            if s_matrix(i,size(s_matrix,2)-j+1)==2	%if it's a half adder->dot line for block
                fprintf(fp,'FCJ 2 0\n');
            end
        end
    end
end

old_origin=new_origin;

for i=1:n_row
    for j=1:n_column
        if mat(i,n_column-j+1)>0
            fprintf(fp,'SA ');	%generation of the new dot matrix
            fprintf(fp,'%d ', new_origin(1)-10*(j-1));
            fprintf(fp,'%d ', (new_origin(2)+10*(i-1)));
            fprintf(fp,'%d\n', zeros);            
        end
    end
end
fprintf(fp,'LI ');	%line between two steps
fprintf(fp,'%d ', new_origin(1)-10*(n_column-1));
fprintf(fp,'%d ', (new_origin(2)+10*n_row));
fprintf(fp,'%d ', new_origin(1)+5);
fprintf(fp,'%d ', (new_origin(2)+10*n_row));
fprintf(fp,'%d\n', zeros);


fclose(fp);
new_origin(2)=new_origin(2)+10*(n_row+1);

end
