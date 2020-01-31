# -*- coding: utf-8 -*-
"""
Created on Tue Sep  3 18:14:24 2019

@author: Admin
"""

from math import ceil,sqrt
import numpy
import os

def bn_param_reduction(gamma,beta,mu,sigma):
    a  =    gamma/sqrt(sigma)
    b  =    beta - (mu*gamma)/(sqrt(sigma))
    return a,b

def dec2bin(var,fp, ip) :
    if var >= 0 :
        string = '0'+str(fp+ip)+'b'
        bin_var = format(var,string)
    else :
        bin_var = format(2**(fp+ip) + var,'b')	
    return bin_var

def float2fix(x,fract_part, int_part):
    if x < -1*pow(2,int_part-1):
        x = -1*pow(2,int_part-1)
    upper_bound = 0
    for i in range(1,fract_part+1):
        upper_bound += pow(2,-i)
    for i in range(int_part-1):
        upper_bound += pow(2,i)
    if x > upper_bound:
        x = upper_bound
    x_fix = int(round(x*pow(2,fract_part)))
    x_fix_bin = dec2bin(x_fix,fract_part, int_part)
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
    return x_fix_bin


''' param '''
int_part = 6
frac_part = 2

''' save coeff '''
A_1 = []
B_1 = []
A_2 = []
B_2 = []
A_3 = []
B_3 = []
A_4 = []
B_4 = []
bn_1 = numpy.asarray(Wq[1:5])
bn_2 = numpy.asarray(Wq[6:10])
bn_3 = numpy.asarray(Wq[11:15])
bn_4 = numpy.asarray(Wq[16:20])

for i in bn_1.T:
    A_1.append(float2fix(bn_param_reduction(i[0],i[1],i[2],i[3])[0],7,1))
    B_1.append(float2fix(bn_param_reduction(i[0],i[1],i[2],i[3])[1],7,1))
    
for i in bn_2.T:
    A_2.append(float2fix(bn_param_reduction(i[0],i[1],i[2],i[3])[0],7,1))
    B_2.append(float2fix(bn_param_reduction(i[0],i[1],i[2],i[3])[1],7,1))
    
for i in bn_3.T:
    A_3.append(float2fix(bn_param_reduction(i[0],i[1],i[2],i[3])[0],7,1))
    B_3.append(float2fix(bn_param_reduction(i[0],i[1],i[2],i[3])[1],7,1))
    
for i in bn_4.T:
    A_4.append(float2fix(bn_param_reduction(i[0],i[1],i[2],i[3])[0],7,1))
    B_4.append(float2fix(bn_param_reduction(i[0],i[1],i[2],i[3])[1],7,1))

#os.chdir('./act')


#''' c1 '''
#
#c1_fp = activations['binary_conv2d_1/convolution:0']
#
#c1_fixed = numpy.array(numpy.zeros([28,28,6]),dtype = 'object')
#for i in range(6):
#    for j in range(28):
#        for k in range(28):
#            c1_fixed[k,j,i] = float2fix(c1_fp[k,j,i],frac_part,int_part)
#
#for i in range(6):
#    numpy.savetxt('conv1_'+str(i)+'.txt', c1_fixed[:,:,i], fmt="%s")
#    
#numpy.savetxt('A_1.txt', A_1, fmt="%s")
#numpy.savetxt('B_1.txt', B_1, fmt="%s")
#
#''' c2 '''
#
#c2_fp = activations['binary_conv2d_2/convolution:0']
#
#c2_fixed = numpy.array(numpy.zeros([10,10,16]),dtype = 'object')
#for i in range(16):
#    for j in range(10):
#        for k in range(10):
#            c2_fixed[k,j,i] = float2fix(c2_fp[k,j,i],frac_part,int_part)
#
#for i in range(16):
#    numpy.savetxt('conv2_'+str(i)+'.txt', c2_fixed[:,:,i], fmt="%s")
#    
#numpy.savetxt('A_2.txt', A_2, fmt="%s")
#numpy.savetxt('B_2.txt', B_2, fmt="%s")
#
#''' c3 '''
#
#c3_fp = activations['binary_conv2d_3/convolution:0']
#
#c3_fixed = numpy.array(numpy.zeros([1,1,120]),dtype = 'object')
#for i in range(120):
#    c3_fixed[0,0,i] = float2fix(c3_fp[0,0,i],frac_part,int_part)
#
#numpy.savetxt('conv3.txt', c3_fixed[0,0,:], fmt="%s")
#    
#numpy.savetxt('A_3.txt', A_3, fmt="%s")
#numpy.savetxt('B_3.txt', B_3, fmt="%s")
#
#''' fc1 '''
#
#fc1_fp = activations['binary_dense_2/MatMul:0']
# 
#fc1_fixed = numpy.array(numpy.zeros([84]),dtype = 'object')
#for i in range(84):
#    fc1_fixed[i] = float2fix(fc1_fp[i],frac_part,int_part)
#    
#numpy.savetxt('fc1.txt', fc1_fixed, fmt="%s")
#    
#numpy.savetxt('A_4.txt', A_4, fmt="%s")
#numpy.savetxt('B_4.txt', B_4, fmt="%s")
#




















