# -*- coding: utf-8 -*-
"""
Spyder Editor

This is a temporary script file.
"""
import numpy as np


file_data    = open("c3_input.txt", "r")
file_weights = open("c3_pesi_ord.txt", "r")

i_data = file_data.readlines()
i_weights = file_weights.readlines()

tmp = np.zeros(16) 

for i in range(400): 
   
    for n in range(16): 
    
      tmp[n] = tmp[n] + float(i_data[i])*float(i_weights[n+16*i]) 



file_data.close()
file_weights.close()
    
    