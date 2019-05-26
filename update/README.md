## LENET5 SW MODEL
####Keras Sequential Model

> High Level API implementation of the architecture:

***run*** :
1. 'python3.X main.py'	: plot feature maps on trained lenet architecture, run training if no model exists 
2. 'python3.X test.py' 	: predict on both MNIST dataset and *self-made* dataset

modules :	 

- **main.py** 	 : hidden layers features visualization
- **lenet.py**	 : architecture definition + training 
- **dataset.py** : 
	- mnist class interface for data pre-processing
	- png2mnist class for *png* images processing
- **plot.py**	 : plot utils   

####Tensorflow Functional API 

> Low Level API implementation of the architecture:

*** BUG: KeyError restoring model from checkpoint ***

***run*** :
1. 'python3.X main.py'	: train the model, plot predictions examples 

modules :	 

- **main.py** 	 
- **tf_lenet_class.py**	 : architecture  
- **dataset.py** : 
	- mnist class interface for data pre-processing
	- png2mnist class for *png* images processing
- **plot.py**	 : plot utils 

>> ##### Initial commit dir
first try 