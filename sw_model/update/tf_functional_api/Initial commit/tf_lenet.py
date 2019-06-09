# -*- coding: utf-8 -*-
"""
Created on Tue May 21 10:48:33 2019

@author: Matteo Risso, Alessandro Romeo, Antonio Simone
"""

import tensorflow as tf
import dataset
import plot
import numpy as np
from sklearn.utils import shuffle

# load MNIST dataset
data = dataset.mnist()
x_train,    y_train    = data.x_train,   data.y_train
x_test,     y_test     = data.x_test,    data.y_test

x_train    = tf.keras.utils.normalize(x_train, axis=-1)
x_test     = tf.keras.utils.normalize(x_test, axis=-1)

# placeholder for input, output variables
x           = tf.placeholder(tf.float32, (None, 32, 32, 1))
y           = tf.placeholder(tf.int32, (None))
one_hot_y   = tf.one_hot(y, 10)
# to_categorical returns a tensor with 
# hyperparameters
mu      = 0
sigma   = 0.1

# dictionary
weights = {
    # The shape of the filter weight is (height, width, input_depth, output_depth)
    'conv1':    tf.Variable(tf.truncated_normal(shape=(5, 5, 1, 6), mean = mu, stddev = sigma)),
    'conv2':    tf.Variable(tf.truncated_normal(shape=(5, 5, 6, 16), mean = mu, stddev = sigma)),
    'fc2':      tf.Variable(tf.truncated_normal(shape=(5 * 5 * 16, 120), mean = mu, stddev = sigma)),
    'fc3':      tf.Variable(tf.truncated_normal(shape=(120, 84), mean = mu, stddev = sigma)),
    'out':      tf.Variable(tf.truncated_normal(shape=(84, 10), mean = mu, stddev = sigma))
}

biases = {
    # The shape of the filter bias is (output_depth)
    'conv1':    tf.Variable(tf.zeros(6)),
    'conv2':    tf.Variable(tf.zeros(16)),
    'fc2':      tf.Variable(tf.zeros(120)),
    'fc3':      tf.Variable(tf.zeros(84)),
    'out':      tf.Variable(tf.zeros(10))
}

#INFERENCE  
# Layer 1: Convolutional. Input = 32x32x1. Output = 28x28x6
conv1   = tf.nn.conv2d(x, weights['conv1'], strides=[1, 1, 1, 1], padding='VALID')
conv1   = tf.nn.bias_add(conv1, biases['conv1'])
# Activation
conv1   = tf.nn.tanh(conv1)
# Pooling. Input = 28x28x6. Output = 14x14x6.
pool1   = tf.nn.avg_pool(conv1, ksize=(1, 2, 2, 1), strides=(1,2,2,1), padding='VALID')
# Layer 2: Convolutional. Output = 10x10x16
conv2   = tf.nn.conv2d(pool1, weights['conv2'], strides=[1, 1, 1, 1], padding='VALID')
conv2   = tf.nn.bias_add(conv2, biases['conv2'])
# Activation
conv2   = tf.nn.tanh(conv2)
# Pooling. Input = 10x10x16. Output = 5x5x16
pool2   = tf.nn.avg_pool(conv2, ksize=(1, 2, 2, 1), strides=(1,2,2,1), padding='VALID')
# Flatten. Input = 5x5x16. Output = 400 
# NB: LeCun original paper custom mapping to reduce the trainable parameters 400->120
fc1     = tf.layers.flatten(pool2) #deprecated
# Layer 3: Fully Connected. Input = 400. Output = 120.
fc2     = tf.add(tf.matmul(fc1, weights['fc2']), biases['fc2'])
# Activation.
fc2     = tf.nn.tanh(fc2)
# Layer 4: Fully Connected. Input = 120. Output = 84.
fc3     = tf.add(tf.matmul(fc2, weights['fc3']), biases['fc3'])
# Activation.
fc3     = tf.nn.tanh(fc3)
# Layer 5: Fully Connected. Input = 84. Output = 10.
logits  = tf.add(tf.matmul(fc3, weights['out']), biases['out'])

logits = tf.nn.softmax(logits)             


#TRAINING PIPELINE
EPOCHS      = 10     # number of iterations on the entire dataset
BATCH_SIZE  = 128   # after 128 samples, do the update  
LR          = 0.001 # learning rate parameter


  
# variable scopes are used to organize the dataflow graph (@TensorBoard) # summary.FileWriter 
with tf.variable_scope('Train'):
    
    with tf.variable_scope('Loss'):
        loss = tf.reduce_mean(\
               tf.nn.softmax_cross_entropy_with_logits(labels=one_hot_y, logits=logits),\
               name='loss')
    #softmax_cross_entropy_with_logits is deprecated -> tf.nn.softmax_cross_en-...-v2
    tf.summary.scalar('loss', loss)
    
    with tf.variable_scope('Optimizer'):
        optimizer = tf.train.AdamOptimizer(learning_rate=LR,name='Adam-op').minimize(loss)
        #optimizer = tf.train.GradientDescentOptimizer(learning_rate=LR,name='Gradient-op').minimize(loss)
        
        #• ? • GradientDescentOptimizer @10%  
        
    with tf.variable_scope('Accuracy'):
        # one_hot_y is a tensor with 1 at index (on_value=1), while other locations are 0 (off_value)
        # argmax returns the index of the max value element in the array
        correct_prediction = tf.equal(\
                             tf.argmax(logits, 1),\
                             tf.argmax(one_hot_y, 1),name='correct_pred')
        
        accuracy = tf.reduce_mean(\
                   tf.cast(correct_prediction, tf.float32), name='accuracy')
        
    tf.summary.scalar('accuracy', accuracy)
    
    with tf.variable_scope('Prediction'):
        cls_prediction = tf.argmax(logits, 1, name='predictions')

#TRAIN THE MODEL

#    Run the training data through the training pipeline to train the model.
#    Before each epoch, shuffle the training set.
#    After each epoch, measure the loss and accuracy of the validation set.
#    Save the model after training.
saver = tf.train.Saver()
with tf.Session() as sess:
    
    sess.run(tf.global_variables_initializer())
    # `sess.graph` provides access to the graph used in a <a href="./../api_docs/python/tf/Session"><code>tf.Session</code></a>.
    #writer = tf.summary.FileWriter("/tmp/log/...", sess.graph)
    print()
    print("Training...")
    print('---------------------------------------------------------')
    for epoch in range(EPOCHS):

        x_train, y_train = shuffle(x_train, y_train)
        #it = iteration = offset in training set according to batch size
        for it in range(0, len(x_train), BATCH_SIZE):
            end = it + BATCH_SIZE
#BACKPROP            
            batch_x, batch_y = x_train[it:end], y_train[it:end]
            sess.run(optimizer, feed_dict={x: batch_x, y: batch_y})
            
#EVAL            
        loss_valid, acc_valid = sess.run([loss, accuracy], feed_dict={x: x_test, y: y_test})
        print('EPOCH: {0}, Validation Loss: {1:.2f}, Validation Accuracy: {2:.01%}'.\
              format(epoch + 1, loss_valid, acc_valid))
    #writer.close()
    print()
    print('READY')
    '''    
    saver = tf.train.Saver()#save all variables and meta-graph
    saver.save(sess, './tf_lenet')
    print("Model saved")
    '''   
#TEST - after training -    
    x_test, y_test = shuffle(x_test,y_test)
    
    cls_pred = sess.run(cls_prediction, feed_dict={x: x_test, y: y_test})
    
    plot.plot_images(x_test, y_test, cls_pred, title='Correct Examples')
    plot.plot_example_errors(x_test, y_test, cls_pred, title='Misclassified Examples')

#SAVE    
    print()
    print('Saving...')
    saver.save(sess, "./network_weights.ckpt")
    
# TEST RESTORE WEIGHTS OK
    '''
    print()
    print('Loading model...')
    saver.restore(sess, "./network_weights.ckpt")
    
    loss_test, acc_test = sess.run([loss, accuracy], feed_dict={x: x_test, y: y_test})
    print()
    print('---------------------------------------------------------')
    print('Test Loss: {0:.2f}, Test Accuracy: {1:.01%}'.format(loss_test, acc_test))
    print('---------------------------------------------------------')
    
    preds = sess.run(cls_prediction, feed_dict={x: x_test, y: y_test})
    
    print(preds)
    '''