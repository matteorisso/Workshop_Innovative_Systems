# -*- coding: utf-8 -*-
"""
Created on Tue May 21 23:18:51 2019

@author: Antonio
"""
from keras.datasets import mnist
from keras.utils import np_utils, normalize


def load(): 
    return mnist.load_data()    

def process(num_classes):
    
    (x_train, y_train), (x_test, y_test) = load()
    # Set numeric type to float32 from uint8
    x_train = x_train.astype('float32')
    x_test = x_test.astype('float32')
       
    # Normalized value 
    x_train = normalize(x_train, axis=-1)
    x_test  = normalize(x_test, axis=-1)
       
    # Transform labels to one-hot encoding for categorical_crossentropy loss function
    y_train = np_utils.to_categorical(y_train, num_classes)
    y_test = np_utils.to_categorical(y_test, num_classes)
    
    # Reshape the dataset into 4D array, because keras' layers objects need an 
    # array of that type as input.
    
    x_test  = np.pad(x_test, ((0,0),(2,2),(2,2),(0,0)), 'constant')
    x_train = np.pad(x_train,((0,0),(2,2),(2,2),(0,0)), 'constant')

    x_train = x_train.reshape(x_train.shape[0], 32,32,1)
    x_test = x_test.reshape(x_test.shape[0], 32,32,1)
    
    return (x_train, y_train), (x_test, y_test)