#include <cstdio>
#include <iostream>



void dgemm( char transa, char transb,
              unsigned int m, unsigned int n, unsigned int k, 
              double alpha, const double * const * a,
              const double * const * b,
              double beta, double **c)
{
    //This function should perform the following operation:
    //C = alpha*A*B + beta*C

    /*
     Simplifying assumptions
        * Assume that matrices a, b, and c are all square (m == n == k)
          This also means lda == ldb == ldc == n
        * Ignore transa and transb for this exercise. Just pass in 'n'
          for these arguments.
        * You do not need to perform multiplication by alpha or beta.
          You may assume these are 1 and 0, respectively.

     Inputs:
      transa = assume 'n'
      transb = assume 'n'
           m = # rows of a and c
           n = # columns in b and c
           k = # columns of a and rows of b
       alpha = assume 1.0
           a = the matrix A
         lda = leading dimension of A
           b = the matrix B
         ldb = leading dimension of B
           c = the matrix C
         ldc = leading dimension of C

     Output:
      An updated matrix c
    */

    //Write your naive matrix multiply here
    for(unsigned int i=0; i<n; i++){
    	for(unsigned int j=0; j<m; j++){
		c[i][j] *= beta;
		}
	};
    for(unsigned int l=0; l<k; l++){
       	for(unsigned int j=0; j<m; j++){
    		for(unsigned int i=0; i<n; i++){
	             c[i][j] += alpha*a[i][l]*b[l][j];
			}
		}
	};

  
}


