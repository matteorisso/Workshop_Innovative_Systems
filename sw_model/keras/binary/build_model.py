# -*- coding: utf-8 -*-
"""
Created on Mon Aug 19 22:53:23 2019

@author: Antonio
"""
from keras.models import Sequential, Model 
from keras.layers import Input, Add, AveragePooling2D, BatchNormalization, Concatenate, Flatten, Activation
from keras.regularizers import l2

from ternary_layers import TernaryConv2D, TernaryDense
from binary_layers import BinaryConv2D, BinaryDense
from xnor_layers import XnorConv2D, XnorDense

from quantized_ops import quantized_relu as quantize_op
from quantized_ops import quantize
from ternary_ops import ternarize
from binary_ops import binary_tanh

import config as cf
import numpy as np

def build_model(model:str, full=False, sequential=True):
   
    if model == 'bnn':
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
        if full:
            Act = lambda name : Activation(binary_tanh, name=name)
        else:    
            def quantized_relu(x):
                return quantize_op(x, nb=3)
            
            Act = lambda name : Activation(quantized_relu, name=name)
            
            
    elif model == 'tnn': 
        
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
        
        if full:
            Act = lambda name : Activation(binary_tanh, name=name)
        else:   
            def quantized_relu(x):
                return quantize_op(x, nb=3)
            
            Act = lambda name : Activation(quantized_relu, name=name)
    
#    else:
#        raise AttributeError('model error, try "binary" or "xnor" or "ternary"')
#    
    elif model == 'mixed':
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
        
        Dense = lambda units : BinaryDense(\
                                            units=units,\
                                            H=cf.H,\
                                            kernel_regularizer=l2(cf.kernel_regularizer),\
                                            kernel_lr_multiplier=cf.kernel_lr_multiplier,\
                                            use_bias=False)
        
        if full:
            Act = lambda name : Activation(binary_tanh, name=name)
        
        else:   
            def quantized_relu(x):
                return quantize_op(x, nb=3)
            
            Act = lambda name : Activation(quantized_relu, name=name)
    
    if sequential == True:
        
        model = Sequential()
        
        model.add(Conv_(filters=cf.conv1_filters, kernel_size = cf.kernel_size, \
                        dim =cf.img_dim, channel = cf.channel))
        model.add(BatchNormalization(axis= -1, momentum=cf.momentum, epsilon=cf.epsilon))
        model.add(Act(name='c1'))
        
        model.add(AveragePooling2D(pool_size = cf.pool_size, strides = cf.pool_size,padding = 'valid'))
        model.add(Act(name='s1'))
        
        model.add(Conv(filters=cf.conv2_filters, kernel_size = cf.kernel_size))
        model.add(BatchNormalization(axis=-1, momentum=cf.momentum, epsilon=cf.epsilon))
        model.add(Act(name='c2'))
        
        model.add(AveragePooling2D(pool_size = cf.pool_size, strides = cf.pool_size,padding = 'valid'))
        model.add(Act(name='s2')) 
        
        model.add(Conv(filters=cf.conv3_filters, kernel_size = cf.kernel_size))
        model.add(BatchNormalization(axis=-1, momentum=cf.momentum, epsilon=cf.epsilon))
        model.add(Act(name='c3'))
        
        model.add(Flatten())
        
        model.add(Dense(84))
        model.add(BatchNormalization(axis=-1, momentum=cf.momentum, epsilon=cf.epsilon))
        model.add(Act(name='fc1'))
        
        model.add(Dense(10))
        model.add(Activation('softmax'))
        
    else:
        
        q = lambda x : np.clip(np.round(x*(2**3)), -(2**8), (2**8)-1)/(2**3)
        
        inputs = Input(shape=(32, 32, 1))
        
        c1_1 = Conv(filters=1, kernel_size = cf.kernel_size)(inputs)
        c1_2 = Conv(filters=1, kernel_size = cf.kernel_size)(inputs)
        c1_3 = Conv(filters=1, kernel_size = cf.kernel_size)(inputs)
        c1_4 = Conv(filters=1, kernel_size = cf.kernel_size)(inputs)
        c1_5 = Conv(filters=1, kernel_size = cf.kernel_size)(inputs)
        c1_6 = Conv(filters=1, kernel_size = cf.kernel_size)(inputs)
        
        c1_1 = BatchNormalization(axis=-1, momentum=cf.momentum, epsilon=cf.epsilon)(c1_1)
        c1_2 = BatchNormalization(axis=-1, momentum=cf.momentum, epsilon=cf.epsilon)(c1_2)
        c1_3 = BatchNormalization(axis=-1, momentum=cf.momentum, epsilon=cf.epsilon)(c1_3)
        c1_4 = BatchNormalization(axis=-1, momentum=cf.momentum, epsilon=cf.epsilon)(c1_4)
        c1_5 = BatchNormalization(axis=-1, momentum=cf.momentum, epsilon=cf.epsilon)(c1_5)
        c1_6 = BatchNormalization(axis=-1, momentum=cf.momentum, epsilon=cf.epsilon)(c1_6)
        
        act1_1 = Act(name='c1_1')(c1_1)
        act1_2 = Act(name='c1_2')(c1_2)
        act1_3 = Act(name='c1_3')(c1_3)
        act1_4 = Act(name='c1_4')(c1_4)
        act1_5 = Act(name='c1_5')(c1_5)
        act1_6 = Act(name='c1_6')(c1_6)
        
        s1_1 = AveragePooling2D(pool_size = cf.pool_size, strides = cf.pool_size, padding = 'valid')(act1_1)
        s1_2 = AveragePooling2D(pool_size = cf.pool_size, strides = cf.pool_size, padding = 'valid')(act1_2)
        s1_3 = AveragePooling2D(pool_size = cf.pool_size, strides = cf.pool_size, padding = 'valid')(act1_3)
        s1_4 = AveragePooling2D(pool_size = cf.pool_size, strides = cf.pool_size, padding = 'valid')(act1_4)
        s1_5 = AveragePooling2D(pool_size = cf.pool_size, strides = cf.pool_size, padding = 'valid')(act1_5)
        s1_6 = AveragePooling2D(pool_size = cf.pool_size, strides = cf.pool_size, padding = 'valid')(act1_6)
        
        c2_1_1 = Conv(filters= 1, kernel_size = cf.kernel_size)(s1_1)
        c2_1_2 = Conv(filters= 1, kernel_size = cf.kernel_size)(s1_2)
        c2_1_3 = Conv(filters= 1, kernel_size = cf.kernel_size)(s1_3)
        c2_1_4 = Conv(filters= 1, kernel_size = cf.kernel_size)(s1_4)
        c2_1_5 = Conv(filters= 1, kernel_size = cf.kernel_size)(s1_5)
        c2_1_6 = Conv(filters= 1, kernel_size = cf.kernel_size)(s1_6)
        
        #quantize all 
        c2_1_1 = q(c2_1_1)
        c2_1_2 = q(c2_1_1)
        c2_1_3 = q(c2_1_1)
        c2_1_4 = q(c2_1_1)
        c2_1_5 = q(c2_1_1)
        c2_1_6 = q(c2_1_1)
        
        c2_1 = Add()([c2_1_1, c2_1_2, c2_1_3, c2_1_4, c2_1_5, c2_1_6])
   
        c2_2_1 = Conv(filters= 1, kernel_size = cf.kernel_size)(s1_1)
        c2_2_2 = Conv(filters= 1, kernel_size = cf.kernel_size)(s1_2)
        c2_2_3 = Conv(filters= 1, kernel_size = cf.kernel_size)(s1_3)
        c2_2_4 = Conv(filters= 1, kernel_size = cf.kernel_size)(s1_4)
        c2_2_5 = Conv(filters= 1, kernel_size = cf.kernel_size)(s1_5)
        c2_2_6 = Conv(filters= 1, kernel_size = cf.kernel_size)(s1_6)
        
        #quantize all 
        c2_1_1 = q(c2_1_1)
        c2_1_2 = q(c2_1_1)
        c2_1_3 = q(c2_1_1)
        c2_1_4 = q(c2_1_1)
        c2_1_5 = q(c2_1_1)
        c2_1_6 = q(c2_1_1)
        
        c2_1 = Add()([c2_2_1, c2_2_2, c2_2_3, c2_2_4, c2_2_5, c2_2_6])
        
        
        c2_2_1 = Conv(filters= 1, kernel_size = cf.kernel_size)(s1_1)
        c2_2_2 = Conv(filters= 1, kernel_size = cf.kernel_size)(s1_2)
        c2_2_3 = Conv(filters= 1, kernel_size = cf.kernel_size)(s1_3)
        c2_2_4 = Conv(filters= 1, kernel_size = cf.kernel_size)(s1_4)
        c2_2_5 = Conv(filters= 1, kernel_size = cf.kernel_size)(s1_5)
        c2_2_6 = Conv(filters= 1, kernel_size = cf.kernel_size)(s1_6)
        
        #quantize all 
        c2_1_1 = q(c2_1_1)
        c2_1_2 = q(c2_1_1)
        c2_1_3 = q(c2_1_1)
        c2_1_4 = q(c2_1_1)
        c2_1_5 = q(c2_1_1)
        c2_1_6 = q(c2_1_1)
        
        c2_2 = Add()([c2_2_1, c2_2_2, c2_2_3, c2_2_4, c2_2_5, c2_2_6])
        
        c2_3_1 = Conv(filters= 1, kernel_size = cf.kernel_size)(s1_1)
        c2_3_2 = Conv(filters= 1, kernel_size = cf.kernel_size)(s1_2)
        c2_3_3 = Conv(filters= 1, kernel_size = cf.kernel_size)(s1_3)
        c2_3_4 = Conv(filters= 1, kernel_size = cf.kernel_size)(s1_4)
        c2_3_5 = Conv(filters= 1, kernel_size = cf.kernel_size)(s1_5)
        c2_3_6 = Conv(filters= 1, kernel_size = cf.kernel_size)(s1_6)

        #quantize all 
        c2_1_1 = q(c2_1_1)
        c2_1_2 = q(c2_1_1)
        c2_1_3 = q(c2_1_1)
        c2_1_4 = q(c2_1_1)
        c2_1_5 = q(c2_1_1)
        c2_1_6 = q(c2_1_1)
        
        c2_3 = Add()([c2_3_1, c2_3_2, c2_3_3, c2_3_4, c2_3_5, c2_3_6])
        
        c2_4_1 = Conv(filters= 1, kernel_size = cf.kernel_size)(s1_1)
        c2_4_2 = Conv(filters= 1, kernel_size = cf.kernel_size)(s1_2)
        c2_4_3 = Conv(filters= 1, kernel_size = cf.kernel_size)(s1_3)
        c2_4_4 = Conv(filters= 1, kernel_size = cf.kernel_size)(s1_4)
        c2_4_5 = Conv(filters= 1, kernel_size = cf.kernel_size)(s1_5)
        c2_4_6 = Conv(filters= 1, kernel_size = cf.kernel_size)(s1_6)
        
        #quantize all 
        c2_1_1 = q(c2_1_1)
        c2_1_2 = q(c2_1_1)
        c2_1_3 = q(c2_1_1)
        c2_1_4 = q(c2_1_1)
        c2_1_5 = q(c2_1_1)
        c2_1_6 = q(c2_1_1)
        
        c2_4 = Add()([c2_4_1, c2_4_2, c2_4_3, c2_4_4, c2_4_5, c2_4_6])
    
        c2_5_1 = Conv(filters= 1, kernel_size = cf.kernel_size)(s1_1)
        c2_5_2 = Conv(filters= 1, kernel_size = cf.kernel_size)(s1_2)
        c2_5_3 = Conv(filters= 1, kernel_size = cf.kernel_size)(s1_3)
        c2_5_4 = Conv(filters= 1, kernel_size = cf.kernel_size)(s1_4)
        c2_5_5 = Conv(filters= 1, kernel_size = cf.kernel_size)(s1_5)
        c2_5_6 = Conv(filters= 1, kernel_size = cf.kernel_size)(s1_6)
        
        #quantize all 
        c2_1_1 = q(c2_1_1)
        c2_1_2 = q(c2_1_1)
        c2_1_3 = q(c2_1_1)
        c2_1_4 = q(c2_1_1)
        c2_1_5 = q(c2_1_1)
        c2_1_6 = q(c2_1_1)
        
        c2_5 = Add()([c2_5_1, c2_5_2, c2_5_3, c2_5_4, c2_5_5, c2_5_6])
        
        c2_6_1 = Conv(filters= 1, kernel_size = cf.kernel_size)(s1_1)
        c2_6_2 = Conv(filters= 1, kernel_size = cf.kernel_size)(s1_2)
        c2_6_3 = Conv(filters= 1, kernel_size = cf.kernel_size)(s1_3)
        c2_6_4 = Conv(filters= 1, kernel_size = cf.kernel_size)(s1_4)
        c2_6_5 = Conv(filters= 1, kernel_size = cf.kernel_size)(s1_5)
        c2_6_6 = Conv(filters= 1, kernel_size = cf.kernel_size)(s1_6)
        
        #quantize all 
        c2_1_1 = q(c2_1_1)
        c2_1_2 = q(c2_1_1)
        c2_1_3 = q(c2_1_1)
        c2_1_4 = q(c2_1_1)
        c2_1_5 = q(c2_1_1)
        c2_1_6 = q(c2_1_1)
        
        c2_6 = Add()([c2_6_1, c2_6_2, c2_6_3, c2_6_4, c2_6_5, c2_6_6])
        
        c2_7_1 = Conv(filters= 1, kernel_size = cf.kernel_size)(s1_1)
        c2_7_2 = Conv(filters= 1, kernel_size = cf.kernel_size)(s1_2)
        c2_7_3 = Conv(filters= 1, kernel_size = cf.kernel_size)(s1_3)
        c2_7_4 = Conv(filters= 1, kernel_size = cf.kernel_size)(s1_4)
        c2_7_5 = Conv(filters= 1, kernel_size = cf.kernel_size)(s1_5)
        c2_7_6 = Conv(filters= 1, kernel_size = cf.kernel_size)(s1_6)
        
        #quantize all 
        c2_1_1 = q(c2_1_1)
        c2_1_2 = q(c2_1_1)
        c2_1_3 = q(c2_1_1)
        c2_1_4 = q(c2_1_1)
        c2_1_5 = q(c2_1_1)
        c2_1_6 = q(c2_1_1)
        
        c2_7 = Add()([c2_7_1, c2_7_2, c2_7_3, c2_7_4, c2_7_5, c2_7_6])
        
        c2_8_1 = Conv(filters= 1, kernel_size = cf.kernel_size)(s1_1)
        c2_8_2 = Conv(filters= 1, kernel_size = cf.kernel_size)(s1_2)
        c2_8_3 = Conv(filters= 1, kernel_size = cf.kernel_size)(s1_3)
        c2_8_4 = Conv(filters= 1, kernel_size = cf.kernel_size)(s1_4)
        c2_8_5 = Conv(filters= 1, kernel_size = cf.kernel_size)(s1_5)
        c2_8_6 = Conv(filters= 1, kernel_size = cf.kernel_size)(s1_6)
        
        #quantize all 
        c2_1_1 = q(c2_1_1)
        c2_1_2 = q(c2_1_1)
        c2_1_3 = q(c2_1_1)
        c2_1_4 = q(c2_1_1)
        c2_1_5 = q(c2_1_1)
        c2_1_6 = q(c2_1_1)
        
        c2_8 = Add()([c2_8_1, c2_8_2, c2_8_3, c2_8_4, c2_8_5, c2_8_6])
        
        c2_9_1 = Conv(filters= 1, kernel_size = cf.kernel_size)(s1_1)
        c2_9_2 = Conv(filters= 1, kernel_size = cf.kernel_size)(s1_2)
        c2_9_3 = Conv(filters= 1, kernel_size = cf.kernel_size)(s1_3)
        c2_9_4 = Conv(filters= 1, kernel_size = cf.kernel_size)(s1_4)
        c2_9_5 = Conv(filters= 1, kernel_size = cf.kernel_size)(s1_5)
        c2_9_6 = Conv(filters= 1, kernel_size = cf.kernel_size)(s1_6)
        
        #quantize all 
        c2_1_1 = q(c2_1_1)
        c2_1_2 = q(c2_1_1)
        c2_1_3 = q(c2_1_1)
        c2_1_4 = q(c2_1_1)
        c2_1_5 = q(c2_1_1)
        c2_1_6 = q(c2_1_1)
        
        c2_9 = Add()([c2_9_1, c2_9_2, c2_9_3, c2_9_4, c2_9_5, c2_9_6])
        
        c2_10_1 = Conv(filters= 1, kernel_size = cf.kernel_size)(s1_1)
        c2_10_2 = Conv(filters= 1, kernel_size = cf.kernel_size)(s1_2)
        c2_10_3 = Conv(filters= 1, kernel_size = cf.kernel_size)(s1_3)
        c2_10_4 = Conv(filters= 1, kernel_size = cf.kernel_size)(s1_4)
        c2_10_5 = Conv(filters= 1, kernel_size = cf.kernel_size)(s1_5)
        c2_10_6 = Conv(filters= 1, kernel_size = cf.kernel_size)(s1_6)
        
        #quantize all 
        c2_1_1 = q(c2_1_1)
        c2_1_2 = q(c2_1_1)
        c2_1_3 = q(c2_1_1)
        c2_1_4 = q(c2_1_1)
        c2_1_5 = q(c2_1_1)
        c2_1_6 = q(c2_1_1)
        
        c2_10 = Add()([c2_10_1, c2_10_2, c2_10_3, c2_10_4, c2_10_5, c2_10_6])
        
        c2_11_1 = Conv(filters= 1, kernel_size = cf.kernel_size)(s1_1)
        c2_11_2 = Conv(filters= 1, kernel_size = cf.kernel_size)(s1_2)
        c2_11_3 = Conv(filters= 1, kernel_size = cf.kernel_size)(s1_3)
        c2_11_4 = Conv(filters= 1, kernel_size = cf.kernel_size)(s1_4)
        c2_11_5 = Conv(filters= 1, kernel_size = cf.kernel_size)(s1_5)
        c2_11_6 = Conv(filters= 1, kernel_size = cf.kernel_size)(s1_6)
        
        #quantize all 
        c2_1_1 = q(c2_1_1)
        c2_1_2 = q(c2_1_1)
        c2_1_3 = q(c2_1_1)
        c2_1_4 = q(c2_1_1)
        c2_1_5 = q(c2_1_1)
        c2_1_6 = q(c2_1_1)
        
        c2_11 = Add()([c2_11_1, c2_11_2, c2_11_3, c2_11_4, c2_11_5, c2_11_6])
        
        c2_12_1 = Conv(filters= 1, kernel_size = cf.kernel_size)(s1_1)
        c2_12_2 = Conv(filters= 1, kernel_size = cf.kernel_size)(s1_2)
        c2_12_3 = Conv(filters= 1, kernel_size = cf.kernel_size)(s1_3)
        c2_12_4 = Conv(filters= 1, kernel_size = cf.kernel_size)(s1_4)
        c2_12_5 = Conv(filters= 1, kernel_size = cf.kernel_size)(s1_5)
        c2_12_6 = Conv(filters= 1, kernel_size = cf.kernel_size)(s1_6)
        
        #quantize all 
        c2_1_1 = q(c2_1_1)
        c2_1_2 = q(c2_1_1)
        c2_1_3 = q(c2_1_1)
        c2_1_4 = q(c2_1_1)
        c2_1_5 = q(c2_1_1)
        c2_1_6 = q(c2_1_1)
        
        c2_12 = Add()([c2_12_1, c2_12_2, c2_12_3, c2_12_4, c2_12_5, c2_12_6])
        
        c2_13_1 = Conv(filters= 1, kernel_size = cf.kernel_size)(s1_1)
        c2_13_2 = Conv(filters= 1, kernel_size = cf.kernel_size)(s1_2)
        c2_13_3 = Conv(filters= 1, kernel_size = cf.kernel_size)(s1_3)
        c2_13_4 = Conv(filters= 1, kernel_size = cf.kernel_size)(s1_4)
        c2_13_5 = Conv(filters= 1, kernel_size = cf.kernel_size)(s1_5)
        c2_13_6 = Conv(filters= 1, kernel_size = cf.kernel_size)(s1_6)
        
        #quantize all 
        c2_1_1 = q(c2_1_1)
        c2_1_2 = q(c2_1_1)
        c2_1_3 = q(c2_1_1)
        c2_1_4 = q(c2_1_1)
        c2_1_5 = q(c2_1_1)
        c2_1_6 = q(c2_1_1)
        
        c2_13 = Add()([c2_13_1, c2_13_2, c2_13_3, c2_13_4, c2_13_5, c2_13_6])
        
        c2_14_1 = Conv(filters= 1, kernel_size = cf.kernel_size)(s1_1)
        c2_14_2 = Conv(filters= 1, kernel_size = cf.kernel_size)(s1_2)
        c2_14_3 = Conv(filters= 1, kernel_size = cf.kernel_size)(s1_3)
        c2_14_4 = Conv(filters= 1, kernel_size = cf.kernel_size)(s1_4)
        c2_14_5 = Conv(filters= 1, kernel_size = cf.kernel_size)(s1_5)
        c2_14_6 = Conv(filters= 1, kernel_size = cf.kernel_size)(s1_6)
        
        #quantize all 
        c2_1_1 = q(c2_1_1)
        c2_1_2 = q(c2_1_1)
        c2_1_3 = q(c2_1_1)
        c2_1_4 = q(c2_1_1)
        c2_1_5 = q(c2_1_1)
        c2_1_6 = q(c2_1_1)
        
        c2_14 = Add()([c2_14_1, c2_14_2, c2_14_3, c2_14_4, c2_14_5, c2_14_6])
        
        c2_15_1 = Conv(filters= 1, kernel_size = cf.kernel_size)(s1_1)
        c2_15_2 = Conv(filters= 1, kernel_size = cf.kernel_size)(s1_2)
        c2_15_3 = Conv(filters= 1, kernel_size = cf.kernel_size)(s1_3)
        c2_15_4 = Conv(filters= 1, kernel_size = cf.kernel_size)(s1_4)
        c2_15_5 = Conv(filters= 1, kernel_size = cf.kernel_size)(s1_5)
        c2_15_6 = Conv(filters= 1, kernel_size = cf.kernel_size)(s1_6)
        
        #quantize all 
        c2_1_1 = q(c2_1_1)
        c2_1_2 = q(c2_1_1)
        c2_1_3 = q(c2_1_1)
        c2_1_4 = q(c2_1_1)
        c2_1_5 = q(c2_1_1)
        c2_1_6 = q(c2_1_1)
        
        c2_15 = Add()([c2_15_1, c2_15_2, c2_15_3, c2_15_4, c2_15_5, c2_15_6])
        
        c2_16_1 = Conv(filters= 1, kernel_size = cf.kernel_size)(s1_1)
        c2_16_2 = Conv(filters= 1, kernel_size = cf.kernel_size)(s1_2)
        c2_16_3 = Conv(filters= 1, kernel_size = cf.kernel_size)(s1_3)
        c2_16_4 = Conv(filters= 1, kernel_size = cf.kernel_size)(s1_4)
        c2_16_5 = Conv(filters= 1, kernel_size = cf.kernel_size)(s1_5)
        c2_16_6 = Conv(filters= 1, kernel_size = cf.kernel_size)(s1_6)
        
        #quantize all 
        c2_1_1 = q(c2_1_1)
        c2_1_2 = q(c2_1_1)
        c2_1_3 = q(c2_1_1)
        c2_1_4 = q(c2_1_1)
        c2_1_5 = q(c2_1_1)
        c2_1_6 = q(c2_1_1)
        
        c2_16 = Add()([c2_16_1, c2_16_2, c2_16_3, c2_16_4, c2_16_5, c2_16_6])
        
        c2 = Concatenate(axis=-1)([c2_1, c2_2, c2_3, c2_4, c2_5, c2_6, c2_7, c2_8,\
                        c2_9, c2_10, c2_11, c2_12, c2_13, c2_14, c2_15, c2_16])
        
        c2 = BatchNormalization(axis=-1, momentum=cf.momentum, epsilon=cf.epsilon)(c2)
        act2 = Act(name='c2')(c2)
        s2 = AveragePooling2D(pool_size = cf.pool_size, strides = cf.pool_size, padding = 'valid')(act2)
        
        c3 = Conv(filters=120, kernel_size = cf.kernel_size)(s2)
        
        c3 = BatchNormalization(axis=-1, momentum=cf.momentum, epsilon=cf.epsilon)(c3)
        act3 = Act(name='c3')(c3)
        
        flat = Flatten()(act3)
        
        fc1 = Dense(84)(flat)
        fc1 = BatchNormalization(axis=-1, momentum=cf.momentum, epsilon=cf.epsilon)(fc1)
        fc1 = Act(name='fc1')(fc1)
        
        fc2 = Dense(10)(fc1)
        fc2 = Activation('softmax')(fc2)
        
        model = Model(inputs, fc2)
        
    model.summary()
    
    return model