# -*- coding: utf-8 -*-
"""
Created on Tue Aug 27 08:51:41 2019

@author: Admin
"""
import tensorflow as tf
import os

import scipy.io
import numpy as np

import dataset

from keras.models import Sequential,Model
from keras.layers import AveragePooling2D, BatchNormalization, Flatten, Activation, Input
from keras.regularizers import l2

from binary_layers import BinaryConv2D, BinaryDense

from quantized_ops import quantized_relu as quantize_op
from binary_ops import binary_tanh, binarize

import config as cf

from math import ceil,sqrt
import numpy

def bn_param_reduction(gamma,beta,mu,sigma):
    a  =    gamma/sqrt(sigma)
    b  =    beta - (mu*gamma)/(sqrt(sigma))
    return a,b

def dec2bin(var,fp) :
    if var >= 0 :
        string = '0'+str(fp+1)+'b'
        bin_var = format(var,string)
    else :
        bin_var = format(2**(fp+1) + var,'b')	
    return bin_var

def float2fix(x,fract_part):
    if x < -1:
        x = -1
    if x > 0.875:
        x = 0.875
    x_fix = int(round(x*pow(2,fract_part)))
    x_fix_bin = dec2bin(x_fix,fract_part)
    x_fix = 0
    acc = 0
    for i in x_fix_bin:
        if x_fix_bin[0] == '1':
            if acc == 0:    
                x_fix += -int(i)*pow(2,-1*acc)
                acc += 1
            else:
               x_fix += int(i)*pow(2,-1*acc)
               acc += 1 
        else:
            x_fix += int(i)*pow(2,-1*acc)
            acc += 1      
    return x_fix

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

def quantized_relu(x):
    return quantize_op(x,nb=4)
    
Act = lambda: Activation(quantized_relu)




nn_inputs = Input(shape = (32,32,1))

c1 = Conv_(filters=cf.conv1_filters, kernel_size = cf.kernel_size, \
                    dim =cf.img_dim, channel = cf.channel)(nn_inputs)
b1 = BatchNormalization(axis= -1, momentum=cf.momentum, epsilon=cf.epsilon)(c1)
a1 = Act()(b1)
p1 = AveragePooling2D(pool_size = cf.pool_size, strides = cf.pool_size,padding = 'valid')(a1)
a2 = Act()(p1)
c2 = Conv(filters=cf.conv2_filters, kernel_size = cf.kernel_size)(a2)
b2 = BatchNormalization(axis=-1, momentum=cf.momentum, epsilon=cf.epsilon)(c2)
a3 = Act()(b2)
p2 = AveragePooling2D(pool_size = cf.pool_size, strides = cf.pool_size,padding = 'valid')(a3)
a4 = Act()(p2)
c3 = Conv(filters=cf.conv3_filters, kernel_size = cf.kernel_size)(a4)
b3 = BatchNormalization(axis=-1, momentum=cf.momentum, epsilon=cf.epsilon)(c3)
a5 = Act()(b3)
fl = Flatten()(a5)
f1 = Dense(84)(fl)
b4 = BatchNormalization(axis=-1, momentum=cf.momentum, epsilon=cf.epsilon)(f1)
a6 = Act()(b4)
f2 = Dense(10)(a6)
a7 = Activation('softmax')(f2)

model = Model(nn_inputs, a7)

if os.path.isfile(cf.model_path+'.hdf5'):    
    model.load_weights(cf.model_path+'.hdf5')
    
    W = model.get_weights()
    Wq = np.copy(W)        

    with tf.Session() as sess:    
        init = tf.global_variables_initializer()
        sess.run(init)
    
        for it in range(len(W)):
            if len(W[it].shape)>1:#keep batch norm parameters full-precision
                Wq[it]  = sess.run(binarize(tf.convert_to_tensor(W[it])))
            #else:
                #Wq[it]  = sess.run(quantize(tf.convert_to_tensor(W[it]),16))
    Wq = Wq.tolist() #from ndarray to numpy array list
    model.set_weights(Wq)

#model.layers[0].set_weights(Wq[0])
#
#model.layers[4].set_weights(Wq[5])
#
#model.layers[8].set_weights(Wq[10])
#
#model.layers[11].set_weights(Wq[15])
#
#model.layers[13].set_weights(Wq[20])

'''
 load dataset
'''
data = dataset.mnist()
train,test = data.process()

x_train,y_train=train
x_test,y_test=test



A_1 = []
B_1 = []
A_2 = []
B_2 = []
A_3 = []
B_3 = []
A_4 = []
B_4 = []
bn_1 = numpy.asarray(Wq[1:5])
bn_2 = numpy.asarray(Wq[6:10])
bn_3 = numpy.asarray(Wq[11:15])
bn_4 = numpy.asarray(Wq[16:20])

frac_part = 3

for i in bn_1.T:
    A_1.append(bn_param_reduction(i[0],i[1],i[2],i[3])[0])
    B_1.append(bn_param_reduction(i[0],i[1],i[2],i[3])[1])
    
for i in bn_2.T:
    A_2.append(bn_param_reduction(i[0],i[1],i[2],i[3])[0])
    B_2.append(bn_param_reduction(i[0],i[1],i[2],i[3])[1])
    
for i in bn_3.T:
    A_3.append(bn_param_reduction(i[0],i[1],i[2],i[3])[0])
    B_3.append(bn_param_reduction(i[0],i[1],i[2],i[3])[1])
    
for i in bn_4.T:
    A_4.append(bn_param_reduction(i[0],i[1],i[2],i[3])[0])
    B_4.append(bn_param_reduction(i[0],i[1],i[2],i[3])[1])
    
    
model_1 = Model(nn_inputs, c1)

correct_eval = 0

for test in range(5000):

    model_1_out = model_1.predict(x_test[test].reshape(1,32,32,1))
    
    conv1 = model_1_out.reshape(28,28,6)
    
    bn_output_1 = numpy.zeros([28,28,6])
    for i in range(6):
        for j in range(28):
            for k in range(28):
                bn_output_1[k,j,i] = float2fix(A_1[i],frac_part)*conv1[k,j,i]+float2fix(B_1[i],frac_part)
    
    model_2_input = Input(shape = (28,28,6))
    next_layer = model_2_input
    for layer in model.layers[3:7]:
        next_layer = layer(next_layer)
     
    model_2 = Model(model_2_input, next_layer)
               
    model_2_out = model_2.predict(bn_output_1.reshape(1,28,28,6))
    
    conv2 = model_2_out.reshape(10,10,16)
    
    bn_output_2 = numpy.zeros([10,10,16])
    for i in range(16):
        for j in range(10):
            for k in range(10):
                bn_output_2[k,j,i] = float2fix(A_2[i],frac_part)*conv2[k,j,i]+float2fix(B_2[i],frac_part)
                
    model_3_input = Input(shape = (10,10,16))
    next_layer = model_3_input
    for layer in model.layers[8:12]:
        next_layer = layer(next_layer)
     
    model_3 = Model(model_3_input, next_layer)
               
    model_3_out = model_3.predict(bn_output_2.reshape(1,10,10,16))
    
    conv3 = model_3_out.reshape(120)
    
    bn_output_3 = numpy.zeros([120])
    for i in range(120):
        bn_output_3[i] = float2fix(A_3[i],frac_part)*conv3[i]+float2fix(B_3[i],frac_part)
        
    model_4_input = Input(shape = (1,1,120))
    next_layer = model_4_input
    for layer in model.layers[13:16]:
        next_layer = layer(next_layer)
     
    model_4 = Model(model_4_input, next_layer)
               
    model_4_out = model_4.predict(bn_output_3.reshape(1,1,1,120))
    
    fc1 = model_4_out.reshape(84)
    
    bn_output_4 = numpy.zeros([84])
    for i in range(84):
        bn_output_4[i] = float2fix(A_4[i],frac_part)*fc1[i]+float2fix(B_4[i],frac_part)
        
    model_5_input = Input(shape = (1,1,84))
    next_layer = model_5_input
    for layer in model.layers[17:20]:
        next_layer = layer(next_layer)
     
    model_5 = Model(model_5_input, next_layer)
               
    model_5_out = model_5.predict(bn_output_4.reshape(1,1,1,84))   
    
    result = model_5_out.reshape(10)
    
        
    if numpy.argmax(result) ==  numpy.argmax(y_test[test]):
        correct_eval += 1
    
    print(test)
    
print('Accuracy :', correct_eval*100/5000)



            












