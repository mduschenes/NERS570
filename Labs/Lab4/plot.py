#!/usr/bin/env python

import numpy as np
import scipy as sp
import scipy.optimize
import matplotlib.pyplot as plt

def plot(x,y,fig,ax,props):
	ax.plot(x,y,**{k: props.pop(k) for k in ['label','marker','linestyle','color']})
	for k in props:
		getattr(ax,'%s'%(k))(props[k])
	return

def fit(x,y,f,params):
	params[:],_ = sp.optimize.curve_fit(f,x,y,params)
	return 

def model(x,*params):
	return params[0]*(x**params[1])

# Arguments
names = ['Naive','BLAS','openBLAS','mkl','numpy']
N = len(names)

# Figure
fig,ax = plt.subplots()

props = {'set_xlabel':'N','set_ylabel':'T [s]','set_title':'Matrix Multiplication : T = a N^b',
		 'set_xscale':'linear','set_yscale':'log'}
colors = ['r','g','b','m','y']
# Process
for i in range(N):
	name = names[i]
	print(name)

	# Data
	x = np.array([2e1,1e2,5e2,1e3,2e3,4e3])
	if name == 'Naive':
		y = np.array([0,0,1.5e-1,2.62,3.63e1,3.54e2])
	elif name == 'BLAS':
		y = np.array([0,0,8e-2,6.8e-1,6.08,4.89e1])		
	elif name == 'openBLAS':
		y = np.array([0,0,1e-2,8e-2,4.2e-1,2.37])
	elif name == 'mkl':
		y = np.array([0,0,2e-2,7e-2,4.2e-1,2.53])	
	elif name == 'numpy':
		y = np.array([7.5e-5,2.8e-4,8.3e-3,5.2e-2,3.7e-1,3.09])	
	else:
		continue
	_slice = slice(2,None)
	x,y = x[_slice],y[_slice]

	# Fit
	_params = ['a','b']
	params = [1,2]
	fit(x,y,model,params)

	# Plot
	props['label'] = '%s'%(name)
	props['marker'] = 'o'
	props['linestyle'] = '-'
	props['color'] = colors[i]
	plot(x,y,fig,ax,props)

	props['label'] = '%s'%(
					 '\n'.join(['%s: %0.3e'%(l,p) 
					  for l,p in zip(_params,params)]))
	props['marker'] = '*'
	props['linestyle'] = '--'
	props['color'] = colors[i]
	plot(x,model(x,*params),fig,ax,props)

fig.legend(ncol=2,loc=(0.48,0.15),fontsize=8)
fig.savefig('results.pdf')	
