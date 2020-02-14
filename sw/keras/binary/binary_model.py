# -*- coding: utf-8 -*-
"""
Created on Mon Aug 19 21:01:11 2019

@author: Antonio
"""

import matplotlib.pyplot as plt
import tensorflow as tf
import numpy as np
import os
import math
import dataset
import config as cf

from keras import Model
from keract import get_activations
from keract import display_activations

''' 
 create model
'''
model = cf.build()

'''
 configure  model 
'''

from keras.optimizers import Adam
from keras.losses import squared_hinge

adam = Adam(lr=cf.lr, beta_1=0.9, beta_2=0.999, epsilon=1e-08, decay=cf.decay)
model.compile(loss=squared_hinge, optimizer=adam, metrics=['accuracy'])

'''
 callbacks
'''

from keras.callbacks import EarlyStopping, ModelCheckpoint, TensorBoard

early_stop = EarlyStopping(monitor='loss', min_delta=0.001, patience=20, mode='min', verbose=1)
tensorboard = TensorBoard(cf.logpath, histogram_freq=0, write_graph=True, write_images=False)

'''
Save model and weights
'''
checkpoint = ModelCheckpoint(cf.model_path+'.hdf5', monitor='val_acc', verbose=1,\
                             save_best_only=True, save_weights_only=True,\
                             mode='max', period=1)

'''
 load dataset
'''
data = dataset.mnist()
train, test = data.process()

x_train, y_train = train
x_test, y_test = test

'''
 check saved model
'''
if not os.path.isfile(cf.model_path+'.hdf5'):

    '''
    training
    '''
    hist = model.fit(x=x_train, y=y_train, epochs=cf.epochs, batch_size=cf.batch_size, \
                     validation_data=(x_test, y_test), verbose=1,\
                     callbacks=[checkpoint, early_stop])
    print('Trained model saved at {} '.format(cf.model_path))
    
'''
restore model
'''

model.load_weights(cf.model_path+'.hdf5')   

W = model.get_weights()
Wq = np.copy(W)        

'''
quantize network weights
'''

# batch norm parameters quantization
#
#nbits = 8
#nfrac = 6
#
#m = 2**(nbits-1)
#mfrac = 2**(nfrac)
#
#quant = lambda x, m, m_frac: np.clip(np.round(x*m_frac), -m, m-1)/m_frac
#
#def bn_param_reduction(gamma,beta,mu,sigma):
#    a  =    gamma/math.sqrt(sigma)
#    b  =    beta - (mu*gamma)/(math.sqrt(sigma))
#    return a,b
#
#bn = [] #batch norm parameters container, each element is one layer
# 
#collect scale, offset, mean and variance for each layer
#
#for k in range(1, len(W), 5):
#    
#    bn1_scale = W[k] #gamma
#    bn1_offset = W[k+1] #beta
#    bn1_mean = W[k+2] #mu
#    bn1_var = W[k+3] #sigma
#    
#    bn_param = [] #batch norm layer parameters
#    
#    # reduction
#    for i in range(bn1_mean.shape[-1]):
#        bn_param.append(bn_param_reduction(bn1_scale[i], bn1_offset[i], bn1_mean[i], bn1_var[i]))
#    
##    #add reduced param
#    bn.append(bn_param)

# quantize    
with tf.Session() as sess:    
    
    init = tf.global_variables_initializer()
    sess.run(init)

#    bn_layer_cnt = 0 #
#    bn_param_cnt = 0 #
#    
    for it in range(len(W)):
        if len(W[it].shape) > 1: #skip bn parameters 
            
            Wq[it] = sess.run(cf.qop(tf.convert_to_tensor(W[it]))) #ternary
            
            bn_param_cnt = 0 #
#            
#        else:
##           Wq[it] = np.clip(np.round(W[it]*mfrac), -m, m-1)/mfrac
#            
#            if bn_param_cnt == 0: #
#                #set gamma as A coefficient #
#                for i in range(len(bn[bn_layer_cnt])): # foreach channel get first value of tuple #
#                    Wq[it][i] = bn[bn_layer_cnt][i][0] #
#                    Wq[it][i] = quant(Wq[it][i], m, mfrac)
#                    #test approx shift
#                    #Wq[it][i] = 1/pow(2, np.round(math.log(abs(Wq[it][i]*mfrac))/math.log(2)))
#                    
#            elif bn_param_cnt == 1: #
#                #set offset as B coefficient #
#                for i in range(len(bn[bn_layer_cnt])): # foreach channel get second value of tuple #
#                    Wq[it][i] = bn[bn_layer_cnt][i][1] # 
#                    Wq[it][i] = quant(Wq[it][i], m, mfrac)
#                    #test approx
#                    #Wq[it][i] = 1/pow(2, np.round(math.log(abs(Wq[it][i])*mfrac)/math.log(2)))
#                    
#            elif bn_param_cnt == 2: #
#                #set mean 0.
#                 for i in range(len(bn[bn_layer_cnt])): #
#                    Wq[it][i] = 0 #
#            else:
#                #set var 1.
#                for i in range(len(bn[bn_layer_cnt])): #
#                    Wq[it][i] = 1 #
#                
#            if bn_param_cnt == 3: #
#                bn_layer_cnt +=1  #
#                
#            bn_param_cnt +=1 #
#            
            
model.set_weights(Wq) 
Wq = Wq.tolist()

np.save(cf.model_path+'_weights.npy', Wq)

'''
 check accuracy
'''

test_score = model.evaluate(x_test, y_test)
print("Test loss {:.4f}, accuracy {:.2f}%".format(test_score[0], test_score[1] * 100))
print()

hidden = [layer.output for layer in model.layers]

model = Model(inputs=model.input, outputs=hidden) 
model.compile(loss=squared_hinge, optimizer=adam)    

activations = get_activations(model, x_test[0:1])

display_activations(activations, save=True, path=cf.imgpath)

activations = dict([(layer[0], layer[1][0]) for layer in activations.items()])
np.save(cf.model_path+'_act.npy', np.asarray(activations))

'''
zero activations ratio
'''

img_inputs = [x_test[0:1][0]]

np.save(cf.model_path+'_img.npy', {'img':x_test[0:1]})
print()
print()
for key in activations.keys():
    if key.startswith('c') or key.startswith('fc'): 
        print(key)
        img_inputs.append(activations[key])     
        
zeros_act = []

for it in img_inputs:    
    cnt = 0 
    for i in it.ravel():
        if i == 0: cnt += 1
    zeros_act.append(cnt/np.size(it)*100)
    
print('\nZero activations ratio :')
print(zeros_act)

'''
zero weights ratio
'''
wtmp = Wq[0::1]

zeros_k = []
for it in wtmp:    
    cnt = 0 
    for i in it.ravel():
        if i == 0: cnt += 1
    zeros_k.append(cnt/np.size(it)*100)
    
print('\nZero weights ratio :')
print(zeros_k)

'''
plot 
'''
for item in range(len(img_inputs)):
    
    img_inputs[item] = img_inputs[item].ravel()
    u, inv = np.unique(img_inputs[item], return_inverse=True)
    counts = np.bincount(inv)    
    
    plt.bar(u, counts, width=0.3)
    plt.xticks(np.arange(-1, 1.1, 0.5))

plt.legend()
plt.show()


for item in range(len(wtmp)):
    
    wtmp[item] = wtmp[item].ravel()
    u, inv = np.unique(wtmp[item], return_inverse=True)
    counts = np.bincount(inv)    
    
    plt.bar(u, counts, width=0.3)
    plt.xticks(np.arange(-1, 1.1, 0.5))
    
plt.show()

