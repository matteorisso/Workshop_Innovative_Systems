# -*- coding: utf-8 -*-
"""
Created on Tue May 21 10:48:33 2019

@author: Antonio
"""
from tensorflow.keras import Sequential, layers, losses
import dataset
import plot

''' pre-processing MNIST dataset
'''
(x_train, y_train), (x_test, y_test) = dataset.get()

NSYM    = 10   
EPOCHS  = 10 
BATCH_SIZE = 128

'''
define LeNet5  Sequential model (tf.keras)
'''
lenet = Sequential()

lenet.add(layers.Conv2D(filters=6, kernel_size = (5, 5), strides = (1, 1), \
              input_shape = (28,28,1), padding = 'same'))
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
lenet.add(layers.Dense(NSYM))
lenet.add(layers.Activation('softmax'))

'''
configure lenet model
'''
lenet.compile(loss = losses.categorical_crossentropy, \
              optimizer = 'SGD', metrics = ['accuracy'])
'''
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
plot.acc(hist)

 
''' 
Save lenet model
'''
lenet.save("lenet5model.h5")
''' 
this is redundant-> lenet.save_weights('weights.h5')
'''