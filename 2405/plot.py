# -*- coding: utf-8 -*-
"""
Created on Tue May 21 23:38:11 2019

@author: Antonio
"""
import matplotlib.pyplot as plt
import numpy as np
import os

def featuremaps(layers_name, feature_maps, save=None):
    
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
        

def history(hist):
    ''' 
    https://keras.io/visualization/
    '''
    
    save_dir = os.path.join(os.getcwd(), 'saved_models')
    if not os.path.isdir(save_dir):
        os.makedirs(save_dir)
        
    acc = hist.history['acc']
    val_acc = hist.history['val_acc']
    loss = hist.history['loss']
    val_loss = hist.history['val_loss']
    epochs = range(1, len(acc) + 1)
    
    title = 'Training and validation accuracy'
    
    plt.plot(epochs, acc, 'r', label='Training acc')
    plt.plot(epochs, val_acc, 'g', label='Validation acc')
    plt.title(title)
    plt.legend()
    plt.ylabel('Accuracy')
    plt.xlabel('Epoch')
    
    path = os.path.join(save_dir, title)
    plt.savefig("{}.png".format(path))

    title = 'Training and validation loss'
    
    plt.figure()
    plt.plot(epochs, loss, 'r', label='Training loss')
    plt.plot(epochs, val_loss, 'g', label='Validation loss')
    plt.title(title)
    plt.legend()
    plt.ylabel('Loss')
    plt.xlabel('Epoch')

    path = os.path.join(save_dir, title)
    plt.savefig("{}.png".format(path))
        
    plt.show()
        
        
        
