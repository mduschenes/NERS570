#!/usr/bin/env python

import os,sys,glob
import numpy as np
import scipy as sp
import pandas as pd
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

def importer(path):
	df = pd.read_csv(path,header=None).T
	df.columns = df.iloc[0]
	df.drop(0,inplace=True)
	index=df.columns[0]
	df.set_index(index,drop=True,append=False, inplace=True)
	return df

# Arguments
paths=['*.csv']
files=[f for path in paths for f in glob.glob(path)]
keys = ['.'.join(f.split('.')[:-1]) for f in files]
N = len(keys)

data = {}
for k,f in zip(keys,files):
	data[k] = importer(f)


	print(k)
	print(data[k])
	print()




# Figure
fig,axes = plt.subplots(N,1)

_props = lambda **kwargs: {'set_xlabel':'n','set_ylabel':'%s'%(kwargs['set_ylabel']),'set_title':None,
		 'set_xscale':'linear','set_yscale':'log'}
colors = ['r','g','b','m','y']
# Process



for i in range(N):
	key = keys[i]
	df = data[key]
	ax = axes[i]
	
	x = df.index.values
	for label in df.columns:
		y = df[label].values
		_slice = slice(0,None)
		x,y = x[_slice],y[_slice]

		# Fit
#		_params = ['a','b']
#		params = [1,2]
#		fit(x,y,model,params)

		# Plot
		props=_props(**{'set_ylabel':key})
		props['label'] = '%s'%(label)
		props['marker'] = 'o'
		props['linestyle'] = '-'
		props['color'] = colors[i]
		plot(x,y,fig,ax,props)



#	props['label'] = '%s'%(
#					 '\n'.join(['%s: %0.3e'%(l,p) 
#					  for l,p in zip(_params,params)]))
#	props['marker'] = '*'
#	props['linestyle'] = '--'
#	props['color'] = colors[i]
#	plot(x,model(x,*params),fig,ax,props)

fig.legend(ncol=2,loc=(0.48,0.15),fontsize=8)
fig.savefig('results.pdf')	

