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
import numpy as np


# Uploading our trained model
trained_model = keras.models.load_model("trained_LeNet5_act.h5")

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


layer_names = []
for layer in trained_model.layers[:]:
    layer_names.append(layer.name) # Names of the layers, so you can have them as part of your plot

images_per_row = 6
for layer_name, layer_activation in zip(layer_names, activations): # Displays the feature maps
    n_features = layer_activation.shape[-1] # Number of features in the feature map
    size = layer_activation.shape[1] #The feature map has shape (1, size, size, n_features).
    n_cols = n_features // images_per_row # Tiles the activation channels in this matrix
    display_grid = np.zeros((size * n_cols, images_per_row * size))
    for col in range(n_cols): # Tiles each filter into a big horizontal grid
        for row in range(images_per_row):
            channel_image = layer_activation[0,
                                             :, :,
                                             col * images_per_row + row]
            channel_image -= channel_image.mean() # Post-processes the feature to make it visually palatable
            channel_image /= channel_image.std()
            channel_image *= 64
            channel_image += 128
            channel_image = np.clip(channel_image, 0, 255).astype('uint8')
            display_grid[col * size : (col + 1) * size, # Displays the grid
                         row * size : (row + 1) * size] = channel_image
    scale = 1. / size
    plt.figure(figsize=(scale * display_grid.shape[1],
                        scale * display_grid.shape[0]))
    plt.title(layer_name)
    plt.grid(False)
    plt.imshow(display_grid, aspect='auto', cmap='viridis')
    plt.savefig(layer_name+'.png')
#plt.matshow(C1_outputs[0, :, :, 4], cmap='gray')

