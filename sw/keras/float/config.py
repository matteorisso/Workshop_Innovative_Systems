# -*- coding: utf-8 -*-
"""
Created on Mon Aug 19 00:31:05 2019

@author: Antonio
"""

_model   = 'lenet5'
_savedir = 'saved_model'
_imgdir  = 'img'
import os

cwd  = os.getcwd()
path = lambda x,y : os.path.join(x,y)

savepath  = path(cwd,_savedir)
modelpath = path(savepath,_model)
imgpath   = path(cwd,_imgdir)

