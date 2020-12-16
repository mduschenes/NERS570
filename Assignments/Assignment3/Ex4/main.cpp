#include <iostream>
#include "physics.hpp"
#include "io.hpp"

const int set_dim(int d){
    return d;

}

int main(int argc, char *argv[]){
    int argn = 1;

    const int dim = 2;

    int d = 2;
    int n = 5;
    int q = 2;
    float T = 1;
    float J[] = {0.0,-1.0};

    // argn++;if (argc >= argn){d = std::atoi(argv[argn-1]);};
    argn++;if (argc >= argn){n = std::atoi(argv[argn-1]);};
    argn++;if (argc >= argn){q = std::atoi(argv[argn-1]);};
    argn++;if (argc >= argn){T = std::atof(argv[argn-1]);};
    argn++;if (argc >= argn){J[0] = std::atof(argv[argn-1]);};
    argn++;if (argc >= argn){J[1] = std::atof(argv[argn-1]);};
    

    PHYS::Spin<float,int,dim> spin(n,q,T,J);
    
    spin.settings.num_threads = 1;
    spin.settings.stop = 1e-6;
    spin.montecarlo();
    spin.write();

    return 0;
};  
