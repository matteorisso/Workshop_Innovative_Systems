# -*- coding: utf-8 -*-
"""
Created on Tue May 21 23:38:11 2019

@author: Antonio
"""
import matplotlib.pyplot as p
import numpy as np

def fmap(layers_name, feature_maps, save=None):
    
    images_per_row = 6
    
    for layer_name, fmap in zip(layers_name, feature_maps): # Displays the feature maps
        n_features = fmap.shape[-1] # Number of features in the feature map
        
        size = fmap.shape[1] #The feature map has shape (1, size, size, n_features).
        n_cols = n_features // images_per_row # Tiles the activation channels in this matrix
        display_grid = np.zeros((size * n_cols, images_per_row * size))
       
        for col in range(n_cols): # Tiles each filter into a big horizontal grid
            for row in range(images_per_row):

                channel_image = fmap[0, :, :, col * images_per_row + row]
                '''
                channel_image -= channel_image.mean() # Post-processes the feature to make it visually palatable
                channel_image /= channel_image.std()
                channel_image *= 64
                channel_image += 128
                channel_image = np.clip(channel_image, 0, 255).astype('uint8')
                ''' 
                display_grid[col * size : (col + 1) * size, row * size : (row + 1) * size] \
                = channel_image
               
        scale = 1. / size
        p.figure(figsize=(scale * display_grid.shape[1], scale * display_grid.shape[0]))
        p.title(layer_name)
        p.grid(False)
        p.imshow(display_grid, aspect='auto', cmap='viridis')#cividis, plasma
        
        if save == True:
            p.savefig("{}.png".format(layer_name))
        
def acc(hist):
        
	'''
	plotting the training accuracy and loss after each epoch.
	'''
	f, ax = p.subplots()
	ax.p([None] + hist.history['loss'], 'o-')
	ax.p([None] + hist.history['val_loss'], 'x-')
	'''
	plot legend and use the best location automatically: loc = 0
	'''
	ax.legend(['Train Loss', 'Validation Loss'], loc = 0)
	ax.set_title('Training/Validation Loss per Epoch')
	ax.set_xlabel('Epoch')
	ax.set_ylabel('Loss')

 
def history(hist):

    # list all data in history
    print(hist.history.keys())
    # summarize history for accuracy
    p.plot(hist.history['acc'])
    p.plot(hist.history['val_acc'])
    p.title('model accuracy')
    p.ylabel('accuracy')
    p.xlabel('epoch')
    p.legend(['train', 'test'], loc='upper left')
    p.show()
    # summarize history for loss
    p.plot(hist.history['loss'])
    p.plot(hist.history['val_loss'])
    p.title('model loss')
    p.ylabel('loss')
    p.xlabel('epoch')
    p.legend(['train', 'test'], loc='upper left')
    p.show()