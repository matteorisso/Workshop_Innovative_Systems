# -*- coding: utf-8 -*-
"""
Created on Tue Jan  7 12:32:02 2020

@author: Antonio
"""

import numpy as np
import math
from bn_bc import bn_param_reduction
from buffer_ctrl import twoscomp

nbits = 16
nfrac = 8

m = 2**(nbits-1)
mfrac = 2**(nfrac)

quantize = lambda x, m, m_frac: np.clip(np.round(x*m_frac), -m, m-1)/m_frac 
#scale = lambda x, m: int(x*m) #scale to integer (np.floor)
#qop = lambda x, m, m_frac: scale(quantize(x, m, m_frac), m_frac) #convert x
   
activations = np.load('./saved_model/tnn_act.npy', allow_pickle=True).item()
weights = np.load('./saved_model/tnn_weights.npy', allow_pickle=True)

bn1_scale = weights.item(1) #gamma
bn1_offset = weights.item(2) #beta
bn1_mean = weights.item(3) #mu
bn1_var = weights.item(4) #sigma

bn_param = []
for i in range(bn1_mean.shape[-1]):
    bn_param.append(bn_param_reduction(bn1_scale[i], bn1_offset[i], bn1_mean[i], bn1_var[i]))
    
bn1 = activations['batch_normalization_1/cond/Merge:0']
c1 = activations['ternary_conv2d_1/convolution:0']

c1_1 = np.zeros(c1.shape)

err = []
epsilon = 1e-6 #A small float number to avoid dividing by 0.

for k in range(c1.shape[-1]):
    for i in range(c1.shape[0]):
        for j in range(c1.shape[1]):
            
            c1_1[i,j,k] = bn1_scale[k]*(c1[i,j,k] - bn1_mean[k])/math.sqrt(bn1_var[k] + epsilon) + bn1_offset[k]
            err.append(c1_1[i,j,k] - bn1[i,j,k])
print('\nKeras layer error:')
print(np.max(err))

# batch norm param reduction

c1_2 = np.zeros(c1.shape)

err = []

for k in range(c1.shape[-1]):
    for i in range(c1.shape[0]):
        for j in range(c1.shape[1]):
            
            c1_2[i,j,k] = (bn1_scale[k]/math.sqrt(bn1_var[k] + epsilon))*c1[i,j,k] + (bn1_offset[k] - (bn1_scale[k]*bn1_mean[k])/math.sqrt(bn1_var[k] + epsilon)) 
            err.append(c1_2[i,j,k] - bn1[i,j,k])
print('\nKeras layer error with reduction:')
print(np.max(err))

# batch norm param reduction quantization

c1_3 = np.zeros(c1.shape)

qerr = []

for k in range(c1.shape[-1]):
    for i in range(c1.shape[0]):
        for j in range(c1.shape[1]):
            
            c1_3[i,j,k] = quantize(c1[i,j,k], m, mfrac)*quantize(bn_param[k][0], m, mfrac) + quantize(bn_param[k][1], m, mfrac)
            qerr.append(c1_3[i,j,k] - quantize(bn1[i,j,k], m, mfrac))
print('\nKeras layer error with quantized reduction:')       
print(np.max(qerr))
