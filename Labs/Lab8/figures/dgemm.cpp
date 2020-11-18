#include <cstdio>
#include <iostream>



void dgemm( char transa, char transb,
              unsigned int m, unsigned int n, unsigned int k, 
              double alpha, const double * const * a,
              const double * const * b,
              double beta, double **c)
{
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


