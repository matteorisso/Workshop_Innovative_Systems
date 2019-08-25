# -*- coding: utf-8 -*-
"""
Created on Tue May 21 10:48:33 2019
@author: Matteo Risso, Alessandro Romeo, Antonio Simone
"""
from keras import Sequential, layers, losses, utils
import dataset

data = dataset.mnist()
train, test = data.process()

x_train, y_train = train
x_test, y_test = test


'''
 define LeNet5 Sequential model 
'''

lenet = Sequential()
lenet.add(layers.Conv2D(filters=6,kernel_size = (5, 5), strides = (1, 1),padding = 'valid',input_shape = x_train[0].shape))
lenet.add(layers.Activation('relu'))
lenet.add(layers.AveragePooling2D(pool_size = (2, 2),strides = (2, 2),padding = 'valid'))
lenet.add(layers.Conv2D(filters=16,kernel_size = (5, 5),strides = (1, 1), padding = 'valid'))
lenet.add(layers.Activation('relu'))
lenet.add(layers.AveragePooling2D(pool_size = (2, 2),strides = (2, 2),padding = 'valid'))
lenet.add(layers.Conv2D(filters=120,kernel_size = (5, 5),strides = (1, 1), padding = 'valid'))
lenet.add(layers.Activation('relu'))
lenet.add(layers.Flatten())
lenet.add(layers.Dense(84))
lenet.add(layers.Activation('relu'))
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
EPOCHS      = 10   # number of iterations on the entire dataset
BATCH_SIZE  = 64   # after 128 sample eval ,do the update 

hist = lenet.fit(x = x_train, y = y_train, epochs = EPOCHS, batch_size = BATCH_SIZE, \
                 validation_data = (x_test, y_test), verbose = 1)
'''
check accuracy
'''
test_score = lenet.evaluate(x_test, y_test)
print("Test loss {:.4f}, accuracy {:.2f}%".format(test_score[0], \
      test_score[1] * 100))

''' 
check log dir
'''
import os
import config as cf

if not os.path.isdir(cf.savepath):
    os.makedirs(cf.savepath)
'''
plotting the training accuracy and loss after each epoch.
https://keras.io/visualization/
'''   

import matplotlib.pyplot as plt
  
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

plt.savefig("{}/{}.png".format(cf.savepath,title))

title = 'Training and validation loss'

plt.figure()
plt.title(title)

plt.plot(epochs, loss, 'r', label='Training loss')
plt.plot(epochs, val_loss, 'g', label='Validation loss')

plt.legend()
plt.ylabel('Loss')
plt.xlabel('Epoch')

plt.savefig("{}/{}.png".format(cf.savepath,title))

plt.show()
 
'''
Save model and weights
'''

lenet.save('{}.hdf5'.format(cf.modelpath))
utils.plot_model(lenet, to_file='{}.png'.format(cf.modelpath))

W = dict([(layer.name, layer.get_weights()) for layer in lenet.layers])

convW = dict([it for it in W.items() if 'conv' in it[0]])
fcW   = dict([it for it in W.items() if 'dense' in it[0]])

kernel = dict([layer,w[0][:,:,0,:]]\
              for layer,w in zip(convW.keys(), convW.values()) )

bias   = dict([layer,w[1]] \
              for layer,w in zip(convW.keys(), convW.values()) )

import scipy.io

scipy.io.savemat(os.path.join(cf.savepath,'all_weights.mat'),W)    
scipy.io.savemat(os.path.join(cf.savepath,'conv_weights.mat'),convW)
scipy.io.savemat(os.path.join(cf.savepath,'conv_kernels.mat'),kernel)
scipy.io.savemat(os.path.join(cf.savepath,'conv_biases.mat'),bias)
scipy.io.savemat(os.path.join(cf.savepath,'fc_weights.mat'),fcW)

print('*KUDOS* \nTrained model saved at {} '.format(cf.savepath))
