#!/usr/bin/env python3

import os,sys,time
import numpy as np


# Matrix Operations
def timer(quiet=False):
	def wrapper(func):
		def _wrapper(*args,**kwargs):
			time0 = time.time()
			output = func(*args,**kwargs)
			deltatime = time.time()-time0
			if not quiet:
				print('Time: %0.5f s'%(deltatime))
			return output
		return _wrapper
	return wrapper


@timer(quiet=True)
def generate_random_matrix(m,n,quiet=True,label=None):
	# return np.random.rand(m,n)
	arr = np.random.randint(1,10,(m,n)).astype(float)
	if not quiet:
		print_matrix(arr,label)
	return arr


def print_matrix(arr,label=None):
	if label is not None:
		print(label)
		print(arr)
		print()
	return


@timer(quiet=False)
def dgemm(A,B,C,alpha,beta):
	C *= beta
	C += alpha*np.dot(A,B)
	return


# Arguments
N = 10


Nargs = len(sys.argv)-1
if Nargs > 0:
	N = int(sys.argv[1])

print('N = %d'%(N))


# Initialize Matrices
arrs = {}
keys = ['A','B','C']
for k in keys:
	arrs[k] = generate_random_matrix(N,N,quiet=True,label=k)



# Multiply Matrices

params = {'alpha':1.0,'beta':0.0}

dgemm(**arrs,**params)

#print_matrix(arrs['C'],'New C')






