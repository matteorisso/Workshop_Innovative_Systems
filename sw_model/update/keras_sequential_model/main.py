# -*- coding: utf-8 -*-
"""
Created on Tue May 21 23:21:47 2019

@author: Matteo Risso, Alessandro Romeo, Antonio Simone
"""
'''
    Keras Sequential model : feature maps plot example
'''
import keras

from keras.utils import CustomObjectScope
from keras.initializers import glorot_uniform

import matplotlib.pyplot as plt
import random

import os

import dataset
import plot

# check pre-trained model
saved_models = os.path.join(os.getcwd(), 'saved_models')
if not os.path.isdir(saved_models):
    import lenet #exec : model definition and training 
    
print('Loading model...')    
with CustomObjectScope({'GlorotUniform': glorot_uniform()}):
    trained = keras.models.load_model('{}/lenet5model.h5'.format(saved_models))

# Extract outputs of each layer in our trained_model
hidden_outputs = [layer.output for layer in trained.layers] #comprehension python?

# Creates a model that will return the OFMAPs of each layer, starting from
# previously trained sequential model. 
model = keras.Model(inputs = trained.input, outputs = hidden_outputs) 
model.summary()

# load mnist dataset with pre-processing
data = dataset.mnist()
x_test, y_test = data.preprocess_input()[1]
# generate random sample index
index = random.randint(0, len(x_test)-1)
image = x_test[index].squeeze()
# plot sample
plt.figure(figsize = (2,2))
plt.title('Test')
plt.imshow(image,cmap="gray")
# evaluate fmaps 
feature_maps = model.predict(x_test[index].reshape(1,32,32,1))
layers_name = [layer.name for layer in model.layers[1:]]    
# display hidden layers outputs (fmaps)
plot.featuremaps(layers_name, feature_maps)
'''
VISUALIZE FILTERS TOO
'''
#NOW TEST HANDWRITTEN DIGITS
#import test_myLeNet_5  #exec
