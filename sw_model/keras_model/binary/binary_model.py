# -*- coding: utf-8 -*-
"""
Created on Mon Aug 19 21:01:11 2019

@author: Antonio
"""
import tensorflow as tf
import os

import scipy.io
import numpy as np

import dataset
import config as cf

from build_model import build_model 
from binary_ops import binarize
from quantized_ops import quantize
#from ternary_ops import ternarize
''' 
 create model
'''
model = build_model('binary',BinaryNet=False)

'''
 configure  model 
'''

from keras.optimizers import Adam
from keras.losses import squared_hinge

adam= Adam(lr=cf.lr, beta_1=0.9, beta_2=0.999, epsilon=1e-08, decay=cf.decay)
model.compile(loss = squared_hinge, optimizer = adam, metrics = ['accuracy'])

'''
 callbacks
'''

from keras.callbacks import EarlyStopping, ModelCheckpoint, TensorBoard
#Stop training when a monitored quantity has stopped improving.
early_stop = EarlyStopping(monitor='loss', min_delta=0.001, patience=5, mode='min', verbose=1)

'''
Save model and weights
'''

checkpoint = ModelCheckpoint(cf.BinaryNet_path+'.hdf5', monitor='val_acc', verbose=1, \
                             save_best_only=True, save_weights_only=True,\
                             mode='max', period=1)

tensorboard = TensorBoard(cf.logpath,\
                          histogram_freq=0, write_graph=True, write_images=False)

'''
 load dataset
'''
data = dataset.mnist()
train,test = data.process()

x_train,y_train=train
x_test,y_test=test

'''
 check saved model
'''
if os.path.isfile(cf.BinaryConnect_path+'.hdf5'):
    
    model.load_weights(cf.BinaryConnect_path+'.hdf5')
    
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
#   create dictionary to savemat
#    scipy.io.savemat(cf.BinaryNet_path+'_fp_weights.mat',W)
#    scipy.io.savemat(cf.BinaryNet_path+'_bin_weights.mat',Wq)

else:
    '''
     training
     - acc, loss metrics on training dataset
     - val_acc, val_loss metrics on validation dataset
    '''
    hist = model.fit(x = x_train, y = y_train, epochs = cf.epochs, batch_size = cf.batch_size, \
                     validation_data = (x_test, y_test), verbose = 1,\
                     callbacks = [checkpoint,tensorboard,early_stop])
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
         
    from keras import utils
    
    utils.plot_model(model, to_file=cf.BinaryNet_path+'.png')
    print('*KUDOS* \nTrained model saved at {} '.format(cf.BinaryNet_path))

'''
 check accuracy
'''

print()
print('binary_layers model:\n')
test_score = model.evaluate(x_test, y_test)
print("Test loss {:.4f}, accuracy {:.2f}%".format(test_score[0], \
      test_score[1] * 100))

from keras import Model
from keract import get_activations
from keract import display_activations

hidden =  [layer.output for layer in model.layers]
model = Model(inputs = model.input,\
              outputs =hidden ) 
  
model.compile(loss = squared_hinge, optimizer = adam)    

activations = get_activations(model,x_test[0:1])
display_activations(activations, save=True, path=cf.imgpath)

activations = dict([(layer[0],layer[1][0]) for layer in activations.items()])

scipy.io.savemat(cf.BinaryNet_path+'_activations.mat',activations)