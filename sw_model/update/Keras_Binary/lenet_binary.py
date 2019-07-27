# -*- coding: utf-8 -*-
"""
Created on Tue May 21 10:48:33 2019

@author: Matteo Risso, Alessandro Romeo, Antonio Simone
"""
import numpy as np

import keras.backend as K
from keras import losses
from keras.datasets import mnist
from keras.models import Sequential
from keras.layers import Dense, Dropout, Activation, BatchNormalization, AveragePooling2D
from keras.layers import Flatten
from keras.utils import np_utils
from keras.callbacks import LearningRateScheduler


from binary_layers import BinaryDense, BinaryConv2D

import os

import plot


'''
import sys
sys.stdout = open('transcript','w')
'''

(x_train, y_train), (x_test, y_test) = mnist.load_data()

x_train = x_train.reshape(60000, 1, 28, 28)
x_test = x_test.reshape(10000, 1, 28, 28)
x_train = x_train.astype('float32')
x_test = x_test.astype('float32')
x_train /= 255
x_test /= 255
print(x_train.shape[0], 'train samples')
print(x_test.shape[0], 'test samples')

# convert class vectors to binary class matrices
y_train = np_utils.to_categorical(y_train, 10) * 2 - 1 # -1 or 1 for hinge loss
y_test = np_utils.to_categorical(y_test, 10) * 2 - 1



print("Image Shape: {}\n".format(x_train[0].shape))

'''define LeNet5  Sequential model (tf.keras)
'''
lenet = Sequential()

# BN
epsilon = 1e-6
momentum = 0.9

# First convolution
lenet.add(BinaryConv2D(6, kernel_size=(5,5), input_shape=(1, 28, 28),
                       data_format='channels_first',
                       H=1, kernel_lr_multiplier='Glorot', 
                       padding='same', use_bias=False, name='conv1'))

lenet.add(BatchNormalization(epsilon=epsilon, momentum=momentum, axis=1, name='bn1'))


#lenet.add(layers.Conv2D(filters=6,kernel_size = (5, 5),strides = (1, 1),padding = 'same',  \
#        input_shape = x_train[0].shape))

lenet.add(Activation('relu'))

lenet.add(AveragePooling2D(pool_size = (2, 2),strides = (1, 1),padding = 'valid',
                           data_format='channels_first'))

lenet.add(BinaryConv2D(16, kernel_size=(5,5), 
                       data_format='channels_first',
                       H=1, kernel_lr_multiplier='Glorot', 
                       padding='valid', use_bias=False, name='conv2'))

lenet.add(BatchNormalization(epsilon=epsilon, momentum=momentum, axis=1, name='bn2'))

#lenet.add(layers.Conv2D(filters=16,kernel_size = (5, 5),strides = (1, 1), padding = 'valid'))

lenet.add(Activation('relu'))

lenet.add(AveragePooling2D(pool_size = (2, 2),strides = (2, 2),padding = 'valid',
                           data_format='channels_first'))

lenet.add(BinaryConv2D(120, kernel_size=(5,5), 
                       data_format='channels_first',
                       H=1, kernel_lr_multiplier='Glorot', 
                       padding='valid', use_bias=False, name='conv3'))

lenet.add(BatchNormalization(epsilon=epsilon, momentum=momentum, axis=1, name='bn3'))


#lenet.add(layers.Conv2D(filters=120,kernel_size = (5, 5),strides = (1, 1), padding = 'valid'))

lenet.add(Activation('relu'))

lenet.add(Flatten())

lenet.add(BinaryDense(84, H=1, kernel_lr_multiplier='Glorot', \
                      use_bias=False, name='dense1'))

lenet.add(BatchNormalization(epsilon=epsilon, momentum=momentum, axis=1, name='bn4'))


#lenet.add(layers.Dense(84))

lenet.add(Activation('relu'))

lenet.add(BinaryDense(10, H=1, kernel_lr_multiplier='Glorot', \
                      use_bias=False, name='dense2'))

lenet.add(BatchNormalization(epsilon=epsilon, momentum=momentum, axis=1, name='bn5'))


#lenet.add(layers.Dense(10))

lenet.add(Activation('softmax'))

'''
configure lenet model - Stochastig Gradient Descent
'''
lenet.compile(loss = losses.categorical_crossentropy, \
              optimizer = 'SGD', metrics = ['accuracy'])
'''
training
'''
EPOCHS      = 20    # number of iterations on the entire dataset
BATCH_SIZE  = 50   # after 128 sample eval ,do the update 

# learning rate schedule
lr_start = 1e-3
lr_end = 1e-4
lr_decay = (lr_end / lr_start)**(1. / EPOCHS)


lr_scheduler = LearningRateScheduler(lambda e: lr_start * lr_decay ** e)

hist = lenet.fit(x = x_train, y = y_train, epochs = EPOCHS, batch_size = BATCH_SIZE, \
                 validation_data = (x_test, y_test), verbose = 1,
                 callbacks=[lr_scheduler])
'''
check accuracy
'''
test_score = lenet.evaluate(x_test, y_test)
print("Test loss {:.4f}, accuracy {:.2f}%".format(test_score[0], \
      test_score[1] * 100))



# Save model
lenet.save("trained_LeNet5_bin.h5")
'''
plotting the training accuracy and loss after each epoch.
'''
''' 
plot.history(hist)
''' 
'''
Save model and weights
'''
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