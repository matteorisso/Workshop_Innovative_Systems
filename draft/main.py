# -*- coding: utf-8 -*-
"""
Created on Tue May 21 23:21:47 2019

@author: Antonio
"""
import plot
import dataset
import keras

x_test = dataset.process()[1][0]

trained = keras.models.load_model("lenet5model.h5")
'''
results = trained.predict(x_test[0]) #get only one sample from the dataset x_test[i]
'''
# Extract outputs of each layer in our trained_model
hidden_outputs = [layer.output for layer in trained.layers] #comprehension python?

#Creates a model that will return the OFMAPs of each layer, starting from
#previously trained sequential model. 

model = keras.Model(inputs = trained.input, outputs = hidden_outputs) 
model.summary()


# N.B.: the input data MUST be organized in a 4D tensor.
x_test = x_test[0].reshape(1,28,28,1)

feature_maps = model.predict(x_test)

layers_name = [layer.name for layer in model.layers[1:]]    
plot.fmap(layers_name, feature_maps)