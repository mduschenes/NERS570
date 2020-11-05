#include <iostream>
#include <exception>
#include "tensor.hpp"

namespace geometry{

// Tensor constructor with shape as array
template <class T,const int dim>
Tensor<T,dim>::Tensor(size_t (&shape)[dim]){

    this->reshape(shape);
    
    return;
};

// Tensor constructor with shape as args
template <class T,const int dim>
Tensor<T,dim>::Tensor(const int d,...){
    va_list args;
    va_start(args, d);
    size_t shape[dim];
    for(int i=0;i<dim;i++){
        shape[i] = va_arg(args, size_t);
    };
    this->reshape(shape);
    return;
};


template <class T,const int dim>
Tensor<T,dim>::~Tensor(){
};


// Indexing operators
template <class T,const int dim>
T& Tensor<T,dim>::operator()(size_t z){
    T & a = this->get(z);
    return a;
}; 

template <class T,const int dim>
T& Tensor<T,dim>::operator()(size_t (&indices)[dim]){
    T & a = this->get(indices);
    return a;
}; 



// Set tensor elements
template <class T,const int dim>
void Tensor<T,dim>::set(size_t (&indices)[dim],T & a){
    size_t z = this->_lorder(indices);
    this->set(z,a);
    return;
};

// Set tensor elements
template <class T,const int dim>
void Tensor<T,dim>::set(size_t z,T & a){
    tensor[z] = a;
    return;
};

// Get tensor elements
template <class T,const int dim>
T & Tensor<T,dim>::get(size_t (&indices)[dim]){
    size_t z = this->_lorder(indices);
    return this->get(z);
};

// Get tensor elements
template <class T,const int dim>
T & Tensor<T,dim>::get(size_t z){
    return tensor[z];
};


// Resize tensor
template <class T,const int dim>
void Tensor<T,dim>::reshape(size_t (&shape)[dim]){
    
    this->_size=1;
    for(int i=0;i<dim;i++){
        this->_shape[i] = shape[i];
        this->_size = this->_size*(shape[i]);
    };
    
    this->tensor.resize(this->_size);

    this->_state = initialized;

    return;
};


// Tensor Size
template <class T,const int dim>
size_t Tensor<T,dim>::size(){
    // Enforced accepted state, throw error otherwise
    if( this->_state == undefined ) {
        throw std::runtime_error("Cannot get size of undefined tensor");
    }
    return this->_size;
};



// Tensor Shape
template <class T,const int dim>
void Tensor<T,dim>::shape(size_t (&shape)[dim]){
    // Enforced accepted state, throw error otherwise
    if( this->_state == undefined ) {
        throw std::runtime_error("Cannot get size of undefined tensor");
    }
      for(int i=0;i<dim;i++){
        shape[i] = this->_shape[i];
    };
    return;
};


// Indices (i_{0},...,i_{dim-1}) from linear index (Naive operations)
template <class T,const int dim>
void Tensor<T,dim>::indices(size_t z,size_t (&indices)[dim]){
    int i,j,L;
    for (i=0;i<dim;i++){
        L = 1;
        for (j=i+1;j<dim;j++){
            L *= this->_shape[j];
        };
        // std::cout << "sizetot" << i << " " << L << std::endl;
        indices[i] = (z/L)%(this->_shape[i]);
    };

    return; 
};


// Get slice of tensor
// template <class T,const int dim>
// void Tensor<T,dim>::slice(Tensor<T,dim-1> Tslice,int i,int axis){

//     for(int i=0;i<vec.size();i++){
//         vec[i] = arr[i][j];
//     };
//     return;
// };



// Linear order of indices (i_{0},...,i_{dim-1}), 
//  with shape(N_{0},...,N_{dim-1})
template <class T,const int dim>
size_t Tensor<T,dim>::_lorder(size_t (&indices)[dim]){

    size_t z = 0;
    int w = 1;
    int i,j;
    for (i=0;i<dim;i++){
        w = 1;
        for (j=i+1;j<dim;j++){
            w *= this->_shape[j];
        }
        z += indices[i]*w;
    }
    return z;

};


// z order of indices (i_{0},...,i_{dim-1}) (Bitwise operations)
template <class T,const int dim>
size_t Tensor<T,dim>::_zorder(size_t (&indices)[dim]){  
    const int zsize=8*sizeof(int);
    int i,j;
    size_t z = 0;
    int x;
    for (i=0;i<zsize;i++){
        for(j=0;j<dim;j++){
            x = (indices[dim-1-j] & (1 << i));
            z |= (x << (i+j));
            };
        };
    return z;
};





template class Tensor<int,1>;
template class Tensor<int,2>;
template class Tensor<int,3>;
template class Tensor<int,4>;
template class Tensor<int,5>;
template class Tensor<int,6>;
template class Tensor<int,7>;
template class Tensor<int,8>;
template class Tensor<int,9>;
template class Tensor<int,10>;
template class Tensor<float,1>;
template class Tensor<float,2>;
template class Tensor<float,3>;
template class Tensor<float,4>;
template class Tensor<float,5>;
template class Tensor<float,6>;
template class Tensor<float,7>;
template class Tensor<float,8>;
template class Tensor<float,9>;
template class Tensor<float,10>;
template class Tensor<double,1>;
template class Tensor<double,2>;
template class Tensor<double,3>;
template class Tensor<double,4>;
template class Tensor<double,5>;
template class Tensor<double,6>;
template class Tensor<double,7>;
template class Tensor<double,8>;
template class Tensor<double,9>;
template class Tensor<double,10>;
};




// int main(){

//     const int dim=2;

//     size_t shape[dim] = {2,3};
//     size_t indices[dim];
    
//     geometry::Tensor<int,dim> T(shape);

//     geometry::Tensor<int,dim> T2(dim,2,3);

//     size_t size = T.size();

//     std::cout << "Size of T " << size << std::endl;

//     size_t size2 = T2.size();

//     std::cout << "Size of T2 " << size2 << std::endl;


//     int a,b;
//     a = 99;
//     for (size_t z=0;z<size;z++){
//         T.indices(z,indices);
//         T.shape(shape);
//         std::cout << "z " << z << std::endl;
//         // for (int i=0;i<dim;i++){
//         //     std::cout << indices[i] <<std::endl;
//         // };
//         // std::cout << std::endl;
//         T.set(indices,a);
//         std::cout << "Set " << indices[0] << " " << indices[1] << " " << a << std::endl;            
//         a += 1;
//         T.get(indices,b);
//         std::cout << "Get " << indices[0] << " " << indices[1] << " " << b << std::endl;            

//     };

// };