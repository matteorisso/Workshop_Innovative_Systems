%errori per la parte frazionaria. 

x1 = [0: 1/255: 1]; 

y1 = tanh(x1);

y2 = x1;

error1 = y2 - y1;

figure 
plot(x1,error1);
grid on;

%errori per la parte intera 

x2 = [1: 1/255: 2]; 

y3 = tanh(x2);

y4 = 1;

error2 = y4 - y3;

figure 
plot(x2,error2);
grid on;