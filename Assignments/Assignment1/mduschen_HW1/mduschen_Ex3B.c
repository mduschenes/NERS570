#include <stdio.h>

// Define constant base {0,1} indexing
const int base = 1;

// Reverse array
void reverse(int N,int arr[]){
	int i,temp;
    for (int i=0; i<N/2;i++)
    {
        temp = arr[i];
        arr[i] = arr[N - 1 - i];
        arr[N - 1 - i] = temp;
    }
};

// z order of coords (i_{0},...,i_{dim-1}) (Naive operations)
int zorder_naive( int const dim,int const coords[dim]){
	
	const int size=8*sizeof(int);
	int arr[dim][size];
	int i,j,x;
	for (i = dim-1; i >=0; i--){
		x = coords[dim];
		for (j=0;j<size;j++){
			arr[i][j] = x%2;
			x /= 2;
			if (arr[i][j]<0){
				arr[i][j] = 0;
			};
		};
	};

	int z=0;
	int o=1;
	for (j=0;j<size;j++){
		for (i=0;i<dim;i++){
			z += arr[i][j]*o;
			o *= 2;
		}
	};

	return z;
};

// z order of coords (i_{0},...,i_{dim-1}) (Bitwise operations)
int zorder(int const dim, int const coords[dim],int const sizes[dim]){	
	const int zsize=8*sizeof(int);
	int i,j;
	int z = 0;
	int x;
	for (i=0;i<zsize;i++){
		for(j=0;j<dim;j++){
			x = (coords[dim-1-j] & (1 << i));
			z |= (x << (i+j));
			};
		};
	return z;
};

// Linear order of coords (i_{0},...,i_{dim-1}), 
//  with sizes(N_{0},...,N_{dim-1})
int lorder(int const dim,int const coords[dim],int const sizes[dim]){

	int z = 0;
	int w = 1;
	int i,j;
	for (i=0;i<dim;i++){
		w = 1;
		for (j=i+1;j<dim;j++){
			w *= sizes[j];
		}
		z += coords[i]*w;
	}
	return z;

};

// z order of 2D coords (i,j) (Bitwise operations)
int z_order2D(int i,int j){
	int z;
	int const dim=2;
	int coords[] = {i,j};
	int sizes[] = {0,0};
	z = zorder(dim,coords,sizes);
	return z;
};



// Coords (i_{0},...,i_{dim-1}) from linear index (Naive operations)
void position(int z, int const N,int const dim,int coords[dim]){
	int i,j,L;
	for (i=0;i<dim;i++){
		L = 1;
		for (j=i+1;j<dim;j++){
			L *= N;
		};
		coords[i] = (z/L)%N;
	};

	return;	
};

// Linear order of coords (i_{0},...,i_{dim-1}) for (2d) array (Naive operations)
void l_order(const int N, const int dim,int arr[]){
	int i,j;
	int coords[dim];
	int sizes[dim];
	int size = 1;
	for (i=0;i<dim;i++){
		sizes[i] = N;
		size *= N;
	};
	for(i=0;i<size;i++){
		position(i,N,dim,coords);
		arr[i] = lorder(dim,coords,sizes)+base;
	};
	return;
};

// z order of coords (i_{0},...,i_{dim-1}) for (2d) array (Bitwise operations)
void z_order_c_(int *N, int *dim, int arr[]){
	int i,j;
	int coords[(*dim)];
	int sizes[(*dim)];
	int size = 1;
	for (i=0;i<(*dim);i++){
		sizes[i] = (*N);
		size *= (*N);
	};
	for(i=0;i<size;i++){
		position(i,*N,*dim,coords);
		// printf("(%d,%d) -> %d\n",coords[0],coords[1],i);
		arr[i] = zorder(*dim,coords,sizes)+base;
	};
	return;
};
