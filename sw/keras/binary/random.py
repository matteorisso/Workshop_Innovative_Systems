# -*- coding: utf-8 -*-
"""
Created on Fri Jan 31 18:19:52 2020

@author: Antonio
"""
import os
import random
import numpy as np
import buffer_ctrl

# random input img
img = np.zeros((32, 32, 1))
random_img = random.choices([0, 0.25, 0.75], k = np.prod(img.shape))
random_img = np.asarray(random_img).reshape(img.shape)

kernel = np.zeros((5, 5, 1, 6))
random_kernel = random.choices([-1, 0, 1], k = np.prod(kernel.shape))
random_kernel = np.asarray(random_kernel).reshape(kernel.shape)

res_c1 = buffer_ctrl.convolution(random_img, random_kernel)

bn1 = np.zeros(res_c1.shape)

weights = np.load('./saved_model/tnn_bn_weights.npy', allow_pickle=True)
bn_a = weights.item(1)
bn_b = weights.item(2)

for i in range(res_c1.shape[-1]):
    bn1[:,:,i] = res_c1[:,:,i]*bn_a[i] + bn_b[i]
    
tmp=[]
for x in bn1.ravel():
    if x >= 0:
        tmp.append(buffer_ctrl.quantize(x, nbits=3, nfrac=2)/pow(2,2)) # quantize+scaling 
    else:
        tmp.append(0)
        
res_c1_relu = np.zeros(bn1.shape)
res_c1_relu = np.asarray(tmp).reshape(bn1.shape)

x, y, z = res_c1_relu.shape

p1 = np.zeros((x//2, y//2, z))
   
for k in range(z):
    for j in range(0,x,2):
        for i in range(0,y,2):
            p1[i//2, j//2, k] += np.sum(res_c1_relu[i:i+2, j:j+2, k]) 
p1 /= 4

c2_in = np.zeros(p1.shape)           
x, y, z = c2_in.shape
for k in range(z):
    for j in range(x):
        for i in range(y):
            c2_in[i, j, k] = buffer_ctrl.quantize(p1[i, j, k], 3, 2)/(pow(2,2))
            
random_kernel = random_kernel[:, :, :, :]

# random c2
#img = np.zeros((14, 14, 6))
#random_img = random.choices([0, 0.25, 0.75], k = np.prod(img.shape))
#random_img = np.asarray(random_img).reshape(img.shape)

kernel2 = np.zeros((5, 5, 6, 16))
random_kernel2 = random.choices([-1, 0, 1], k = np.prod(kernel2.shape))
random_kernel2 = np.asarray(random_kernel2).reshape(kernel2.shape)

res_c2 = buffer_ctrl.convolution(c2_in, random_kernel2)

bn2 = np.zeros(res_c2.shape)

weights = np.load('./saved_model/tnn_bn_weights.npy', allow_pickle=True)
bn2_a = weights.item(6)
bn2_b = weights.item(7)

for i in range(res_c2.shape[-1]):
    bn2[:,:,i] = res_c2[:,:,i]*bn2_a[i] + bn2_b[i]
    
tmp=[]
for x in bn2.ravel():
    if x >= 0:
        tmp.append(buffer_ctrl.quantize(x, nbits=3, nfrac=2)/pow(2,2)) # quantize+scaling 
    else:
        tmp.append(0)
        
res_c2_relu = np.zeros(bn2.shape)
res_c2_relu = np.asarray(tmp).reshape(bn2.shape)

x, y, z = res_c2_relu.shape

p2 = np.zeros((x//2, y//2, z))
   
for k in range(z):
    for j in range(0,x,2):
        for i in range(0,y,2):
            p2[i//2, j//2, k] += np.sum(res_c2_relu[i:i+2, j:j+2, k]) 
p2 /= 4

c3_in = np.zeros(p2.shape)           
x, y, z = c3_in.shape
for k in range(z):
    for j in range(x):
        for i in range(y):
            c3_in[i, j, k] = buffer_ctrl.quantize(p2[i, j, k], 3, 2)/(pow(2,2))
            
random_kernel2 = random_kernel2[:, :, :, :]

memdir = 'rand'
memdir = os.path.join(os.getcwd(), memdir)

if not os.path.isdir(memdir):
    os.mkdir(memdir)    

# create weights file
with open(memdir+'/c1kernel.mem', 'w+') as f:
    m, n, b, c = random_kernel.shape
    for k in range(c):
        for i in range(m):
            for j in range(n):
                for h in range(b):
                    f.write(buffer_ctrl.weight_table(random_kernel[i,j,h,k])+'\n')

with open(memdir+'/c1gamma.mem', 'w+') as f1, open(memdir+'/c1beta.mem', 'w+') as f2:
    for i,j in zip(bn_a,bn_b):
        f1.write(buffer_ctrl.twoscomp(i, 8, 6, hexa=True)+'\n')
        f2.write(buffer_ctrl.twoscomp(j, 8, 6, hexa=True)+'\n')
    
# memory dump                    
buffer_ctrl.act_memory_map(img=random_img, nbits=3, nfrac=2, npu_dim=8, filename='{}/c1act'.format(memdir))
buffer_ctrl.act_memory_map(img=c2_in, nbits=3, nfrac=2, npu_dim=8, filename='{}/c2act'.format(memdir))

# create weights file
with open(memdir+'/c2kernel.mem', 'w+') as f:
    m, n, b, c = random_kernel2.shape
    for k in range(c):
        for i in range(m):
            for j in range(n):
                for h in range(b):
                    f.write(buffer_ctrl.weight_table(random_kernel2[i,j,h,k])+'\n')

with open(memdir+'/c2gamma.mem', 'w+') as f1, open(memdir+'/c2beta.mem', 'w+') as f2:
    for i,j in zip(bn2_a, bn2_b):
        f1.write(buffer_ctrl.twoscomp(i, 8, 6, hexa=True)+'\n')
        f2.write(buffer_ctrl.twoscomp(j, 8, 6, hexa=True)+'\n')
    
# memory dump                    
buffer_ctrl.act_memory_map(img=c3_in, nbits=3, nfrac=2, npu_dim=8, filename='{}/c3act'.format(memdir))