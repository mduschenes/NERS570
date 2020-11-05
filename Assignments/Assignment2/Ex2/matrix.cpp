#include <iostream>
#include "tensor.hpp"
#include "matrix.hpp"

namespace geometry{

// Matrix constructor
template <class T>
Matrix<T>::Matrix(size_t m,size_t n): Tensor<T,MATRIX_DIM>::Tensor(MATRIX_DIM,m,n){
    this->reshape(m,n);

    return;
};


template <class T>
Matrix<T>::~Matrix(){
};


// Indexing operators
template <class T>
T& Matrix<T>::operator()(size_t i,size_t j){
    T & a = this->get(i,j);
    return a;
}; 


// Set tensor elements
template <class T>
void Matrix<T>::set(size_t i,size_t j,T & a){
    size_t indices[MATRIX_DIM] = {i,j};
    this->set(indices,a);
    return;
};

// Set tensor elements
template <class T>
T & Matrix<T>::get(size_t i,size_t j){
    size_t indices[MATRIX_DIM] = {i,j};
    return this->get(indices);
};


// Reshape tensor
template <class T>
void Matrix<T>::reshape(size_t m,size_t n){
    size_t shape[MATRIX_DIM] = {m,n};
    this->reshape(shape);
    // size_t z;
    // this->matrix.resize(m);
    // for (int i=0;i<m;i++){
    //     this->matrix[i].resize(n);
    //     for(int j=0;j<m;j++){
    //         this->matrix[i][j] = this->get(i,j);
    //     };
    // };
    return;
};



// Matrix Shape
template <class T>
void Matrix<T>::shape(size_t &m,size_t &n){
    // Enforced accepted state, throw error otherwise
    if( this->_state == undefined ) {
        throw std::runtime_error("Cannot get size of undefined tensor");
    }
    m = this->_shape[0];
    n = this->_shape[1];
    return;
};


// Indices (i_{0},...,i_{dim-1}) from linear index (Naive operations)
template <class T>
void Matrix<T>::indices(size_t z,size_t &i, size_t &j){
    size_t indices[MATRIX_DIM];
    this->indices(z,indices);
    i = indices[0];
    j = indices[1];
    return; 
};




// Linear order of indices (i_{0},...,i_{dim-1}), 
//  with shape(N_{0},...,N_{dim-1})
template <class T>
size_t Matrix<T>::_lorder(size_t i,size_t j){
    size_t indices[MATRIX_DIM] = {i,j};
    size_t z;
    z = this->_lorder(indices);
    return z;
};


// z order of indices (i_{0},...,i_{dim-1}) (Bitwise operations)
template <class T>
size_t Matrix<T>::_zorder(size_t i,size_t j){  
    size_t indices[MATRIX_DIM] = {i,j};
    size_t z;
    z = this->_zorder(indices);
    return z;
};


// Matrix Functions

// vector norm
template <class T>
T Matrix<T>::_l2norm(std::vector<T> & vec){
    T norm=0;
    for(int i=0;i<vec.size();i++){
        norm += vec[i]*vec[i];
    };
    norm = std::sqrt(norm);
    return norm;
}

 // Get slice of matrix
template <class T>
void Matrix<T>::_slice(std::vector<std::vector<T>> &arr,int j,int axis,std::vector<T> &vec){
    for(int i=0;i<vec.size();i++){
        if(axis==0){
            vec[i] = arr[j][i];
        }
        else if (axis==1){
            vec[i] = arr[i][j];            
        };
    };
    return;
};

// Add vectors
template <class T>
void Matrix<T>::_add(std::vector<T> &vec1,std::vector<T> &vec2,T alpha,T beta){
    for(int i=0;i<vec1.size();i++){
        vec2[i] = alpha*vec1[i] + beta*vec2[i];
    };
    return;
};

// Multiply arrays
template <class T>
void Matrix<T>::_multiply(std::vector<std::vector<T>> &arr1,std::vector<std::vector<T>> &arr2,std::vector<std::vector<T>> &arr, T alpha){
    for (int k=0;k<arr1.size();k++){
        for(int i=0;i<arr.size();i++){
            for(int j=0;j<arr[i].size();j++){
                    arr[i][j] = arr1[i][k]*arr2[k][j];
            };  
        };
    };
}; 

// Dot product between vectors
template <class T>
T Matrix<T>::_dot (std::vector<T> &vec1,std::vector<T> &vec2){
    T dot = 0;
    for (int i=0;i<vec1.size();i++){
        dot += vec1[i]*vec2[i];
    };
    return dot;
};

// Copy array
template <class T>
void Matrix<T>::_copy(std::vector<std::vector<T>> &arr1,std::vector<std::vector<T>> &arr2){
    for (int i=0;i<arr1.size();i++){
        for(int j=0;j<arr1[i].size();j++){
            arr2[i][j] = arr1[i][j];
        };
    };
};

// Tranpose Array
template <class T>
void Matrix<T>::_transpose(std::vector<std::vector<T>> &arr,std::vector<std::vector<T>> &arrT){
    for (int i=0;i<arr.size();i++){
        for(int j=0;j<arr[i].size();j++){
            arrT[j][i] = arr[i][j];
        };
    };
};


//  Check if arrays are equal
template <class T>
int Matrix<T>::_equal(std::vector<std::vector<T>> &arr1,std::vector<std::vector<T>> &arr2,float tol){
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
void Matrix<T>::_print(std::vector<std::vector<T>> &arr){
    for(int i=0;i<arr.size();i++){
        for(int j=0;j<arr[i].size();j++){
            std::cout << arr[i][j] << "   ";
        };
        std::cout << std::endl;
    }
};


template class Matrix<int>;
template class Matrix<float>;
template class Matrix<double>;

};


