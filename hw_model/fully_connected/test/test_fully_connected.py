# -*- coding: utf-8 -*-

# Module with random function:
import random 

# Definition of the extreme of the interval on 16 bit:
MIN = -32768 
MAX = 32767

# Constant used to perform the rounding to nearest even.
Round_const = 2**26

# Dimension of the input vector:
N = 400

# Number of PEs:
M = 20

# Definition of the empty lists where store the random test pattern:
IFMAP = []
WEIGHTS = []

# Definition of the empty list of size M, with default value of 0,
# where store the algorithm's results:
OFMAP = [0]*M

# Function that generates random number in the interval [MIN,MAX], 
# and stores the value in a list for each variable of the algorithm.
def random_pattern(L) :
	L.append(random.randint(MIN,MAX))

# Function that applies the algorithm of fully connected layer algorithm.
def fully_c_algorithm(I,W) :
    for k in range(M) :
        OFMAP[k] += I[k]*W[k]
        
# Functon that perform the rounding to nearest even to 16 bit
def round_even(sample) :
    rounded_sample = sample + Round_const
    if rounded_sample >= 0 :
        sample_bin = list('{0:043b}'.format(rounded_sample))
        if sample_bin[16] == '0' :
            sample_bin_str = ''.join(sample_bin)
            sample_bin_str = sample_bin_str[:16]
        else :
            sample_bin_str = '{0:043b}'.format(sample)
            sample_bin_str = sample_bin_str[:16]
    else :
        sample_bin = list(format(2**43 + rounded_sample,'b'))
        if sample_bin[16] == '0' :
            sample_bin_str = ''.join(sample_bin)
            sample_bin_str = sample_bin_str[:16]
        else :
            if sample < 0 :
                sample_bin_str = format(2**43 + sample,'b')
                sample_bin_str = sample_bin_str[:16]
            else :
                sample_bin_str = '{0:043b}'.format(sample)
                sample_bin_str = sample_bin_str[:16]
    return sample_bin_str[:8]+'.'+sample_bin_str[8:]


def dec2bin(var) :
	if var >= 0 :
		bin_var = '{0:016b}'.format(var)
	else :
		bin_var = format(2**16 + var,'b')	
	return bin_var

# File where store the random value:
f_IN = open('random_IN.txt','w')

# File where store the output:
f_OUT = open('results.txt','w')

# Random value generation:
for i in range(N) :
    IFMAP = []
    WEIGHTS = []
    
    #line1 = "\n"
    #f_IN.write(line1) 
    
    # Generation of the M random value of IFMAP and writing in the file
    for j in range(M) :
    	# Generation.
    	random_pattern(IFMAP)
    	# Write to file.
    	line3 = dec2bin(IFMAP[j]) + "\n"
    	f_IN.write(line3)
    
    #line1 = "\n"
    #f_IN.write(line1)
    
     # Generation of the M random value of WEIGHTS and writing in the file
    for j in range(M) :
    	# Generation.
    	random_pattern(WEIGHTS)
    	# Write to file.
    	line2 = dec2bin(WEIGHTS[j])  + "\n"
    	f_IN.write(line2)     
        
        
    # Algorithm.
    fully_c_algorithm(IFMAP,WEIGHTS)
        
    	
# Write results on output file
for line in OFMAP :
    
    f_OUT.write(round_even(line) + "\n")

f_IN.close()
f_OUT.close()




