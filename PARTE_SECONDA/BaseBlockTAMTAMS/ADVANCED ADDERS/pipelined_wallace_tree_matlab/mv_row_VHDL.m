function mv_row_VHDL(n_rowTomv,height,length,k)
%MV_ROW_VHDL move rows of dots to the next step of the wallace algorithm
%   MV_ROW_VHDL(n_rowTomv,VHDL_file,height,length,k) inputs:
%           n_rowTomv   => numbers of dot rows to be moved to the next
%                          step
%           height      => current height of the tree
%           length      => number of column of the dot matrix
%           k           => current number of operands already processed

VHDL_file=fopen('wallace.vhd','a'); % append text to 'wallace.vhd'

% Move dots to the next step of the algorithm
for i=1:n_rowTomv
    for j=1:length
        fprintf(VHDL_file,'p(%d)(%d)<=p(%d)(%d);\n',ceil(k*2/3)+height-n_rowTomv+(i-1),j-1,height-n_rowTomv+(i-1),j-1);
    end
end

end

