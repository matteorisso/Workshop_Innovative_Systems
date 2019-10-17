# -*- coding: utf-8 -*-
"""
Created on Sat Oct 12 09:45:04 2019

@author: Admin
"""
import numpy

def quantize(a) :
    b=0
    if a == 0.000:
        b = 0.000
    elif a == 0.125:
        b = 0.001
    elif a == 0.25:
        b = 0.010
    elif a == 0.375:
        b = 0.011
    elif a == 0.5:
        b = 0.100
    elif a == 0.625:
        b = 0.101
    elif a == 0.75:
        b = 0.110
    elif a == 0.875:
        b = 0.111 
    return b



pool_in=activations['c1/clip_by_value_1:0']
pool_in_0=pool_in[:,:,0]

for i in range(28):
    for j in range(28):
        tmp = pool_in_0[i,j]
        pool_in_0[i,j]=quantize(tmp)

rf_0_e = []
rf_1_e = []
rf_2_e = []
rf_3_e = []

rf_0_o = []
rf_1_o = []
rf_2_o = []
rf_3_o = []

for j in range(0,26,8) :
    for i in range(4) :
        if j != 24 :
            rf_0_e.append(pool_in_0[i*8,j])
            rf_0_e.append(pool_in_0[i*8,j+2])
            rf_0_e.append(pool_in_0[i*8,j+4])
            rf_0_e.append(pool_in_0[i*8,j+6])
            rf_0_e.append(pool_in_0[i*8+1,j])
            rf_0_e.append(pool_in_0[i*8+1,j+2])
            rf_0_e.append(pool_in_0[i*8+1,j+4])
            rf_0_e.append(pool_in_0[i*8+1,j+6])
        else:
            rf_0_e.append(pool_in_0[i*8,j])
            rf_0_e.append(pool_in_0[i*8,j+2])
            rf_0_e.append(pool_in_0[i*8,j])
            rf_0_e.append(pool_in_0[i*8,j+2])
            rf_0_e.append(pool_in_0[i*8+1,j])
            rf_0_e.append(pool_in_0[i*8+1,j+2])
            rf_0_e.append(pool_in_0[i*8+1,j])
            rf_0_e.append(pool_in_0[i*8+1,j+2])

for j in range(0,26,8) :
    for i in range(4) :
        if j != 24 :
            rf_1_e.append(pool_in_0[i*8+2,j])
            rf_1_e.append(pool_in_0[i*8+2,j+2])
            rf_1_e.append(pool_in_0[i*8+2,j+4])
            rf_1_e.append(pool_in_0[i*8+2,j+6])
            rf_1_e.append(pool_in_0[i*8+3,j])
            rf_1_e.append(pool_in_0[i*8+3,j+2])
            rf_1_e.append(pool_in_0[i*8+3,j+4])
            rf_1_e.append(pool_in_0[i*8+3,j+6])
        else:
            rf_1_e.append(pool_in_0[i*8+2,j])
            rf_1_e.append(pool_in_0[i*8+2,j+2])
            rf_1_e.append(pool_in_0[i*8+2,j])
            rf_1_e.append(pool_in_0[i*8+2,j+2])
            rf_1_e.append(pool_in_0[i*8+3,j])
            rf_1_e.append(pool_in_0[i*8+3,j+2]) 
            rf_1_e.append(pool_in_0[i*8+3,j])
            rf_1_e.append(pool_in_0[i*8+3,j+2]) 
            
for j in range(0,26,8) :
    for i in range(4) :
        if j != 24 :
            if i != 3 :
                rf_2_e.append(pool_in_0[i*8+4,j])
                rf_2_e.append(pool_in_0[i*8+4,j+2])
                rf_2_e.append(pool_in_0[i*8+4,j+4])
                rf_2_e.append(pool_in_0[i*8+4,j+6])
                rf_2_e.append(pool_in_0[i*8+5,j])
                rf_2_e.append(pool_in_0[i*8+5,j+2])
                rf_2_e.append(pool_in_0[i*8+5,j+4])
                rf_2_e.append(pool_in_0[i*8+5,j+6])
            else:
                rf_2_e.append(pool_in_0[i*8,j])
                rf_2_e.append(pool_in_0[i*8,j+2])
                rf_2_e.append(pool_in_0[i*8,j+4])
                rf_2_e.append(pool_in_0[i*8,j+6])
                rf_2_e.append(pool_in_0[i*8+1,j])
                rf_2_e.append(pool_in_0[i*8+1,j+2])
                rf_2_e.append(pool_in_0[i*8+1,j+4])
                rf_2_e.append(pool_in_0[i*8+1,j+6])
        else :
            if i != 3 :
                rf_2_e.append(pool_in_0[i*8+4,j])
                rf_2_e.append(pool_in_0[i*8+4,j+2])
                rf_2_e.append(pool_in_0[i*8+4,j])
                rf_2_e.append(pool_in_0[i*8+4,j+2])
                rf_2_e.append(pool_in_0[i*8+5,j])
                rf_2_e.append(pool_in_0[i*8+5,j+2])
                rf_2_e.append(pool_in_0[i*8+5,j])
                rf_2_e.append(pool_in_0[i*8+5,j+2])
            else:
                rf_2_e.append(pool_in_0[i*8,j])
                rf_2_e.append(pool_in_0[i*8,j+2])
                rf_2_e.append(pool_in_0[i*8,j])
                rf_2_e.append(pool_in_0[i*8,j+2])
                rf_2_e.append(pool_in_0[i*8+1,j])
                rf_2_e.append(pool_in_0[i*8+1,j+2])
                rf_2_e.append(pool_in_0[i*8+1,j])
                rf_2_e.append(pool_in_0[i*8+1,j+2])
            
for j in range(0,26,8) :
    for i in range(4) :
        if j != 24 :
            if i != 3 :
                rf_3_e.append(pool_in_0[i*8+6,j])
                rf_3_e.append(pool_in_0[i*8+6,j+2])
                rf_3_e.append(pool_in_0[i*8+6,j+4])
                rf_3_e.append(pool_in_0[i*8+6,j+6])
                rf_3_e.append(pool_in_0[i*8+7,j])
                rf_3_e.append(pool_in_0[i*8+7,j+2])
                rf_3_e.append(pool_in_0[i*8+7,j+4])
                rf_3_e.append(pool_in_0[i*8+7,j+6])
            else:
                rf_3_e.append(pool_in_0[i*8+2,j])
                rf_3_e.append(pool_in_0[i*8+2,j+2])
                rf_3_e.append(pool_in_0[i*8+2,j+4])
                rf_3_e.append(pool_in_0[i*8+2,j+6])
                rf_3_e.append(pool_in_0[i*8+3,j])
                rf_3_e.append(pool_in_0[i*8+3,j+2])
                rf_3_e.append(pool_in_0[i*8+3,j+4])
                rf_3_e.append(pool_in_0[i*8+3,j+6])
        else :
            if i != 3 :
                rf_3_e.append(pool_in_0[i*8+6,j])
                rf_3_e.append(pool_in_0[i*8+6,j+2])
                rf_3_e.append(pool_in_0[i*8+7,j])
                rf_3_e.append(pool_in_0[i*8+7,j+2]) 
                rf_3_e.append(pool_in_0[i*8+6,j])
                rf_3_e.append(pool_in_0[i*8+6,j+2])
                rf_3_e.append(pool_in_0[i*8+7,j])
                rf_3_e.append(pool_in_0[i*8+7,j+2])
            else :
                rf_3_e.append(pool_in_0[i*8+2,j])
                rf_3_e.append(pool_in_0[i*8+2,j+2])
                rf_3_e.append(pool_in_0[i*8+2,j])
                rf_3_e.append(pool_in_0[i*8+2,j+2]) 
                rf_3_e.append(pool_in_0[i*8+3,j])
                rf_3_e.append(pool_in_0[i*8+3,j+2])
                rf_3_e.append(pool_in_0[i*8+3,j])
                rf_3_e.append(pool_in_0[i*8+3,j+2])

for j in range(1,26,8) :
    for i in range(4) :
        if j != 25 :
            rf_0_o.append(pool_in_0[i*8,j])
            rf_0_o.append(pool_in_0[i*8,j+2])
            rf_0_o.append(pool_in_0[i*8,j+4])
            rf_0_o.append(pool_in_0[i*8,j+6])
            rf_0_o.append(pool_in_0[i*8+1,j])
            rf_0_o.append(pool_in_0[i*8+1,j+2])
            rf_0_o.append(pool_in_0[i*8+1,j+4])
            rf_0_o.append(pool_in_0[i*8+1,j+6])
        else:
            rf_0_o.append(pool_in_0[i*8,j])
            rf_0_o.append(pool_in_0[i*8,j+2])
            rf_0_o.append(pool_in_0[i*8,j])
            rf_0_o.append(pool_in_0[i*8,j+2])
            rf_0_o.append(pool_in_0[i*8+1,j])
            rf_0_o.append(pool_in_0[i*8+1,j+2])
            rf_0_o.append(pool_in_0[i*8+1,j])
            rf_0_o.append(pool_in_0[i*8+1,j+2])

for j in range(1,26,8) :
    for i in range(4) :
        if j != 25 :
            rf_1_o.append(pool_in_0[i*8+2,j])
            rf_1_o.append(pool_in_0[i*8+2,j+2])
            rf_1_o.append(pool_in_0[i*8+2,j+4])
            rf_1_o.append(pool_in_0[i*8+2,j+6])
            rf_1_o.append(pool_in_0[i*8+3,j])
            rf_1_o.append(pool_in_0[i*8+3,j+2])
            rf_1_o.append(pool_in_0[i*8+3,j+4])
            rf_1_o.append(pool_in_0[i*8+3,j+6])
        else:
            rf_1_o.append(pool_in_0[i*8+2,j])
            rf_1_o.append(pool_in_0[i*8+2,j+2])
            rf_1_o.append(pool_in_0[i*8+2,j])
            rf_1_o.append(pool_in_0[i*8+2,j+2])
            rf_1_o.append(pool_in_0[i*8+3,j])
            rf_1_o.append(pool_in_0[i*8+3,j+2])
            rf_1_o.append(pool_in_0[i*8+3,j])
            rf_1_o.append(pool_in_0[i*8+3,j+2])
            
for j in range(1,26,8) :
    for i in range(4) :
        if j != 25 :
            if i != 3 :
                rf_2_o.append(pool_in_0[i*8+4,j])
                rf_2_o.append(pool_in_0[i*8+4,j+2])
                rf_2_o.append(pool_in_0[i*8+4,j+4])
                rf_2_o.append(pool_in_0[i*8+4,j+6])
                rf_2_o.append(pool_in_0[i*8+5,j])
                rf_2_o.append(pool_in_0[i*8+5,j+2])
                rf_2_o.append(pool_in_0[i*8+5,j+4])
                rf_2_o.append(pool_in_0[i*8+5,j+6])
            else:
                rf_2_o.append(pool_in_0[i*8,j])
                rf_2_o.append(pool_in_0[i*8,j+2])
                rf_2_o.append(pool_in_0[i*8,j+4])
                rf_2_o.append(pool_in_0[i*8,j+6])
                rf_2_o.append(pool_in_0[i*8+1,j])
                rf_2_o.append(pool_in_0[i*8+1,j+2])
                rf_2_o.append(pool_in_0[i*8+1,j+4])
                rf_2_o.append(pool_in_0[i*8+1,j+6])
        else :
            if i != 3 :
                rf_2_o.append(pool_in_0[i*8+4,j])
                rf_2_o.append(pool_in_0[i*8+4,j+2])
                rf_2_o.append(pool_in_0[i*8+5,j])
                rf_2_o.append(pool_in_0[i*8+5,j+2]) 
                rf_2_o.append(pool_in_0[i*8+4,j])
                rf_2_o.append(pool_in_0[i*8+4,j+2])
                rf_2_o.append(pool_in_0[i*8+5,j])
                rf_2_o.append(pool_in_0[i*8+5,j+2]) 
            else :
                rf_2_o.append(pool_in_0[i*8,j])
                rf_2_o.append(pool_in_0[i*8,j+2])
                rf_2_o.append(pool_in_0[i*8,j])
                rf_2_o.append(pool_in_0[i*8,j+2]) 
                rf_2_o.append(pool_in_0[i*8+1,j])
                rf_2_o.append(pool_in_0[i*8+1,j+2])
                rf_2_o.append(pool_in_0[i*8+1,j])
                rf_2_o.append(pool_in_0[i*8+1,j+2])
            
for j in range(1,26,8) :
    for i in range(4) :
        if j != 25 :
            if i != 3 :
                rf_3_o.append(pool_in_0[i*8+6,j])
                rf_3_o.append(pool_in_0[i*8+6,j+2])
                rf_3_o.append(pool_in_0[i*8+6,j+4])
                rf_3_o.append(pool_in_0[i*8+6,j+6])
                rf_3_o.append(pool_in_0[i*8+7,j])
                rf_3_o.append(pool_in_0[i*8+7,j+2])
                rf_3_o.append(pool_in_0[i*8+7,j+4])
                rf_3_o.append(pool_in_0[i*8+7,j+6])
            else:
                rf_3_o.append(pool_in_0[i*8+2,j])
                rf_3_o.append(pool_in_0[i*8+2,j+2])
                rf_3_o.append(pool_in_0[i*8+2,j+4])
                rf_3_o.append(pool_in_0[i*8+2,j+6])
                rf_3_o.append(pool_in_0[i*8+3,j])
                rf_3_o.append(pool_in_0[i*8+3,j+2])
                rf_3_o.append(pool_in_0[i*8+3,j+4])
                rf_3_o.append(pool_in_0[i*8+3,j+6])
        else :
            if i != 3 :
                rf_3_o.append(pool_in_0[i*8+6,j])
                rf_3_o.append(pool_in_0[i*8+6,j+2])
                rf_3_o.append(pool_in_0[i*8+7,j])
                rf_3_o.append(pool_in_0[i*8+7,j+2])
                rf_3_o.append(pool_in_0[i*8+6,j])
                rf_3_o.append(pool_in_0[i*8+6,j+2])
                rf_3_o.append(pool_in_0[i*8+7,j])
                rf_3_o.append(pool_in_0[i*8+7,j+2]) 
            else :
                rf_3_o.append(pool_in_0[i*8+2,j])
                rf_3_o.append(pool_in_0[i*8+2,j+2])
                rf_3_o.append(pool_in_0[i*8+2,j])
                rf_3_o.append(pool_in_0[i*8+2,j+2])
                rf_3_o.append(pool_in_0[i*8+3,j])
                rf_3_o.append(pool_in_0[i*8+3,j+2])
                rf_3_o.append(pool_in_0[i*8+3,j])
                rf_3_o.append(pool_in_0[i*8+3,j+2])
            
with open('rf_0_e.txt', 'w') as f:
    for item in rf_0_e:
        f.write("%s\n" % item)
        
with open('rf_1_e.txt', 'w') as f:
    for item in rf_1_e:
        f.write("%s\n" % item)
        
with open('rf_2_e.txt', 'w') as f:
    for item in rf_2_e:
        f.write("%s\n" % item)
        
with open('rf_3_e.txt', 'w') as f:
    for item in rf_3_e:
        f.write("%s\n" % item)
        
with open('rf_0_o.txt', 'w') as f:
    for item in rf_0_o:
        f.write("%s\n" % item)
        
with open('rf_1_o.txt', 'w') as f:
    for item in rf_1_o:
        f.write("%s\n" % item)
        
with open('rf_2_o.txt', 'w') as f:
    for item in rf_2_o:
        f.write("%s\n" % item)
        
with open('rf_3_o.txt', 'w') as f:
    for item in rf_3_o:
        f.write("%s\n" % item)