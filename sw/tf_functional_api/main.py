# -*- coding: utf-8 -*-
"""
Created on Sun May 26 16:18:51 2019

@author: Antonio
"""
import tensorflow as tf
import tf_lenet_class as lenet
import os

model = lenet.lenet()
model.configure(epochs=3)
model.train()

ckpt = os.path.join(os.getcwd(), 'model.ckpt')
vars_in_checkpoint = tf.train.list_variables(ckpt)

model.test_examples()

'''
model.load_model('./model.ckpt')#optimizer not found in ckpoint

model.evaluate()
model.test_examples()
'''