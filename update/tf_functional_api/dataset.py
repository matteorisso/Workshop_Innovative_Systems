# -*- coding: utf-8 -*-
"""
Created on Tue May 21 10:48:33 2019

@author: Matteo Risso, Alessandro Romeo, Antonio Simone
"""

from keras import datasets
from keras.utils import np_utils, normalize
from numpy import pad

class mnist():
    def __init__(self, n_classes=10, verbose=True):
         
        self.n_classes = 10
        
        print('Loading MNIST...') 
        (self.x_train,  self.y_train),   \
        (self.x_test,   self.y_test)        = datasets.mnist.load_data()
        # reshape (28,28) img : Tensor
        self.x_train    = self.x_train.reshape(self.x_train.shape[0], 28,28,1)
        self.x_test     = self.x_test.reshape(self.x_test.shape[0], 28,28,1)
        
        if verbose==False:
            self.x_train      = pad(self.x_train, ((0,0),(2,2),(2,2),(0,0)), 'constant')
            self.x_test       = pad(self.x_test, ((0,0),(2,2),(2,2),(0,0)), 'constant')
        else:     
            print()
            print("Image Shape:         {}".format(self.x_train[0].shape))
            print()
            print("Training Set:        {} samples".format(len(self.x_train)))
            print("Test Set:            {} samples".format(len(self.x_test)))
            
            self.x_train      = pad(self.x_train, ((0,0),(2,2),(2,2),(0,0)), 'constant')
            self.x_test       = pad(self.x_test, ((0,0),(2,2),(2,2),(0,0)), 'constant')
             
            print("Updated Image Shape: {}".format(self.x_train[0].shape))
        
    def process(self):
        
        self.x_train    = self.x_train.astype('float32')
        self.x_test     = self.x_test.astype('float32')
           
        '''Normalized value
        '''
        self.x_train    = normalize(self.x_train, axis=-1)
        self.x_test     = normalize(self.x_test, axis=-1)
           
        ''' Transform labels to one-hot encoding for categorical_crossentropy loss function
        '''
        self.y_train    = np_utils.to_categorical(self.y_train, self.n_classes)
        self.y_test     = np_utils.to_categorical(self.y_test, self.n_classes)
        
        return (self.x_train, self.y_train), (self.x_test, self.y_test)

