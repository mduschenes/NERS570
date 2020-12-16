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

    // std::string path = "./testdata.csv";
    // std::vector<std::string> header = {"spin1","spin2"};
    // std::vector<std::vector<int>> data;
    // data.push_back(spin.state);

    // for (int i=0;i<data.size();i++){
    //     for (int j=0;j<data[i].size();j++){
    //         std::printf("%d ",data[i][j]);
    //     };
    //     printf("\n");
    // };

    // spin.update();
    // data.push_back(spin.state);

    // IO::io<int> obj;
    // obj.write(path,header,data);

    // header.clear();
    // data.clear();
    // obj.read(path,header,data);

    // for (int i=0;i<data.size();i++){
    //     for (int j=0;j<data[i].size();j++){
    //         std::printf("%d ",data[i][j]);
    //     };
    //     printf("\n");
    // };

    // IO::io<float> objf;
    // header.clear();
    // std::vector<std::vector<float>> dataf;
    // objf.read(spin.settings.path,header,dataf);

    // for (int i=0;i<dataf.size();i++){
    //     for (int j=0;j<dataf[i].size();j++){
    //         std::printf("%f\n",dataf[i][j]);
    //     };
    // };

    // std::string pathnew = "./new.csv";
    // header.clear();    
    // objf.write(pathnew,header,dataf);

    return 0;
};  