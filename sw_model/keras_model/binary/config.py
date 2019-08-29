# -*- coding: utf-8 -*-
"""
Created on Mon Aug 19 00:31:05 2019

@author: Antonio
"""
import os

cwd      = os.getcwd()

path     = lambda x,y : os.path.join(x,y)
isdir    = lambda x : os.path.isdir(x)
makedirs = lambda x: os.makedirs(x)

# Custom Layers
H                       = 1.
kernel_lr_multiplier    = 'Glorot'
kernel_regularizer      = 0.
activity_regularizer    = 0.

# Convolution
img_dim = 32 
channel = 1

conv1_filters = 6
conv2_filters = 16
conv3_filters = 120

kernel_size = (5, 5)
pool_size = (2, 2)

# Batch norm
epsilon     = 1e-6
momentum    = 0.9

# Training 
epochs      = 20   # number of iterations on the entire dataset
batch_size  = 64   # after BATCH_SIZE samples eval, do the update 
lr          = 0.001
decay       = 0.000025

_model   = 'lenet5'
_savedir = 'saved_model'
_logdir  = 'logs'
_imgdir  = 'img'

_binarycon = 'BinaryConnect'
_binarynet = 'BinaryNet'
_xnornet   = 'XnorNet'
_ternary   = 'b4ternary'

_tensorboard_name = 'tensorboard'

savepath  = path(cwd,_savedir)
imgpath   = path(cwd,_imgdir)
logpath   = path(path(cwd,_logdir),_tensorboard_name)

model_path         = path(savepath,'{}'.format(_model))
BinaryConnect_path = path(savepath,'{}'.format(_binarycon))
BinaryNet_path     = path(savepath,'{}'.format(_binarynet))
XnorNet_path       = path(savepath,'{}'.format(_xnornet))
ternary_path       = path(savepath,'{}'.format(_ternary))


if not isdir(savepath):
    makedirs(savepath)
if not isdir(imgpath):
    makedirs(imgpath)
if not isdir(logpath):
    makedirs(logpath)
    