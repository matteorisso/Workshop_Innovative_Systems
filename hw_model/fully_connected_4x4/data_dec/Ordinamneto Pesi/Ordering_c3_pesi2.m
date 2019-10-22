% il file è organizzato come 120 array da 400 pesi, ogni array da 400 contiene i pesi per generare una delle 120 uscite
% il primo passo è quello di organizzare i pesi in 400 array da 120 pesi e successivamente ordinare i pesi in modo da poter generare 16 uscite alla volta

file_r = fopen('c3_pesi_ord.txt','r');
file_w = fopen('c3_pesi_ord2.txt','w');

formatSpec = '%f';

%Prime sedici uscite
while not(feof(file_r))
    
Block = fscanf(file_r,formatSpec,16);
Jump  = fscanf(file_r,formatSpec,104);

fprintf(file_w,'%f\n',Block);

end

fclose(file_r);
fclose(file_w);

file_r = fopen('c3_pesi_ord.txt','r');
file_w = fopen('c3_pesi_ord2.txt','a');


%Seconde sedici uscite
Jump  = fscanf(file_r,formatSpec,16);

while not(feof(file_r))
    
Block = fscanf(file_r,formatSpec,16);
Jump  = fscanf(file_r,formatSpec,104);

fprintf(file_w,'%f\n',Block);

end

fclose(file_r);
fclose(file_w);

file_r = fopen('c3_pesi_ord.txt','r');
file_w = fopen('c3_pesi_ord2.txt','a');

%Terze sedici uscite
Jump  = fscanf(file_r,formatSpec,32);

while not(feof(file_r))
    
Block = fscanf(file_r,formatSpec,16);
Jump  = fscanf(file_r,formatSpec,104);

fprintf(file_w,'%f\n',Block);

end

fclose(file_r);
fclose(file_w);

file_r = fopen('c3_pesi_ord.txt','r');
file_w = fopen('c3_pesi_ord2.txt','a');

%Quarte sedici uscite
Jump  = fscanf(file_r,formatSpec,48);

while not(feof(file_r))
    
Block = fscanf(file_r,formatSpec,16);
Jump  = fscanf(file_r,formatSpec,104);

fprintf(file_w,'%f\n',Block);

end

fclose(file_r);
fclose(file_w);

file_r = fopen('c3_pesi_ord.txt','r');
file_w = fopen('c3_pesi_ord2.txt','a');

%Quinte sedici uscite
Jump  = fscanf(file_r,formatSpec,64);

while not(feof(file_r))
    
Block = fscanf(file_r,formatSpec,16);
Jump  = fscanf(file_r,formatSpec,104);

fprintf(file_w,'%f\n',Block);

end

fclose(file_r);
fclose(file_w);

file_r = fopen('c3_pesi_ord.txt','r');
file_w = fopen('c3_pesi_ord2.txt','a');

%Seste sedici uscite
Jump  = fscanf(file_r,formatSpec,80);

while not(feof(file_r))
    
Block = fscanf(file_r,formatSpec,16);
Jump  = fscanf(file_r,formatSpec,104);

fprintf(file_w,'%f\n',Block);

end

fclose(file_r);
fclose(file_w);

file_r = fopen('c3_pesi_ord.txt','r');
file_w = fopen('c3_pesi_ord2.txt','a');

%Settime sedici uscite

Jump  = fscanf(file_r,formatSpec,96);

while not(feof(file_r))
    
Block = fscanf(file_r,formatSpec,16);
Jump  = fscanf(file_r,formatSpec,104);

fprintf(file_w,'%f\n',Block);

end

fclose(file_r);
fclose(file_w);

file_r = fopen('c3_pesi_ord.txt','r');
file_w = fopen('c3_pesi_ord2.txt','a');

%ultime otto uscite

Jump  = fscanf(file_r,formatSpec,112);

while not(feof(file_r))
    
Block = fscanf(file_r,formatSpec,8);
Jump  = fscanf(file_r,formatSpec,112);

fprintf(file_w,'%f\n',Block);

end

fclose(file_r);
fclose(file_w);
