# -*- coding: utf-8 -*-
"""
Created on Tue May 21 10:48:33 2019

@author: Antonio
"""
from tensorflow.keras import Sequential, layers, losses, utils
import dataset
import plot
import numpy as np
import os
'''
import sys
sys.stdout = open('transcript','w')
'''
''' pre-processing MNIST dataset
'''
NUM_CLASSES = 10    # output class labels  
EPOCHS      = 10    # number of iterations on the entire dataset
BATCH_SIZE  = 128   # after 128 sample eval ,do the update 

(x_train, y_train), (x_test, y_test) = dataset.process(NUM_CLASSES)
'''
x_test  = np.pad(x_test, ((0,0),(2,2),(2,2),(0,0)), 'constant')
x_train = np.pad(x_train,((0,0),(2,2),(2,2),(0,0)), 'constant')
'''
print("Image Shape: {}\n".format(x_train[0].shape))

'''
define LeNet5  Sequential model (tf.keras)
'''
lenet = Sequential()

lenet.add(layers.Conv2D(filters=6, kernel_size = (5, 5), strides = (1, 1), \
              input_shape = x_train[0].shape, padding = 'same'))

lenet.add(layers.Activation('tanh'))

lenet.add(layers.AveragePooling2D(pool_size = (2, 2), strides = (1, 1), \
                                  padding = 'valid'))

lenet.add(layers.Conv2D(filters=16, kernel_size = (5, 5), strides = (1, 1), \
                        padding = 'valid'))

lenet.add(layers.Activation('tanh'))

lenet.add(layers.AveragePooling2D(pool_size = (2, 2), \
                                  strides = (2, 2), padding = 'valid'))

lenet.add(layers.Conv2D(filters=120, kernel_size = (5, 5), strides = (1, 1), \
                        padding = 'valid'))

lenet.add(layers.Activation('tanh'))

lenet.add(layers.Flatten())

lenet.add(layers.Dense(84))

lenet.add(layers.Activation('tanh'))

lenet.add(layers.Dense(NUM_CLASSES))

lenet.add(layers.Activation('softmax'))

'''
configure lenet model - Stochastig Gradient Descent
'''
lenet.compile(loss = losses.binary_crossentropy, optimizer = 'SGD',\
              metrics = ['accuracy'] )
'''
lenet.compile(loss = losses.categorical_crossentropy, \
              optimizer = 'SGD', metrics = ['accuracy'])

training
'''
hist = lenet.fit(x = x_train, y = y_train, epochs = EPOCHS, batch_size = BATCH_SIZE, \
                 validation_data = (x_test, y_test), verbose = 1)
'''
check accuracy
'''
test_score = lenet.evaluate(x_test, y_test)
print("Test loss {:.4f}, accuracy {:.2f}%".format(test_score[0], \
      test_score[1] * 100))
'''
plotting the training accuracy and loss after each epoch.
'''
plot.history(hist)

''' 
Save model and weights
'''
save_dir = os.path.join(os.getcwd(), 'saved_models')
model_name = 'lenet5model.h5'
lenet.save(model_name)

if not os.path.isdir(save_dir):
    os.makedirs(save_dir)
    
model_path = os.path.join(save_dir, model_name)
lenet.save(model_path)

print('Saved trained model at {} '.format(model_path))
utils.plot_model(lenet, to_file='model.png')
