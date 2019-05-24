# -*- coding: utf-8 -*-
"""
Created on Tue May 21 23:21:47 2019

@author: Antonio
"""

import keras
#from keras import losses
from keras.utils import CustomObjectScope
from keras.initializers import glorot_uniform

import dataset
import plot

import matplotlib.pyplot as plt
import random
import numpy as np


NUM_CLASSES = 10 

x_test, y_test = dataset.process(NUM_CLASSES)[1]
#x_test = np.pad(x_test, ((0,0),(2,2),(2,2),(0,0)), 'constant')

print("\nTest Set:\t{} samples\n".format(len(x_test)))


with CustomObjectScope({'GlorotUniform': glorot_uniform()}):
    trained = keras.models.load_model('lenet5model.h5')

# Extract outputs of each layer in our trained_model
hidden_outputs = [layer.output for layer in trained.layers] #comprehension python?

# Creates a model that will return the OFMAPs of each layer, starting from
# previously trained sequential model. 
model = keras.Model(inputs = trained.input, outputs = hidden_outputs) 
model.summary()
'''
# now get the accuracy
model.compile(loss = losses.categorical_crossentropy, \
              optimizer = 'SGD', metrics = ['accuracy'])
model.evaluate()
'''
index = random.randint(0, len(x_test)-1)
image = x_test[index].squeeze()

plt.figure(figsize = (2,2))
plt.title('Test')
plt.imshow(image,cmap="gray")
print("\nImage Shape:\t{}\n".format(x_test[index].shape))

# test trained model
#x_test = x_test[index].reshape(1,28,28,1)
x_test = x_test[index].reshape(1,32,32,1) 
'''trova un reshape generico
'''
prediction = trained.predict(x_test)
print('\nPredicted:\t{}'.format(np.argmax(prediction)))
 
# evaluate fmaps 
feature_maps = model.predict(x_test)
layers_name = [layer.name for layer in model.layers[1:]]    

plot.featuremaps(layers_name, feature_maps)
'''
VISUALIZE FILTERS TOO
'''

'''
images_per_row = 6

for layer_name, fmap in zip(layers_name, feature_maps): # Displays the feature maps
        
    n_features = fmap.shape[-1] # Number of features in the feature map
        
    size = fmap.shape[1] #The feature map has shape (1, size, size, n_features).
    n_cols = n_features // images_per_row # Tiles the activation channels in this matrix
    display_grid = np.zeros((size * n_cols, images_per_row * size))
   
    for col in range(n_cols): # Tiles each filter into a big horizontal grid
        for row in range(images_per_row):

            channel_image = fmap[0, :, :, col * images_per_row + row]
            display_grid[col * size : (col + 1) * size, row * size : (row + 1) * size] \
            = channel_image
           
    scale = 1. / size
    plt.figure(figsize=(scale * display_grid.shape[1], scale * display_grid.shape[0]))
    plt.title(layer_name)
    plt.grid(False)
    plt.imshow(display_grid, aspect='auto', cmap='gray')#cividis, plasma
    
    save_dir = os.path.join(os.getcwd(), 'saved_models')
    if not os.path.isdir(save_dir):
        os.makedirs(save_dir)
        
    layer_path = os.path.join(save_dir, layer_name)
    plt.savefig("{}.png".format(layer_path))
'''
'''
for l in range(len(layers_name)):
    
    fmap_index = feature_maps[l].shape[-1]
    print(fmap_index)
    row_size = fmap_index // 8 + 1
    col_size = fmap_index % 8 
    
    fmap_index = 0
   
    fig, ax = plt.subplots(row_size, col_size, figsize=(row_size*2.5,col_size*1.5))

    for row in range(0,row_size):
        for col in range(0,col_size):
        
            ax[row][col].imshow(feature_maps[l][0, :, :, fmap_index], cmap='gray')
            fmap_index +=1
            print(fmap_index)
   '''