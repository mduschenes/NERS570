#!/usr/bin/env python

# Python Modules
import os,sys,copy,time,pickle
import numpy as np
import scipy as sp
import matplotlib as mpl
mpl.use('agg')
from matplotlib import pyplot as plt

# Linear Solver Modules
import nelin
import pyamg
from pyamg.aggregation import smoothed_aggregation_solver


def sci(x,decimals=3,texify=True):
	if x in [None]:
		return str(x)
	s = '%.*e'%(decimals,x)
	s = s.split('e')
	s = [s[0],int(s[1].replace('-0','-').replace('+0','').replace('+',''))]
	s = r'%s%s'%(s[0],(r'\cdot10^{%d}'%s[1] if (s[1] != 0) else ''))
	if texify:
		s = r'r$%s$'%(s)
	return s

def plot(x,y,fig,ax,props):
	if x is None:
		x = np.arange(y.shape[0])
	ax.plot(x,y,**props['plot'])
	for prop in props['set']:
		getattr(ax,prop)(**props['set'][prop])
	return


def conditionnumber(A):
	return sp.sparse.linalg.norm(A)*sp.sparse.linalg.norm(sp.sparse.linalg.inv(A))

def eigenvalues(A,key,whichs=['LM']):

	n = A.shape[0]

	eigsolver = lambda A,**kwargs: sp.sparse.linalg.eigs(A,k=1,return_eigenvectors=False,**kwargs)
	
	D,L,U = DLU(A)

	if key == 'Jac':
		B = sp.sparse.linalg.spsolve(D,-(L+U))
	elif key == 'GS':
		B = sp.sparse.linalg.spsolve(D+L,-U)

	sigmas = {'LM':0.9,'SM':0.1}
	stop = False
	eigs = {which:None for which in whichs}
	for ncv in [20,50,100,1000]:
		for maxiter in [100,1000]:
			try:		
				eigs = {which: np.abs(eigsolver(B,which=which,maxiter=maxiter*n,ncv=ncv,sigma=sigmas[which])) for which in whichs}
				stop = True
			except:
				stop = False
			if stop:
				break
		if stop:
			break

	if stop:
		print('Eigs Found with -- maxiter: %d, ncv: %d'%(maxiter,ncv))
	else:
		print('Eigs Not Found with -- maxiter: %d, ncv: %d'%(maxiter,ncv))

	return eigs


def DLU(A):
	options = {'format':'csc'}
	D = sp.sparse.diags(A.diagonal(),**options)
	U = sp.sparse.triu(A,1,**options)
	L = sp.sparse.tril(A,-1,**options)

	return D,L,U


path = 'Ex1.pickle'

# N = [int(i) for i in [1e1,1e2,1e3,1e4]]# [1e2,1e3,1e4]]
N = [int(i) for i in [10,20,30]]# [1e2,1e3,1e4]]
methods = ['Jac','GS']
setups = {'Jac':lambda n,m,A,x0: nelin.solutionvector(m,x0),
		  'GS':lambda n,m,A,x0: nelin.solutionvector(m,x0)
		  }

schemes = {k: getattr(nelin,k) for k in methods}
kwargs = {'Jac':{'tol':1e-9,'maxiter':1000},
		'GS':{'tol':1e-9,'maxiter':1000,'w':1}
		}
Nsizes = len(N)
Nmethods = len(methods)

# Data
matrix = lambda n: pyamg.gallery.poisson((n,), format='csc')
dims = lambda A: A.shape[0]
initial = lambda n: np.sin(np.arange(0,n)/100.0*np.pi*1.0) + np.sin(np.arange(0,n)/100.0*np.pi*6.0)
solution = lambda A,x0: np.zeros(A.shape[0]) 
function = lambda A,x_true: A.dot(x_true)


keys = ['x','solution','error','residual','iterations','spectral_numerical','spectral_analytical','condition_number']


# Data
results = {}
try:
	with open(path,'rb') as fobj:
		results = pickle.load(fobj)
except:
	pass
	results = {k: {m: {n: None for n in N} for m in methods} for k in keys}

for k in keys:
	if results.get(k) is None:
		results[k] = {}
	for m in methods:
		if results[k].get(m) is None:
			results[k][m] = {n: None for n in N}
		results[k][m].update({n:None for n in N if n not in results[k][m]})

for i in range(Nsizes):
	n = N[i]

	A = matrix(n) 
	m = dims(A)
	x0 = initial(n)
	x_true = solution(A,x0)
	b = function(A,x_true)

	print()
	print()

	for method in methods:

		print('Method: %s, Size: %d'%(method,n))


		_keys = ['x']
		if any([results[k][method][n] is None for k in _keys]):
			print('Updating: ',_keys)
			results['x'][method][n] = setups[method](n,m,A,x0)
			schemes[method](A,b,x0=x0,callback=results['x'][method][n].store,**kwargs[method]);

		# Save
		with open(path,'wb') as fobj:
			pickle.dump(results,fobj)

		_keys = ['error','residual']
		if any([results[k][method][n] is None for k in _keys]):
			print('Updating: ',_keys)
			results['error'][method][n],results['residual'][method][n] = results['x'][method][n].getres(A,b) 

		# Save
		with open(path,'wb') as fobj:
			pickle.dump(results,fobj)


		_keys = ['iterations','solution']
		if any([results[k][method][n] is None for k in _keys]):
			print('Updating: ',_keys)
			results['iterations'][method][n],results['solution'][method][n] = results['x'][method][n].getsol() 

		print('Iterations: %d'%(results['iterations'][method][n]))

		# Save
		with open(path,'wb') as fobj:
			pickle.dump(results,fobj)

		_keys = ['spectral_numerical','spectral_analytical','condition_number']
		if any([results[k][method][n] is None for k in _keys]):
		
			results['spectral_numerical'][method][n] = (results['residual'][method][n][-1]/results['residual'][method][n][0])**(1/(len(results['residual'][method][n])+1))
			results['spectral_analytical'][method][n] = eigenvalues(A,method,['LM'])['LM']
			results['condition_number'][method][n] = conditionnumber(A)
	
		print('rho: %0.4e, kappa: %0.4e'%(results['spectral_analytical'][method][n],results['condition_number'][method][n]))

		# Save
		with open(path,'wb') as fobj:
			pickle.dump(results,fobj)

		print()
	print()

# Save
with open(path,'wb') as fobj:
	pickle.dump(results,fobj)

# Plot
plots = ['residual']
Nplots = len(plots)
fig,axes = plt.subplots(Nmethods,Nplots)
fig.set_size_inches(**{'h':20,'w':20})
axes = np.array(axes)
axes = np.atleast_2d(axes)
if axes.shape[0] != Nmethods:
	axes = axes.T
_properties = {'set':{'set_xlabel':{'xlabel':'Iteration'},
 			   		  'set_yscale':{'value':'log'},
 			   		  'set_xscale':{'value':'log'}}}
properties = {N[0]:{'plot':{'color':'r','marker':'o'},
 			   **_properties,
 			   },
			 N[1]:{'plot':{'color':'g','marker':'s'},
 		  	  **_properties,
 		  	  },
			 N[2]:{'plot':{'color':'b','marker':'^'},
 		  	  **_properties,
	 		  },
	 		 **{n:{'plot':{'marker':'+'},
 		  	  **_properties,
	 		  } for n in N[3:]}
		}

for i in range(Nmethods):
	method = methods[i];
	for j in range(Nplots):
		key = plots[j]
		ax = axes[i][j]
		for k in range(Nsizes):
			n = N[k]
			props = properties[n]
			if key == 'error':
				props['set']['set_xlabel'] = {'xlabel':'Grid Index'}
				props['set']['set_ylabel'] = {'ylabel':'Error (Last Iteration)'}
				props['set']['set_yscale'] = {'value':'log'}
				props['set']['set_xscale'] = {'value':'linear'}
				props['plot']['linestyle'] = ''
				y = np.abs(results[key][method][n][-1])

			elif key == 'residual':
				props['set']['set_xlabel'] = {'xlabel':'Iteration'}
				props['set']['set_ylabel'] = {'ylabel':'Residual Norm'}
				props['set']['set_yscale'] = {'value':'log'}
				props['set']['set_xscale'] = {'value':'log'}
				props['plot']['linestyle'] = '--'
				y = results[key][method][n]

			props['set']['set_title'] = {'label':method}
			props['plot']['label'] = r'$%d ~~~ %s ~~~ %s ~~~ %s$'%(n,sci(results['spectral_numerical'][method][n],3,False),
														  sci(results['spectral_analytical'][method][n],3,False),
														  sci(results['condition_number'][method][n],3,False))
			x = None
			# print('Key: %s, Size: %d, Iterations: %d'%(key,N[k],len(y)))
			plot(x,y,fig,ax,props)

			ax.legend(**{'title':r'$~~~N ~~~~~~~~ \rho_{num} ~~~~~~~~ \rho_{anl}~~~~~~~~ \kappa$'})
fig.subplots_adjust(**{'wspace':1,'hspace':1})
fig.savefig('Ex1.pdf')