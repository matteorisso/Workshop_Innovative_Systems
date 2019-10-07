# -*- coding: utf-8 -*-
"""
Created on Mon Aug 19 21:01:11 2019

@author: Antonio
"""
import tensorflow as tf
import os

import scipy.io as spio
import numpy as np

import dataset
import config as cf

''' 
 create model
'''
model = cf.build()

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
early_stop = EarlyStopping(monitor='loss', min_delta=0.001, patience=10, mode='min', verbose=1)

tensorboard=TensorBoard(cf.logpath,\
                          histogram_freq=0, write_graph=True, write_images=False)
'''
Save model and weights
'''

checkpoint = ModelCheckpoint(cf.model_path+'.hdf5', monitor='val_acc', verbose=1, \
                             save_best_only=True, save_weights_only=True,\
                             mode='max', period=1)

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
if os.path.isfile(cf.model_path+'.hdf5'):
    
    import keras.backend as K
    
    model.load_weights(cf.model_path+'.hdf5')   
    W = model.get_weights()
    Wq = np.copy(W)        

    with tf.Session() as sess:    
        init = tf.global_variables_initializer()
        sess.run(init)
    
        for it in range(len(W)):
            if len(W[it].shape)>1:#skip batch norm parameters 
                Wq[it]  = sess.run(cf.qop(tf.convert_to_tensor(W[it])))
            else:
                #quantize batch norm with res 2**-8, clip values to 255, -256
                m = pow(2,4) #better accuracy with 2**4 !
                Wq[it] = sess.run(K.clip(tf.math.round(tf.convert_to_tensor(W[it])*m)/m,-m,m-1))
                
    model.set_weights(Wq) 
    Wq = Wq.tolist()
    '''
    conv param : #weights = ksize*ksize*ch_in*ch_o
    C1 : 5*5*1*6 = 150 + 6 bias (BN)
    C2 : 5*5*6*16 = 2400 + 16 bias (BN)
    C3 : 5*5*16*120 = 48000 + 120 bias (BN)
    '''
        
else:
    '''
     training
     - acc, loss metrics on training dataset
     - val_acc, val_loss metrics on validation dataset
    '''
    hist = model.fit(x = x_train, y = y_train, epochs = cf.epochs, batch_size = cf.batch_size, \
                     validation_data = (x_test, y_test), verbose = 1,\
                     callbacks = [checkpoint,tensorboard,early_stop])
    print('Trained model saved at {} '.format(cf.model_path))

'''
 check accuracy
'''

test_score = model.evaluate(x_test, y_test)
print("Test loss {:.4f}, accuracy {:.2f}%".format(test_score[0], \
      test_score[1] * 100))
print()

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
spio.savemat(cf.model_path+'_activations.mat',activations)

'''
non-zero activations ratio
'''
conv_inputs = [x_test[0:1][0]]
for key in activations.keys():
    if key.startswith('s1')\
    or key.startswith('s2'):
        conv_inputs.append(activations[key])     
ratio=[]
for it in conv_inputs:    
    cnt=0 
    for k in range(it.shape[-1]):
        for m in it[:,:,k]:
            for i in range(it.shape[0]):
                    if m[i] != 0: cnt+=1
    ratio.append(cnt/(it.shape[0]*it.shape[1]*it.shape[2])*100)

'''
non-zero weights ratio
#'''
#ratio=[]
#for it in Wq:    
#    cnt=0 
#    for k in range(it.shape[-1]):
#        for m in it[:,:,k]:
#            for i in range(it.shape[0]):
#                    if m[i] != 0: cnt+=1
#    ratio.append(cnt/(it.shape[0]*it.shape[1]*it.shape[2])*100)
