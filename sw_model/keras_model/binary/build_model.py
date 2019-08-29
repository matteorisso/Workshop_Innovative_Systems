# -*- coding: utf-8 -*-
"""
Created on Mon Aug 19 22:53:23 2019

@author: Antonio
"""
from keras.models import Sequential
from keras.layers import AveragePooling2D, BatchNormalization, Flatten, Activation
from keras.regularizers import l2

from ternary_layers import TernaryConv2D, TernaryDense
from binary_layers import BinaryConv2D, BinaryDense
from xnor_layers import XnorConv2D, XnorDense

from quantized_ops import quantized_relu as quantize_op
from binary_ops import binary_tanh

import config as cf

def build_model(model:str,BinaryNet=False):
    
    if model=='xnor':
        Conv_ = lambda filters, kernel_size, dim, channel : XnorConv2D(\
                                                   kernel_size=kernel_size, 
                                                   H=cf.H,  
                                                   filters=filters, 
                                                   strides=(1, 1),\
                                                   padding='valid', activation='linear',\
                                                   kernel_regularizer=l2(cf.kernel_regularizer),\
                                                   kernel_lr_multiplier=cf.kernel_lr_multiplier,\
                                                   use_bias=False,\
                                                   input_shape=(dim,dim,channel))
        
        Conv = lambda filters, kernel_size: XnorConv2D(\
                                            kernel_size=kernel_size,\
                                            H=cf.H,\
                                            filters=filters,\
                                            strides=(1, 1),\
                                            padding='valid', activation='linear',\
                                            kernel_regularizer=l2(cf.kernel_regularizer),\
                                            kernel_lr_multiplier=cf.kernel_lr_multiplier,\
                                            use_bias=False)
        
        Dense = lambda units : XnorDense(units=units,\
                                        H=cf.H,\
                                        kernel_regularizer=l2(cf.kernel_regularizer),\
                                        kernel_lr_multiplier=cf.kernel_lr_multiplier,\
                                        use_bias=False)
        Act = lambda: Activation('relu')

    elif model=='binary':
        Conv_ = lambda filters, kernel_size, dim, channel : BinaryConv2D(\
                                                   kernel_size=kernel_size, 
                                                   H=cf.H,  
                                                   filters=filters, 
                                                   strides=(1, 1),\
                                                   padding='valid', activation='linear',\
                                                   kernel_regularizer=l2(cf.kernel_regularizer),\
                                                   kernel_lr_multiplier=cf.kernel_lr_multiplier,\
                                                   use_bias=False,\
                                                   input_shape=(dim,dim,channel))
        
        Conv = lambda filters, kernel_size: BinaryConv2D(\
                                            kernel_size=kernel_size,\
                                            H=cf.H,\
                                            filters=filters,\
                                            strides=(1, 1),\
                                            padding='valid', activation='linear',\
                                            kernel_regularizer=l2(cf.kernel_regularizer),\
                                            kernel_lr_multiplier=cf.kernel_lr_multiplier,\
                                            use_bias=False)
        
        Dense = lambda units : BinaryDense(\
                                            units=units,\
                                            H=cf.H,\
                                            kernel_regularizer=l2(cf.kernel_regularizer),\
                                            kernel_lr_multiplier=cf.kernel_lr_multiplier,\
                                            use_bias=False)
        if BinaryNet:
            Act = lambda : Activation(binary_tanh)
        else:    
            def quantized_relu(x):
                return quantize_op(x,nb=4)
    
            Act = lambda: Activation(quantized_relu)
    
    elif model=='ternary': 
        Conv_ = lambda filters, kernel_size, dim, channel : TernaryConv2D(\
                                                   kernel_size=kernel_size, 
                                                   H=cf.H,  
                                                   filters=filters, 
                                                   strides=(1, 1),\
                                                   padding='valid', activation='linear',\
                                                   kernel_regularizer=l2(cf.kernel_regularizer),\
                                                   kernel_lr_multiplier=cf.kernel_lr_multiplier,\
                                                   use_bias=False,\
                                                   input_shape=(dim,dim,channel))
        Conv = lambda filters, kernel_size: TernaryConv2D(\
                                            kernel_size=kernel_size,\
                                            H=cf.H,\
                                            filters=filters,\
                                            strides=(1, 1),\
                                            padding='valid', activation='linear',\
                                            kernel_regularizer=l2(cf.kernel_regularizer),\
                                            kernel_lr_multiplier=cf.kernel_lr_multiplier,\
                                            use_bias=False)
        Dense = lambda units : TernaryDense(\
                                            units=units,\
                                            H=cf.H,\
                                            kernel_regularizer=l2(cf.kernel_regularizer),\
                                            kernel_lr_multiplier=cf.kernel_lr_multiplier,\
                                            use_bias=False)
        
        if BinaryNet:
            Act = lambda : Activation(binary_tanh)
        else:    
            def quantized_relu(x):
                return quantize_op(x,nb=4)
    
            Act = lambda: Activation(quantized_relu)
    
    else:
        raise AttributeError('model error, try "binary" or "xnor" or "ternary"')
        
    model = Sequential()
        
    '''
     tmp: tanh after conv to test saturation 
    	  quantized_relu after pooling to test the effect of fixed fractional length (Q1.3)
    '''
    model.add(Conv_(filters=cf.conv1_filters, kernel_size = cf.kernel_size, \
                    dim =cf.img_dim, channel = cf.channel))
    model.add(BatchNormalization(axis= -1, momentum=cf.momentum, epsilon=cf.epsilon))
    model.add(Act())
    model.add(AveragePooling2D(pool_size = cf.pool_size, strides = cf.pool_size,padding = 'valid'))
    model.add(Act())
    model.add(Conv(filters=cf.conv2_filters, kernel_size = cf.kernel_size))
    model.add(BatchNormalization(axis=-1, momentum=cf.momentum, epsilon=cf.epsilon))
    model.add(Act())
    model.add(AveragePooling2D(pool_size = cf.pool_size, strides = cf.pool_size,padding = 'valid'))
    model.add(Act()) 
    model.add(Conv(filters=cf.conv3_filters, kernel_size = cf.kernel_size))
    model.add(BatchNormalization(axis=-1, momentum=cf.momentum, epsilon=cf.epsilon))
    model.add(Act())
    model.add(Flatten())
    model.add(Dense(84))
    model.add(BatchNormalization(axis=-1, momentum=cf.momentum, epsilon=cf.epsilon))
    model.add(Act())
    model.add(Dense(10))
    model.add(Activation('softmax'))
    
    model.summary()
    
    return model