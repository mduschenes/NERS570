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

U=scipy.sparse.triu(A,1)
L=A-U
D=A.diagonal()
nL=A.shape[0]
xinit=x0
tmprol=A.dot(x0)-b
nIter=0
maxiter=10000
tol=1e-12


w=1.0
while(np.linalg.norm(tmprol)/A.shape[0]>tol and nIter<maxiter ):
    tmpb=b-U.dot(xinit)
    for i in range(nL):
        tmpb[i]=tmpb[i]-A[i,1:i].dot(xinit[1:i])
        xinit[i]=tmpb[i]/D[i]*w+(1-w)*xinit[i]
    tmprol=A.dot(xinit)-b
    nIter=nIter+1    
    print(nIter,np.linalg.norm(tmprol)/A.shape[0])