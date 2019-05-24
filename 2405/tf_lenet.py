# -*- coding: utf-8 -*-
"""
Created on Fri May 24 02:01:11 2019

@author: Antonio
"""
import tensorflow as tf



x = tf.placeholder(tf.float32, (None, 32, 32, 1))
y = tf.placeholder(tf.int32, (None))
one_hot_y = tf.one_hot(y, 10)

# Hyperparameters
mu = 0
sigma = 0.1
layer_depth = {
    'layer_1' : 6,
    'layer_2' : 16,
    'layer_3' : 120,
    'layer_f1' : 84
}


# Layer 1: Convolutional. Input = 32x32x1. Output = 28x28x6.
conv1_w = tf.Variable(tf.truncated_normal(shape = [5,5,1,6],mean = mu, stddev = sigma))
conv1_b = tf.Variable(tf.zeros(6))
conv1 = tf.nn.conv2d(x,conv1_w, strides = [1,1,1,1], padding = 'VALID') + conv1_b 
# Activation.
conv1 = tf.nn.tanh(conv1)

# Pooling. Input = 28x28x6. Output = 14x14x6.
pool_1 = tf.nn.max_pool(conv1,ksize = [1,2,2,1], strides = [1,2,2,1], padding = 'VALID')

#Layer 2: Convolutional. Output = 10x10x16.
conv2_w = tf.Variable(tf.truncated_normal(shape = [5,5,6,16], mean = mu, stddev = sigma))
conv2_b = tf.Variable(tf.zeros(16))
conv2 = tf.nn.conv2d(pool_1, conv2_w, strides = [1,1,1,1], padding = 'VALID') + conv2_b
#Activation.
conv2 = tf.nn.tanh(conv2)

#Pooling. Input = 10x10x16. Output = 5x5x16.
pool_2 = tf.nn.max_pool(conv2, ksize = [1,2,2,1], strides = [1,2,2,1], padding = 'VALID') 

#Flatten. Input = 5x5x16. Output = 400.
fc1 = tf.flatten(pool_2)

#Layer 3: Fully Connected. Input = 400. Output = 120.
fc1_w = tf.Variable(tf.truncated_normal(shape = (400,120), mean = mu, stddev = sigma))
fc1_b = tf.Variable(tf.zeros(120))
fc1 = tf.matmul(fc1,fc1_w) + fc1_b

#Activation.
fc1 = tf.nn.tanh(fc1)

#Layer 4: Fully Connected. Input = 120. Output = 84.
fc2_w = tf.Variable(tf.truncated_normal(shape = (120,84), mean = mu, stddev = sigma))
fc2_b = tf.Variable(tf.zeros(84))
fc2 = tf.matmul(fc1,fc2_w) + fc2_b
#Activation.
fc2 = tf.nn.tanh(fc2)

#Layer 5: Fully Connected. Input = 84. Output = 10.
fc3_w = tf.Variable(tf.truncated_normal(shape = (84,10), mean = mu , stddev = sigma))
fc3_b = tf.Variable(tf.zeros(10))
fc3 = tf.matmul(fc2, fc3_w) + fc3_b

logits = tf.nn.softmax(fc3)

'''training pipeline
'''
cross_entropy = tf.nn.softmax_cross_entropy_with_logits(logits = logits, \
                                                        labels = one_hot_y)
loss_operation = tf.reduce_mean(cross_entropy)
optimizer = tf.train.SDG(learning_rate = 0.001)

training_operation = optimizer.minimize(loss_operation)
