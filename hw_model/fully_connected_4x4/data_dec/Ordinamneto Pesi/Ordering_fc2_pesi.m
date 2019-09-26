file_r = fopen('fc2_pesi.txt','r');
file_w = fopen('fc2_pesi_ord.txt','w');

formatSpec = '%f';

%Prime otto uscite
while not(feof(file_r))
    
Block = fscanf(file_r,formatSpec,8);
Jump  = fscanf(file_r,formatSpec,2);

fprintf(file_w,'%f\n',Block);

end

fclose(file_r);
fclose(file_w);

file_r = fopen('fc2_pesi.txt','r');
file_w = fopen('fc2_pesi_ord.txt','a');


%Ultime due uscite
Jump  = fscanf(file_r,formatSpec,8);

while not(feof(file_r))
    
Block = fscanf(file_r,formatSpec,2);
Jump  = fscanf(file_r,formatSpec,8);

fprintf(file_w,'%f\n',Block);

end

fclose(file_r);
fclose(file_w);

