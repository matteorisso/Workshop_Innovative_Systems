file_r = fopen('fc1_pesi.txt','r');
file_w = fopen('fc1_pesi_ord.txt','w');

formatSpec = '%f';

%Prime sedici uscite
while not(feof(file_r))
    
Block = fscanf(file_r,formatSpec,16);
Jump  = fscanf(file_r,formatSpec,68);

fprintf(file_w,'%f\n',Block);

end

fclose(file_r);
fclose(file_w);

file_r = fopen('fc1_pesi.txt','r');
file_w = fopen('fc1_pesi_ord.txt','a');


%Seconde sedici uscite
Jump  = fscanf(file_r,formatSpec,16);

while not(feof(file_r))
    
Block = fscanf(file_r,formatSpec,16);
Jump  = fscanf(file_r,formatSpec,68);

fprintf(file_w,'%f\n',Block);

end

fclose(file_r);
fclose(file_w);

file_r = fopen('fc1_pesi.txt','r');
file_w = fopen('fc1_pesi_ord.txt','a');

%Terze sedici uscite
Jump  = fscanf(file_r,formatSpec,32);

while not(feof(file_r))
    
Block = fscanf(file_r,formatSpec,16);
Jump  = fscanf(file_r,formatSpec,68);

fprintf(file_w,'%f\n',Block);

end

fclose(file_r);
fclose(file_w);

file_r = fopen('fc1_pesi.txt','r');
file_w = fopen('fc1_pesi_ord.txt','a');

%Quarte sedici uscite
Jump  = fscanf(file_r,formatSpec,48);

while not(feof(file_r))
    
Block = fscanf(file_r,formatSpec,16);
Jump  = fscanf(file_r,formatSpec,68);

fprintf(file_w,'%f\n',Block);

end

fclose(file_r);
fclose(file_w);

file_r = fopen('fc1_pesi.txt','r');
file_w = fopen('fc1_pesi_ord.txt','a');

%Quinte sedici uscite
Jump  = fscanf(file_r,formatSpec,64);

while not(feof(file_r))
    
Block = fscanf(file_r,formatSpec,16);
Jump  = fscanf(file_r,formatSpec,68);

fprintf(file_w,'%f\n',Block);

end

fclose(file_r);
fclose(file_w);

file_r = fopen('fc1_pesi.txt','r');
file_w = fopen('fc1_pesi_ord.txt','a');

%Ultime quattro uscite
Jump  = fscanf(file_r,formatSpec,80);

while not(feof(file_r))
    
Block = fscanf(file_r,formatSpec,4);
Jump  = fscanf(file_r,formatSpec,80);

fprintf(file_w,'%f\n',Block);

end

fclose(file_r);
fclose(file_w);