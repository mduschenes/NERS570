#ifndef _SPIN_
#define _SPIN_

#include <cstddef>
#include <iostream>
#include <vector>
#include <cstdarg>
#include <cmath>
#include <time.h>


namespace PHYS {

template <class T_sys,class T_state, const int dim>
class Spin {

	public:

		//Constructor 
		Spin(int n, T_state q, T_sys T, T_sys * J);
		//Destructor
		~Spin();

	
		// Set system
		void set();

		// Get system
		void get();

		// Compute observables
		void calculate();

		// Do Monte Carlo Iterations
		void montecarlo();

		// Update System
		void update(int index,T_state state);

		// Print System
		void print();

		// System states
		std::vector<T_state> state;

		// System Variables
		int d;
		int n;
		T_state q;
		T_sys T;
		T_sys * J;
		T_state direction;
		int complexity;
		int size;
		int coordination;



		// System observables
		struct observables {
			std::vector<T_sys> magnetization;
			std::vector<T_sys> energy;
			// std::vector<T_sys> correlation;
		} observables;


		// System variables
		struct settings {
			int seed = 1;
		} settings;		
		
	private:


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

		// Get state
		T_state _get_state(int index);		

		// Get Random state
		T_state _random_state(T_state nullstate);	

		// Get Random state
		T_state _random_state();						

		// Set size
		void _set_size();		

		// Calculate change in energies
		void _set_delta();

		// Transition probability calculation
		float _transition(int index);

		//  Set observables
		void _set_observables();

		//  Set settings
		void _set_settings();		

		// State interaction calculation
		T_sys _interaction(T_state x, T_state y);

		// Energy calculation
		T_sys _energy();

		// Magnetization calculation
		T_sys _magnetization();

		// Two-pt correlation calculation
		T_sys _correlation();

		// Energy calculation
		T_sys _energy(int index);

		// Magnetization calculation
		T_sys _magnetization(int index);

		// Two-pt correlation calculation
		T_sys _correlation(int index);		


		// Lookup table for change in energies
		std::vector<T_sys> _deltas;


		// Nearest neighbours
		std::vector<std::vector<int>> _neighbours;




};

};

#endif