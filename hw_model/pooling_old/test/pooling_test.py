# -*- coding: utf-8 -*-

# Module with random function:
import random 

# Definition of the extreme of the interval on 16 bit:
MIN = -32768 
MAX = 32767

# Number of PEs:
M = 14

# Dimension of the input vector:
N = M*4

# Definition of the empty lists where store the random test pattern:
IFMAP = []

# Definition of the empty list of size M, with default value of 0,
# where store the algorithm's results:
OFMAP = [0]*M

# Function that generates random number in the interval [MIN,MAX], 
# and stores the value in a list for each variable of the algorithm.
def random_pattern(L) :
	L.append(random.randint(MIN,MAX))

## Function that applies the algorithm of fully connected layer algorithm.
#def avg_pool_algorithm(I) :
#    for k in range(M) :
#        OFMAP[k] = I[k] + I[k+M+1] + I[k+(2*M)+1] + I[k+(3*M)+1]
#    return 0
        

def dec2bin(var) :
	if var >= 0 :
		bin_var = '{0:016b}'.format(var)
	else :
		bin_var = format(2**16 + var,'b')	
	return bin_var

def ca2todec(var) :
    if var[0] == '1' :
        L_var = list(var)
        pos = 0
        for i in L_var :
            if i == '0' :
                L_var[pos] = '1'
            else :
                L_var[pos] = '0'
            pos += 1
        str_var = ''.join(L_var)
        return (int(str_var,2)+1)*(-1)
    else :
        return int(var,2)
    
def shift_dec(v) :
    bin_string = dec2bin(v)
    bin_string_shift = bin_string[0] + bin_string[0] + bin_string[:-2]
    return ca2todec(bin_string_shift)
    

# File where store the random value:
f_IN = open('random_in.txt','w')

# File where store the output:
f_OUT = open('results.txt','w')

# Random value generation:
iter=0
for i in range(4) :
    # Generation of the M random value of IFMAP and writing in the file
    for j in range(M) :
    	# Generation.
    	random_pattern(IFMAP)
    	# Write to file.
    	line3 = dec2bin(IFMAP[j+(M*iter)]) + "\n"
    	f_IN.write(line3)
    iter += 1

for k in range(M) :
    OFMAP[k] = (shift_dec(IFMAP[k]) + shift_dec(IFMAP[k+M]) \
         + shift_dec(IFMAP[k+(2*M)]) + shift_dec(IFMAP[k+(3*M)]))
    OFMAP[k] = dec2bin(OFMAP[k])
            	
# Write results on output file
for line in OFMAP :
    f_OUT.write(line[:8] + '.' + line[8:] + "\n")

f_IN.close()
f_OUT.close()

