#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
File : png_to_mnist.py
Author : Alessandro Romeo, Matteo Risso, Antonio Simone
Description : This script perform a conversion from .png of our handwritten
              digits, to an "mnist-like" format, i.e. a matrix with shape 
              (28,28). 
              For the function "imageprepare" thanks to Naveen Kumar Dasari.
              This function could be find following this URL :
              https://stackoverflow.com/questions/35842274/convert-own-image-to
              -mnists-image
"""

from PIL import Image, ImageFilter
import numpy
import matplotlib.pyplot as plt

# This function returns the pixel values.
# The imput is a png file location.
def imageprepare(argv):
    im = Image.open(argv).convert('L')
    width = float(im.size[0])
    height = float(im.size[1])
     # creates white canvas of 28x28 pixels
    newImage = Image.new('L', (28, 28), (255)) 
    
    # check which dimension is bigger
    if width > height:  
        # Width is bigger. Width becomes 20 pixels.
         # resize height according to ratio width
        nheight = int(round((20.0 / width * height), 0)) 
        # rare case but minimum is 1 pixel
        if (nheight == 0):  
            nheight = 1
        # resize and sharpen
        img = im.resize((20, nheight), \
                        Image.ANTIALIAS).filter(ImageFilter.SHARPEN)
        # calculate horizontal position
        wtop = int(round(((28 - nheight) / 2), 0)) 
        # paste resized image on white canvas
        newImage.paste(img, (4, wtop))  
        
    else:
        # Height is bigger. Heigth becomes 20 pixels.
        # resize width according to ratio height
        nwidth = int(round((20.0 / height * width), 0))  
         # rare case but minimum is 1 pixel
        if (nwidth == 0): 
            nwidth = 1
        # resize and sharpen
        img = im.resize((nwidth, 20), \
                        Image.ANTIALIAS).filter(ImageFilter.SHARPEN)
        # caculate vertical pozition
        wleft = int(round(((28 - nwidth) / 2), 0))  
        # paste resized image on white canvas
        newImage.paste(img, (wleft, 4))  
    
    # get pixel values
    tv = list(newImage.getdata()) 

    # normalize pixels to 0 and 1. 0 is pure white, 1 is pure black.
    tva = [(255 - x) * 1.0 / 255.0 for x in tv]

    return tva

# empty numpy array of dimension (10,28,28) where the dataset will be stored.
handwritten_ds = numpy.empty((10,28,28))

# In this loop the dataset of our handwritten digits is converted in the 
# MNIST-like format and stored in the numpy array handwritten_ds
for i in range(10) : 
    x = imageprepare('./immagini_test/test_LeNet5_'+str(i)+'.png')
    img = numpy.array(x)
    img = img.reshape(28,28)
    handwritten_ds[i] = img
    #plt.imshow(img, cmap='viridis', vmin=0, vmax=1)