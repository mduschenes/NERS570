// gcc -c -o mduschen_Ex2A_main.o mduschen_Ex2A_main.c 
// gcc -c -o mduschen_Ex2A.o mduschen_Ex2A.c 
// gcc -o mduschen_Ex2A_main.out mduschen_Ex2A_main.o
// ./mduschen_Ex2A_main.out N

#include <stdio.h>
#include <stdlib.h>
#include "mduschen_Ex2A.c"


// Check if x is power of 2
int ispoweroftwo(int x)
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
  			z = lorder(dim,coords,sizes);
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
	if (ispoweroftwo(N)==1){
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
	z_order(N,dim,arr);
	printa(N,N,arr,"A");	



	return;

}
