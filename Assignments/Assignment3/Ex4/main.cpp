#include <iostream>
#include "physics.hpp"

int main(int argc, char *argv[]){
    int argn = 1;

    int d = 2;
    int n = 5;
    int q = 5;
    float T = 1;
    float J[] = {0.0,-1.0};

    // argn++;if (argc >= argn){d = std::atoi(argv[argn-1]);};
    argn++;if (argc >= argn){n = std::atoi(argv[argn-1]);};
    argn++;if (argc >= argn){q = std::atoi(argv[argn-1]);};
    argn++;if (argc >= argn){T = std::atoi(argv[argn-1]);};
    
    const int dim = 2;
    PHYS::Spin<float,int,dim> spin(n,q,T,J);

    // std::cout << "J = " << spin.J[1] << std::endl;


    return 0;
};  