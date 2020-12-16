#include "physics.hpp"

namespace PHYS {

// Spin constructor with system size n, temperature T, couplings J, and number of states q
template <class T_sys,class T_state,const int dim>
Spin<T_sys,T_state,dim>::Spin(int n, T_state q, T_sys T, T_sys * J){
	

	// Set state
	this->set(n,q,T,J);

	// Update
	this->montecarlo();

	// Write Observables
	this->write();

	// // Print Observables
	// this->print();


	return;
};



// Destructor
template <class T_sys,class T_state,const int dim>
Spin<T_sys,T_state,dim>::~Spin(){
};


// Set System
template <class T_sys,class T_state,const int dim>
void Spin<T_sys,T_state,dim>::set(int n, T_state q, T_sys T, T_sys * J){
	
	// Set settings
	this->_set_settings();

	// Set System
	this->_set_system(n,q,T,J);

	//  Set lattice
	this->_set_lattice();

	// Set State
	this->_set_state();


	return;
};



// Update State
template <class T_sys,class T_state,const int dim>
void Spin<T_sys,T_state,dim>::update(){
	this->_propose();	
	return;
};

// Calculate MonteCarlo averages
template <class T_sys,class T_state,const int dim>
void Spin<T_sys,T_state,dim>::calculate(){
	this->settings.iteration++;
	this->_set_observables();
	this->_set_observables_stats();
};

// Perform Monte Carlo (Metropolis Algorithm)
template <class T_sys,class T_state,const int dim>
void Spin<T_sys,T_state,dim>::montecarlo(){
	#pragma omp parallel for default(private) shared(this->state)
	for (int i=0;i<this->settings.iterations;i++){
		
		// Update state
		this->update();


		if (i>this->settings.burnin){
			// Set observables
			this->calculate();
			// printf("Correlation = %f\n",this->observables.energy_var.back());
			// Print Observables
			this->print();


			// Stopping conditions
			if (this->_stop() == 1){
				std::cout << "Stopping at "<< i <<std::endl;
				break;
			};
		};		
	};
};


// Write system
template <class T_sys,class T_state,const int dim>
void Spin<T_sys,T_state,dim>::write(){
	std::vector<std::string> header;
	std::vector<std::vector<T_sys>> data;
	
	std::string path = this->settings.path;

	std::string file = path.substr(0,path.find_last_of("."));
	std::string ext = path.substr(path.find_last_of(".")+1);


	path = file + \
		"_d" + std::to_string(this->system.d) + \
		"_n" + std::to_string(this->system.n) + \
		"_q" + std::to_string(this->system.q) + \
		"_T" + std::to_string(this->system.T) + \
		"_J" + std::to_string(this->system.J[1]) + \
		"." + ext;

	header.push_back("energy");
	data.push_back(this->observables.energy);

	header.push_back("energy_mean");
	data.push_back(this->observables.energy_mean);

	header.push_back("energy_var");
	data.push_back(this->observables.energy_var);

	header.push_back("order");
	data.push_back(this->observables.order);

	header.push_back("order_mean");
	data.push_back(this->observables.order_mean);

	header.push_back("order_var");
	data.push_back(this->observables.order_var);

	IO::io<T_sys> obj;
	obj.write(path,header,data);

};


// Set system
template <class T_sys,class T_state,const int dim>
void Spin<T_sys,T_state,dim>::_set_system(int n, T_state q, T_sys T, T_sys * J){


	this->system.d = dim;
	this->system.n = n;
	this->system.q = q;
	this->system.T = T;
	this->system.J = J;

	this->system.direction = 0;
	this->system.complexity = sizeof(this->system.J)/sizeof(*this->system.J);
	this->system.size = 1;
	for(int i=0;i<this->system.d;i++){
		this->system.size *= this->system.n;
	};
	this->system.coordination = 2*this->system.d;	

	return;
};

// Set settings
template <class T_sys,class T_state,const int dim>
void Spin<T_sys,T_state,dim>::_set_settings(){
	this->settings.seed = time(NULL);
	this->settings.num_threads = 4;
	this->settings.iteration = 0;
	this->settings.iterations = 10000;
	this->settings.burnin = this->settings.iterations/30;
	this->settings.stop = 1e-3;
	this->settings.verbose = 0;
	this->settings.read = 1;
	this->settings.write = 1;
	this->settings.path = "./data.csv";


	// Set random seed
	std::srand(this->settings.seed);

	// Set number of OpenMP threads
	omp_set_num_threads(this->settings.num_threads);

	return;
};


// Set observables
template <class T_sys,class T_state,const int dim>
void Spin<T_sys,T_state,dim>::_set_observables(){
	this->observables.energy.push_back(_energy());
	this->observables.order.push_back(_order());
	return;
};


// Set observables statistics
template <class T_sys,class T_state,const int dim>
void Spin<T_sys,T_state,dim>::_set_observables_stats(){
	T_sys value;

	_average(value,this->observables.energy,this->observables.energy.size());
	this->observables.energy_mean.push_back(value);
	_variance(value,this->observables.energy,this->observables.energy.size());	
	this->observables.energy_var.push_back(value/(this->system.T*this->system.T));


	_average(value,this->observables.order,this->observables.order.size());
	this->observables.order_mean.push_back(value);
	_variance(value,this->observables.order,this->observables.order.size());	
	this->observables.order_var.push_back(value/(this->system.T));

	return;
};


// Propose Update State
template <class T_sys,class T_state,const int dim>
void Spin<T_sys,T_state,dim>::_propose(){
	int index = this->_random_index();
	T_sys delta = -_energy(index)+0.0;
	T_state state = this->state[index];

	this->_update(index,this->_random_state(this->state[index]));
	
	delta += _energy(index)+0.0;

	// std::cout << "Proposing "<< index << ": " << state << " ---> " << this->state[index] << std::endl;

	if (this->_transition(delta)==0){
		this->_update(index,state);
		// std::cout << "Holding "<< index << ": " << state << " ---> " << this->state[index] << std::endl;
	}
	else{

		// std::cout << "Updating "<< index << ": " << state << " ---> " << this->state[index] << std::endl;
	};

	return;
};

// Transition probability
template <class T_sys,class T_state,const int dim>
int Spin<T_sys,T_state,dim>::_transition(T_sys delta){
	T_sys random = 	T_sys(std::rand())/RAND_MAX;
	// std::cout << "transition = "<< delta/this->system.T << " exp " << std::exp(-delta/this->system.T)<< "rand " << random << " --- "<<((1.0/(1.0+std::exp(delta/this->system.T)))) << std::endl;
	return ((delta<=0) | std::exp(-delta/this->system.T) > random);
	// return ((1.0/(1+std::exp(delta/this->system.T))) >= 0.5);
};


// Stopping condition
template <class T_sys,class T_state,const int dim>
int Spin<T_sys,T_state,dim>::_stop(){

	T_sys var = 0;
	int i = this->settings.iterations/100;
	if (this->settings.iteration< 20*i){
		return 0;
	};
	for (int j=this->settings.iteration-i;j<this->settings.iteration;j++){
		var += this->observables.energy_var[j];
	};
	var /=i;
	var = std::abs(var);
	// std::cout << "Rolling var ("<<i<<") : " << var << "  with tol "<< this->settings.stop <<std::endl;
	return (var<this->settings.stop);
};


// Set State
template <class T_sys,class T_state,const int dim>
void Spin<T_sys,T_state,dim>::_set_state(){

	this->state.resize(this->system.size);

	// Set state
	T_state state;
	for(unsigned int i=0;i<this->system.size;i++){
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

	while(state == nullstate){
		state = _random_state();
	};
	return state;
};


// Generate State
template <class T_sys,class T_state,const int dim>
T_state Spin<T_sys,T_state,dim>::_random_state(){
	T_state state = static_cast <T_state> (std::rand());
	state = fmod(state,this->system.q);
	return state;
};


// Generate Index
template <class T_sys,class T_state,const int dim>
int Spin<T_sys,T_state,dim>::_random_index(){
	int index = fmod(std::rand(),this->system.size);
	return index;
};


// Update State
template <class T_sys,class T_state,const int dim>
void Spin<T_sys,T_state,dim>::_update(int index,T_state state){
	this->state[index] = state;
	return;
};


// Set Lattice
template <class T_sys,class T_state,const int dim>
void Spin<T_sys,T_state,dim>::_set_lattice(){

	// Set nearest neighbours
	int radius = 1;
	int index,axis;
	int shift;
	int indices[dim];
	this->_neighbours.resize(this->system.size);
	for(int i=0;i<this->system.size;i++){
		this->_neighbours[i].resize(this->system.coordination);
		for(int j=0;j<this->system.coordination;j++){
			index = i;
			this->_indices(index,indices);
			axis = j/2;
			shift = radius*((2*(j%2))-1);
			indices[axis] = (((this->system.n) + ((indices[axis]+shift)%(this->system.n))) % (this->system.n));
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
			L *= this->system.n;
		};
		indices[i] = (z/L)%(this->system.n);
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
			w *= this->system.n;
		}
		z += indices[i]*w;
	}
	return;
};



// Monte Carlo Average
template <class T_sys,class T_state,const int dim>
void Spin<T_sys,T_state,dim>::_average(T_sys & value, std::vector<T_sys> observables,int N){
	value = 0;
	for (int i=0;i<N;i++){
		value += observables[i];
	};
	value /= (N);
	return;
};

// Monte Carlo Variance
template <class T_sys,class T_state,const int dim>
void Spin<T_sys,T_state,dim>::_variance(T_sys & value, std::vector<T_sys> observables,int N){
	value = 0;
	_average(value,observables,N);
	value = -N*(value*value);
	for (int i=0;i<N;i++){
		value += observables[i]*observables[i];
	};
	if (N>1){
		value /= (N-1);
	};
	return;
};


// Calculate Interaction
template <class T_sys,class T_state,const int dim>
T_sys Spin<T_sys,T_state,dim>::_interaction(T_state x, T_state y){
	// std::cout << "i("<<x<<","<<y<<") = "<<T_sys(x==y)<<std::endl;
	return T_sys(x==y);
};

// Calculate Energy
template <class T_sys,class T_state,const int dim>
T_sys Spin<T_sys,T_state,dim>::_energy(){
	T_sys energy = 0;
	for (int i=0;i<this->system.size;i++){
		energy += _energy(i);
	};
	return energy/this->system.size;
};

// Calculate Energy at index
template <class T_sys,class T_state,const int dim>
T_sys Spin<T_sys,T_state,dim>::_energy(int index){
	T_sys energy = 0;
	energy += this->system.J[0]*(this->state[index],this->system.direction);
	for (int j=0;j<this->system.coordination;j++){
		// std::cout << index << " :: "<< this->_neighbours[index][j] <<" states " << this->state[index]<<" , "<<this->state[this->_neighbours[index][j]] <<std::endl;
		energy += (0.5)*this->system.J[1]*_interaction(this->state[index],this->state[this->_neighbours[index][j]]);
	};
	return energy;
};

// Calculate Order
template <class T_sys,class T_state,const int dim>
T_sys Spin<T_sys,T_state,dim>::_order(){
	T_sys order = 0;
	for (int i=0;i<this->system.size;i++){
		order += _order(i);
	};
	return std::abs(order/this->system.size);
};


// Calculate Order at index
template <class T_sys,class T_state,const int dim>
T_sys Spin<T_sys,T_state,dim>::_order(int index){
	T_sys order = 0;
	order += _interaction(this->state[index],this->system.direction);
	return (this->system.q*order -1)/(this->system.q-1);
};



// Print State
template <class T_sys,class T_state,const int dim>
void Spin<T_sys,T_state,dim>::print(){
	if (this->settings.verbose == 0){
		return;
	};
	if (this->settings.iteration == 1){
		std::cout << std::endl;
		std::cout << "d = " << this->system.d << ", ";
		std::cout << "n = " << this->system.n << ", ";
		std::cout << "q = " << this->system.q << ", ";
		std::cout << "T = " << this->system.T << ", ";
		for(int i=0;i<this->system.complexity;i++){
			std::cout << "J" << i <<" = "<< this->system.J[i];
			if (i==(this->system.complexity-1)){
				std::cout << "";
			}
			else{
				std::cout << ", ";			
			};
		};
		std::cout << std::endl;
		std::cout << std::endl;
	};
		
	std::cout << "energy = " << this->observables.energy.back() << ", ";
	std::cout << "mean   = " << this->observables.energy_mean.back() << ", ";
	std::cout << "var    = " << this->observables.energy_var.back() << " ";
	std::cout << std::endl;

	std::cout << "order = " << this->observables.order.back() << ", ";
	std::cout << "mean  = " << this->observables.order_mean.back() << ", ";
	std::cout << "var   = " << this->observables.order_var.back() << " ";
	std::cout << std::endl;

	std::cout << std::endl;

	// std::cout << "neighbours = "<< std::endl;
	// for(int i=0;i<this->system.size;i++){
	// 	for(int j=0;j<this->system.coordination;j++){
	// 		std::cout << this->_neighbours[i][j] << "   ";
	// 	};
	// 	std::cout << std::endl;
	// };

	// std::cout << "state = "<< std::endl;
	// for(int i=0;i<this->system.size;i++){
	// 	std::cout << this->state[i] << "   ";
	
	// 	if (((i+1)%this->system.n) == 0){
	// 		std::cout << std::endl;
	// 	};
	// };
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