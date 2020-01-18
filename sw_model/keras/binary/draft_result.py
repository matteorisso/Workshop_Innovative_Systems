# -*- coding: utf-8 -*-
"""
Created on Thu Jan 16 22:43:31 2020

@author: Antonio
"""

#def convolution2d(image, kernel, bias):
#    m, n = kernel.shape
#    if (m == n):
#        y, x = image.shape
#        y = y - m + 1
#        x = x - m + 1
#        new_image = np.zeros((y,x))
#        for i in range(y):
#            for j in range(x):
#                new_image[i][j] = np.sum(image[i:i+m, j:j+m]*kernel) + bias
#    return new_image 
#       
#    res_file_radix = memdir+'/c1result'
#    tempfiles = []
#    
#    with open(memdir+'/c1kernel.mem', 'w+') as f:
#        for ofmap in range(kernelc1.shape[-1]):                      
#            #compute output
#            resc1 = convolution(img, kernelc1[:,:,:,ofmap:ofmap+1])          
#            #write memory map to tempfile
#            tempfiles.append(res_file_radix+str(ofmap)+'.mem')        
#            res_memory_map(resc1.reshape(resc1.shape[0], resc1.shape[0], 1), nbits, nfrac, npu_dim, tempfiles[ofmap])          
#            #write kernels
#            for i in range(kernelc1.shape[0]):
#                for j in range(kernelc1.shape[1]): 
#                    for k in range(kernelc1.shape[2]):
#                        f.write(weight_table(kernelc1[i,j,k,ofmap])+'\n')
#    #merge tempfiles
#    with open(res_file_radix+'.mem', 'w+') as f:
#        for file in tempfiles:
#            with open(file, 'r+') as src:
#                f.write(src.read()) 
#    
#    resc2 = signal.convolve2d(c2_in, kernelc2, mode='valid')
#    resc2 = np.reshape(resc2, (np.shape(resc2)[0], np.shape(resc2)[1], 1))[:, :, 0]
#    
#    resc2_new = convolution2d(c2_in, kernelc2, 0)
#    resc2_new2 = signal.correlate2d(c2_in, kernelc2, mode='valid')
#    #debug
#    np.array_equal(resc2, resc2_new)
#    np.array_equal(resc2_new, resc2_new2)
#    
#    resc2 = resc2_new
#    
#    nbits = 8
#    nfrac = 2
#    
#    res_file_radix = memdir+'/c2result'
#    tempfiles = []                   
#    
#    with open(memdir+'/c2kernel.mem', 'w+') as f:
#        for ofmap in range(kernelc2.shape[-1]):            
#            
#            #compute output
#            resc2 = convolution(c2_in, kernelc2)
#           
#            #write memory map to tempfile
#            tempfiles.append(res_file_radix+str(ofmap)+'.mem')        
#            res_memory_map(resc2.reshape(resc2.shape[0], resc2.shape[0], 1), nbits, nfrac, npu_dim, tempfiles[ofmap])
#       
#            #write kernels
#            for i in range(kernelc2.shape[0]):
#                for j in range(kernelc2.shape[1]):    
#                    for k in range(kernelc2.shape[2]):
#                        f.write(weight_table(kernelc2[i,j,k,ofmap])+'\n')
#    #merge tempfiles
#    with open(res_file_radix+'.mem', 'w+') as f:
#        for file in tempfiles:
#            with open(file, 'r+') as src:
#                f.write(src.read()) 
      
                            
  