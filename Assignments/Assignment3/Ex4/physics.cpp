#include "physics.hpp"

namespace PHYS {

// Spin constructor with system size n, temperature T, couplings J, and number of states q
template <class T_sys,class T_state,const int dim>
Spin<T_sys,T_state,dim>::Spin(int n, T_state q, T_sys T, T_sys * J){
	
	this->d = dim;
	this->n = n;
	this->q = q;
	this->T = T;
	this->J = J;

	this->complexity = sizeof(J)/sizeof(*J);
	this->direction = 0;

	this->set();
	
	this->print();

	return;
};



// Destructor
template <class T_sys,class T_state,const int dim>
Spin<T_sys,T_state,dim>::~Spin(){
};


// Set System
template <class T_sys,class T_state,const int dim>
void Spin<T_sys,T_state,dim>::set(){
	
	// Set settings
	this->_set_settings();

	//  Set lattice
	this->_set_lattice();

	// Set State
	this->_set_state();

	// Set observables
	this->_set_observables();


	return;
};

// Set State
template <class T_sys,class T_state,const int dim>
void Spin<T_sys,T_state,dim>::_set_state(){

	this->_set_size();

	this->state.resize(this->size);

	// Set state
	T_state state;
	for(unsigned int i=0;i<this->size;i++){
		state = this->_random_state();
		this->_set_state(i,state);
	};
	return;
};



// Set State
template <class T_sys,class T_state,const int dim>
void Spin<T_sys,T_state,dim>::_set_state(int index, T_state state){
	this->state[index] = state;
	return;
};


// Get State
template <class T_sys,class T_state,const int dim>
T_state Spin<T_sys,T_state,dim>::_get_state(int index){
	return this->state[index];
};


// Generate State
template <class T_sys,class T_state,const int dim>
T_state Spin<T_sys,T_state,dim>::_random_state(T_state nullstate){
	T_state state = _random_state();

	while(state != nullstate){
		state = _random_state();
	};
	return state;
};


// Generate State
template <class T_sys,class T_state,const int dim>
T_state Spin<T_sys,T_state,dim>::_random_state(){
	T_state state = static_cast <T_state> (std::rand());
	state = fmod(state,this->q);
	return state;
};


// Set Lattice
template <class T_sys,class T_state,const int dim>
void Spin<T_sys,T_state,dim>::_set_lattice(){

	//  Set size and coordination number
	this->_set_size();
	this->coordination = 2*dim;

	this->state.resize(this->size);

	// Set nearest neighbours
	int radius = 1;
	int index,axis;
	int shift;
	int indices[dim];
	this->_neighbours.resize(this->size);
	for(int i=0;i<this->size;i++){
		this->_neighbours[i].resize(this->coordination);
		for(int j=0;j<this->coordination;j++){
			index = i;
			this->_indices(index,indices);
			axis = j/2;
			shift = radius*((2*(j%2))-1);
			indices[axis] = (((this->n) + ((indices[axis]+shift)%(this->n))) % (this->n));
			this->_index(index,indices);
			this->_neighbours[i][j] = index;
		};
	};
	return;
};


// Indices (i_{0},...,i_{dim-1}) from linear index (Naive operations)
template <class T_sys,class T_state,const int dim>
void Spin<T_sys,T_state,dim>::_indices(int & z,int * indices){
	int i,j,L;
	for (i=0;i<dim;i++){
		L = 1;
		for (j=i+1;j<dim;j++){
			L *= this->n;
		};
		// std::cout << "sizetot" << i << " " << L << std::endl;
		indices[i] = (z/L)%(this->n);
	};

	return; 
};

// Linear index from Indices (i_{0},...,i_{dim-1})
template <class T_sys,class T_state,const int dim>
void Spin<T_sys,T_state,dim>::_index(int & z,int * indices){
	z = 0;
	int w = 1;
	for (int i=0;i<dim;i++){
		w = 1;
		for (int j=i+1;j<dim;j++){
			w *= this->n;
		}
		z += indices[i]*w;
	}
	return;
};


// Set Size
template <class T_sys,class T_state,const int dim>
void Spin<T_sys,T_state,dim>::_set_size(){
	// Set state
	this->size = 1;
	for(int i=0;i<dim;i++){
		this->size *= this->n;
	};
	return;	
};


// Set observables
template <class T_sys,class T_state,const int dim>
void Spin<T_sys,T_state,dim>::_set_observables(){
	this->observables.energy.push_back(_energy());
	this->observables.magnetization.push_back(_magnetization());
	// this->observables.correlation.push_back(_correlation());
	return;
};


// Set settings
template <class T_sys,class T_state,const int dim>
void Spin<T_sys,T_state,dim>::_set_settings(){
	this->settings.seed = time(NULL);
	// this->settings.seed = 1;

	// Set random seed
	std::srand(this->settings.seed);
	return;
};


// Calculate Interaction
template <class T_sys,class T_state,const int dim>
T_sys Spin<T_sys,T_state,dim>::_interaction(T_state x, T_state y){
	return T_sys(x==y);
};

// Calculate Energy
template <class T_sys,class T_state,const int dim>
T_sys Spin<T_sys,T_state,dim>::_energy(){
	T_sys energy = 0;
	for (int i=0;i<this->size;i++){
		energy += this->J[0]*_interaction(this->state[i],this->direction);
		for (int j=0;j<this->coordination;j++){
			energy += (0.5)*this->J[1]*_interaction(this->state[i],this->state[this->_neighbours[i][j]]);
		};
	};
	return energy;
};

// Calculate Energy at index
template <class T_sys,class T_state,const int dim>
T_sys Spin<T_sys,T_state,dim>::_energy(int index){
	T_sys energy = 0;
	energy += this->J[0]*(this->state[index],this->direction);
	for (int j=0;j<this->coordination;j++){
		energy += (0.5)*this->J[1]*_interaction(this->state[index],this->state[this->_neighbours[index][j]]);
	};
	return energy;
};

// Calculate Magnetization
template <class T_sys,class T_state,const int dim>
T_sys Spin<T_sys,T_state,dim>::_magnetization(){
	T_sys magnetization = 0;
	for (int i=0;i<this->size;i++){
		magnetization += _interaction(this->state[i],this->direction);
	};
	return magnetization;
};


// Calculate Magnetization at index
template <class T_sys,class T_state,const int dim>
T_sys Spin<T_sys,T_state,dim>::_magnetization(int index){
	T_sys magnetization = 0;
	magnetization += _interaction(this->state[index],this->direction);
	return magnetization;
};



// Print State
template <class T_sys,class T_state,const int dim>
void Spin<T_sys,T_state,dim>::print(){
	std::cout << "d = " << this->d << ", ";
	std::cout << "n = " << this->n << ", ";
	std::cout << "T = " << this->T << ", ";
	std::cout << "q = " << this->q << ", ";
	for(int i=0;i<this->complexity;i++){
		std::cout << "J" << i <<" = "<< this->J[i];
		if (i==(this->complexity-1)){
			std::cout << "";
		}
		else{
			std::cout << ", ";			
		};
	};
	std::cout << std::endl;

	std::cout << "energy = " << this->observables.energy.back() << ", ";
	std::cout << "magnetization = " << this->observables.magnetization.back() << ", ";
	std::cout << std::endl;

	// std::cout << "neighbours = "<< std::endl;
	// for(int i=0;i<this->size;i++){
	// 	for(int j=0;j<this->coordination;j++){
	// 		std::cout << this->_neighbours[i][j] << "   ";
	// 	};
	// 	std::cout << std::endl;
	// };

	std::cout << "state = "<< std::endl;
	for(int i=0;i<this->size;i++){
		std::cout << this->state[i] << "   ";
	
		if (((i+1)%this->n) == 0){
			std::cout << std::endl;
		};
	};
	return;
};



template class Spin<double,int,1>;
template class Spin<double,int,2>;
template class Spin<double,int,3>;
template class Spin<double,int,4>;
template class Spin<float,int,1>;
template class Spin<float,int,2>;
template class Spin<float,int,3>;
template class Spin<float,int,4>;
template class Spin<double,double,1>;
template class Spin<double,double,2>;
template class Spin<double,double,3>;
template class Spin<double,double,4>;
template class Spin<float,double,1>;
template class Spin<float,double,2>;
template class Spin<float,double,3>;
template class Spin<float,double,4>;
template class Spin<double,float,1>;
template class Spin<double,float,2>;
template class Spin<double,float,3>;
template class Spin<double,float,4>;
template class Spin<float,float,1>;
template class Spin<float,float,2>;
template class Spin<float,float,3>;
template class Spin<float,float,4>;
};