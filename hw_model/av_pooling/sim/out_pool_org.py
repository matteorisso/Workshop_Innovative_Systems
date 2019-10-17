# -*- coding: utf-8 -*-
"""
Created on Thu Oct 17 21:59:35 2019

@author: Admin
"""

def quantize_str(a) :
    b='0000'
    if a == 0.000:
        b = '0000'
    elif a == 0.125:
        b = '0001'
    elif a == 0.25:
        b = '0010'
    elif a == 0.375:
        b = '0011'
    elif a == 0.5:
        b = '0100'
    elif a == 0.625:
        b = '0101'
    elif a == 0.75:
        b ='0110'
    elif a == 0.875:
        b = '0111' 
    return b

out_pool = activations['s1/clip_by_value_1:0']
out_pool = out_pool[:,:,0]

f = open('out.txt','a+')

for i in range(4):
    for j in range(4):
        if i < 3 :
            if j < 3 :
                tmp_matrix=out_pool[j*4:j*4+4,i*4:i*4+4].reshape(16)
                for item in tmp_matrix.tolist():
                    f.write("%s\n" % quantize_str(item))  
            else:
                tmp_matrix=out_pool[j*4:j*4+2,i*4:i*4+4].reshape(8)
                for item in tmp_matrix.tolist():
                    f.write("%s\n" % quantize_str(item))
        else :
            if j < 3 :
                tmp_matrix=out_pool[j*4:j*4+4,i*4:i*4+2].reshape(8)
                for item in tmp_matrix.tolist():
                    f.write("%s\n" % quantize_str(item))  
            else:
                tmp_matrix=out_pool[j*4:j*4+2,i*4:i*4+2].reshape(4)
                for item in tmp_matrix.tolist():
                    f.write("%s\n" % quantize_str(item))

f.close()

num = 0

with open('out.txt','r') as f1 :
    with open('sim_resultspool.txt','r') as f2 :
        for (a,b) in zip(f1,f2) :
            if a == b :
                num += 1