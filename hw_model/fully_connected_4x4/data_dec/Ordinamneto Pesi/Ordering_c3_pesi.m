% il file è organizzato come 120 array da 400 pesi, ogni array da 400 contiene i pesi per generare una delle 120 uscite
% il primo passo è quello di organizzare i pesi in 400 array da 120 pesi e successivamente ordinare i pesi in modo da poter generare 16 uscite alla volta

file_w = fopen('c3_pesi_ord.txt','a');

for i = 0:399

file_r = fopen('c3_pesi.txt','r');

formatSpec = '%f';

fscanf(file_r,formatSpec,i); 

while not(feof(file_r))
    
weight  = fscanf(file_r,formatSpec,1);
fscanf(file_r,formatSpec,399);

fprintf(file_w,'%f\n',weight);

end

fclose(file_r);

end

fclose(file_w);