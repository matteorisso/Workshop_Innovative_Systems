# -*- coding: utf-8 -*-

# Module with random function:
import random 

# Definition of the extreme of the interval on 16 bit:
MIN = -32768 
MAX = 32767

# size of PEs' array:
PE_array = 4

# Filter size
filter_size = 5

# IFMAP size
ifmap_size = 32

# stride of convolution :
stride = 1

# Definition of the empty lists where store the random test pattern:
IFMAP = [[0] * ifmap_size for i in range(ifmap_size)]

# Definition of the empty lists where store the random filter :
FILTER = [[0] * filter_size for i in range(filter_size)]

# Definition of the empty list where store the convolution results :
OFMAP = [[0] * (ifmap_size-filter_size+stride) for i in range(ifmap_size-filter_size+stride)]


# Function that generates random number in the interval [MIN,MAX], 
# and stores the value in a list for each variable of the algorithm.
def random_pattern() :
	return random.randint(MIN,MAX)


def conv(W, I) :
    res = 0
    for i in range(filter_size) :
        for j in range(filter_size) :
            res += W[i][j] * I[i][j]
    return res
    
        
def dec2bin(var) :
	if var >= 0 :
		bin_var = '{0:016b}'.format(var)
	else :
		bin_var = format(2**16 + var,'b')	
	return bin_var

def dec2bin32(var) :
	if var >= 0 :
		bin_var = '{0:037b}'.format(var)
	else :
		bin_var = format(2**37 + var,'b')	
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

    

# File where store the random value:
f_IN = open('random_in.txt','w')

# File where the input file is described:
f_descr = open('map_in.txt','w')

# File where the filter file is described:
f_filter = open('random_filter.txt','w')

# File where store the output:
f_OUT = open('results.txt','w')

# Random value generation IFMAP:
for i in range(ifmap_size) :
    for j in range(ifmap_size) :
    	IFMAP[i][j] = random_pattern()
        
# Random value generation FILTER and print to file:
for i in range(filter_size) :
    for j in range(filter_size) :
        FILTER[i][j] = random_pattern()
        f_filter.write(dec2bin(FILTER[i][j]) + "\n")
    	
# First four vector :
for i in range(4) :
    for j in range(4) :
        f_descr.write("I" + str(i) + "," + str(j) + " ")
        f_IN.write(dec2bin(IFMAP[i][j]) + " ")
    f_descr.write("\n")
    f_IN.write("\n")       

m = 0
n = 4

for k in range(5) :
    q = n + m
    p = 0
    # Loop five vector (oriz), each element is Im+j,n+i: 
    for i in range(5) :
        for j in range(4) :
            f_descr.write("I" + str(m+j) + "," + str(n+i) + " ")
            f_IN.write(dec2bin(IFMAP[m+j][n+i]) + " ")
        f_descr.write("\n")
        f_IN.write("\n")
        
    # Loop one vector (vert), each element is Iq,p+j :
    for j in range(4) :
            f_descr.write("I" + str(q) + "," + str(p+j) + " ")
            f_IN.write(dec2bin(IFMAP[q][p+j]) + " ")
    f_descr.write("----vert" + "\n")
    f_IN.write("\n")
    m += 1
  
# Convolution between IFMAP and FILTER :
for i in range(ifmap_size - filter_size + stride) :
    for j in range(ifmap_size - filter_size + stride) :
        IFMAP_window = []
        for line in IFMAP[i:(filter_size+i)] :
            IFMAP_window.append(line[j:(filter_size+j)])
        OFMAP[i][j] = conv(FILTER, IFMAP_window)

# Write conv results to file :
for i in range(ifmap_size - filter_size + stride) :
    for j in range(ifmap_size - filter_size + stride) :
        f_OUT.write(str(OFMAP[i][j]) + " ")
    f_OUT.write("\n")

    
f_IN.close()
f_descr.close()
f_filter.close()
f_OUT.close()


