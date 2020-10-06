#!/usr/bin/env python

import numpy as np
import matplotlib.pyplot as plt

def plot(x,y,fig,ax,props):
	ax.plot(x,y,label = props.pop('label'))
	for k in props:
		getattr(ax,'%s'%(k))(props[k])

# Arguments
names = ['Naive','BLAS','openBLAS','python']
N = len(names)

# Figure
fig,ax = plt.subplots()

props = {'set_xlabel':'N','set_ylabel':'Time [s]','set_title':'Matrix Multiplication',
		 'set_xscale':'log','set_yscale':'log'}

for name in names:
	print(name)
	if name == 'Naive':
		x = np.array([2e1,1e2,5e2,1e3])		
		y = np.array([0,0,7.9e-1,7.41])
	elif name == 'BLAS':
		x = np.array([2e1,1e2,5e2,1e3])		
		y = np.array([0,0,7.8e-1,6.4e-1])		
	elif name == 'openBLAS':
		x = np.array([2e1,1e2,5e2,1e3])		
		y = np.array([0,0,1e-2,8e-2])
	elif name == 'python':
		x = np.array([2e1,1e2,5e2,1e3,2e3,4e3])
		y = np.array([0,0,2.5e-4,7.96e-3,4.855e-2,3.5467e-1])	


	props['label'] = name
	plot(x,y,fig,ax,props)


fig.legend()
fig.savefig('results.pdf')	
