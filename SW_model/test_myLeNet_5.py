#!/usr/bin/env python3
# -*- coding: utf-8 -*-

"""
File : test_myLeNet_5.py
Author : Alessandro Romeo, Matteo Risso, Antonio Simone
Description : keras' commands to upload our trained SW model of the CNN LeNet-5
              and to test it with data.
"""

import keras 

# Uploading our trained model
trained_model = keras.models.load_model("trained_LeNet5.h5")

# Downloading from MNIST the test dataset, x_test contains the images for the 
# testing process, y_test contains the expected results from the CNN
from keras.datasets import mnist
(_, _), (x_test, y_test) = mnist.load_data()

# New data are given to the CNN, the results of the prediction will be saved in
# a 2D matrix  with a number of rows equal to the number of pictures analyzed 
# and a number of columns equal to 10, where every column represent the 
# corresponding probablity that the nth sample is the value is the index of the 
# column.

# N.B.: the input data MUST be organized in a 4D tensor.
x_test_float = x_test.astype('float32')
x_test_float = x_test_float.reshape(x_test.shape[0], 28,28,1)

predictions = trained_model.predict(x_test_float)

