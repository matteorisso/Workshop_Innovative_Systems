#!/usr/bin/env python3
# -*- coding: utf-8 -*-

"""
File : intermediate_result_myLeNet_5.py
Author : Alessandro Romeo, Matteo Risso, Antonio Simone
Description : keras' commands to show intermediate results of each layer of
              our trained SW model of the CNN LeNet-5.
"""

import keras 
from keras import models

import matplotlib.pyplot as plt


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
x_test_float = x_test_float[0].reshape(1, 28,28,1)

# In this script we feed the NN with only one image, because our goal is to 
# plot the output of each layer in order to understand how the NN works.
# In particular we will use the first picture of MNIST which is a 
# representation of the digit seven (7)
predictions = trained_model.predict(x_test_float)

# Extract outputs of each layer in our trained_model
layer_outputs = [layer.output for layer in trained_model.layers[:]]

# Creates a model that will return the OFMAPs of each layer, starting from
# the sequential model previously trained "trained_LeNet5.h5"
activation_model = models.Model(inputs = trained_model.input, \
                                outputs = layer_outputs) 

# Returns a list of eight Numpy arrays: one array per layer activation
activations = activation_model.predict(x_test_float)

# C1 Convolutional Layer
C1_outputs = activations[0]

# S2 Pooling Layer
S2_outputs = activations[1]

# C3 Convolutional Layer
C3_outputs = activations[2]

# S4 Pooling Layer
S4_outputs = activations[3]

# C5 Fully Connected Convolutional Layer
C5_outputs = activations[4]

#Flatten the CNN output so that we can connect it with fully connected layers
flattening_outputs = activations[5]

# FC6 Fully Connected Layer
FC6_outputs = activations[6]

#Output Layer with softmax activation
softmax_outputs = activations[7]

plt.matshow(C1_outputs[0, :, :, 4], cmap='gray')

