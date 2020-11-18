#include <cstdio>
#include <iostream>


#include <immintrin.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>


void matvec(const int n,const int m,const double * A,const double *x, double *y){
	for(unsigned int i=0;i<n;i++){
		for(unsigned int j=0;j<m;j++){
			std::cout << i << " " << j << " :: " << y[i] << " = " << A[i*m+j] << " * " << x[j] << std::endl;
			y[i] += A[i*m +j]*x[j];
		}
	};		
};

void matvec_avx(const int n,const int m, const double* A,const double* x,double* y){
    asm volatile ("# avx code begin");  // looking at assembly with gcc -S
    __m256d xrow = _mm256_loadu_pd(x);
    // __m256d yrow = _mm256_loadu_pd(y);
    
    __m256d a = _mm256_mul_pd(_mm256_loadu_pd(A), xrow);
    __m256d b = _mm256_mul_pd(_mm256_loadu_pd(A+4), xrow);
    __m256d c = _mm256_mul_pd(_mm256_loadu_pd(A+8), xrow);
    __m256d d = _mm256_mul_pd(_mm256_loadu_pd(A+12), xrow);

    // our task now is to get {sum(a), sum(b), sum(c), sum(d)}
    // This is tricky because there is no hadd instruction for avx
    
    // {a[0]+a[1], b[0]+b[1], a[2]+a[3], b[2]+b[3]}
    __m256d sumab = _mm256_hadd_pd(a, b);   

    // {c[0]+c[1], d[0]+d[1], c[2]+c[3], d[2]+d[3]}
    __m256d sumcd = _mm256_hadd_pd(c, d);   

    // {a[0]+a[1], b[0]+b[1], c[2]+c[3], d[2]+d[3]}
    __m256d blend = _mm256_blend_pd(sumab, sumcd, 0b1100);

    // {a[2]+a[3], b[2]+b[3], c[0]+c[1], d[0]+d[1]}
    __m256d perm = _mm256_permute2f128_pd(sumab, sumcd, 0x21);

    // {sum(a), sum(b), sum(c), sum(d)}
    __m256d Ax = _mm256_add_pd(perm, blend);

    _mm_storel_pd(y, _mm256_castpd256_pd128(Ax));
    // _mm_storel_pd(y, Ax);
};

int main(int argc, char** argv){
	//Size of matrix
	int n=0,m=0;
	if( argc >= 2 ){
		n = atoi(argv[1]);
	};
	if( argc >= 3 ){
		m = atoi(argv[2]);
	};
	const int L=n*m,N=n,M=m;
	double A[L];
	int z=0;
	for(unsigned int i=0;i<n;i++){
		for(unsigned int j=0;j<m;j++){
			z = i*m+j;
			A[z] = double(z);
		};
	};	
	
	double x[M],y[N];
	for(unsigned int i=0;i<m;i++){
		x[i] = double(i);
	};
	for(unsigned int i=0;i<n;i++){
		y[i] = double(0.0);
	};

	matvec(N,M,A,x,y);

	for(unsigned int i=0;i<n;i++){
		std::cout << i << " " << y[i] << std::endl;
	};


	return 0;
};
