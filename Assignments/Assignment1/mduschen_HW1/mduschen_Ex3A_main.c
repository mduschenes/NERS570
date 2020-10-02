// gcc -c mduschen_Ex3A_main.c 
// gfortran -c mduschen_Ex3A.f90
// gfortran -o mduschen_Ex3A_main.out mduschen_Ex3A.o mduschen_Ex3A_main.o
// ./mduschen_Ex3A_main.out N

#include <stdio.h>
#include <stdlib.h>

extern void z_order_f_(int *N,int *dim,int arr[]);

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
void z_order(int const N, int const dim, int arr[]){
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
		// printf("(%d,%d) -> %d\n",coords[0],coords[1],i);
		arr[i] = zorder(dim,coords,sizes)+base;
	};
	return;
};



// Check if x is power of 2
int IsPowerOfTwo(int x)
{
    return (x != 0) && !((x & (x - 1)));
}

// Print out array of shape (N,M)
void printa(int const N, int const M, int const arr[N*M], char const label[]){
	int dim = 2;
	int coords[dim];
	int sizes[] = {N,M};
	int i,j;
	int a,z;
	printf("%s = [",label);
	for (i = 0; i < N; i++) {
  		for (j = 0; j < M; j++){
  			coords[0] = i;
  			coords[1] = j;
  			z = i*M + j; //lorder(dim,coords,sizes);
  			a = arr[z];
  			if (j==0 && i>0){
  				printf("      ");
  			}
  			else if (j==0 && i == 0){
  				printf(" ");
  			};
    		printf("%d",a);
    		if (j== (M-1) && i==(N-1)){
  				printf(" ]\n");
	  		}
	  		else if (j ==(M-1)) {
				printf("\n");
	  		}
    		else if (a < 10){
    			printf("    ");
    		}
    		else if (a < 100){
    			printf("   ");
    		}
    		else if (a < 1000){
    			printf("  ");
    		}
    		else{
    			printf(" ");
    		};		    		
  		};
	};
	return;
};



// Main function to accept N array dimension from command line
void main(int argc, char *argv[]){
	
	// Input array size, dimension and array
	int N = 0;
	int dim = 2;
	
	if (argc > 0){
		N = atoi(argv[1]);
	}

	// Check if N allowed
	if (IsPowerOfTwo(N)==1){
	}
	else {
		printf("ERROR: N not power of 2\n");
		return;
	};

	// Declare N^d dimensional array
	int size = 1;
	int i;
	for (i=0;i<dim;i++){
		size *= N;
	};
	int arr[size];

	// Linear order Index Array
	// L_order(N,dim,arr);
	// printa(N,N,arr,"A");

	// Z order Index Array
	z_order_f_(&N,&dim,arr);
	printa(N,N,arr,"A");	



	return;

}
