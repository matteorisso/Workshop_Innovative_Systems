# -*- coding: utf-8 -*-
"""
Created on Mon Aug 19 22:53:23 2019

@author: Antonio
"""
from keras.models import Sequential, Model 
from keras.layers import Input, Add, AveragePooling2D, MaxPooling2D, \
    BatchNormalization, Concatenate, Flatten, Activation, ThresholdedReLU
    
from keras.regularizers import l2

from ternary_layers import TernaryConv2D, TernaryDense
from binary_layers import BinaryConv2D, BinaryDense

from quantized_ops import quantized_relu as quantize_op
from quantized_ops import quantize
from binary_ops import binary_tanh

import config as cf

def build_model(model:str, full=False, sequential=True):
   
    if model == 'bnn':
        Conv_ = lambda filters, kernel_size, dim, channel :\
            BinaryConv2D(
                     kernel_size=kernel_size,
                     H=cf.H,  
                     filters=filters, 
                     strides=(1, 1),
                     padding='valid', activation='linear',
                     kernel_regularizer=l2(cf.kernel_regularizer),
                     kernel_lr_multiplier=cf.kernel_lr_multiplier,
                     use_bias=False,
                     input_shape=(dim,dim,channel))
        
        Conv = lambda filters, kernel_size:\
            BinaryConv2D(
                     kernel_size=kernel_size,
                     H=cf.H,
                     filters=filters,
                     strides=(1, 1),
                     padding='valid', activation='linear',
                     kernel_regularizer=l2(cf.kernel_regularizer),
                     kernel_lr_multiplier=cf.kernel_lr_multiplier,
                     use_bias=False)
        
        Dense = lambda units :\
            BinaryDense(
                    units=units,
                    H=cf.H,
                    kernel_regularizer=l2(cf.kernel_regularizer),
                    kernel_lr_multiplier=cf.kernel_lr_multiplier,
                    use_bias=False)
        if full:
            Act = lambda name : Activation(binary_tanh, name=name)
        else:    
            def quantized_relu(x):
                return quantize_op(x, nb=cf.nb)
            Act = lambda name : Activation(quantized_relu, name=name)
            def quantize_p(x):
                return quantize(x, nb=cf.nb)
            Quantize = lambda name : Activation(quantize_p, name=name)
            
    elif model == 'tnn': 
        
        Conv_ = lambda filters, kernel_size, dim, channel :\
            TernaryConv2D(
                      kernel_size=kernel_size, 
                      H=cf.H,  
                      filters=filters, 
                      strides=(1, 1),
                      padding='valid', activation='linear',
                      kernel_regularizer=l2(cf.kernel_regularizer),
                      kernel_lr_multiplier=cf.kernel_lr_multiplier,
                      use_bias=False,
                      input_shape=(dim,dim,channel))
        
        Conv = lambda filters, kernel_size:\
            TernaryConv2D(  
                      kernel_size=kernel_size,
                      H=cf.H,
                      filters=filters,
                      strides=(1, 1),
                      padding='valid', activation='linear',
                      kernel_regularizer=l2(cf.kernel_regularizer),
                      kernel_lr_multiplier=cf.kernel_lr_multiplier,
                      use_bias=False)

        Dense = lambda units :\
            TernaryDense(
                     units=units,
                     H=cf.H,
                     kernel_regularizer=l2(cf.kernel_regularizer),
                     kernel_lr_multiplier=cf.kernel_lr_multiplier,
                     use_bias=False)
        
        if full:
            Act = lambda name : Activation(binary_tanh, name=name)
        else:   
            def quantized_relu(x):
                return quantize_op(x, nb=cf.nb)
            Act = lambda name : Activation(quantized_relu, name=name)
            def quantize_p(x):
                return quantize(x, nb=cf.nb)
            Quantize = lambda name : Activation(quantize_p, name=name)
    else:
        raise AttributeError('model error, try "binary" or "ternary"')
   
    
    model = Sequential()
        
    model.add(Conv_(\
                filters=cf.conv1_filters, kernel_size = cf.kernel_size,
                dim =cf.img_dim, channel = cf.channel))
#    model.add(BatchNormalization(axis= -1, momentum=cf.momentum, epsilon=cf.epsilon))
    model.add(Act(name='c1'))
    model.add(AveragePooling2D(pool_size = cf.pool_size, strides = cf.pool_size,padding = 'valid')) 
    model.add(Quantize(name='s1'))
    
    model.add(Conv(filters=cf.conv2_filters, kernel_size = cf.kernel_size))
#    model.add(BatchNormalization(axis=-1, momentum=cf.momentum, epsilon=cf.epsilon))
    model.add(Act(name='c2'))
    model.add(AveragePooling2D(pool_size = cf.pool_size, strides = cf.pool_size,padding = 'valid'))
    model.add(Quantize(name='s2'))
    
    model.add(Conv(filters=cf.conv3_filters, kernel_size = cf.kernel_size))
#    model.add(BatchNormalization(axis=-1, momentum=cf.momentum, epsilon=cf.epsilon))
    model.add(Act(name='c3'))
    
    model.add(Flatten())
    
    model.add(Dense(84))
#    model.add(BatchNormalization(axis=-1, momentum=cf.momentum, epsilon=cf.epsilon))
    model.add(Act(name='fc1'))
    
    model.add(Dense(10))
    model.add(Activation('softmax'))
        
    model.summary()
    
    return model