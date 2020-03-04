function gen_FAHA_VHDL(mat,t,fa,ha,height,ppipe,n_stage)
%GEN_FAHA_VHDL implements Half Adders and Full Adders at each step of the
%algorithm.
%   GEN_FAHA_VHDL(mat,t,VHDL_file,fa,ha,height) inputs:
%           mat         => current dots matrix
%           t           => index of current 3 rows group to be processed
%           fa          => current FAs count
%           ha          => current HAs count
%           ppipe       => every how many levels of the tree a pipe stage is introduced
%           n_stace     => current stage

VHDL_file=fopen('wallace.vhd','a'); % append text to 'wallace.vhd'
if mod(n_stage+1,ppipe)==0
for j=1:size(mat,2)
       l=find(mat((3*t-2):(3*t),(size(mat,2)-(j-1))));    % search for '1' position in s columns starting from the north east of s
       if length(l)==3  % allocate FA
           fprintf(VHDL_file,['FA_ff_%d:FAff port map',...
               '(x=>p(%d)(%d),y=>p(%d)(%d),Cin=>p(%d)(%d),clock=>clock,reset=>reset,s=>p(%d)(%d),cout=>p(%d)(%d));\n'],fa,3*t-3+height,j-1,3*t-2+height,j-1,3*t-1+height,j-1,2*t-2+size(mat,1)+height,j-1,2*t-1+size(mat,1)+height,j);
           fa=fa+1; % increment FA count
       elseif length(l)==2 % allocate HA
               fprintf(VHDL_file,['HA_ff_%d:HAff port map',...
               '(x=>p(%d)(%d),y=>p(%d)(%d),clock=>clock,reset=>reset,s=>p(%d)(%d),c=>p(%d)(%d));\n'],ha,3*t-4+l(1)+height,j-1,3*t-4+l(2)+height,j-1,2*t-2+size(mat,1)+height,j-1,2*t-1+size(mat,1)+height,j);
               ha=ha+1; % increment HA count
       elseif length(l)==1 % move dot to the next stage
                   fprintf(VHDL_file,'p(%d)(%d)<=p(%d)(%d);\n',2*t-2+size(mat,1)+height,j-1,3*t-4+l(1)+height,j-1);
       end
end
else
for j=1:size(mat,2)
       l=find(mat((3*t-2):(3*t),(size(mat,2)-(j-1))));    % search for '1' position in s columns starting from the north east of s
       if length(l)==3  % allocate FA
           fprintf(VHDL_file,['FA_%d:FA port map',...
               '(x=>p(%d)(%d),y=>p(%d)(%d),Cin=>p(%d)(%d),s=>p(%d)(%d),cout=>p(%d)(%d));\n'],fa,3*t-3+height,j-1,3*t-2+height,j-1,3*t-1+height,j-1,2*t-2+size(mat,1)+height,j-1,2*t-1+size(mat,1)+height,j);
           fa=fa+1; % increment FA count
       elseif length(l)==2 % allocate HA
               fprintf(VHDL_file,['HA_%d:HA port map',...
               '(x=>p(%d)(%d),y=>p(%d)(%d),s=>p(%d)(%d),c=>p(%d)(%d));\n'],ha,3*t-4+l(1)+height,j-1,3*t-4+l(2)+height,j-1,2*t-2+size(mat,1)+height,j-1,2*t-1+size(mat,1)+height,j);
               ha=ha+1; % increment HA count
       elseif length(l)==1 % move dot to the next stage
                   fprintf(VHDL_file,'p(%d)(%d)<=p(%d)(%d);\n',2*t-2+size(mat,1)+height,j-1,3*t-4+l(1)+height,j-1);
       end
end 
    
end
    
end




