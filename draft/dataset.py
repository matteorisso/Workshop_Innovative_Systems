# -*- coding: utf-8 -*-
"""
Created on Tue May 21 23:18:51 2019

@author: Antonio
"""
from keras.datasets import mnist
from keras.utils import np_utils


def get(): 
    # Load dataset as train and test sets
    return mnist.load_data()    

def process():

    (x_train, y_train), (x_test, y_test) = get()
    # Set numeric type to float32 from uint8
    x_train = x_train.astype('float32')
    x_test = x_test.astype('float32')
    
    # Normalize value to [0, 1]
    x_train /= 255
    x_test /= 255
    
    # Transform lables to one-hot encoding
    y_train = np_utils.to_categorical(y_train, 10)
    y_test = np_utils.to_categorical(y_test, 10)
    
    # Reshape the dataset into 4D array, because keras' layers objects need an 
    # array of that type as input.
    x_train = x_train.reshape(x_train.shape[0], 28,28,1)
    x_test = x_test.reshape(x_test.shape[0], 28,28,1)
    
    return (x_train, y_train), (x_test, y_test)