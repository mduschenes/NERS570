#!/usr/bin/python3

import os,sys,csv,glob,argparse
import numpy as np
import scipy as sp
import scipy.special as sps
import matplotlib as mpl
from matplotlib import pyplot as plt


# Functions
def caps(string):
	return string[0].upper()+string[1:]
def parse(i,line): 
	if i == 0:
		return [caps(str(l).split(' ')[0]) for l in line]
	elif i > 0:
		return [float(l) for l in line]
	else:
		return line

# Arguments
_args=['file','order','basis']
_defaults = ['Ex2/600K/water_prop_10.csv',8,'polynomial']
_types = [str,int,str]


parser = argparse.ArgumentParser(description = "Parse Arguments")
for arg,default,typ in zip(_args,_defaults,_types):
	parser.add_argument('-%s'%arg,default=default,type=typ) 






# Regression

def basis(X,order,basis='polynomial'):
	if basis == 'polynomial':
		return np.reshape(np.power(X[:,None],np.arange(order)),(X.shape[0],-1))

	else:
		return X


def fit(X,y):
	solver = lambda X,y: np.linalg.solve(np.dot(X.T,X),np.dot(X.T,y))
	n,m = X.shape
	if y.ndim == 1:
		n = y.shape
		d = 1
	elif y.ndim == 2:
		n,d = y.shape
	if n<m:
		coef_ = np.zeros((m,d))
		coef_[:n] = solver(X[:,:n],y)
	else:
		coef_ = solver(X,y)
	return coef_

def predict(X,y,coef_=None):
	if coef_ is None:
		coef_ = fit(X,y)
	return np.dot(X,coef_)

def loss(X,y,y_true,coef_=None):
	y_predict = predict(X,y,coef_)
	return y_true-y_predict

def plot(X,y,fig=None,ax=None,props=None):
	if fig is None and ax is None:
		fig,ax = plt.subplots()
	elif ax is None:
		ax = fig.add_subplot()
	else:
		pass
	N = X.shape[0]

	ax.plot(X,y,**props.get('plot',{}))
	
	if props.get('set') is not None:

		ax.set_yscale(props['set'].get('set_yscale'))
		ax.yaxis.offsetText.set_fontsize(props['set'].get('set_offsetText_fontsize'))
		#ax.ticklabel_format(**props['set'].get('set_yticklabel_format'))

		ax.set_xlabel(props['set'].get('set_xlabel'))
		ax.set_ylabel(props['set'].get('set_ylabel'))
		ax.set_title(props['set'].get('set_title'),pad=10)
		fig.suptitle(props['set'].get('set_suptitle'))

	if props.get('legend') is not None:
		ax.legend(**props['legend'])
	if props.get('subplots_adjust') is not None:
		fig.subplots_adjust(**props.get('subplots_adjust'))
	if props.get('savefig') is not None:
		fig.savefig(props['savefig'])
	return	

def derivative(coef_,order):
	n = len(coef_)
	i = np.arange(n)
	f = sps.factorial
	num = f(i)
	den = f(i-order)
	num[i<order] = 0.0
	den[i<order] = 1
	coef_ = coef_*num/den
	return coef_

def model(X,coef_,order):
	return predict(basis(X,order),None,coef_)

def polyroot(coef_,order,bounds=[-np.inf,np.inf],function=np.argmax):

	n = len(coef_)
	m = order
	roots = np.polynomial.polynomial.polyroots(derivative(coef_,m+1))
	print(roots)

	roots  = roots[(roots>=bounds[0]) & (roots<=bounds[1])]

	rootmax = roots[function(predict(basis(roots,n,'polynomial'),None,coef_))]
	return rootmax



def write(path,labels,values,display=False):
	string = '\n\n'.join(['\n'.join(['%s:'%l,*['%0.4e'%(u) for i,u in enumerate(v)]]) for l,v in zip(labels,values)])
	with open(path,'w') as file:
		file.write(string)
	if display:
		print(string)
	return




def process(path,label,fig,axes,savefig=None,options={}):

	defaults = {'order':8,'basis':'polynomial','label':None}
	options.update({k:defaults[k] for k in defaults if k not in options})
	# Data
	data = []

	with open(path,'r') as file:
		obj=csv.reader(file,delimiter=',')
		for i,line in enumerate(obj):
			data.append(parse(i,line))


	header = data[0]
	data = np.array(data[1:])
	
	# Predict
	X = basis(data[:,0],options['order'],options['basis'])
	y = data[:,1:]

	N,p,d = X.shape[0],X.shape[1],y.shape[1]
	coef_ = fit(X,y)
	y_predict = predict(X,y,coef_)


	# Save
	filepath = '%s.%s'%('.'.join(path.split('.')[:-1]),'txt')
	labels = header[1:]
	values = coef_.T

	write(filepath,labels,values,True)
	
	# Plot
	if fig is None:
		fig,axes = plt.subplots(1,d)
	elif axes is None:
		axes = [fig.add_subplot(1,d,i+1) for i in range(d)]

	for i in range(d):
		props = {
			 'plot':{
				'marker':'.',
				'linestyle':'--',
				 'label':'%s'%(label),
				},
			 'set':{
				 'set_xlabel':header[0],
				 'set_title':header[i+1],
				 'set_suptitle':options['label'],
				 'set_yticklabel_format':{'axis':'y','style':'sci','scilimits':(-1,1)},
				 'set_yscale':'log',
				},
			 'legend':{} if i==(d-1) else None,
			 'savefig':savefig,
			 'subplots_adjust': {'wspace':1,'hspace':1},
			}

		ax = axes[i]

		X = data[:,0]
		y = data[:,i]
		props['plot']['marker'] = '.'
		props['plot']['label'] = '%s (data)'%(label)
		if savefig is not None:
			plot(X,y,fig,ax,props)

		X = data[:,0]
		y = y_predict[:,i]
		props['plot']['marker'] = '*'
		props['plot']['label'] = '%s (8th order)'%(label)
		if savefig is not None:
			plot(X,y,fig,ax,props)

		if header[i+1] == 'Viscosity':
			props = {
			 'plot':{
				'marker':'*',
				'linestyle':'--',
				 'label':'%s - true'%(label),
				},
			 'set':{
				 'set_xlabel':header[0],
				 'set_title':header[i+1],
				 'set_suptitle':options['label'],
				 'set_yticklabel_format':{'axis':'y','style':'sci','scilimits':(-1,1)},
				 'set_yscale':'log',
				},
			 'legend':{},
			 'savefig':savefig,
			 'subplots_adjust': {'wspace':1,'hspace':1},
			}

			def derivative(coef,order):
				n = len(coef)
				i = np.arange(n)
				f = sps.factorial
				num = f(i)
				den = f(i-order)
				num[i<order] = 0.0
				den[i<order] = 1
				coef = coef*num/den
				return coef
			
			model = lambda X,order,coef_: predict(basis(X,order),None,coef_)

			coef_model=[7.33e1, 3.785e-1,1.229e-3,2.949e-6,-4.247e-9,3.12e-12,-9.076e-16,0]
			n = len(coef_model)
			m = 2

			# y_true = model(X,len(coef_model),coef_model)
			# y_root = np.polynomial.polynomial.polyroots(derivative(coef_model,m+1))
			#plot(X,y_true,fig,ax,props)	
	return fig,axes

def main():	
	args, unknown = parser.parse_known_args()
	args = vars(args)
	args.update({arg:typ(inp) for arg,inp,typ in zip(_args,sys.argv[1:],_types)})

	print(args)

	# for arg in args:
	# 	print(arg,args[arg])

	# Data
	files = glob.glob(args['file'])
	if len(files)>1:
		root = os.path.commonpath(files)
		files = [os.path.relpath(file,start=root) for file in files]
	else:		
		root = os.path.dirname(files[0])
		files = [os.path.basename(file) for file in files]


	# Process and Plot
	fig = plt.figure()
	axes = None
	args['label'] = root.replace(os.path.sep,' ')
	plotpath=None #os.path.join(root,'%s.%s'%('_'.join(['.'.join(file.split('.')[:-1]) for file in files]),'pdf'))
	for file in files:
		path = os.path.join(root,file)
		label = path.split('.')[-2].split('_')[-1]
		fig,axes = process(path,label,fig,axes,plotpath,args)	


if __name__ == "__main__":



	# y_true = model(X,len(coef_model),coef_model)
	# coef_=[7.33e1, 3.785e-1,1.229e-3,2.949e-6,-4.247e-9,3.12e-12,-9.076e-16,0]
	# m = 2
	# rootmax = polyroot(coef_,m)

	# func = lambda X,coef_=coef_: -predict(basis(np.atleast_1d(X),len(coef_)),None,derivative(coef_,2))
	# import scipy.optimize
	# xmax = sp.optimize.fmin(func,0)
	# print(xmax)

	main()
