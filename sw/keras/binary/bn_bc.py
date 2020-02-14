# -*- coding: utf-8 -*-
"""
Created on Mon Aug 26 15:56:36 2019

@author: Admin
"""

from math import ceil,sqrt
import numpy


def _hard_sigmoid(x):
    return numpy.clip((x+1)/2, 0, 1)

def quantized_relu(W, nb=4):
    nb_bits = nb
    Wq = numpy.clip(2. *(numpy.round(_hard_sigmoid(W) * pow(2, nb_bits)) / pow(2, nb_bits)) - 1.
                    ,0,1 - 1.0 / pow(2, nb_bits - 1))
    return Wq

def bn_param_reduction(gamma,beta,mu,sigma):
    a  =    gamma/sqrt(sigma)
    b  =    beta - (mu*gamma)/(sqrt(sigma))
    return a,b

def dec2bin(var,fp) :
    if var >= 0 :
        string = '0'+str(fp+1)+'b'
        bin_var = format(var,string)
    else :
        bin_var = format(2**(fp+1) + var,'b')	
    return bin_var

def float2fix(x,fract_part):
    x_fix = int(round(x*pow(2,fract_part)))
    x_fix_bin = dec2bin(x_fix,fract_part)
    x_fix = 0
    acc = 0
    for i in x_fix_bin:
        if x_fix_bin[0] == '1':
            if acc == 0:    
                x_fix += -int(i)*pow(2,-1*acc)
                acc += 1
            else:
               x_fix += int(i)*pow(2,-1*acc)
               acc += 1 
        else:
            x_fix += int(i)*pow(2,-1*acc)
            acc += 1      
    return x_fix

'''
calcolo a, b
'''
A      = []
B      = []
bn_1   = numpy.asarray(Wq[11:15])

frac_part = 3

for i in bn_1.T:
    A.append(bn_param_reduction(i[0],i[1],i[2],i[3])[0])
    B.append(bn_param_reduction(i[0],i[1],i[2],i[3])[1])
    
conv = activations['binary_conv2d_110/convolution:0']

bn_output = numpy.zeros([120])
act_f_output = numpy.zeros([120])
for i in range(120):
#    for j in range(10):
#        for k in range(10):
    bn_output[i] = float2fix(A[i],frac_part)*conv[0,0,i]+float2fix(B[i],frac_part)
    act_f_output[i] = quantized_relu(bn_output[i])
            
print(numpy.array_equal(act_f_output,activations['activation_3/clip_by_value_1:0']))

