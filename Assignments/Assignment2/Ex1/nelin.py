from __future__ import print_function

import time
import numpy as np
import scipy.sparse as sparse
import scipy
import pyamg

__all__ = ['stencil_grid']

class solutionvector:
    def __init__(this,nSize,x0):
      this.maxV=nSize
      this.solution=np.zeros([nSize,nSize])
      this.nIter = 1
      this.resnorm=0
      this.solution[0,:]=x0
    def store(this,x):
      this.nIter=this.nIter+1
      this.solution[this.nIter-1,:]=x
      if(this.nIter>this.maxV*0.75-1):
        tmpV=this.solution   
        this.maxV=this.nIter*2
        this.solution=np.zeros([this.maxV,tmpV.shape[1]])
        this.solution[:this.nIter+1,:]=tmpV[:this.nIter+1,:]
     

      

    
    def getsol(this):
       return this.nIter,this.solution[:min(this.nIter,this.maxV),:]

    def getres(this,A,b):
        this.resnorm=np.zeros(this.nIter)
        this.resv=np.zeros([this.nIter,this.solution.shape[1]])
        for it in range(this.nIter):
            this.resv[it,:]=A.dot(this.solution[it,:])-b
            this.resnorm[it]=np.linalg.norm(this.resv[it,:])
        return this.resv,this.resnorm

def PrintCompare(A,x_0,b,refx,M=None):
    #CG
    nSize=A.shape[0]

    start = time.time()
    scipy.sparse.linalg.cg(A,b,x0=x_0,M=M, tol=1e-10)
    end = time.time()
    cg_sol = solutionvector(nSize,x_0)
    x_cg,info =  scipy.sparse.linalg.cg(A,b,x0=x_0, tol=1e-10,M=M,callback=cg_sol.store)

    t_cg=end - start
    res_cg=np.linalg.norm(x_cg-refx)
    
    #Bicgstab
    start = time.time()
    np.array(scipy.sparse.linalg.bicgstab(A,b,x0=x_0,M=M, tol=1e-10))
    end = time.time()
    bicg_sol = solutionvector(nSize,x_0)
    x_bicg,info =  scipy.sparse.linalg.bicgstab(A,b,x0=x_0, tol=1e-10,M=M,callback=bicg_sol.store)
    t_bicg=end - start
    res_bicg=np.linalg.norm(x_bicg-refx)
    #GMRES

    start = time.time()
    x_gmres,info=scipy.sparse.linalg.gmres(A,b,x0=x_0, tol=1e-10,M=M,restart=nSize,maxiter=nSize)
    end = time.time()
    gmres_sol= solutionvector(nSize,x_0)
    x_gmres,info =  scipy.sparse.linalg.gmres(A,b,x0=x_0, tol=1e-10,M=M,callback=gmres_sol.store,restart=nSize+1,maxiter=nSize*3)
    t_gmres=end - start
    res_gmres=np.linalg.norm(x_gmres-refx)
    
    start = time.time()
    amg_sol= solutionvector(nSize,x_0)    
    ml = pyamg.ruge_stuben_solver(A,max_coarse=10)
    x_amg=ml.solve(b=b,x0=x_0,tol=1e-10,callback=amg_sol.store,accel='gmres')
    end = time.time()
    t_amg=end - start
    res_amg=np.linalg.norm(x_amg-refx)
    print("-----------------------------------")
    print("Summary for Convergence Properties")
    print("-----------------------------------")
    print("Solver   CG     BiCGstab   GMRES    AMG")
    print("Time(s)  {:8.2f} {:8.2f} {:8.2f} {:8.2f}".format(t_cg,t_bicg,t_gmres,t_amg))
    print("Iters    {:8d} {:8d} {:8d} {:8d} ".format(cg_sol.nIter,bicg_sol.nIter,gmres_sol.nIter,amg_sol.nIter))
    print("Residual {:8.0e} {:8.0e} {:8.0e} {:8.0e}".format(res_cg,res_bicg,res_gmres,res_amg))
    
def stencil_grid_1d(S, grid, offset,dtype=None, format=None):


    N_v = grid  # number of vertices in the mesh
    print(S,offset)


    return sparse.diags(S, offset,shape=(N_v, N_v),format=format)



def Jac(A,b,x0,tol=1e-6,maxiter=100,callback=None):
        D=A.diagonal()
        R=A-scipy.sparse.diags(D)
        xinit=x0
        tmprol=A.dot(x0)-b
        nIter=0
        while(np.linalg.norm(tmprol)/A.shape[0]>tol and nIter<maxiter ):
            tmpb=b-R.dot(xinit)
            xinit=tmpb/D
            tmprol=A.dot(xinit)-b
            nIter=nIter+1   
            if(callback!=None):
                callback(xinit)
        return xinit
                
def GS(A,b,x0,tol=1e-6,maxiter=100,w=1,callback=None):
    U=scipy.sparse.triu(A,1)
    L=A-U
    nL=A.shape[0]
    xinit=x0
    tmprol=A.dot(x0)-b
    nIter=0
    D=A.diagonal()
    while(np.linalg.norm(tmprol)/A.shape[0]>tol and nIter<maxiter ):
        tmpb=b-U.dot(xinit)
        for i in range(nL):
            tmpb[i]=tmpb[i]-A[i,0:i].dot(xinit[0:i])
            xinit[i]=tmpb[i]/D[i]*w+(1-w)*xinit[i]
        tmprol=A.dot(xinit)-b
        nIter=nIter+1    
        if(callback!=None):
            callback(xinit)
    return xinit