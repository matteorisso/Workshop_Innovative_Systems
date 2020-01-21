# -*- coding: utf-8 -*-
"""
Created on Sun Sep  1 15:58:21 2019

@author: Antonio
"""

import os
import math
import numpy as np
 
#Two's complement conversion from decimal 
def twoscomp(x, nbits, nfrac, hexa=False):
      
    m = 2**(nbits-1)
    m_frac = 2**(nfrac)
    
    quant = lambda x, m, m_frac: np.clip(np.round(x*m_frac), -m, m-1)/m_frac #quantize   
    scale = lambda x, m: int(x*m) #scale to integer (np.floor)
    qop = lambda x, m, m_frac: scale(quant(x, m, m_frac), m_frac) #convert x
   
    #repr : force sign ext for 2C
    rep = lambda x, hexa: (bin(x & int("1"*nbits, 2))[2:], hex(x & int("1"*nbits, 2))[2:])[hexa] 
    
    radix = (1, 4)[hexa==True]
    
    w = rep(qop(x, m, m_frac), hexa)
    wn = rep(~qop(x, m, m_frac) + qop(1/m, m, m), hexa) #2's complement
    
    return (w, wn)[w[0]=='-'].zfill(math.ceil(nbits/radix))

#Activations memory map
def act_memory_map(img, nbits, nfrac, npu_dim, filename, BXY=False, index=False):
  
    x, y, b = img.shape
    
    if BXY==True:
        bb, b = b, 1 #swap loop range
    else:
        bb, b = 1, b
        
    with open(filename+'even.mem','w+') as fe, open(filename+'odd.mem','w+') as fo:           
        for kk in range(bb): 
            for i in range(math.ceil(x/(2*npu_dim))):    
                for j in range(y):
                    for k in range(b): 
                        
                        dw = np.zeros(2*npu_dim)# doubleword
                        
                        lo_idx_x = i*2*npu_dim  
                        hi_idx_x = lo_idx_x + 2*npu_dim              
                        
                        channel = (k, kk)[BXY==True] #swap loop index
                       
                        # pad remainder memory word 
                        dw[:len(img[j, lo_idx_x : hi_idx_x, channel])] = img[j, lo_idx_x:hi_idx_x, channel]
                        
                        if not index:
                            dw = [ twoscomp(val, nbits, nfrac, hexa=True) for val in dw ]
                            
                        fe.write('{}\n'.format(''.join(map(str, dw[ : npu_dim]))))
                        fo.write('{}\n'.format(''.join(map(str, dw[npu_dim : ]))))      
  
#Correlation function
def convolution(image, kernel):
    
    m, n, w, c = kernel.shape
    y, x, w = image.shape
    
    #new image shape
    y = y - m + 1
    x = x - m + 1
    
    new_image = np.zeros((y,x,c))

    for k in range(c):        
        for l in range(w):
            for i in range(y):
                for j in range(x):
                    new_image[i][j][k] += np.sum(image[i:i+m,j:j+m,l]*kernel[:,:,l,k])
                    
    return new_image

#Ternary weights table
def weight_table(w):
    
    if w == -1:
        k = '3'
    elif w == 1:
        k = '2'
    else: 
        k = '0'       
    return k

                    
if __name__ == '__main__':
    
    memdir = 'mem'
    memdir = os.path.join(os.getcwd(), memdir)
    
    try: 
        os.mkdir(memdir) 
    except:
        pass
    
    # index examples
    
    c1dim = 32
    c2dim = 14
    c1channels = 1
    c2channels = 6
    
    px = 8
    py = 8
    
    map1 = np.zeros((c1dim,c1dim,c1channels))
    map2 = np.zeros((c2dim,c2dim,c2channels))
    maps = (map1, map2)
    
    for i in range(c1channels):
        for j in range(c1dim):
            for k in range(c1dim):
                map1[j,k,i]='{}.{}{}'.format(j,k,i)      
                
    for i in range(c2channels):
        for j in range(c2dim):
            for k in range(c2dim):
                map2[j,k,i]='{}.{}{}'.format(j,k,i)
                        
    for map_,i in zip(maps,range(len(maps))):
        
        filename = '{}/tb_map_idx{}'.format(memdir,i)
        act_memory_map(map_, None, None, 8, filename, index=True)
    
    ''' get golden model
    '''
    
    npu_dim = 8
    
    # Create test memory
    
    nbits = 3
    nfrac = 2
    
    activations = np.load('./saved_model/tnn_act.npy', allow_pickle=True).item()
    weights = np.load('./saved_model/tnn_weights.npy', allow_pickle=True)
    
    '''
    C1
    '''
    
    kernelc1 = weights.item(0) #C1  kernel
    img = np.load('./saved_model/tnn_img.npy', allow_pickle=True).item()['img'].reshape((32, 32, 1))
    
    act_memory_map(img, nbits, nfrac, npu_dim, '{}/c1act'.format(memdir))
    
    nbits = 8
    nfrac = 2
    
    # create results file
    res_c1 = convolution(img, kernelc1)
    #res_memory_map(res_c1, 8, 2, 8, memdir+'/c1result.mem')
    act_memory_map(res_c1, nbits, nfrac, npu_dim, '{}/c1res'.format(memdir), BXY=True)
    
    # create weights file
    with open(memdir+'/c1kernel.mem', 'w+') as f:
        m, n, b, c = kernelc1.shape
        for k in range(c):
            for i in range(m):
                for j in range(n):
                    for h in range(b):
                        f.write(weight_table(kernelc1[i,j,h,k])+'\n')
           
    '''C2
    '''
    
    nbits = 3
    nfrac = 2
    
    kernelc2 = weights.item(5) #C2 kernel
    c2_in = activations[ [ layer for layer in activations.keys() if layer.startswith('s1') ][0] ]
    
    act_memory_map(c2_in, nbits, nfrac, npu_dim, '{}/c2act'.format(memdir))
    
    nbits = 8
    nfrac = 2
    # create results file
    res_c2 = convolution(c2_in, kernelc2)
    res_memory_map(res_c2, 8, 2, 8, memdir+'/c2result.mem')
    act_memory_map(res_c2, nbits, nfrac, npu_dim, '{}/c2res'.format(memdir), BXY=True)
    
    # create weights file
    with open(memdir+'/c2kernel.mem', 'w+') as f:
        m, n, b, c = kernelc2.shape
        for k in range(c):
            for i in range(m):
                for j in range(n):
                    for h in range(b):
                        f.write(weight_table(kernelc2[i,j,h,k])+'\n')

#    '''
#    Batch normalization test
#    '''
#    nbits = 3
#    nfrac = 2
#    
#    m = pow(2, nbits)
#    m_frac = pow(2, nfrac)
#    
#    quantize = lambda x, m, m_frac: np.clip(np.round(x*m_frac), -m, m-1)/m_frac
##    relu = lambda x : x if x >= 0 else 0
#    
#    bn1_a = weights.item(1)[-1]
#    bn1_b = weights.item(2)[-1]
#    
#    bn = np.zeros(res_c1.shape)
#    bnq = np.zeros(bn.shape)
#    
#    y, x, z = res_c1.shape
#    
#    for i in range(y):
#        for j in range(x):
#            bn[i,j] = res_c1[i,j]*bn1_a + bn1_b
#            bn[i,j] = quantize(bn[i,j], pow(2,16), pow(2,8))
#            #bnq[i,j] = relu(quantize(bn[i,j], m, m_frac))
#    
#    #i_gamma            
#    print(twoscomp(bn1_a,8,6,hexa=True))  
#    #i_beta
#    print(twoscomp(bn1_b,8,6,hexa=True))  
#    #i_data
#    print(twoscomp(res_c1[16,16,0],8,2,hexa=True))  
#    
#    #o_data
#    print(twoscomp(bn[16,16,0],16,8,hexa=True))
#    print(twoscomp(bn[16,16,0],16,8))
#
#    
  