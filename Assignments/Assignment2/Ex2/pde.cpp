
#include <iostream>
#include <cstddef>
#include <cmath>
#include <vector>

#include "QR.hpp"



template <class T>
T randtype(){
	T r = static_cast <T> (std::rand()) / static_cast <T> (RAND_MAX);
	return r;
};


template <class T>
void printa(const std::vector<std::vector<T>> & arr){
	for(int i=0;i<arr.size();i++){
		for(int j=0;j<arr[i].size();j++){
			std::cout << arr[i][j] << "   ";
		};
		std::cout << std::endl;
	}
	return;
};

template<class T>
void laplacian(const int dim, const size_t n,const std::string scheme){
	
	size_t N = n*n;
	T h = (T) 1/(N-1);
	T _zero = (T)0;

	std::vector<std::vector<T>> A(N,std::vector<T>(N,_zero));
	std::vector<std::vector<T>> Q(N,std::vector<T>(N,_zero));
	std::vector<std::vector<T>> R(N,std::vector<T>(N,_zero));

	if (scheme == "2pt"){
		const int neighbours = 2*dim;
		std::vector<int> offsets{1,-1,(int)-n,(int)n};
		size_t z = 0;
		for(int i=0;i<n;i++){
			for(int j=0;j<n;j++){
				z = j + i*n;
				A[z][z] = (T) -neighbours;
				if(i==0){
					if(j==0){
						A[z][z+1] = (T)1.0;
						A[z][z+n] = (T)1.0;
					}
					else if(j==(n-1)){
						A[z][z-1] = (T)1.0;
						A[z][z+n] = (T)1.0;
					}
					else{
						A[z][z+1] = (T)1.0;
						A[z][z-1] = (T)1.0;
						A[z][z+n] = (T)1.0;
					};			
				}
				else if(i==(n-1)){
					if(j==0){
						A[z][z+1] = (T)1.0;
						A[z][z-n] = (T)1.0;				}
					else if(j==(n-1)){
						A[z][z-1] = (T)1.0;
						A[z][z-n] = (T)1.0;
					}
					else{
						A[z][z+1] = (T)1.0;
						A[z][z-1] = (T)1.0;
						A[z][z-n] = (T)1.0;
					};			
				}
				else{
					if(j==0){
						A[z][z+1] = (T)1.0;
						A[z][z+n] = (T)1.0;
						A[z][z-n] = (T)1.0;
					}
					else if(j==(n-1)){
						A[z][z-1] = (T)1.0;
						A[z][z+n] = (T)1.0;
						A[z][z-n] = (T)1.0;
					}
					else{
						A[z][z+1] = (T)1.0;
						A[z][z-1] = (T)1.0;
						A[z][z+n] = (T)1.0;
						A[z][z-n] = (T)1.0;
					};			
				};
			};
		};

	}
	else {
		size_t z = 0;		
		for(int i=0;i<n;i++){
			for(int j=0;j<n;j++){
				z = j + n*i;
				A[i][j] = randtype<T>();	
				std::cout << i << " " << j << " : " << A[i][j] << std::endl;
			};
		};
	};

	std::cout << "2pt stencil Laplacian matrix in d=2" << std::endl;
	std::cout << "h^2 factor omitted for debugging" << std::endl;
	std::cout << "values < 1e-15 rounded to 0 for debugging" << std::endl;
	std::cout << std::endl;
	qr::QR<T> qr;
	qr.factor(A,Q,R);



	return;
};



int main(int argc, char *argv[]){
	
	size_t n = 4;
	int dim = 2;
	std::string scheme = "2pt";

	if (argc >= 2){
		n = std::atoi(argv[1]);
	};

	if (argc >= 3){
		dim = std::atoi(argv[2]);
	};
	if (argc >= 4){
		scheme = (std::string) argv[3];
	};
	
	laplacian<double>(dim,n,scheme);


	return 0;
};