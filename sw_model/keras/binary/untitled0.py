# -*- coding: utf-8 -*-
"""
Created on Sat Jan 11 12:07:34 2020

@author: Antonio
"""
import os
import math
import numpy as np

def twoscomp(x, nbits, nfrac, hexa=False):
      
    m = 2**(nbits-1)
    m_frac = 2**(nfrac)
    
    quant = lambda x, m, m_frac: np.clip(np.round(x*m_frac), -m, m-1)/m_frac #quantize   
    scale = lambda x, m: int(x*m) #scale to integer (np.floor)
    qop = lambda x, m, m_frac: scale(quant(x, m, m_frac), m_frac) #convert x
   
    #repr : force sign ext for 2C
    rep = lambda x, hexa: (bin(x & int("1"*nbits, 2))[2:], hex(x & int("1"*nbits, 2))[2:])[hexa] 
    
    w = rep(qop(x, m, m_frac), hexa)
    wn = rep(~qop(x, m, m_frac) + qop(1/m, m, m), hexa) #2's complement
    
    return (w, wn)[w[0]=='-']

def act_memory_map(img, nbits, nfrac, npu_dim, filename, filename2, index=False):
  
    with open(filename,'w+') as fe, open(filename2,'w+') as fo: 
            for h in range(math.ceil(img.shape[0]/(2*npu_dim))):    
                for v in range(img.shape[0]):
                    for b in range(img.shape[-1]):
                    
                        dword = np.zeros(2*npu_dim)   
                        lidx_h = h*2*npu_dim  
                        hidx_h = lidx_h + 2*npu_dim              
                        
                        # pad remainder memory word 
                        dword[:len(img[v,lidx_h:hidx_h,b])] = img[v, lidx_h:hidx_h, b] 
                        if not index:
                            dword = [ twoscomp(val, nbits, nfrac, hexa=True) for val in dword ]
                            
                        fe.write('{}\n'.format(''.join(map(str, dword[ : npu_dim]))))
                        fo.write('{}\n'.format(''.join(map(str, dword[npu_dim : ]))))                         
                    
def convolution(image, kernel):
    
    m, n, c = kernel.shape
    y, x = image.shape
    
    y = y - m + 1
    x = x - m + 1
    
    new_image = np.zeros((y,x,c))
    for i in range(y):
        for j in range(x):
            for k in range(c):
                new_image[i][j][k] = np.sum(image[i:i+m, j:j+m]*kernel[:,:,k])
    return new_image
                