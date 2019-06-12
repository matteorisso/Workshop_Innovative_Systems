x1 = [0: 1/255: 2.5];       %ingressi in decimale

x2 = dec2q(x1,7,8,'bin');   %ingressi in binario

y1 = tanh(x1);              %uscite della tanh in decimale

y2 = dec2q(y1,7,8,'bin');   %uscite della tanh in decimale

 % Siccome matlab non è buono a scrivere i valori in binario, ho
 % plottato x2 ed y2 nella command window e poi li ho incollati nel txt
 % 'input_tanh' ed 'output_tanh'
