#include <iostream>
#include "matrix.hpp"

int main(){

    size_t m=3;
    size_t n=2;
    
    geometry::Matrix<int> A(m,n);

    size_t size = A.size();

    std::cout << "Size of A " << size << std::endl;


    std::cout << "Matrix of A " << A(0) << std::endl;

    int a,b;
    size_t i,j;
    a = 99;
    for (size_t z=0;z<size;z++){
        A.indices(z,i,j);
        std::cout << "z " << z << std::endl;
        // for (int i=0;i<dim;i++){
        //     std::cout << indices[i] <<std::endl;
        // };
        // std::cout << std::endl;
        A.set(i,j,a);
        std::cout << "Set " << i << " " << j << " " << a << std::endl;            
        a += 1;
        b = A.get(i,j);
        std::cout << "Get " << i << " " << j << " " << b << std::endl;            


    };
    std::cout << "Matrix of A " << A(0) << std::endl;

    A(1) = 1;
    std::cout << "Matrix of A " << A(0,1) << std::endl;


};