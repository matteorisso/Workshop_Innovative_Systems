# -*- coding: utf-8 -*-
"""
Created on Tue May 21 23:21:47 2019

@author: Matteo Risso, Alessandro Romeo, Antonio Simone
"""
'''
    Keras Sequential model : feature maps plot example
'''

# keras
from keras.models import Model, load_model
from keras.utils import CustomObjectScope
from keras.initializers import glorot_uniform
from keras.losses import categorical_crossentropy
# utils
import os
import random
import matplotlib.pyplot as plt
# data
import dataset 

import config as cf
'''
import sys
sys.stdout = open('transcript','w+')
'''

'''
 check log dir
'''
if not os.path.isdir(cf.savepath):
   import lenet  #exec : model definition and training 
        
print('Loading model...')    
with CustomObjectScope({'GlorotUniform': glorot_uniform()}):
    model = load_model('{}.hdf5'.format(cf.modelpath))

'''
 Extract outputs of each layer in our trained_model
'''
hidden_layers = [layer.output for layer in model.layers] 

'''
 Creates a model that will return the activations of each layer, starting from
 previously trained sequential model. 
'''

model = Model(inputs = model.input, outputs = hidden_layers) 
model.summary()

'''
 load mnist dataset with pre-processing
'''
data = dataset.mnist()
train, test = data.process()

x_train, y_train = train
x_test, y_test = test

'''
 generate random sample index
'''
index = random.randint(0, len(x_test)-1)
input_img = x_test[index].squeeze()

'''
 plot sample
'''   

if not os.path.isdir(cf.imgpath):
    os.makedirs(cf.imgpath)
    
import numpy as np

fig   = plt.figure(figsize = (1,1))
title = 'input_image: {}'.format(np.argmax(y_test[index]))
plt.title(title)
plt.axis('off')
plt.imshow(input_img, cmap='gray')

f = os.path.join(cf.imgpath, title.replace(': ','_')+'.png')

plt.savefig(f, bbox_inches='tight')
plt.close(fig)

#
##
#

'''
 display filters and activations 
'''

#
##
#
''' 
 get convolution kernels and biases
'''

from keract import get_activations
from keract import display_weights
from keract import display_activations
from keract import display_heatmaps

import scipy.io as spio

kernel = spio.loadmat('{}/conv_kernels.mat'.format(cf.savepath))
kernel = dict([ (key, kernel[key]) for key in list(kernel.keys())[3:]] )

display_weights(kernel,save=True, path=cf.imgpath)

''' 
 get activations
'''

model.compile(loss = categorical_crossentropy, optimizer = 'SGD')

activations = get_activations(model, x_test[index:index+1])

display_activations(activations, save=True, path=cf.imgpath)
display_heatmaps(activations, input_img, save=True, path=cf.imgpath)
