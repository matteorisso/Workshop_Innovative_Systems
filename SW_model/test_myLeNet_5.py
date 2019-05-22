#!/usr/bin/env python3
# -*- coding: utf-8 -*-

"""
File : test_myLeNet_5.py
Author : Alessandro Romeo, Matteo Risso, Antonio Simone
Description : keras' commands to upload our trained SW model of the CNN LeNet-5
              and to test it with two different dataset, one from MNIST, the 
              other is a set of handwritten digits from 0 to 9 written by us.
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

predictions_MNIST = trained_model.predict(x_test_float)

# run the script png_to_mnist in order to obtain our self-written dataset.
exec(open("png_to_mnist.py").read())

img_reshaped = handwritten_ds.reshape(handwritten_ds.shape[0],28,28,1)
predictions_ourDS = trained_model.predict(img_reshaped)

# list containing the correct evaluation of our self-created DS
List_ourDS_test = [i for i in range(10)]

# List_prediction_MNIST and are the lists where is saved the most probable 
# numbers according to the CNN
List_prediction_MNIST = []
List_prediction_ourDS = []

# Iteration on the matrix predictions
for (i,j) in zip(predictions_MNIST, predictions_ourDS) :
    # argmax() gives the index of the max value in i(or j), therefore the max 
    # value in i-esim (or j-esim) row of predictions.
    # The result of argmax is stored in List_prediction_
    List_prediction_MNIST.append(i.argmax())
    List_prediction_ourDS.append(j.argmax())

# Cast numpy array y_test to list in order to perform the comparison
List_y_test = y_test.tolist()   

# Number of elements that differ between prediction and corrects results
n_diff_MNIST = 0
n_diff_ourDS = 0

for i in [l_1 - l_2 for l_1, l_2 in zip(List_prediction_MNIST,List_y_test)] :
    if i != 0 :
        n_diff_MNIST += 1

for i in [l_1 - l_2 for l_1, l_2 in zip(List_prediction_ourDS,List_ourDS_test)] :
    if i != 0 :
        n_diff_ourDS += 1

print("The number of elements that differ between prediction and expected results is : ")
print(n_diff_MNIST, "for MNIST dataset.")
print(n_diff_ourDS, "for our dataset.")
