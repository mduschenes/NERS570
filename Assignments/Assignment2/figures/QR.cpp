#include <iostream>
#include <cstddef>
#include <cmath>
#include <vector>

#include "QR.hpp"

namespace qr{

// Constructor and Destructor
template <class T>
QR<T>::QR(){
};


template <class T>
QR<T>::~QR(){
};

// Matrix Functions
template <class T>
T QR<T>::_l2norm(std::vector<T> & vec){
	T norm=0;
	for(int i=0;i<vec.size();i++){
		norm += vec[i]*vec[i];
	};
	norm = std::sqrt(norm);
	return norm;
}

 // Get column of matrix
template <class T>
void QR<T>::_column(std::vector<std::vector<T>> &arr,int j,std::vector<T> &vec){
	for(int i=0;i<vec.size();i++){
		vec[i] = arr[i][j];
	};
	return;
};

// Get row of matrix
template <class T>
void QR<T>::_row(std::vector<std::vector<T>> &arr,int i,std::vector<T> &vec){
	for(int j=0;j<vec.size();j++){
		vec[j] = arr[i][j];
	};
	return;
};

// Add vectors
template <class T>
void QR<T>::_add(std::vector<T> &vec1,std::vector<T> &vec2,T alpha,T beta){
	for(int i=0;i<vec1.size();i++){
		vec2[i] = alpha*vec1[i] + beta*vec2[i];
	};
	return;
};

// Multiply arrays
template <class T>
void QR<T>::_multiply(std::vector<std::vector<T>> &arr1,std::vector<std::vector<T>> &arr2,std::vector<std::vector<T>> &arr, T alpha){
	for (int k=0;k<arr2.size();k++){
		for(int i=0;i<arr.size();i++){
			for(int j=0;j<arr[i].size();j++){
					arr[i][j] += arr1[i][k]*arr2[k][j];
			};	
		};
	};
}; 

// Dot product between vectors
template <class T>
T QR<T>::_dot (std::vector<T> &vec1,std::vector<T> &vec2){
	T dot = 0;
	for (int i=0;i<vec1.size();i++){
		dot += vec1[i]*vec2[i];
	};
	return dot;
};

// Copy array
template <class T>
void QR<T>::_copy(std::vector<std::vector<T>> &arr1,std::vector<std::vector<T>> &arr2){
	for (int i=0;i<arr1.size();i++){
		for(int j=0;j<arr1[i].size();j++){
			arr2[i][j] = arr1[i][j];
		};
	};
};

// round array
template <class T>
void QR<T>::_round(std::vector<std::vector<T>> &arr,T tol){
	for (int i=0;i<arr.size();i++){
		for(int j=0;j<arr[i].size();j++){
			if (std::abs(arr[i][j])<tol){
				arr[i][j] = (T)0;
			};
		};
	};
};

// Tranpose Array
template <class T>
void QR<T>::_transpose(std::vector<std::vector<T>> &arr,std::vector<std::vector<T>> &arrT){
	for (int i=0;i<arr.size();i++){
		for(int j=0;j<arr[i].size();j++){
			arrT[j][i] = arr[i][j];
		};
	};
};


//  Check if arrays are equal
template <class T>
int QR<T>::_equal(std::vector<std::vector<T>> &arr1,std::vector<std::vector<T>> &arr2,float tol){
	int check = 1;
	for (int i=0;i<arr1.size();i++){
		for(int j=0;j<arr1[i].size();j++){
			if (std::abs(arr1[i][j] - arr2[i][j])>tol){
				check = 0;
				break;
			};
		};
		if (check == 0){
			break;
		};
	}; 

	return check;
};


template <class T>
void QR<T>::_print(std::vector<std::vector<T>> &arr){
	for(int i=0;i<arr.size();i++){
		for(int j=0;j<arr[i].size();j++){
			std::cout << arr[i][j] << "   ";
		};
		std::cout << std::endl;
	}
};



// QR representation
template <class T>
void QR<T>::representation(std::vector<std::vector<T>> &A,std::vector<std::vector<T>> &Q,std::vector<std::vector<T>> &R){
	T alpha = (T)1.0;
	this->_multiply(Q,R,A,alpha);
};





// QR Factorization
template <class T>
void QR<T>::factor(std::vector<std::vector<T>> &A,std::vector<std::vector<T>> &Q,std::vector<std::vector<T>> &R){
	size_t m = A.size();
	size_t n = A[0].size();
	T _default = (T)0;
	T tol = (T) 1e-15;

	std::vector<std::vector<T>> V(n,std::vector<T>(m,_default));
	std::vector<std::vector<T>> QT(n,std::vector<T>(m,_default));
	std::vector<std::vector<T>> Aqr(n,std::vector<T>(n,_default));

	this->_transpose(A,V);
	this->_copy(V,QT);


	std::cout << "A" << std::endl;
	this->_print(A);
	std::cout << std::endl;

	for(int i=0;i<n;i++){
		R[i][i] = this->_l2norm(V[i]);
		this->_add(V[i],QT[i],1/R[i][i],(T)0);
		for(int j=i+1;j<n;j++){
			R[i][j] = this->_dot(QT[i],V[j]);
			this->_add(QT[i],V[j],-R[i][j],(T)1);
		};
	};

	this->_transpose(QT,Q);
	this->representation(Aqr,Q,R);
	this->_round(Aqr,tol);

	std::cout << "QR Factorization" << std::endl;

	std::cout << "R" << std::endl;
	this->_print(R);
	std::cout << std::endl;
	std::cout << std::endl;

	std::cout << "Q" << std::endl;
	this->_print(Q);
	std::cout << std::endl;
	std::cout << std::endl;


	std::cout << "Q orthornomality" << std::endl;
	for(int i=0;i<n;i++){
		for(int j=i;j<n;j++){
			std::cout << "q" << i << " * " << "q" << j << " = " << this->_dot(QT[i],QT[j]) << std::endl;
			std::cout << std::endl;
		};
		std::cout << std::endl;
	};
	std::cout << std::endl;



	std::cout << "Aqr = QR" << std::endl;
	this->_print(Aqr);
	std::cout << std::endl;
	std::cout << std::endl;


	int check = this->_equal(A,Aqr,tol);
	std::string message;
	if (check == 1){
		this->_copy(Aqr,A);
		message = "PASSED - QR Factorization Correct";
	}
	else{
		message = "ERROR - QR Factorization Incorrect";
	};
	std::cout << message << std::endl;
};




template class QR<int>;
template class QR<float>;
template class QR<double>;


};