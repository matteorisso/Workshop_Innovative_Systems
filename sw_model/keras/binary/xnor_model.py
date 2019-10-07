# -*- coding: utf-8 -*-
"""
Created on Mon Aug 19 21:01:11 2019

@author: Antonio
"""


import tensorflow as tf
import os

import dataset
import config as cf

from build_model import build_model 
from binary_ops import xnorize

    
model = build_model('xnor')

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
early_stop = EarlyStopping(monitor='loss', min_delta=0.001, patience=10, mode='min', verbose=1)

'''
Save model and weights
'''

checkpoint = ModelCheckpoint(cf.XnorNet_path+'.hdf5', monitor='val_acc', verbose=1, \
                             save_best_only=True, save_weights_only=True,\
                             mode='max', period=1)

tensorboard = TensorBoard(cf.logpath+'XNOR',\
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
if os.path.isfile(cf.XnorNet_path+'.hdf5'):
    model.load_weights(cf.XnorNet_path+'.hdf5')

    W = model.get_weights()
    #Wq = np.copy(W)        

    # quantize weights list    
    # quantize() return Tensor object to be evaluated as numpy array
    with tf.Session() as sess:    
        init = tf.global_variables_initializer()
        sess.run(init)
        # ensure same shape of get_weights() numpy array list
        for it in range(len(W)):
                W[it]  = sess.run(xnorize(tf.convert_to_tensor(W[it])))
    #Wq = Wq.tolist() #from ndarray to numpy array list

else:
    '''
     training
    '''
    hist = model.fit(x = x_train, y = y_train, epochs = cf.epochs, batch_size = cf.batch_size, \
                     validation_data = (x_test, y_test), verbose = 1, callbacks = [checkpoint,tensorboard])
    
    from keras import utils

    utils.plot_model(model, to_file=cf.XnorNet_path+'.png')
    print('*KUDOS* \nTrained model saved at {} '.format(cf.XnorNet_path))

'''
 check accuracy
'''

print()
print('xnor_layers model:\n')
test_score = model.evaluate(x_test, y_test)
print("Test loss {:.4f}, accuracy {:.2f}%".format(test_score[0], \
      test_score[1] * 100))

from keras import Model
from keract import get_activations

hidden =  [layer.output for layer in model.layers]
model = Model(inputs = model.input,\
              outputs =hidden ) 
  
model.compile(loss = squared_hinge, optimizer = adam)    

activations = get_activations(model,x_test[0:1])
activations = dict([(layer[0],layer[1][0]) for layer in activations.items()])

   


