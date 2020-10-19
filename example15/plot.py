#!/usr/bin/env python

import os,sys,glob
import numpy as np
import scipy as sp
import pandas as pd
import scipy.optimize
import matplotlib.pyplot as plt

def plot(x,y,fig,ax,props):
	ax.plot(x,y,**{k: props.pop(k) for k in ['label','marker','linestyle','color','alpha'] if k in props})
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

def preprocess(df,functions):
	for func in functions:
		df = df.applymap(func)
		df.index = df.index.map(func)
		print(df.index)
	return df

# Arguments
paths=['*.csv']
if len(sys.argv[1:]):
	paths = sys.argv[1:]
files=[f for path in paths for f in glob.glob(path)]
keys = ['.'.join(f.split('.')[:-1]).split('_')[0] for f in files]

functions = {'time':[lambda x: ((60*int(str(x).split(':')[0])+float(str(x).split(':')[1])) if ':' in str(x) else int(x))]}

N = len(keys)

data = {}
for k,f in zip(keys,files):
	data[k] = importer(f)
	data[k] = preprocess(data[k],functions.get(k,[]))

	print(k)
	print(data[k])
	print()




# Figure
# labels = ['cg','gmres']
# get_labels = lambda df,string,boolean=lambda string,label: string in label: [label for label in df.columns if boolean(string,label)]

labels = ['nocondition']
get_labels = lambda df,string: df.columns

for l in labels:
	fig,axes = plt.subplots(N,1)

	_props = lambda **kwargs: {'set_xlabel':'n','set_ylabel':'%s'%(kwargs['set_ylabel']),'set_title':None,
			 'set_xscale':'linear','set_yscale':'log', **kwargs}
	colors = ['r','g','b','m','y']

	# Process

	for i in range(N):
		key = keys[i]
		df = data[key]
		ax = axes[i]
		
		x = df.index.values


		for label in get_labels(df,l):
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
			props['alpha'] = 0.7
			#props['color'] = colors[i]
			print(key,x)
			plot(x,y,fig,ax,props)

			if i==(N-1):
				ax.legend(ncol=2,fontsize=4.5)
			

	#	props['label'] = '%s'%(
	#					 '\n'.join(['%s: %0.3e'%(l,p) 
	#					  for l,p in zip(_params,params)]))
	#	props['marker'] = '*'
	#	props['linestyle'] = '--'
	#	props['color'] = colors[i]
	#	plot(x,model(x,*params),fig,ax,props)
	 
	#fig.legend(ncol=2,loc=(0.48,0.15),fontsize=8)
	fig.savefig('results_%s.%s'%(l,'pdf'))	

