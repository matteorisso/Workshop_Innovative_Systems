#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Sat May 25 18:40:05 2019

@author: Matteo Risso, Alessandro Romeo, Antonio Simone

"""
'''
    Keras Sequential model : test lenet5 architecture -self-made- dataset
                               
'''
from keras.models import load_model
from keras.utils import CustomObjectScope
from keras.initializers import glorot_uniform

import data.dataset as dataset


import numpy as np

# load trained model
with CustomObjectScope({'GlorotUniform': glorot_uniform()}):
    model = load_model('../model/saved_model/lenet5model.h5')
# load test images from MNIST dataset 
mnist = dataset.mnist()
(x_test, y_test) = mnist.preprocess_input()[1]

# results from MNIST dataset
predictions_MNIST = model.predict(x_test)

# load self-made dataset
print('\n'*2)
print('loading self-made dataset...')
print('\n'*2)

png2mnist = dataset.png2mnist()
# get dataset from png2mnist module
handwritten_ds = png2mnist.getimg()
# reshape samples to leNet5 input : (32,32,1)
handwritten_ds = np.pad(handwritten_ds, ((0,0),(2,2),(2,2)), 'constant')
handwritten_ds = handwritten_ds.reshape(handwritten_ds.shape[0],32,32,1)

# results from self-made DS
predictions_ourDS = model.predict(handwritten_ds)

# lists the correct evaluation of our self-made DS
list_ourDS_test = [i for i in range(10)]

# lists architecture predictions
list_prediction_MNIST = []
list_prediction_ourDS = []

for (i,j) in zip(predictions_MNIST, predictions_ourDS) :
    # argmax() gives the index of the max value in i(or j), therefore the max 
    # value in i-esim (or j-esim) row of predictions.
    # The result of argmax is stored in list_prediction_
    
    list_prediction_MNIST.append(i.argmax())
    list_prediction_ourDS.append(j.argmax())
    
# cast numpy array y_test to list in order to perform the comparison
list_y = y_test.tolist()  
list_y_test = []
for i in list_y : 
    list_y_test.append(i.index(1.0))

# number of elements that differ between prediction and corrects results
n_diff_MNIST = 0
n_diff_ourDS = 0

for k in [l_1-l_2 for l_1, l_2 in zip(list_prediction_MNIST,list_y_test)] :
    if k != 0 :
        n_diff_MNIST += 1

for k in [l_1-l_2 for l_1, l_2 in zip(list_prediction_ourDS,list_ourDS_test)] :
    if k != 0 :
        n_diff_ourDS += 1

print('\n'*2)
print("The number of elements that differ between prediction and expected results is : ")
print(n_diff_MNIST, "for MNIST dataset.")
print(n_diff_ourDS, "for our dataset.")
print('dataset:\n{}'.format(list_ourDS_test))
print('predictions:\n{}'.format(list_prediction_ourDS))
