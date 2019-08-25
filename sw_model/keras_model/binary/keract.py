import keras.backend as K
from keras.models import Model

import matplotlib.pyplot as plt
import math
import numpy as np
import os

def _evaluate(model: Model, nodes_to_evaluate, x, y=None):
    if not model._is_compiled:
        if model.name in ['vgg16', 'vgg19', 'inception_v3', 'inception_resnet_v2', 'mobilenet_v2', 'mobilenetv2']:
            print('Transfer learning detected. Model will be compiled with ("categorical_crossentropy", "adam").')
            print('If you want to change the default behaviour, then do in python:')
            print('model.name = ""')
            print('Then compile your model with whatever loss you want: https://keras.io/models/model/#compile.')
            print('If you want to get rid of this message, add this line before calling keract:')
            print('model.compile(loss="categorical_crossentropy", optimizer="adam")')
            model.compile(loss='categorical_crossentropy', optimizer='adam')
        else:
            print('Please compile your model first! https://keras.io/models/model/#compile.')
            print('If you only care about the activations (outputs of the layers), '
                  'then just compile your model like that:')
            print('model.compile(loss="mse", optimizer="adam")')
            raise Exception('Compilation of the model required.')
    symb_inputs = (model._feed_inputs + model._feed_targets + model._feed_sample_weights)
    f = K.function(symb_inputs, nodes_to_evaluate)
    x_, y_, sample_weight_ = model._standardize_user_data(x, y)
    return f(x_ + y_ + sample_weight_)


def get_activations(model, x, layer_name=None):
    """
    Get output activations for all filters for each layer
    :param model: keras compiled model or one of ['vgg16', 'vgg19', 'inception_v3', 'inception_resnet_v2', 'mobilenet_v2', 'mobilenetv2']
    :param x: input for which activations are sought (can be a batch input)
    :param layer_name: if activations of a particular layer are sought
    :return: dict mapping layers to corresponding activations (batch_size, output_h, output_w, num_filters)
    """
    nodes = [layer.output for layer in model.layers if layer.name == layer_name or layer_name is None][1:]
    # we process the placeholders later (Inputs node in Keras). Because there's a bug in Tensorflow.
    input_layer_outputs, layer_outputs = [], []
    [input_layer_outputs.append(node) if 'input_' in node.name else layer_outputs.append(node) for node in nodes]
    activations = _evaluate(model, layer_outputs, x, y=None)
    activations_dict = dict(zip([output.name for output in layer_outputs], activations))
    activations_inputs_dict = dict(zip([output.name for output in input_layer_outputs], x))
    result = activations_inputs_dict.copy()
    result.update(activations_dict)
    return result


def display_weights(weights, cmpa='gray', save=False, path=None):
    
    for layer_name, k in weights.items():
        
        n_features = np.shape(k)[-1] # Number of features in the feature map        
        size = np.shape(k)[0] #The feature map has shape (1, size, size, n_features).
        
        ncols =  int(math.sqrt(n_features - 0.001)) + 1 
        nrows =  int(math.ceil(n_features/ncols)) # Tiles the activation channels in this matrix
    
        display_grid = np.zeros((size * nrows, ncols * size))
        scale = 1. / size
        
        fig, axes = plt.subplots(nrows, ncols, figsize=(scale * display_grid.shape[1], scale * display_grid.shape[0]))
        fig.suptitle('{} kernels'.format(layer_name))
        
        fig.subplots_adjust(wspace=0.2, hspace=0.2)
        
        for i in range(nrows * ncols):
            if i < k.shape[-1]:
                img = k[:, :, i]
                axes.flat[i].imshow(img, cmap='gray', aspect='auto')
            axes.flat[i].axis('off')
        
        if save:
        
            f = os.path.join(path,'weights_{}.png'.format(layer_name.split('/')[0]))
            plt.savefig(f, bbox_inches='tight')
        
        else:
            plt.show()
        
        # pyplot figures require manual closing
        plt.close(fig)
        
        
def display_activations(activations, cmap='gray', save=False, path=None):
    """
    Plot the activations for each layer using matplotlib
    :param activations: dict mapping layers to corresponding activations (1, output_h, output_w, num_filters)
    :param cmap: string - a valid matplotlib colourmap to be used
    :param save: bool- if the plot should be saved
    :return: None
    """
    
    
    for layer_name, acts in activations.items():
        print(layer_name, acts.shape, end=' ')
        if acts.shape[0] != 1:
            print('-> Skipped. First dimension is not 1.')
            continue
        
        if len(acts.shape) <= 2 or acts.shape[1] == 1:
            print('-> Skipped. 2D Activations.')
            continue
        print()
    
        size  = acts.shape[1]
        ncols = int(math.sqrt(acts.shape[-1]) - 0.001) + 1  # best square fit for the given number
        nrows = int(math.ceil(acts.shape[-1] / ncols))
        
        display_grid = np.zeros((nrows * size, size * ncols ))
        scale = 1. / size
        
        fig, axes = plt.subplots(nrows, ncols, figsize=(scale * display_grid.shape[1], scale * display_grid.shape[0]))
        fig.suptitle(layer_name)
        fig.subplots_adjust(wspace=0., hspace=0.)
        
        for i in range(nrows * ncols):
            if i < acts.shape[-1]:
                img = acts[0, :, :, i]
                axes.flat[i].imshow(img, cmap=cmap, aspect='auto')
            axes.flat[i].axis('off')
        
        if save:
            
            f = os.path.join(path,layer_name.split('/')[0])
            plt.savefig(f, bbox_inches='tight')
            
        else:
            plt.show()
        # pyplot figures require manual closing
        plt.close(fig)

def display_heatmaps(activations, input_image, save=False, path=None, fix=True):
    """
    Plot heatmaps of activations for all filters overlayed on the input image for each layer
    :param activations: dict mapping layers to corresponding activations with the shape (1, output height, output width, number of filters)
    :param input_image: numpy array, input image for the overlay
    :param save: bool, if the plot should be saved
    :param fix: bool, if automated checks and fixes for incorrect images should be ran
    :return: None
    """
    from PIL import Image
    from sklearn.preprocessing import MinMaxScaler
 
    
    if fix:
        #fixes common errors made when passing the image
        #I recommend the use of keras' load_img function passed to np.array to ensure images are loaded in in the correct format
        #removes the batch size from the shape
        if len(input_image.shape)  == 4:
            input_image = input_image.reshape(input_image.shape[1], input_image.shape[2], input_image.shape[3])
        #removes channels from the shape of grayscale images
        if len(input_image.shape)==3 and input_image.shape[2]==1:
            input_image = input_image.reshape(input_image.shape[0], input_image.shape[1])
        
    for layer_name, acts in activations.items():
        print(layer_name, acts.shape, end=' ')
        if acts.shape[0] != 1:
            print('-> Skipped. First dimension is not 1.')
            continue
        if len(acts.shape) <= 2 or acts.shape[1] == 1:
            print('-> Skipped. 2D Activations.')
            continue
        print('')
        size  = acts.shape[1]
        ncols = int(math.sqrt(acts.shape[-1]) - 0.001) + 1  # best square fit for the given number
        nrows = int(math.ceil(acts.shape[-1] / ncols))
        
        display_grid = np.zeros((size * nrows, ncols * size))
        scale = 1. / size
        fig, axes = plt.subplots(nrows, ncols,figsize=(scale * display_grid.shape[1], scale * display_grid.shape[0]),)
        
        fig.subplots_adjust(wspace=0., hspace=0.)
        
        fig.suptitle(layer_name)
        
        # computes values required to scale the activations (which will form our heat map) to be in range 0-1
        scaler = MinMaxScaler()
        #reshapes to be 2D with an automaticly calculated first dimension and second dimension of 1 in order to keep scikitlearn happy
        scaler.fit(acts.reshape(-1, 1))
        
        #loops over each filter/neuron
        for i in range(nrows * ncols):
            if i < acts.shape[-1]:
                img = acts[0, :, :, i]
                #scales the activation (which will form our heat map) to be in range 0-1 using the previously calculated statistics
                img = scaler.transform(img)
                img = Image.fromarray(img)
                # resizes the activation to be same dimensions of input_image
                img = img.resize((input_image.shape[0], input_image.shape[1]), Image.LANCZOS)
                img = np.array(img)
                axes.flat[i].imshow(input_image / 255.0,cmap='binary')
                #overlay the activation at 40% transparency  onto the image with a heatmap colour scheme
                # Lowest activations are dark, highest are dark red, mid are yellow
                axes.flat[i].imshow(img, alpha=0.6, aspect='auto', cmap='jet', interpolation='bilinear')
            axes.flat[i].axis('off')
            
        
        if save:
            f = os.path.join(path,'hmap_{}'.format(layer_name.split('/')[0]))
            plt.savefig(f, bbox_inches='tight')
            
        else:
            plt.show()
        plt.close(fig)
 
