import time
import numpy as np
import scipy.sparse as sparse
import scipy
import pyamg
from pyamg.aggregation import smoothed_aggregation_solver

A = pyamg.gallery.poisson((100,), format='csr')
ml1 = smoothed_aggregation_solver(A)  
M1 = ml1.aspreconditioner(cycle='V') 

b = np.zeros(A.shape[0])
x0 = np.sin(np.arange(0,100)/100*np.pi*1)*2       

D=A.diagonal()
R=A-scipy.sparse.diags(D)
nL=A.shape[0]
xinit=x0
tmprol=A.dot(x0)-b
nIter=0
maxiter=10000
tol=1e-12



while(np.linalg.norm(tmprol)/A.shape[0]>tol and nIter<maxiter ):
    tmpb=b-R.dot(xinit)
    xinit=tmpb/D
    tmprol=A.dot(xinit)-b
    nIter=nIter+1
    