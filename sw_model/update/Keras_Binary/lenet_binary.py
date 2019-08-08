# -*- coding: utf-8 -*-
"""
Created on Tue May 21 10:48:33 2019

@author: Matteo Risso, Alessandro Romeo, Antonio Simone
"""

import keras.backend as K
from keras.datasets import mnist
from keras.models import Sequential
from keras.layers import Dense, Activation, BatchNormalization, AveragePooling2D
from keras.layers import Flatten
from keras.optimizers import SGD, Adam, RMSprop
from keras.callbacks import LearningRateScheduler
from keras.utils import np_utils

from binary_layers import BinaryDense, BinaryConv2D

import plot
import dataset

import os

'''
import sys
sys.stdout = open('transcript','w')
'''

data                                    = dataset.mnist()
(x_train, y_train), (x_test, y_test)    = data.preprocess_input()

print("Image Shape: {}\n".format(x_train[0].shape))

#NN paramters
H                       = 1.
kernel_lr_multiplier    = 'Glorot'
channels                = 1
img_rows                = 32 
img_cols                = 32 
conv1_filters           = 6
conv2_filters           = 16
conv3_filters           = 120
kernel_size             = (5, 5)
pool_size               = (2, 2)
use_bias                = False

# BN
epsilon     = 1e-6
momentum    = 0.9

'''define LeNet5  Sequential model (tf.keras)
'''
lenet = Sequential()

# conv1
lenet.add(BinaryConv2D(filters = conv1_filters, kernel_size = kernel_size, 
                       input_shape = (img_rows, img_cols, channels), 
                       data_format = 'channels_last', strides = (1, 1),
                       H = H, kernel_lr_multiplier = kernel_lr_multiplier, 
                       padding = 'valid', use_bias = use_bias, name = 'conv1'))

lenet.add(BatchNormalization(epsilon = epsilon, momentum = momentum, axis = 1,
                             name = 'bn1'))

lenet.add(Activation('relu', name = 'act1'))

lenet.add(AveragePooling2D(pool_size = (2, 2), 
                           padding = 'valid', name  = 'pool1'))

# conv2
lenet.add(BinaryConv2D(filters = conv2_filters, kernel_size = kernel_size, 
                       input_shape = (img_rows, img_cols, channels), 
                       data_format = 'channels_last', strides = (1, 1),
                       H = H, kernel_lr_multiplier = kernel_lr_multiplier, 
                       padding = 'valid', use_bias = use_bias, name = 'conv2'))

lenet.add(BatchNormalization(epsilon = epsilon, momentum = momentum, axis = 1,
                             name = 'bn2'))

lenet.add(Activation('relu', name = 'act2'))

lenet.add(AveragePooling2D(pool_size = (2, 2), 
                           padding = 'valid', name = 'pool2'))

# conv3
lenet.add(BinaryConv2D(filters = conv3_filters, kernel_size = kernel_size, 
                       input_shape = (img_rows, img_cols, channels), 
                       data_format = 'channels_last', strides = (1, 1),
                       H = H, kernel_lr_multiplier = kernel_lr_multiplier, 
                       padding = 'valid', use_bias = use_bias, name = 'conv3'))


lenet.add(BatchNormalization(epsilon = epsilon, momentum = momentum, axis = 1,
                             name = 'bn3'))

lenet.add(Activation('relu', name = 'act3'))

lenet.add(Flatten())

lenet.add(BinaryDense(120, H = H, kernel_lr_multiplier = kernel_lr_multiplier, 
                      use_bias = use_bias, name = 'fc1'))

lenet.add(BatchNormalization(epsilon = epsilon, momentum = momentum, axis = 1,
                             name = 'bn4'))

lenet.add(Activation('relu', name = 'act4'))

lenet.add(BinaryDense(84, H = H, kernel_lr_multiplier = kernel_lr_multiplier, 
                      use_bias = use_bias, name = 'fc2'))

lenet.add(BatchNormalization(epsilon = epsilon, momentum = momentum, axis = 1,
                             name = 'bn5'))
 
lenet.add(Activation('relu', name = 'act5'))

lenet.add(BinaryDense(10, H = H, kernel_lr_multiplier = kernel_lr_multiplier, 
                      use_bias = use_bias, name = 'fc3'))

lenet.add(BatchNormalization(epsilon = epsilon, momentum = momentum, axis = 1,
                             name = 'bn6'))

lenet.add(Activation('softmax', name = 'act6'))


'''
training
'''
EPOCHS      = 20    # number of iterations on the entire dataset
BATCH_SIZE  = 50   # after 50 sample eval ,do the update 

# learning rate schedule
lr_start    = 1e-3
lr_end      = 1e-4
lr_decay    = (lr_end / lr_start)**(1. / EPOCHS)

lr_scheduler = LearningRateScheduler(lambda e: lr_start * lr_decay ** e)

'''
configure lenet model - Stochastig Gradient Descent
'''
lenet.compile(loss = 'squared_hinge', \
              optimizer = Adam(lr = lr_start), metrics = ['accuracy'])
lenet.summary()


hist = lenet.fit(x = x_train, y = y_train, epochs = EPOCHS, 
                 batch_size = BATCH_SIZE, validation_data = (x_test, y_test), 
                 verbose = 1, callbacks = [lr_scheduler])
'''
check accuracy
'''
test_score = lenet.evaluate(x_test, y_test)
print("Test loss {:.4f}, accuracy {:.2f}%".format(test_score[0], \
      test_score[1] * 100))
'''
plotting the training accuracy and loss after each epoch.
'''
''' 
plot.history(hist)
''' 

'''
Save model and weights
'''
lenet.save("trained_LeNet5_bin.h5")

'''
save_dir = os.path.join(os.getcwd(), 'saved_models')
model_name = 'lenet5model.h5'
lenet.save(model_name)

if not os.path.isdir(save_dir):
    os.makedirs(save_dir)
    
model_path = os.path.join(save_dir, model_name)
lenet.save(model_path)

print('*KUDOS* \nTrained model saved at {} '.format(model_path))
utils.plot_model(lenet, to_file='lenet5model.png')
'''