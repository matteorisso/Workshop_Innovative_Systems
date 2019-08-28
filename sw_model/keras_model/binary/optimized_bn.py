#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Sat Aug 24 11:07:09 2019

@author: matteorisso
"""

from math import sqrt,ceil
import numpy

def bn_param_reduction(gamma,beta,mu,sigma):
    a  =    gamma/sqrt(sigma)
    b  =    beta - (mu*gamma)/(sqrt(sigma))
    r  =    -b/a
    return a,b,r

def booleanize(var):
    if var >= 0:
        bool_var = 1
    else:
        bool_var = 0
    return bool_var

sign = lambda x: (1, -1)[x <= 0]

def nor(a,b):
    return not(a or b)

def mux2to1(a,b,sel):
    if sel :
        #1
        return b
    else:
        #0
        return a

def table(a,b,i):
    res = mux2to1(i,not i,nor(a,b))
    if res == 0:
        res = -1
    return res

'''
calcolo a, b, -b/a
'''
A      = []
B      = []
R      = []
bn_1   = numpy.asarray(Wq[1:5])

for i in bn_1.T:
    A.append(bn_param_reduction(i[0],i[1],i[2],i[3])[0])
    B.append(bn_param_reduction(i[0],i[1],i[2],i[3])[1])
    R.append(bn_param_reduction(i[0],i[1],i[2],i[3])[2])

bool_A = [booleanize(i) for i in A]
bool_B = [booleanize(i) for i in B]

conv = activations['binary_conv2d_1/convolution:0']


act_f_output = numpy.zeros([28,28,6])
for i in range(6):
    for j in range(28):
        for k in range(28):
            bool_R = booleanize(conv[k,j,i]-ceil(R[i]))
            act_f_output[k,j,i] = table(bool_A[i],bool_B[i],bool_R)
            
print(numpy.array_equal(act_f_output,activations['activation_1/sub_1:0']))
          
            
'''

B_integer   = [ceil(i) for i in B]
A_sign      = [sign(i)*1 for i in A]

bn_output = numpy.zeros([28,28,6])

#for i in range(6):
#    bn_output[:,:,i] = (A_sign[i]*conv[:,:,i])+B_integer[i]
   
act_f_output = numpy.zeros([28,28,6])

for i in range(6):
    for j in range(28):
        for k in range(28):
            bn_output[k,j,i] = (A_sign[i]*conv[k,j,i])+B_integer[i]
            act_f_output[k,j,i] = sign(bn_output[k,j,i])
            
print(numpy.array_equal(act_f_output,activations['activation_1/sub_1:0']))

'''
