# -*- coding: utf-8 -*-
"""
Created on Tue May 21 10:48:33 2019

@author: Matteo Risso, Alessandro Romeo, Antonio Simone
"""

import keras.backend as K
import tensorflow as tf
import numpy
from keras.datasets import mnist
from keras.models import Sequential
from keras.layers import Dense, Activation, BatchNormalization, AveragePooling2D
from keras.layers import Flatten
from keras.optimizers import SGD, Adam, RMSprop, Adadelta
from keras.callbacks import LearningRateScheduler
from keras.utils import np_utils

from ternary_ops import ternarize
from ternary_layers import TernaryDense, TernaryConv2D

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
lenet.add(TernaryConv2D(filters = conv1_filters, kernel_size = kernel_size, 
                       input_shape = (img_rows, img_cols, channels), 
                       data_format = 'channels_last', strides = (1, 1),
                       H = H, kernel_lr_multiplier = kernel_lr_multiplier, 
                       padding = 'valid', use_bias = use_bias, name = 'conv1'))

lenet.add(BatchNormalization(epsilon = epsilon, momentum = momentum, axis = 1,
                             name = 'bn1'))

#lenet.add(Activation(binary_tanh, name = 'act1'))
lenet.add(Activation('relu', name = 'act1'))

lenet.add(AveragePooling2D(pool_size = (2, 2), 
                           padding = 'valid', name  = 'pool1'))

# conv2
lenet.add(TernaryConv2D(filters = conv2_filters, kernel_size = kernel_size, 
                       input_shape = (img_rows, img_cols, channels), 
                       data_format = 'channels_last', strides = (1, 1),
                       H = H, kernel_lr_multiplier = kernel_lr_multiplier, 
                       padding = 'valid', use_bias = use_bias, name = 'conv2'))

lenet.add(BatchNormalization(epsilon = epsilon, momentum = momentum, axis = 1,
                             name = 'bn2'))

#lenet.add(Activation(binary_tanh, name = 'act2'))
lenet.add(Activation('relu', name = 'act2'))

lenet.add(AveragePooling2D(pool_size = (2, 2), 
                           padding = 'valid', name = 'pool2'))

# conv3
lenet.add(TernaryConv2D(filters = conv3_filters, kernel_size = kernel_size, 
                       input_shape = (img_rows, img_cols, channels), 
                       data_format = 'channels_last', strides = (1, 1),
                       H = H, kernel_lr_multiplier = kernel_lr_multiplier, 
                       padding = 'valid', use_bias = use_bias, name = 'conv3'))


lenet.add(BatchNormalization(epsilon = epsilon, momentum = momentum, axis = 1,
                             name = 'bn3'))

#lenet.add(Activation(binary_tanh, name = 'act3'))
lenet.add(Activation('relu', name = 'act3'))

lenet.add(Flatten())

#lenet.add(BinaryDense(120, H = H, kernel_lr_multiplier = kernel_lr_multiplier, 
#                      use_bias = use_bias, name = 'fc1'))
#
#lenet.add(BatchNormalization(epsilon = epsilon, momentum = momentum, axis = 1,
#                             name = 'bn4'))
#
#lenet.add(Activation('relu', name = 'act4'))

lenet.add(TernaryDense(84, H = H, kernel_lr_multiplier = kernel_lr_multiplier, 
                      use_bias = use_bias, name = 'fc1'))

lenet.add(BatchNormalization(epsilon = epsilon, momentum = momentum, axis = 1,
                             name = 'bn4'))
 
#lenet.add(Activation(binary_tanh, name = 'act4'))
lenet.add(Activation('relu', name = 'act4'))

lenet.add(TernaryDense(10, H = H, kernel_lr_multiplier = kernel_lr_multiplier, 
                      use_bias = use_bias, name = 'fc2'))

lenet.add(BatchNormalization(epsilon = epsilon, momentum = momentum, axis = 1,
                             name = 'bn5'))

lenet.add(Activation('softmax', name = 'act5'))


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
              optimizer = Adadelta(), metrics = ['accuracy'])
lenet.summary()


hist = lenet.fit(x = x_train, y = y_train, epochs = EPOCHS, 
                 batch_size = BATCH_SIZE, validation_data = (x_test, y_test), 
                 verbose = 1)
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
Save model
'''
lenet.save("trained_LeNet5_tern_adad.h5")
#lenet.save_weights('my_model_weights_adad.h5')

'''
Save Weights
'''

os.chdir('./weights_adad')

weights_num = (5 * 5 * 6) + (5 * 5 * 6 * 16) +  (5 * 5 * 6 * 120) \
              + (120 * 84) + (84 * 10)

zero_num = 0

#conv1
with tf.Session() as sess:
    sess.run(tf.global_variables_initializer())
    conv1_ter = sess.run(ternarize(lenet.layers[0].kernel))

for i in range(6):
    numpy.savetxt('conv1_'+str(i)+'.txt', conv1_ter[:, :, 0,i])

zero_num +=  numpy.count_nonzero(conv1_ter==0)
    
#bn1
bn1 = lenet.layers[1].get_weights()
for i in range(len(bn1)) :
    numpy.savetxt('bn1_'+str(i)+'.txt',bn1[i])
    
#conv2
with tf.Session() as sess:
    sess.run(tf.global_variables_initializer())
    conv2_ter = sess.run(ternarize(lenet.layers[4].kernel))

for i in range(6) :
    for j in range(16) :
        numpy.savetxt('conv2_'+str(i)+str(j)+'.txt', conv2_ter[:, :, i, j])
    
zero_num +=  numpy.count_nonzero(conv2_ter==0)

#bn2
bn2 = lenet.layers[5].get_weights()
for i in range(len(bn2)) :
    numpy.savetxt('bn2_'+str(i)+'.txt',bn2[i])
    
#conv3
with tf.Session() as sess:
    sess.run(tf.global_variables_initializer())
    conv3_ter = sess.run(ternarize(lenet.layers[8].kernel))

for i in range(0,16) :
    for j in range(0,120) :
        numpy.savetxt('conv3_'+str(i)+str(j)+'.txt', conv3_ter[:, :, i, j])

zero_num +=  numpy.count_nonzero(conv3_ter==0)

#bn3
bn3 = lenet.layers[9].get_weights()
for i in range(len(bn3)) :
    numpy.savetxt('bn3_'+str(i)+'.txt',bn3[i])

#fc1
with tf.Session() as sess:
    sess.run(tf.global_variables_initializer())
    fc1_ter = sess.run(ternarize(lenet.layers[12].kernel))

numpy.savetxt('fc1_,txt',fc1_ter)

zero_num +=  numpy.count_nonzero(fc1_ter==0)

#bn4
bn4 = lenet.layers[13].get_weights()
for i in range(len(bn4)) :
    numpy.savetxt('bn4_'+str(i)+'.txt',bn4[i])

#fc2
with tf.Session() as sess:
    sess.run(tf.global_variables_initializer())
    fc2_ter = sess.run(ternarize(lenet.layers[15].kernel))
    
numpy.savetxt('fc2_,txt',fc2_ter)

zero_num +=  numpy.count_nonzero(fc2_ter==0)

#bn5
bn5 = lenet.layers[16].get_weights()
for i in range(len(bn5)) :
    numpy.savetxt('bn5_'+str(i)+'.txt',bn5[i])

zero_density = zero_num / weights_num

print("Zero density {:.4f}%".format(zero_density * 100))


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