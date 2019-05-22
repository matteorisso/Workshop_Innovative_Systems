# -*- coding: utf-8 -*-
"""
Created on Wed May 22 13:52:04 2019

@author: Antonio
"""

import lenet_class
import dataset

model = lenet_class.lenet("lenet5model.h5")
model.fmap(dataset.process()[1][0])

