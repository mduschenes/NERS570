#include <cstdio>
#include <iostream>



template<class T>
void matvec(const int n,const int m,const T * const *A,const T *x, T *y){
	for(unsigned int i=0;i<n;i++){
		for(unsigned int j=0;j<m;j++){
			std::cout << i << " " << j << " :: " << y[i] << " = " << A[i][j] << " * " << x[j] << std::endl;
			y[i] += A[i][j]*x[j];
		}
	};		
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
	const int N=n,M=m;
	float **A = new float*[N];
	for(unsigned int i=0;i<n;i++){
		A[i] = new float[M];
		for(unsigned int j=0;j<m;j++){
			A[i][j] = float(i*m  + j);
		};
	};	
	
	float *x = new float[M],*y = new float[N];
	for(unsigned int i=0;i<m;i++){
		x[i] = float(i);
	};
	for(unsigned int i=0;i<n;i++){
		y[i] = float(0.0);
	};

	matvec<float>(N,M,A,x,y);

	for(unsigned int i=0;i<n;i++){
		std::cout << i << " " << y[i] << std::endl;
	};


	return 0;
};
