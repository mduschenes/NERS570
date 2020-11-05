#ifndef _MATRIX_
#define _MATRIX_

#include <cstddef>
#include <iostream>
#include <vector>  //for std::vector
#include "tensor.hpp"

namespace geometry {

const int MATRIX_DIM = 2;

// Matrix Class definition
template <class T>
class Matrix : public Tensor<T,MATRIX_DIM>
{

	public:


		//This is the constructor
		Matrix(size_t m,size_t n);
		//This is the destructor
		~Matrix();

		// Indexing operators
		T& operator()(size_t i,size_t j); 
		using Tensor<T,MATRIX_DIM>::operator();

		// Set Matrix values
		void set(size_t i, size_t j, T & a);
		using Tensor<T,MATRIX_DIM>::set;
		
		// Get Matrix values
		T & get(size_t i, size_t j);
		using Tensor<T,MATRIX_DIM>::get;

		// Reshape Matrix
		void reshape(size_t m, size_t n);
		using Tensor<T,MATRIX_DIM>::reshape;

		// Get Matrix size
		void shape(size_t &m,size_t &n);
		using Tensor<T,MATRIX_DIM>::shape;

		// Indices (i_{0},...,i_{dim-1}) from linear index (Naive operations)
		void indices(size_t z,size_t &i, size_t &j);
		using Tensor<T,MATRIX_DIM>::indices;

		// Matrix 
		std::vector<std::vector<T>> matrix;

	protected:



		// Dimension
		const int _dim = MATRIX_DIM;

		// z order of indices (i_{0},...,i_{dim-1}) (Bitwise operations)
		size_t _zorder(size_t i,size_t j);
		using Tensor<T,MATRIX_DIM>::_zorder;

		// Linear order of indices (i_{0},...,i_{dim-1}), 
		//  with shape(N_{0},...,N_{dim-1})
		size_t _lorder(size_t i,size_t j);
		using Tensor<T,MATRIX_DIM>::_lorder;

		// Matrix functions
		T _l2norm(std::vector<T> & vec); // L2 norm
		void _slice(std::vector<std::vector<T>> &arr,int j,int axis,std::vector<T> &vec); // Get column of matrix
		T _dot (std::vector<T> &vec1,std::vector<T> &vec2); // Get dot product of two vectors
		void _copy(std::vector<std::vector<T>> &arr1,std::vector<std::vector<T>> &arr2); // Copy array
		void _multiply(std::vector<std::vector<T>> &arr1,std::vector<std::vector<T>> &arr2, std::vector<std::vector<T>> &arr, T alpha); // Multiply arrays
		void _add(std::vector<T> &vec1,std::vector<T> &vec2,T alpha,T beta); // Add vectors
		void _transpose(std::vector<std::vector<T>> &arr,std::vector<std::vector<T>> &arrT); // Tranpose array 
		void _print(std::vector<std::vector<T>> &arr); // Print array
		int _equal(std::vector<std::vector<T>> &arr1,std::vector<std::vector<T>> &arr2,float tol); //  Check if arrays are equal


};
}; 
#endif

