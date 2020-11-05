#ifndef _TENSOR_
#define _TENSOR_

#include <cstddef>
#include <iostream>
#include <vector>
#include <cstdarg>
#include <cmath>


namespace geometry
{

enum State {undefined,initialized,building,assembled};

// Tensor Class definition
template <class T,const int dim>
class Tensor
{

	public:

		//Constructor for shape as array
		Tensor(size_t (&shape)[dim] );
		//Constructor for shape as args
		Tensor(const int d,...);
		//This is the destructor
		~Tensor();


		// Indexing operators
		T& operator()(size_t z); 
		T& operator()(size_t (&indices)[dim]); 

		// Set tensor values
		void set(size_t (&indices)[dim], T & a);

		// Set tensor values
		void set(size_t z, T & a);
		
		// Get tensor values
		T & get(size_t (&indices)[dim]);

		// Get tensor values
		T & get(size_t z);

		// Reshape tensor
		void reshape(size_t (&shape)[dim]);

		// Get tensor size
		void shape(size_t (&shape)[dim]);

		// Get tensor size
		size_t size();

		// Indices (i_{0},...,i_{dim-1}) from linear index (Naive operations)
		void indices(size_t z,size_t (&indices)[dim]);


	protected:

		// Tensor
		std::vector<T> tensor;

		// Dimension
		const int _dim = dim;

		//  Tensor Size
		size_t _size;

		// Tensor Shape
		size_t _shape[dim];

		// Tensor State
		State _state = undefined;
		
		// z order of indices (i_{0},...,i_{dim-1}) (Bitwise operations)
		size_t _zorder(size_t (&indices)[dim]);

		// Linear order of indices (i_{0},...,i_{dim-1}), 
		//  with shape(N_{0},...,N_{dim-1})
		size_t _lorder(size_t (&indices)[dim]);


};

};
#endif