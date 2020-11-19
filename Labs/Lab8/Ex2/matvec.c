#include <immintrin.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>

#define ALIGN 16
#define SIMD_BLOCK (ALIGN/sizeof(double))

#define base 0


// Coords (i_{0},...,i_{dim-1}) from linear index (Naive operations)
void position(int z, const int dim, const int * shape,int * indices){
	int i,j,L;
	for (i=0;i<dim;i++){
		L = 1;
		for (j=i+1;j<dim;j++){
			L *= shape[j];
		};
		indices[i] = (z/L)%shape[i];
	};

	return;	
};


// Linear order of indices (i_{0},...,i_{dim-1}), 
//  with shape(N_{0},...,N_{dim-1})
int lorder(const int dim,const int * indices,const int * shape){

	int z = 0;
	int w = 1;
	int i,j;
	for (i=0;i<dim;i++){
		w = 1;
		for (j=i+1;j<dim;j++){
			w *= shape[j];
		}
		z += indices[i]*w;
	}
	return z;

};


// z order of indices (i_{0},...,i_{dim-1}) (Bitwise operations)
int zorder(const int dim, const int * indices,const int *shape){	
	const int zsize=8*sizeof(int);
	int i,j;
	int z = 0;
	int x;
	for (i=0;i<zsize;i++){
		for(j=0;j<dim;j++){
			x = (indices[dim-1-j] & (1 << i));
			z |= (x << (i+j));
			};
		};
	return z;
};

// z order of indices (i_{0},...,i_{dim-1}) for (2d) array (Bitwise operations)
void z_order(const int N, const int dim, double * arr){
	int i,j,z;
	int indices[dim];
	int shape[dim];
	int size = 1;
	for (i=0;i<dim;i++){
		shape[i] = N;
		size *= N;
	};
	double tmp[size];
	for(i=0;i<size;i++){
		position(i,dim,shape,indices);
		// printf("(%d,%d) -> %d\n",indices[0],indices[1],i);
		z = zorder(dim,indices,shape)+base;
		tmp[i] = arr[z];
	};
	for(i=0;i<size;i++){
		arr[i] = tmp[i];
	};
	return;
};

int size(const int dim,const int * shape){
	int size=1;
	for(unsigned int i=0;i<dim;i++){
		size *= shape[i];
	};
	return size;
};

void arr_init(const int dim,const int * shape, double * arr,const char * type){
	int N=size(dim,shape);

	for(unsigned int i=0;i<N;i++){
		if (strcmp(type,"RANDOM")==0){
			arr[i] = rand();
		}
		else if (strcmp(type,"LINEAR")==0){
			arr[i] = i;
		}
		else if (strcmp(type,"ONES")==0){
			arr[i] = 1;
		}
		else if (strcmp(type,"ZEROS")==0){
			arr[i] = 0;
		}
		else {
			arr[i] = 0;
		};
	};
	return;
};

void arr_pad(const int n,const int m,const int N, const int M, const double * A, double * A_,double padding){
	unsigned int i,j,z,w;
	for(i=0;i<N;i++){
		for(j=0;j<M;j++){
			if ((i<n) && (j<m)){
				z = i*M+j;
				w=i*m+j;
				A_[z] = A[w];
			}
			else{
				z = i*M+j;
				A_[z] = padding;	
			};
		};
	};
};


// Print out array of shape (N,M)
void printa(const int N, const int M, double const * arr, char const * label){
	const int dim = 2;
	int indices[dim];
	int shape[] = {N,M};
	int i,j;
	int a,z;
	// int label_size = strlen(label);
	// printf("label size = %d",label_size);
	// if(label_size>1){
	// 	char spacing[label_size-1];
	// 	for (unsigned int i=0;i<label_size-1;i++){
	// 		spacing[i]=" ";
	// 	};
	// }
	// else{
	// 	char spacing[]="";
	// };
	char spacing[]="";
	printf("%s = [",label);
	for (i = 0; i < N; i++) {
  		for (j = 0; j < M; j++){
  			indices[0] = i;
  			indices[1] = j;
  			z = lorder(dim,indices,shape);
  			a = arr[z];
  			if (j==0 && i>0){
  				printf("%s",spacing);
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
	printf("\n");
	return;
};

void matvec(const int n,const int m,const double * A,const double *x, double *y){
	for(unsigned int i=0;i<n;i++){
		for(unsigned int j=0;j<m;j++){
			// std::cout << i << " " << j << " :: " << y[i] << " = " << A[i*m+j] << " * " << x[j] << std::endl;
			y[i] += A[i*m +j]*x[j];
		}
	};		
};


void _matvec_avx(const double* A,const double* x,double* y){
    asm volatile ("# avx code begin");  // looking at assembly with gcc -S
    __m256d xrow = _mm256_loadu_pd(x);
    
    __m256d a = _mm256_mul_pd(_mm256_loadu_pd(A), xrow);
    __m256d b = _mm256_mul_pd(_mm256_loadu_pd(A+4), xrow);
    __m256d c = _mm256_mul_pd(_mm256_loadu_pd(A+8), xrow);
    __m256d d = _mm256_mul_pd(_mm256_loadu_pd(A+12), xrow);

    // our task now is to get {sum(a), sum(b), sum(c), sum(d)}
    // This is tricky because there is no hadd instruction for avx
    
    // {a[0]+a[1], b[0]+b[1], a[2]+a[3], b[2]+b[3]}
    __m256d sumab = _mm256_hadd_pd(a, b);   

    // {c[0]+c[1], d[0]+d[1], c[2]+c[3], d[2]+d[3]}
    __m256d sumcd = _mm256_hadd_pd(c, d);   

    // {a[0]+a[1], b[0]+b[1], c[2]+c[3], d[2]+d[3]}
    __m256d blend = _mm256_blend_pd(sumab, sumcd, 0b1100);

    // {a[2]+a[3], b[2]+b[3], c[0]+c[1], d[0]+d[1]}
    __m256d perm = _mm256_permute2f128_pd(sumab, sumcd, 0x21);

    // {sum(a), sum(b), sum(c), sum(d)}
    __m256d Ax = _mm256_add_pd(perm, blend);
    // printf("yinit = %f",*y);
    _mm_storel_pd(y, _mm256_castpd256_pd128(Ax));
    // printf("yfinal = %f",*y);
    // _mm_storel_pd(y, Ax);
    asm volatile ("# avx code end");

};



void matvec_avx(const int n,const int m, const double* A,const double* x,double* y){
	// Break up multiplication into 4x4 blocks for avx instructions
	//Pad A,x,y with zeros to make multiple of 4 for SIMD
	int N = n,M=m;
	if (n%SIMD_BLOCK != 0){
		N = SIMD_BLOCK*(n/SIMD_BLOCK+1);
	};
	if (m%SIMD_BLOCK != 0){
		M = SIMD_BLOCK*(m/SIMD_BLOCK+1);
	};
	if (N<M){
		N = M;
	}
	else if(N>M){
		M = N;
	}; 
	const int L = N*M;
	const int S = N/SIMD_BLOCK;
	double A_[L],x_[M],y_[N];
	double y__;

	arr_pad(n,m,N,M,A,A_,0.0);
	arr_pad(m,1,M,1,x,x_,0.0);
	arr_pad(n,1,N,1,y,y_,0.0);

	// Use z-index ordering for blocks of 4
	// printa(N,M,A_,"A");
	// z_order(N,2,A_);
	// printa(N,M,A,"A");

	printf("Padded Arrays\n");
	printa(N,M,A_,"A");
	printa(M,1,x_,"x");
	printa(N,1,y_,"y");


	_matvec_avx(A_,x_,y_);


	// unsigned int i,j,z;
	// for(z=0;z<L;z+=SIMD_BLOCK){
	// 	i=L/M;
	// 	j=L%M;
	// 	printf("z=%d,i=%d,j=%d\n",z,i,j);
	// 	_matvec_avx(A_+z,x_+j,&y__);
	// 	y[i] += y__;
	// };
	return;
};




int main(int argc, char** argv){
	//Shape of matrix
	const int dim = 2;
	int shape[dim];
	for (int i=dim-1;i>-1;i--){
		shape[i]=0;
		if (argc > (i+1)){
			for(unsigned int j=0;j<dim;j++){
				if (j<=i){
					shape[j] = atoi(argv[j+1]);
				}
				else{
					shape[j] = atoi(argv[i+1]);
				};
			};
			break;
		};
	};

	const int N=size(dim,shape);

	double A[N];
	arr_init(dim,shape,A,"LINEAR");	



	int dim_x=1,dim_y=1;
	int shape_x[1]={shape[1]};
	int shape_y[1]={shape[0]};
	
	double x[shape[1]],y[shape[0]];
	arr_init(dim_x,shape_x,x,"ONES");
	arr_init(dim_y,shape_y,y,"ZEROS");


	printf("Init Arrays\n");
	printa(shape[0],shape[1],A,"A");
	printa(shape[1],1,x,"x");
	printa(shape[0],1,y,"y");

	// for(unsigned int i=0;i<m;i++){
	// 	x[i] = i;
	// };
	// for(unsigned int i=0;i<n;i++){
	// 	y[i] = 0.0;
	// };
	printf("Naive Mat-Vec Arrays\n");
	matvec(shape[0],shape[1],A,x,y);
	
	printf("Naive Result\n");
	printa(shape[0],1,y,"y");


	printf("ASM Mat-Vec Arrays\n");
	arr_init(dim_y,shape_y,y,"ZEROS");
	matvec_avx(shape[0],shape[1],A,x,y);

	printf("ASM Result\n");
	printa(shape[0],1,y,"y");

	// for(unsigned int i=0;i<n;i++){
	// 	std::cout << i << " " << y[i] << std::endl;
	// };


	return 0;
};
