# -*- coding: utf-8 -*-
"""
Created on Wed May 22 13:20:24 2019

@author: Antonio
"""
from tensorflow.keras import Model, Sequential, layers, losses, models
import dataset
import plot

class lenet():
    
    def __init__(self, filename=None):
        
        if filename == None:
            init()    
        self.model = models.load_model("lenet5model.h5")
        
    def fmap(self, dataset):
        
        self.x_test = dataset
        '''
        trained = models.load_model("lenet5model.h5")
        results = trained.predict(x_test[0]) #get only one sample from the dataset x_test[i]
        '''
        
        self.hidden_outputs = [layer.output for layer in self.model.layers] #comprehension python?

        self.model = Model(inputs = self.model.input, outputs = self.hidden_outputs) 
        self.model.summary()
        
        self.x_test = self.x_test[0].reshape(1,28,28,1)
    
        self.feature_maps = self.model.predict(self.x_test)
        self.layers_name = [layer.name for layer in self.model.layers[1:]]    

        plot.fmap(self.layers_name, self.feature_maps)
    
    '''def setWeights'''
    
def init():
    ''' pre-processing MNIST dataset
    '''
    (x_train, y_train), (x_test, y_test) = dataset.load()
    
    NSYM    = 10   
    EPOCHS  = 10 
    BATCH_SIZE = 128
    
    '''
    define LeNet5  Sequential model (tf.keras)
    '''
    lenet = Sequential()
    
    lenet.add(layers.Conv2D(filters=6, kernel_size = (5, 5), strides = (1, 1), \
                  input_shape = (28,28,1), padding = 'same'))
    lenet.add(layers.Activation('tanh'))
    lenet.add(layers.AveragePooling2D(pool_size = (2, 2), strides = (1, 1), \
                                      padding = 'valid'))
    lenet.add(layers.Conv2D(filters=16, kernel_size = (5, 5), strides = (1, 1), \
                            padding = 'valid'))
    lenet.add(layers.Activation('tanh'))
    lenet.add(layers.AveragePooling2D(pool_size = (2, 2), \
                                      strides = (2, 2), padding = 'valid'))
    lenet.add(layers.Conv2D(filters=120, kernel_size = (5, 5), strides = (1, 1), \
                            padding = 'valid'))
    lenet.add(layers.Activation('tanh'))
    lenet.add(layers.Flatten())
    lenet.add(layers.Dense(84))
    lenet.add(layers.Activation('tanh'))
    lenet.add(layers.Dense(NSYM))
    lenet.add(layers.Activation('softmax'))
    
    '''
    configure lenet model
    '''
    lenet.compile(loss = losses.categorical_crossentropy, \
                  optimizer = 'SGD', metrics = ['accuracy'])
    '''
    training
    '''
    hist = lenet.fit(x = x_train, y = y_train, epochs = EPOCHS, batch_size = BATCH_SIZE, \
                     validation_data = (x_test, y_test), verbose = 1)
    '''
    check accuracy
    '''
    test_score = lenet.evaluate(x_test, y_test)
    print("Test loss {:.4f}, accuracy {:.2f}%".format(test_score[0], \
          test_score[1] * 100))
    '''
    plotting the training accuracy and loss after each epoch.
    '''
    #plot.acc(hist)
    plot.history(hist)
     
    ''' 
    Save lenet model
    '''
    lenet.save("lenet5model.h5")
    ''' 
    this is redundant-> lenet.save_weights('weights.h5')
    '''