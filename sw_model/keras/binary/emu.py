# -*- coding: utf-8 -*-
"""
Created on Thu Aug 22 12:54:40 2019

@author: Antonio
"""
import tensorflow as tf
import numpy as np

from build_model import build_model
from dataset import mnist
from binary_ops import binarize
import config as cf


data = mnist()
test = data.process()[-1]

x_test, y_test = test

input_img = x_test[0:1].reshape(x_test.shape[1:])
logits = y_test[0:1] 
label = np.argmax(logits)

'''
get weights from model
'''
model = build_model('binary',BinaryNet=True)
model.load_weights(cf.BinaryNet_path+'.hdf5')

W = model.get_weights()

'''
binarize weights with binary_ops
binary_ops defined to support back-prop during training with non-quantized weights
'''

Wq = np.copy(W)        

with tf.Session() as sess:    
    init = tf.global_variables_initializer()
    sess.run(init)

    for it in range(len(W)):
        if len(W[it].shape)>1:#keep batch norm parameters full-precision
            Wq[it]  = sess.run(binarize(tf.convert_to_tensor(W[it])))
Wq = Wq.tolist()

'''
binarize weights with sign function
inference only
'''
sign = lambda x: tf.math.sign(x)

myWq = np.copy(W) 
with tf.Session() as sess:    
    init = tf.global_variables_initializer()
    sess.run(init)

    for it in range(len(W)):
        if len(W[it].shape)>1:#keep batch norm parameters full-precision
            myWq[it]  = sess.run(sign(tf.convert_to_tensor(W[it])))

myWq = myWq.tolist()

'''
check if equals
'''
for a1,a2 in zip(myWq,Wq):
    if not np.array_equal(a1,a2):
        raise ValueError(a1,a2)

'''
fsm

'''

# NFU Neuron Functional Unit

kernel_size = 5
stride = 1

nfu_dim = 8
nfu = np.zeros((nfu_dim,nfu_dim))

conv_w = Wq[0][:,:,0,:]
conv_dim = int((input_img.shape[0]-kernel_size)/stride+1)
conv_res = np.zeros((28,28,conv_w.shape[-1]))

def tile_v_df(file='dataflow'):
    
    nb_psum = 0
    
    with open(file,'w+') as f:
    
        for tile in range(int(input_img.shape[0]/nfu_dim)):
                for ldv in range(kernel_size):
                    for ldh in range(kernel_size):
                        for k in range(conv_w.shape[-1]):
                            for i in range(nfu_dim):
                                for j in range(nfu_dim):
                                    if ldv+i+tile*nfu_dim < input_img.shape[0]:
                                        print('PE{}{}:\tI{}-{}*K{}-{}[{}]'\
                                              .format(i, j,\
                                                      ldv + i +tile*nfu_dim, ldh + j,\
                                                      ldv, ldh, k),\
                                                      file=f,end='\t')
                                    else:
                                        print('PE{}{}:CKG'.format(i,j),file=f,end='\t')
                                print(file=f)
                            print(file=f)
                    print('H'*100,file=f)
                    nb_psum+=1
                    if nb_psum == kernel_size:
                        nb_psum = 0 
                        print('RES'*100,file=f)
                    else:
                        print('V'*100,file=f)
        print('DONE',file=f)

tile_v_df()

nb_psum = 0 

for k in range(conv_w.shape[-1]): #multiple output channels
    for tile_h in range(int(input_img.shape[1]/nfu_dim)): #input img width axis 1
        ckg_col=False
        for tile_v in range(int(input_img.shape[0]/nfu_dim)): #input img height axis 0
            ckg_row=False
            for ldv in range(kernel_size): #vertical load 
                for ldh in range(kernel_size): #horizontal load 
                      
                        ckg_row = False
                        ckg_col = False
                        #loop over PE array    
                        for i in range(nfu_dim): 
                            for j in range(nfu_dim):
                                
                                #check last fetch for ck gating        
                                if ldv+i+tile_v*nfu_dim >= input_img.shape[0]:
                                    ckg_row = True
                                if ldh+j+tile_h*nfu_dim >= input_img.shape[1]:
                                    ckg_col = True
                                    
                                if ckg_row or ckg_col:
                                    nfu[i,j] = 0 
                                else:
                                    nfu[i,j] += \
                                    input_img[\
                                              ldv+i+tile_v*nfu_dim,\
                                              ldh+j+tile_h*nfu_dim]\
                                    *conv_w[ldv,ldh,k]     
                                
                nb_psum+=1 #each vertical load is 1D conv (primitive)
                if nb_psum == kernel_size: #check end of 2D conv on tiles
                    '''
                     write results
                    '''
                
                    ''' all PE on
                    '''
                    if ckg_row and not ckg_col:
                        conv_res[tile_v*nfu_dim : tile_v*nfu_dim+(nfu_dim-kernel_size+1),\
                                 tile_h*nfu_dim : tile_h*nfu_dim + nfu_dim, k]\
                        = nfu[0:nfu_dim-kernel_size+1, : ]
                        ''' lasts rows gated
                        img end on tile_v
                        '''
                    elif not ckg_row and ckg_col:
                        conv_res[tile_v*nfu_dim : tile_v*nfu_dim+nfu_dim,\
                                 tile_h*nfu_dim : tile_h*nfu_dim+(nfu_dim-kernel_size+1), k]\
                        = nfu[:,0:nfu_dim-kernel_size+1]
                        ''' lasts cols gated
                        img end on tile_h
                        '''
                    elif ckg_row and ckg_col:
                        conv_res[tile_v*nfu_dim : tile_v*nfu_dim+(nfu_dim-kernel_size+1),\
                                 tile_h*nfu_dim : tile_h*nfu_dim+(nfu_dim-kernel_size+1), k]\
                        = nfu[0:nfu_dim-kernel_size+1, 0:nfu_dim-kernel_size+1]
                        ''' half array gated
                        img SE corner
                        '''
                    else:
                        conv_res[ tile_v*nfu_dim : (tile_v*nfu_dim + nfu_dim),\
                                  tile_h*nfu_dim : (tile_h*nfu_dim + nfu_dim), k]\
                        = nfu
                    # reset for new tile    
                    nb_psum = 0 
                    nfu = np.zeros(nfu.shape)

#spio.loadmat()
#for a1,a2 in zip(,conv_res):
#    if not np.array_equal(a1,a2):
#        raise ValueError(a1,a2)
                    
                    
                    