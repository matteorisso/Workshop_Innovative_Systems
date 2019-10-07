# -*- coding: utf-8 -*-
"""
Created on Sat Oct  5 11:48:44 2019

@author: Alessandro
"""


real_res1 = open("real_results.txt", "r").readlines()
real_res2 = open("real_results2.txt", "r").readlines()
sim_res1 = open("sim_results.txt", "r").readlines()
sim_res2 = open("sim_results2.txt", "r").readlines() 


if (real_res1 == sim_res1[:84]):
    print("The first layer is correct")
    
else:
    print("The first layer is not correct")

    
if (real_res2 == sim_res2[:10]):
    print("The second layer is correct")
else: 
    print("The first layer is not correct")


