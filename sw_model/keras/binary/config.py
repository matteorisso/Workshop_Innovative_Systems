# -*- coding: utf-8 -*-
"""
Created on Mon Aug 19 00:31:05 2019

@author: Antonio
"""
import os
from os.path import join,isdir

#------------------------------------------------------------------------------
#------------------------------------------------------------------------------

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

#------------------------------------------------------------------------------
#------------------------------------------------------------------------------

_model   = 'lenet5'
_savedir = 'saved_model'
_logdir  = 'logs'
_imgdir  = 'img'

_binarycon = 'bnn'#'BinaryConnect2'
_binarynet = 'full-bnn'#'BinaryNet2'
#_xnornet   = 'XnorNet'
_ternary   = 'tnn'#'Q4Ternary'
_embeddings= 'metadata.tsv'
_tensorboard_name = 'tensorboard'

cwd = os.getcwd()

savepath  = join(cwd,_savedir)
imgpath   = join(cwd,_imgdir)
logpath   = join(join(cwd,_logdir),_tensorboard_name)
embed     = join(logpath,_embeddings)

#FPmodel       
fp = join(savepath,'{}'.format(_model))
#BinaryConnect 
bnn = join(savepath,'{}'.format(_binarycon))
#BinaryNet     
full_bnn = join(savepath,'{}'.format(_binarynet))
#Ternary
tnn      = join(savepath,'{}'.format(_ternary))

if not isdir(savepath):
    os.makedirs(savepath)
if not isdir(imgpath):
    os.makedirs(imgpath)
if not isdir(logpath):
    os.makedirs(logpath)

#------------------------------------------------------------------------------
#------------------------------------------------------------------------------

#cmd    
from build_model import build_model
from ternary_ops import ternarize
from binary_ops import binarize

model_path = Ternary
build = lambda : build_model('tnn',full=False)
qop = lambda x : ternarize(x)
