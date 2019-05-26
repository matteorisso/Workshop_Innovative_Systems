# -*- coding: utf-8 -*-
"""
Created on Tue May 21 10:48:33 2019

@author: Matteo Risso, Alessandro Romeo, Antonio Simone
"""
from tensorflow.keras import Sequential, layers, losses, utils
import matplotlib.pyplot as plt
import dataset
import os

'''
import sys
sys.stdout = open('transcript','w')
'''

data = dataset.mnist()
(x_train, y_train), (x_test, y_test) = data.process()

print("Image Shape: {}\n".format(x_train[0].shape))

'''define LeNet5  Sequential model (tf.keras)
'''
lenet = Sequential()

lenet.add(layers.Conv2D(filters=6,kernel_size = (5, 5),strides = (1, 1),padding = 'same',  \
        input_shape = x_train[0].shape))

lenet.add(layers.Activation('tanh'))

lenet.add(layers.AveragePooling2D(pool_size = (2, 2),strides = (1, 1),padding = 'valid'))

lenet.add(layers.Conv2D(filters=16,kernel_size = (5, 5),strides = (1, 1), padding = 'valid'))
lenet.add(layers.Activation('tanh'))

lenet.add(layers.AveragePooling2D(pool_size = (2, 2),strides = (2, 2),padding = 'valid'))

lenet.add(layers.Conv2D(filters=120,kernel_size = (5, 5),strides = (1, 1), padding = 'valid'))
lenet.add(layers.Activation('tanh'))

lenet.add(layers.Flatten())

lenet.add(layers.Dense(84))
lenet.add(layers.Activation('tanh'))

lenet.add(layers.Dense(10))
lenet.add(layers.Activation('softmax'))

'''
configure lenet model - Stochastig Gradient Descent
'''
lenet.compile(loss = losses.categorical_crossentropy, \
              optimizer = 'SGD', metrics = ['accuracy'])
'''
training
'''
EPOCHS      = 10    # number of iterations on the entire dataset
BATCH_SIZE  = 128   # after 128 sample eval ,do the update 

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
''' 

https://keras.io/visualization/
'''   
save_dir = os.path.join(os.getcwd(), 'saved_models')
if not os.path.isdir(save_dir):
    os.makedirs(save_dir)
  
acc = hist.history['acc']
val_acc = hist.history['val_acc']
loss = hist.history['loss']
val_loss = hist.history['val_loss']
epochs = range(1, len(acc) + 1)

title = 'Training and validation accuracy'

plt.plot(epochs, acc, 'r', label='Training acc')
plt.plot(epochs, val_acc, 'g', label='Validation acc')
plt.title(title)
plt.legend()
plt.ylabel('Accuracy')
plt.xlabel('Epoch')

path = os.path.join(save_dir, title)
plt.savefig("{}.png".format(path))

title = 'Training and validation loss'

plt.figure()
plt.title(title)

plt.plot(epochs, loss, 'r', label='Training loss')
plt.plot(epochs, val_loss, 'g', label='Validation loss')

plt.legend()
plt.ylabel('Loss')
plt.xlabel('Epoch')

path = os.path.join(save_dir, title)
plt.savefig("{}.png".format(path))
    
plt.show()
    
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

print('*KUDOS* Trained model saved at {} '.format(model_path))
utils.plot_model(lenet, to_file='lenet5model.png')