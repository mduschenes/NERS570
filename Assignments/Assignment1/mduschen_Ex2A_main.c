#include <stdio.h>
#include <stdarg.h>

int IsPowerOfTwo(int x)
{
    return (x != 0) && !((x & (x - 1)));
}


void printa(int N, int M, int arr[N][M], char label[]){
	printf("%s = [",label);
	int i,j;
	for (i = 0; i < N; i++) {
  		for (j = 0; j < M; j++){

  			if (j==0 && i>0){
  				printf("      ");
  			}
  			else if (j==0 && i == 0){
  				printf(" ");
  			};
    		printf("%d",arr[i][j]);
    		if (j== (M-1) && i==(N-1)){
  				printf(" ]\n");
	  		}
	  		else if (j ==(M-1)) {
				printf("\n");
	  		}
    		else if (arr[i][j] < 10){
    			printf("    ");
    		}
    		else if (arr[i][j] < 100){
    			printf("   ");
    		}
    		else if (arr[i][j] < 1000){
    			printf("  ");
    		}
    		else{
    			printf(" ");
    		};		    		
  		};
	};
	return;
};

int zorder( int dim,...){
	va_list args;
	va_start(args,dim);
	
	const int size=8*sizeof(int);
	int arr[dim][size];
	int i,j,a;
	for (i = dim-1; i >=0; i--){
		a = va_arg(args,int);
		for (j=0;j<size;j++){
			arr[i][j] = a%2;
			a /= 2;
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

	// printa(dim,size,arr,"bits");

	va_end(args);

	return z;
};


int lindex(int Nargs,...){
	int dim = Nargs/2;
	va_list args;

	va_start(args,Nargs);
	int positions[dim];
	int sizes[dim];
	int i,j;
	for (i=0;i<dim;i++){
		positions[i] = va_arg(args,int);
		sizes[i] = va_arg(args,int);
	}
	int z = 0;
	int w = 1;
	for (i=0;i<dim;i++){
		w = 1;
		for (j=i+1;j<dim;j++){
			w *= sizes[j];
		}
		// printf("%d - %d --- %d --- %d\n",i,w,positions[i],z);
		z += positions[i]*w;
	}
	va_end(args);

	return z;

};


int z_order2D(int i,int j){
	int z;
	int dim=2;
	z = zorder(dim,i,j);
	return z;
};

int z_order( int dim,...){
	va_list args;
	va_start(args,dim);
	
	const int size=8*sizeof(int);
	int arr[dim];
	int i,j;
	for (i = dim-1; i >=0; i--){
		arr[i] = va_arg(args,int);
	};

	int z = 0;
	int x;
	for (i=0;i<size;i++){
		for(j=0;j<dim;j++){
			x = (arr[j] & (1 << i));
			z |= (x << (i+j));
			};
		};
	va_end(args);
	return z;
};


void position(int z,int N,int dim,int arr[dim]){
	int i,j,L;
	printf('z = %d\n',z)
	for (i=0;i<dim;i++){
		L = 1;
		for (j=0;j<i;j++){
			L *= N;
		};
		arr[i] = (z/L)%N;
		printf('%d\n',arr[i])
	};

	return;	
};
np.mod(((np.atleast_1d(site)[:,np.newaxis]/self.L_i)).
                        astype(self.dtype),self.L)


void Lindex(int N, int dim,int arr[N][N]){
	int base = 1;
	int i,j;
	if (dim == 2){
		for (i=0;i<N;i++){
			for (j=0;j<N;j++){
				arr[i][j] = lindex(2*dim,i,N,j,N)+base;
			}
		};
	};
	return;
};

void Zorder(int N, int dim,int arr[N][N]){
	int base = 1;
	int i,j;
	if (dim == 2){
		for (i=0;i<N;i++){
			for (j=0;j<N;j++){
				arr[i][j] = zorder(dim,i,j)+base;
			}
		};
	};
	return;
};

void Z_order(int N, int dim,int arr[N][N]){
	int base = 1;
	int i,j;
	if (dim == 2){
		for (i=0;i<N;i++){
			for (j=0;j<N;j++){
				arr[i][j] = z_order(dim,i,j)+base;
			}
		};
	};
	return;
};

void main(){
	
	// Declare variables
	int N;

	// Input array dimension
	printf("Array dimension size: ");
	scanf("%d",&N);

	// Check if N allowed
	if (IsPowerOfTwo(N)==1){
	}
	else {
		printf("ERROR: N not power of 2\n");
		return;
	}	

	// Declare array
	int dim = 2;
	int size = 1;
	int i;
	for (i=0;i<dim;i++){
		size *= N;
	};
	// int arr[size];
	int arr[N][N];

	// Linear order Index Array
	Lindex (N,dim,arr);
	printf("Linear Order\n");
	printa(N,N,arr,"A");

	// Z order Index Array
	Zorder(N,dim,arr);
	printf("z Order\n");
	printa(N,N,arr,"A");

	// Z order Index Array
	Z_order(N,dim,arr);
	printf("z_ Order\n");
	printa(N,N,arr,"A");	


	int z,j;
	dim = 2;
	int coords[dim];
	for (i=0;i<N;i++){
		for (j=0;j<N;j++){
			z = lindex(2*dim,i,N,j,N);
			printf('(%d,%d) - %d',i,j,z);
			position(z,N,dim,coords);
			printf('z - (%d,%d)',z,coords[0],coords[1]);
		}
	};

	// int x=1;
	// int y=2;
	// int z=2;
	// int n = 2;
	// int Z;
	// Z = zorder(n,x,y,z);

	// printf("z(%d,%d) = %d\n",x,y,Z);


	return;

}