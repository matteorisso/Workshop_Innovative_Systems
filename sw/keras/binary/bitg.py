# -*- coding: utf-8 -*-
"""
Created on Tue Dec 10 16:07:46 2019

@author: Antonio
"""

# compute bitgrowth L1 norm on kernels (\infty norm on activation is 0.75)
import numpy as np
import math

weights = np.load('./saved_model/tnn_weights.npy', allow_pickle=True)
kernelc1 = weights.item(0)
kernelc2 = weights.item(5)

for kernel in [kernelc1, kernelc2]:
    
    x, y, w, z = kernel.shape
    print(kernel.shape)
    for l in range(z):   #ofmaps
        bg = 0
        norm = 0
        for k in range(w): #ifmaps
            #accumulate norm
            norm += np.linalg.norm(kernel[:,:,k,l], ord=1)                               
        bg = np.ceil(math.log((0.75)*norm, 2))   
        #display bg for each output channel
        print(bg)