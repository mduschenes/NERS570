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


class model_wrapper(object):
	def __init__(self,**kwargs):
		for k in kwargs:
			setattr(self,k,kwargs[k])
		return
	def __call__(self,func):
		def wrapper(*args,**kwargs):
			return func(*args,**kwargs,data=self.data)
		return wrapper


@model_wrapper(data=data)
def model(x,*params,data=data):
	if params == []:
		params = [0]
	return 2*((np.sqrt(data['condition']['cg_none'].values)-1)/(np.sqrt(data['condition']['cg_none'].values)+1))^(x/params[0])




# Figure
labels = ['cg','gmres','condition']
booleans={**{l: (lambda l,label,key: label in l) for l in ['cg','gmres']},
		  **{l: (lambda l,label,key: (label=='condition') & (l=='cg_none') & (key=='iterations')) for l in ['condition']},
		 }
get_labels = lambda df,label,key,boolean: [l for l in df.columns if boolean(l,label,key)]
models = {l:l in ['condition'] for l in labels}

# labels = ['nocondition']
# get_labels = lambda df,string: df.columns

# for l in labels:
# 	for k in keys:
# 		print('key',k)
# 		print(data[k][get_labels(data[k],l,k,booleans[l])])
# 		print()

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

		# print('LABELS',l,key,df.columns)#get_labels(df,l,key,booleans[l]))
		for label in get_labels(df,l,key,booleans[l]):
			y = df[label].values
			_slice = slice(0,None)
			x,y = x[_slice],y[_slice]


			# Plot
			props=_props(**{'set_ylabel':key})
			props['label'] = '%s'%(label)
			props['marker'] = 'o'
			props['linestyle'] = '-'
			props['alpha'] = 0.7
			#props['color'] = colors[i]
			# print(key,x)
			plot(x,y,fig,ax,props)

			if i==(N-1):
				ax.legend(ncol=2,fontsize=4.5)
			
	 
	#fig.legend(ncol=2,loc=(0.48,0.15),fontsize=8)
	fig.savefig('results_%s.%s'%(l,'pdf'))	







# Modelling
label='cg_none'

w = data['condition'][label].values.astype(float)
x = data['iterations'][label].values.astype(int)
y = data['error'][label].values.astype(float)
v = data['error'].index.values.astype(int)



y_predict = lambda x,*params,w=w: (params[1]*(2*(((np.power(w,2)-1)/(np.power(w,2)+1))**(x*params[0]))))

_fig,_ax = plt.subplots()

# Fit
_params = ['a','b']
params = [1.0,1.0]
# fit(x,y,y_predict,params)



props = {'set_xlabel':'Size','set_ylabel':'Error','set_title':'Condition Number Dependence',
			 'set_xscale':'log','set_yscale':'log',}


props['marker'] = 'o'
props['linestyle'] = '-'
props['color'] = 'b'
props['label'] = 'Error'

plot(v,y,_fig,_ax,props)

props['marker'] = ''
props['linestyle'] = '--'
props['color'] = 'r'
# props['label'] = '%s'%('\n'.join(['%s: %0.3e'%(l,p) for l,p in zip(_params,params)]))
props['label'] = r'$2(\frac{\sqrt{\kappa}-1}{\sqrt{\kappa}+1})^{Iterations(size)}$'

plot(v,y_predict(x,*params),_fig,_ax,props)



_ax_ = _ax.twinx()
props = {'set_ylabel':'Condition Number','set_title':'Condition Number Dependence',
			 'set_xscale':'log','set_yscale':'log',}


props['marker'] = '^'
props['linestyle'] = '-'
props['color'] = 'g'
props['label'] = r'$\kappa$'

plot(v,w,_fig,_ax_,props)


_fig.legend(loc=[0.57,0.13])
_fig.savefig('results_fittedmodel.pdf')