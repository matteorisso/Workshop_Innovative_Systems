# -*- coding: utf-8 -*-
"""
Created on Tue May 21 10:48:33 2019

@author: Matteo Risso, Alessandro Romeo, Antonio Simone
"""
from tensorflow.examples.tutorials.mnist import input_data
from numpy import pad

class dataset():
    
    def __init__(self):
        
        mnist = input_data.read_data_sets("MNIST_data/", reshape=False)
                                                  # return tensor 28x28 ? how differs from mnist.load_data  
        self.x_train,       self.y_train          = mnist.train.images, mnist.train.labels
        self.x_validation,  self.y_validation     = mnist.validation.images, mnist.validation.labels
        self.x_test,        self.y_test           = mnist.test.images, mnist.test.labels
        
        assert(len(self.x_train)        == len(self.y_train))
        assert(len(self.x_validation)   == len(self.y_validation))
        assert(len(self.x_test)         == len(self.y_test))
          
        print()
        print("Image Shape: {}".format(self.x_train[0].shape))
        print()
        print("Training Set:   {} samples".format(len(self.x_train)))
        print("Validation Set: {} samples".format(len(self.x_validation)))
        print("Test Set:       {} samples".format(len(self.x_test)))
        
        self.x_train      = pad(self.x_train, ((0,0),(2,2),(2,2),(0,0)), 'constant')
        self.x_validation = pad(self.x_validation, ((0,0),(2,2),(2,2),(0,0)), 'constant')
        self.x_test       = pad(self.x_test, ((0,0),(2,2),(2,2),(0,0)), 'constant')
            
        print("Updated Image Shape: {}".format(self.x_train[0].shape))
    
        