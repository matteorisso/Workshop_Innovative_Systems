#!/usr/bin/env python3
# -*- coding: utf-8 -*-

"""
File : myLeNet_5.py
Author : Alessandro Romeo, Matteo Risso, Antonio Simone
Description : Software model of the CNN LeNet-5 for handwritten digits 
              recognition, implemented using keras.
"""

# Loading of the dataset mnist
from keras.datasets import mnist

# Loading from keras utilities function
from keras.utils import np_utils

# Load dataset as train and test sets
(x_train, y_train), (x_test, y_test) = mnist.load_data()

# Set numeric type to float32 from uint8
x_train = x_train.astype('float32')
x_test = x_test.astype('float32')

# Normalize value to [0, 1]
x_train /= 255
x_test /= 255

# Transform lables to one-hot encoding
y_train = np_utils.to_categorical(y_train, 10)
y_test = np_utils.to_categorical(y_test, 10)

# Reshape the dataset into 4D array, because keras' layers objects need an 
# array of that type as input.
x_train = x_train.reshape(x_train.shape[0], 28,28,1)
x_test = x_test.reshape(x_test.shape[0], 28,28,1)

# Creation of the NN model as a sequential model, this means that all the layer 
# will be stucked in the order with whom appears in the code.
from keras.models import Sequential
from keras import models, layers
import keras
#Instantiate an empty model
model = Sequential()

# C1 Convolutional Layer
model.add(layers.Conv2D(6, kernel_size = (5, 5), strides = (1, 1), \
             activation = 'tanh', input_shape = (28,28,1), padding = 'same'))

# S2 Pooling Layer
model.add(layers.AveragePooling2D(pool_size = (2, 2), strides = (1, 1), \
                                  padding = 'valid'))

# C3 Convolutional Layer
model.add(layers.Conv2D(16, kernel_size = (5, 5), strides = (1, 1), \
                        activation = 'tanh', padding = 'valid'))

# S4 Pooling Layer
model.add(layers.AveragePooling2D(pool_size = (2, 2), \
                                  strides = (2, 2), padding = 'valid'))

# C5 Fully Connected Convolutional Layer
model.add(layers.Conv2D(120, kernel_size = (5, 5), strides = (1, 1), \
                        activation = 'tanh', padding = 'valid'))

#Flatten the CNN output so that we can connect it with fully connected layers
model.add(layers.Flatten())

# FC6 Fully Connected Layer
model.add(layers.Dense(84, activation = 'tanh'))

#Output Layer with softmax activation
model.add(layers.Dense(10, activation = 'softmax'))

# Compile the model
model.compile(loss = keras.losses.categorical_crossentropy, \
              optimizer = 'SGD', metrics = ['accuracy'])

# We can train the model by calling model.fit function and pass in the 
# training data, the expected output, number of epochs, and batch size.
hist = model.fit(x = x_train, y = y_train, epochs = 10, batch_size = 128, \
                 validation_data = (x_test, y_test), verbose = 1)


# We can test the model by calling model.evaluate and passing in the testing 
# data set and the expected output.
test_score = model.evaluate(x_test, y_test)
print("Test loss {:.4f}, accuracy {:.2f}%".format(test_score[0], \
      test_score[1] * 100))

## Save model
# model.save("nome_modello.h5")

##We will visualize the training process by plotting the training accuracy and loss after each epoch.
#import matplotlib.pyplot as plt
#f, ax = plt.subplots()
#ax.plot([None] + hist.history[‘acc’], ‘o-‘)
#ax.plot([None] + hist.history[‘val_acc’], ‘x-‘)
## Plot legend and use the best location automatically: loc = 0.
#ax.legend([‘Train acc’, ‘Validation acc’], loc = 0)
#ax.set_title(‘Training/Validation acc per Epoch’)
#ax.set_xlabel(‘Epoch’)
#ax.set_ylabel(‘acc’)
#
#import matplotlib.pyplot as plt
#f, ax = plt.subplots()
#ax.plot([None] + hist.history[‘loss’], ‘o-‘)
#ax.plot([None] + hist.history[‘val_loss’], ‘x-‘)
## Plot legend and use the best location automatically: loc = 0.
#ax.legend([‘Train Loss’, ‘Validation Loss’], loc = 0)
#ax.set_title(‘Training/Validation Loss per Epoch’)
#ax.set_xlabel(‘Epoch’)
#ax.set_ylabel(‘Loss’)