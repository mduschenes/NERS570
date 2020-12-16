#ifndef _SPIN_
#define _SPIN_

#include <cstddef>
#include <iostream>
#include <vector>
#include <cstdarg>
#include <cmath>
#include <time.h>
#include <map>
#include <omp.h>

#include "io.hpp"

#define MAX_THREADS 8

namespace PHYS {

template <class T_sys,class T_state, const int dim>
class Spin {

	public:

		//Constructor 
		Spin(int n, T_state q, T_sys T, T_sys * J);
		//Destructor
		~Spin();

		// Set system
		void set(int n, T_state q, T_sys T, T_sys * J);

		// Get system
		void get();

		// Compute observables
		void calculate();

		// Do Monte Carlo Iterations
		void montecarlo();

		// Update State
		void update();

		// Write  system
		void write();

		// Write read
		void read();

		// Print System
		void print();

		// System states
		std::vector<T_state> state;

		// System variables
		struct system {
			int d;
			int n;
			T_state q;
			T_sys T;
			T_sys * J;
			T_state direction;
			int complexity;
			int size;
			int coordination;			
		} system;	

		// Observables variables
		struct observables {
			std::vector<T_sys> energy;
			std::vector<T_sys> energy_mean;
			std::vector<T_sys> energy_var;
			std::vector<T_sys> order;
			std::vector<T_sys> order_mean;
			std::vector<T_sys> order_var;
		} observables;


		// Settings variables
		struct settings {
			int seed;
			int num_threads;
			int iteration;
			int iterations;
			int burnin;
			float stop;
			int verbose;
			int read;
			int write;
			std::string path;
		} settings;		
		
	private:


		// Update State
		void _update(int index,T_state state);

		// Set lattice
		void _set_lattice();

		// Get Lattice Site
		void _index(int & z,int * indices);

		// Get Lattice Position
		void _indices(int & z,int * indices);

		// Set state
		void _set_state();		

		// Set state
		void _set_state(int index, T_state state);		

		// Set state
		void _set_system(int n, T_state q, T_sys T, T_sys * J);		


		// Get state
		T_state _get_state(int index);		

		// Get Random state
		T_state _random_state(T_state nullstate);	

		// Get Random state
		T_state _random_state();	

		// Get Random index
		int _random_index();								

		// Transition probability calculation
		void _propose();

		// Transition probability calculation
		int _transition(T_sys delta);

		// Stopping condition
		int _stop();

		//  Set observables
		void _set_observables();

		//  Set observables stats
		void _set_observables_stats();		

		//  Set settings
		void _set_settings();	

		// Monte Carlo average
		void _average(T_sys & value,std::vector<T_sys> observables,int N);

		// Monte Carlo variance
		void _variance(T_sys & value,std::vector<T_sys> observables,int N);

		// State interaction calculation
		T_sys _interaction(T_state x, T_state y);

		// Energy calculation
		T_sys _energy();

		// Order calculation
		T_sys _order();		

		// Energy calculation at index
		T_sys _energy(int index);
	
		// Order calculation at index
		T_sys _order(int index);



		// Calculate change in energies
		void _set_transitions();

		// Lookup table for transition
		std::map<T_sys,T_sys> _transitions;


		// Nearest neighbours
		std::vector<std::vector<int>> _neighbours;

};

};

#endif