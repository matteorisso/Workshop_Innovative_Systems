#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Sat May 25 18:40:05 2019

@author: Matteo Risso, Alessandro Romeo, Antonio Simone

"""
'''
    Keras Sequential model : test lenet5 architecture -self-made- dataset
                               
'''
import keras 
import dataset
import numpy as np

from keras.utils import CustomObjectScope
from keras.initializers import glorot_uniform

# load trained model
with CustomObjectScope({'GlorotUniform': glorot_uniform()}):
    trained_model = keras.models.load_model('./saved_models/lenet5model.h5')
# load test images from MNIST dataset 
mnist = dataset.mnist()
(x_test, y_test) = mnist.preprocess_input()[1]

# results from MNIST dataset
predictions_MNIST = trained_model.predict(x_test)
print('Loading self-made dataset...')
png2mnist = dataset.png2mnist()
# get dataset from png2mnist module
handwritten_ds = png2mnist.getimg()
# reshape samples to LeNet5 input : (32,32,1)
handwritten_ds = np.pad(handwritten_ds, ((0,0),(2,2),(2,2)), 'constant')
handwritten_ds = handwritten_ds.reshape(handwritten_ds.shape[0],32,32,1)

# results from self-made DS
predictions_ourDS = trained_model.predict(handwritten_ds)

# lists the correct evaluation of our self-made DS
List_ourDS_test = [i for i in range(10)]

# lists architecture predictions
List_prediction_MNIST = []
List_prediction_ourDS = []

for (i,j) in zip(predictions_MNIST, predictions_ourDS) :
    # argmax() gives the index of the max value in i(or j), therefore the max 
    # value in i-esim (or j-esim) row of predictions.
    # The result of argmax is stored in List_prediction_
    List_prediction_MNIST.append(i.argmax())
    List_prediction_ourDS.append(j.argmax())

# cast numpy array y_test to list in order to perform the comparison
List_y_test = y_test.tolist()   

# number of elements that differ between prediction and corrects results
n_diff_MNIST = 0
n_diff_ourDS = 0

for i in [(l_1 - l_2) for l_1, l_2 in zip(List_prediction_MNIST,List_y_test)] :
    if i != 0 :
        n_diff_MNIST += 1

for i in [(l_1 - l_2) for l_1, l_2 in zip(List_prediction_ourDS,List_ourDS_test)] :
    if i != 0 :
        n_diff_ourDS += 1

print("The number of elements that differ between prediction and expected results is : ")
print(n_diff_MNIST, "for MNIST dataset.")
print(n_diff_ourDS, "for our dataset.")
