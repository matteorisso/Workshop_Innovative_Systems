# -*- coding: utf-8 -*-
"""
Created on Sun Sep  1 15:58:21 2019

@author: Antonio
"""

'''
buffer controller 
'''
import math
import numpy as np

c1dim = 32
c2dim = 14
c3dim = 5
c1channels=1
c2channels=6
c3channels=16

px = 5
py = 5

nb_banks=py
banks_word=px
banks_width= int(max([math.ceil(c1dim/py)*math.ceil(c1dim/px)*c1channels,\
                      math.ceil(c2dim/py)*math.ceil(c2dim/px)*c2channels]))

#map1 = np.chararray((c1dim,c1dim,c1channels))

''' 
 make ifmaps
'''
map1 = np.zeros((c1dim,c1dim,c1channels))
map2 = np.zeros((c2dim,c2dim,c2channels))
map3 = np.zeros((c3dim,c3dim,c3channels))

for i in range(c1channels):
    for j in range(c1dim):
        for k in range(c1dim):
            map1[j,k,i]='{}.{}{}'.format(j,k,i)            
for i in range(c2channels):
    for j in range(c2dim):
        for k in range(c2dim):
            map2[j,k,i]='{}.{}{}'.format(j,k,i)
for i in range(c3channels):
    for j in range(c3dim):
        for k in range(c3dim):
            map3[j,k,i]='{}.{}{}'.format(j,k,i)
 
'''
load ifmaps in img memory (24x8x4b=24x32b x8 banks rf) @size[rows,word]=[rows, #pixel*bitwidth]
'''                
imem1 = np.zeros((nb_banks,banks_word,banks_width))
imem2 = np.zeros((nb_banks,banks_word,banks_width))
imem3 = np.zeros((nb_banks,banks_word,banks_width))

for imem_,map_ in zip([imem1,imem2,imem3],[map1,map2,map3]):
    cnt = 0 #banks_width axis index
    for ch in range(map_.shape[-1]):# channels loop
        for block_idx2 in range(0,map_.shape[1],banks_word): #set horizontal index for data block
            for block_idx in range(0,map_.shape[0],banks_word):#set vertical index for data block 
                bank_idx=0 #bank index for each row in a block
                for row in map_[block_idx:block_idx+px,block_idx2:block_idx2+px,ch]: #8x32 block of data
                    if row.shape[-1] <= px: #data width less than word size, fill zeros
                        tmp = np.zeros(px)
                        tmp[:row.shape[-1]]=row
                        row=tmp
                    imem_[bank_idx,:,cnt]=row
                    bank_idx+=1 #update bank index within a block
                cnt+=1 #update bank width index after each block
        
#2**2 offset in imem = switch set of banks 0..Py-1 | Py..2Py-1
#        
#nb_tile_v = int(map1.shape[0]/px) 
#nb_tile_h = int(map1.shape[1]/px) 
#for i in range(nb_tile_v):
#    print('{}\nADDR:{}'.format(imem1[0,:,i],bin(i)))            
#    print('{}\nADDR:{}'.format(imem1[0,:,i+nb_tile_v],bin(i+nb_tile_v)))        

bPy1 = np.zeros((nb_banks,banks_word,int(banks_width/2)))
b2Py1 = np.zeros((nb_banks,banks_word,int(banks_width/2)))
idx=0
for i,j in zip(range(0,math.ceil(c1dim/py)*math.ceil(c1dim/px)*c1channels,math.ceil(c1dim/py)*2),\
               range(math.ceil(c1dim/py),math.ceil(c1dim/py)*math.ceil(c1dim/px)*c1channels,math.ceil(c1dim/py)*2)):
    bPy1[:,:,idx:idx+math.ceil(c1dim/py)]=imem1[:,:,i:i+math.ceil(c1dim/py)]
    b2Py1[:,:,idx:idx+math.ceil(c1dim/py)]=imem1[:,:,j:j+math.ceil(c1dim/py)]
    idx+=1
