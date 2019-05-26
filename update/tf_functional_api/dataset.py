# -*- coding: utf-8 -*-
"""
Created on Tue May 21 23:18:51 2019

@author: Matteo Risso, Alessandro Romeo, Antonio Simone
"""

from keras import datasets
from keras.utils import np_utils, normalize
import numpy as np
from PIL import Image, ImageFilter # pillow 

class mnist():
    
    def __init__(self, n_classes=10):
        
        # set labels
        self.n_classes = 10
        #import MNIST dataset w keras API
        print('Loading MNIST...') 
        (self.x_train,  self.y_train),   \
        (self.x_test,   self.y_test)        = datasets.mnist.load_data()
        # reshape (28,28) img : (28,28,1) = (height, width, channels)
        self.x_train    = self.x_train.reshape(self.x_train.shape[0], 28,28,1)
        self.x_test     = self.x_test.reshape(self.x_test.shape[0], 28,28,1)
        
        print()
        print("Image Shape:         {}".format(self.x_train[0].shape))
        print()
        print("Training Set:        {} samples".format(len(self.x_train)))
        print("Test Set:            {} samples".format(len(self.x_test)))
       
        # reshape img to LeNet5 input (32,32,1)
        self.x_train      = np.pad(self.x_train, ((0,0),(2,2),(2,2),(0,0)), 'constant')
        self.x_test       = np.pad(self.x_test, ((0,0),(2,2),(2,2),(0,0)), 'constant')
        print() 
        print("Updated Image Shape: {}".format(self.x_train[0].shape))
    
    def preprocess_input(self):
        ''' 
            Keras Sequential model pre-processing (to_categorical)
        '''
        
        self.x_train    = self.x_train.astype('float32')
        self.x_test     = self.x_test.astype('float32')
           
        # normalize value to help loss function minimization during training 
        self.x_train    = normalize(self.x_train, axis=-1)
        self.x_test     = normalize(self.x_test, axis=-1)
           
        # Transform labels to one-hot encoding for categorical_crossentropy loss function
        self.y_train    = np_utils.to_categorical(self.y_train, self.n_classes)
        self.y_test     = np_utils.to_categorical(self.y_test, self.n_classes)
        
        return (self.x_train, self.y_train), (self.x_test, self.y_test)


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
    
    
    def getimg(self):
        # empty numpy array of dimension (10,28,28) where the dataset will be stored.
        self.handwritten_ds = np.empty((10,28,28))
        
        # In this loop the dataset of our handwritten digits is converted in the 
        # MNIST-like format and stored in the numpy array handwritten_ds
        for i in range(10) : 
            
            self.x      = self.process('./immagini_test/test_LeNet5_'+str(i)+'.png')
            self.img    = np.array(self.x)
            self.img    = self.img.reshape(28,28)
            
            self.handwritten_ds[i] = self.img
            
        return self.handwritten_ds
            