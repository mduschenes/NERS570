#pragma once
#ifndef _QR_
#define _QR_

#include <iostream>
#include <cstddef>
#include <vector> 

namespace qr{

//  Class for QR Algorithm
template <class T>
class QR {


	public:
		//  Constructor and Destructor
		QR();
		~QR();

		// QR Factorization
		void factor(std::vector<std::vector<T>> &A,std::vector<std::vector<T>> &Q,std::vector<std::vector<T>> &R);
		void representation(std::vector<std::vector<T>> &A,std::vector<std::vector<T>> &Q,std::vector<std::vector<T>> &R);

	private:
		// Matrix functions
		T _l2norm(std::vector<T> & vec); // L2 norm
		void _column(std::vector<std::vector<T>> &arr,int j,std::vector<T> &vec); // Get column of matrix
		void _row(std::vector<std::vector<T>> &arr,int i, std::vector<T> &vec); // Get row of matrix
		T _dot (std::vector<T> &vec1,std::vector<T> &vec2); // Get dot product of two vectors
		void _copy(std::vector<std::vector<T>> &arr1,std::vector<std::vector<T>> &arr2); // Copy array
		void _multiply(std::vector<std::vector<T>> &arr1,std::vector<std::vector<T>> &arr2, std::vector<std::vector<T>> &arr, T alpha); // Multiply arrays
		void _add(std::vector<T> &vec1,std::vector<T> &vec2,T alpha,T beta); // Add vectors
		void _transpose(std::vector<std::vector<T>> &arr,std::vector<std::vector<T>> &arrT); // Tranpose array 
		void _print(std::vector<std::vector<T>> &arr); // Print array
		int _equal(std::vector<std::vector<T>> &arr1,std::vector<std::vector<T>> &arr2,float tol); //  Check if arrays are equal
		void _round(std::vector<std::vector<T>> &arr,T tol); // Round array

};
};



#endif
