# -*- coding: utf-8 -*-
"""
Created on Tue May 21 23:18:51 2019

@author: Matteo Risso, Alessandro Romeo, Antonio Simone
"""

from keras import datasets
from keras.utils import np_utils, normalize
from PIL import Image, ImageFilter 

import numpy as np
import scipy.io as spio
import os


def _initialize(train :tuple, test :tuple):
    
    x_train, y_train = train
    x_test, y_test = test
    
    print('Size of:')
    print('- training set:\t{} samples'.format(len(x_train)))
    print('- test set:\t{} samples'.format(len(x_test)))
    
    # reshape (28,28) img : (28,28,1) = (height, width, channels)
    x_train = x_train.reshape(x_train.shape[0], 28,28,1)
    x_test  = x_test.reshape(x_test.shape[0], 28,28,1)
    
    print('\nImage Shape:\t{}'.format(x_train[0].shape))
    # reshape img to lenet5 input (32,32,1)
    x_train = np.pad(x_train, ((0,0),(2,2),(2,2),(0,0)), 'constant')
    x_test  = np.pad(x_test, ((0,0),(2,2),(2,2),(0,0)), 'constant')
    print('Reshape...')
    print('Image Shape:\t{}\n'.format(x_train[0].shape))
    
    train = (x_train,y_train)
    test = (x_test,y_test)
    
    return train,test
 
def _process(train :tuple, test :tuple, n_classes):
     
    x_train, y_train = train
    x_test,  y_test  = test
    
    x_train = x_train.astype('float32')
    x_test  = x_test.astype('float32')
       
    # normalize value to help loss function minimization during training 
    x_train = normalize(x_train, axis=-1)
    x_test  = normalize(x_test, axis=-1)
       
    # Transform labels to one-hot encoding for categorical_crossentropy loss function
    y_train = np_utils.to_categorical(y_train, n_classes)
    y_test  = np_utils.to_categorical(y_test,  n_classes)
    
    train = (x_train,y_train)
    test = (x_test,y_test)
    
    return train, test

class mnist():
    
    def __init__(self):
        
        self.n_classes = 10
        
        print('\nLoading MNIST...\n') 
        train, test = datasets.mnist.load_data()
        self.train, self.test = _initialize(train,test)
        
    def process(self):
        self.train, self.test = _process(self.train,self.test,self.n_classes)
        return self.train, self.test
        
class png2mnist():
    
    def __init__(self):
        pass

    # This function returns the pixel values. The input is a png file location.
    def process(self,argv):
        
        self.im          = Image.open(argv).convert('L')
        self.width       = float(self.im.size[0])
        self.height      = float(self.im.size[1])
        
        # creates white canvas of 28x28 pixels
        self.newImage = Image.new('L', (28, 28), (255)) 
        
        # check which dimension is bigger
        if self.width > self.height:  
            # resize height according to ratio width
            self.nheight = int(round((20.0 / self.width * self.height), 0)) 
            
            # rare case but minimum is 1 pixel
            if self.nheight == 0:      
                self.nheight = 1
            # resize and sharpen
            self.img = self.im.resize((20, self.nheight), \
                            Image.ANTIALIAS).filter(ImageFilter.SHARPEN)
            # calculate horizontal position
            self.wtop = int(round(((28 - self.nheight) / 2), 0)) 
            # paste resized image on white canvas
            self.newImage.paste(self.img, (4, self.wtop))  
            
        else:
            # resize width according to ratio height
            self.nwidth = int(round((20.0 / self.height * self.width), 0))  
            # rare case but minimum is 1 pixel
            if self.nwidth == 0: 
                self.nwidth = 1
            # resize and sharpen
            self.img    = self.im.resize((self.nwidth, 20), \
                                         Image.ANTIALIAS).filter(ImageFilter.SHARPEN)
            # caculate vertical pozition
            self.wleft  = int(round(((28 - self.nwidth) / 2), 0))  
            # paste resized image on white canvas
            self.newImage.paste(self.img, (self.wleft, 4))  
        
        # get pixel values
        self.tv     = list(self.newImage.getdata()) 
    
        # normalize pixels to 0 and 1. 0 is pure white, 1 is pure black.
        self.tva    = [(255 - x) * 1.0 / 255.0 for x in self.tv]
    
        return self.tva
    
    
    def getimg(self, dir_name='handwritten_ex'):
        
        # empty numpy array of dimension (10,28,28) where the dataset will be stored.
        self.handwritten_ds = np.empty((10,28,28))
        # In this loop the dataset of our handwritten digits is converted in the 
        # MNIST-like format and stored in the numpy array handwritten_ds
        for img, i in\
        zip(
                [ file for file in os.listdir(dir_name) if file.endswith('.png')],\
                range(10)):
            
            self.x      = self.process(os.path.join(dir_name,img))
            self.img    = np.array(self.x)
            self.img    = self.img.reshape(28,28)
            
            self.handwritten_ds[i] = self.img
            
        return self.handwritten_ds
    
