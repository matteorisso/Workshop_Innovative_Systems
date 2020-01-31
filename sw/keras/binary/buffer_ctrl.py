# -*- coding: utf-8 -*-
"""
Created on Sun Sep  1 15:58:21 2019

@author: Antonio
"""

import os
import math
import numpy as np
 
# Two's complement conversion from decimal 
def twoscomp(x, nbits, nfrac, hexa=False):
      
    m = 2**(nbits-1)
    m_frac = 2**(nfrac)
   
    mask = int("1"*nbits, 2) #ensure fixed wordlength (least-significand digits)
    # repr : force sign ext for 2C
    rep = lambda x, hexa: (bin(x & mask)[2:], hex(x & mask)[2:])[hexa] 
    
    # quantize : np.clip(np.round(x/LSB), min, max)*LSB 
    # scaling  : int(x/LSB) np.floor    
    quant_op = lambda x, m, m_frac : int(np.clip(np.round(x*m_frac), -m, m-1)/m_frac * m_frac)

    val = rep(quant_op(x, m, m_frac), hexa)
    nval = rep(~quant_op(x, m, m_frac) + quant_op(1/m, m, m), hexa) #2's complement
    
    radix = (1, 4)[hexa==True]
    return (val, nval)[val[0]=='-'].zfill(math.ceil(nbits/radix))

#Activations memory map
def act_memory_map(img, nbits, nfrac, npu_dim, filename, channel_first=True, index=False):
  
    x, y, b = img.shape
    
    if channel_first == True:
        img = img.reshape((x, y, b, 1))   
    else:
        img = img.reshape((x, y, 1, b))        

    x, y, b, c = img.shape

    with open(filename+'even.mem','w+') as fe, open(filename+'odd.mem','w+') as fo:
        for l in range(c):           
            for i in range(math.ceil(x/(2*npu_dim))):    
                for j in range(y):
                    for k in range(b): 
                        
                        dw = np.zeros(2*npu_dim)# doubleword
                        
                        # pad remainder memory word 
                        dw[:len(img[j, i*2*npu_dim : i*2*npu_dim + 2*npu_dim, k, l])] \
                        = img[j, i*2*npu_dim : i*2*npu_dim + 2*npu_dim, k, l]
                        
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
    
    activations = np.load('./saved_model/tnn_no_bn2b_act.npy', allow_pickle=True).item()
    weights = np.load('./saved_model/tnn_no_bn2b_weights.npy', allow_pickle=True)
    
    '''
    C1
    '''
    
    kernelc1 = weights.item(0) #C1  kernel
    img = np.load('./saved_model/tnn_no_bn2b_img.npy', allow_pickle=True).item()['img'].reshape((32, 32, 1))
    
    act_memory_map(img, nbits, nfrac, npu_dim, '{}/c1act'.format(memdir))
    
    nbits = 8
    nfrac = 2
    
    # create results file
    res_c1 = convolution(img, kernelc1)
    #res_memory_map(res_c1, 8, 2, 8, memdir+'/c1result.mem')
    act_memory_map(res_c1, nbits, nfrac, npu_dim, '{}/c1res'.format(memdir))
    
    # create weights file
    with open(memdir+'/c1kernel.mem', 'w+') as f:
        m, n, b, c = kernelc1.shape
        for k in range(c):
            for i in range(m):
                for j in range(n):
                    for h in range(b):
                        f.write(weight_table(kernelc1[i,j,h,k])+'\n')
           
    #c1 + relu 
    s1_in = activations[ [ layer for layer in activations.keys() if layer.startswith('c1') ][0] ]
    
    x, y, z = s1_in.shape
    
    s1_out = np.zeros((x//2, y//2, z))
       
    for k in range(z):
        for j in range(0,x,2):
            for i in range(0,y,2):
                s1_out[i//2, j//2, k] += np.sum(s1_in[i:i+2, j:j+2, k])
#                np.clip(np.round(np.sum(s1_in[i:i+2, j:j+2, k])*4), 0, 2)                
               
    act_memory_map(s1_in, 3, 2, npu_dim, '{}/c1res'.format(memdir))
    act_memory_map(s1_out, 5, 2, npu_dim, '{}/p1res'.format(memdir))    
    
    '''C2
    '''
    
    nbits = 3
    nfrac = 2
    
    kernelc2 = weights.item(1) #C2 kernel
    c2_in = activations[ [ layer for layer in activations.keys() if layer.startswith('s1') ][0] ]
    
    act_memory_map(c2_in, nbits, nfrac, npu_dim, '{}/c2act'.format(memdir))
    
    nbits = 8
    nfrac = 2
    # create results file
    res_c2 = convolution(c2_in, kernelc2)
    #res_memory_map(res_c2, 8, 2, 8, memdir+'/c2result.mem')
    act_memory_map(res_c2, nbits, nfrac, npu_dim, '{}/c2res'.format(memdir))
    
    # create weights file
    with open(memdir+'/c2kernel.mem', 'w+') as f:
        m, n, b, c = kernelc2.shape
        for k in range(c):
            for i in range(m):
                for j in range(n):
                    for h in range(b):
                        f.write(weight_table(kernelc2[i,j,h,k])+'\n')
            
    s2_in = activations[ [ layer for layer in activations.keys() if layer.startswith('c2') ][0] ]
    act_memory_map(s2_in, 3, 2, npu_dim, '{}/c2res'.format(memdir))
    s2_out = activations[ [ layer for layer in activations.keys() if layer.startswith('s2') ][0] ]
    act_memory_map(s2_out, 3, 2, npu_dim, '{}/c3act'.format(memdir))
    
    
#    '''
#    Batch normalization test
#    '''
#    nbits = 3
#    nfrac = 2
#    m = pow(2, nbits)
#    m_frac = pow(2, nfrac)
#    quantize = lambda x, m, m_frac: np.clip(np.round(x*m_frac), -m, m-1)/m_frac
# 
#    res_c1 = res_c1[:,:,-1].reshape((res_c1.shape[0], res_c1.shape[1], 1))
#    
#    bn1_a = weights.item(1)[-1]
#    bn1_b = weights.item(2)[-1]
#    
#    bn1 = np.zeros(res_c1.shape)
#    bn1_ref = activations['batch_normalization_1/cond/Merge:0'][:,:,-1].reshape(bn1.shape)
#    
#    y, x, z = res_c1.shape
#    
#    for i in range(y):
#        for j in range(x):
#            bn1[i,j] = res_c1[i,j]*bn1_a + bn1_b
#            bn1[i,j] = quantize(bn1[i,j], pow(2,16), pow(2,8))
#            bn1_ref[i,j] = quantize(bn1_ref[i,j], pow(2,16), pow(2,8))
#            #bnq[i,j] = relu(quantize(bn[i,j], m, m_frac))
#            
#    nbits = 16
#    nfrac = 8
#    
#    filename = memdir+'/bn1'
#    act_memory_map(bn1, nbits, nfrac, npu_dim, filename)        
#    
#    #i_gamma            
#    print(twoscomp(bn1_a,8,6,hexa=True))  
#    #i_beta
#    print(twoscomp(bn1_b,8,6,hexa=True))  
#    #i_data
##    print(twoscomp(res_c1[16,16,0],8,2,hexa=True))  
##    
##    #o_data
##    print(twoscomp(bn[16,16,0],16,8,hexa=True))
##    print(twoscomp(bn[16,16,0],16,8))
##
#    res_c2 = res_c2[:,:,-1].reshape((res_c2.shape[0], res_c2.shape[1], 1))
#    
#    bn2_a = weights.item(6)[-1]
#    bn2_b = weights.item(7)[-1]
#  
#    bn2 = np.zeros(res_c2.shape)
#    bn2_ref = activations['batch_normalization_2/cond/Merge:0'][:,:,-1].reshape(bn2.shape)
#    
#    y, x, z = res_c2.shape
#    
#    for i in range(y):
#        for j in range(x):
#            bn2[i,j] = res_c2[i,j]*bn2_a + bn2_b
#            bn2[i,j] = quantize(bn2[i,j], pow(2,16), pow(2,8))
#            bn2_ref[i,j] = quantize(bn2_ref[i,j], pow(2,16), pow(2,8))
#            #bnq[i,j] = relu(quantize(bn[i,j], m, m_frac))
#            
#    nbits = 16
#    nfrac = 8
#    
#    filename = memdir+'/bn2'
#    act_memory_map(bn2, nbits, nfrac, npu_dim, filename)        
#    
#    #i_gamma            
#    print(twoscomp(bn2_a,8,6,hexa=True))  
#    #i_beta
#    print(twoscomp(bn2_b,8,6,hexa=True))  