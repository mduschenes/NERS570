/*************************************************
 * Laplace Serial C Version
 *
 * Temperature is initially 0.0
 * Boundaries are as follows:
 *
 *      0         T         0
 *   0  +-------------------+  0
 *      |                   |
 *      |                   |
 *      |                   |
 *   T  |                   |  T
 *      |                   |
 *      |                   |
 *      |                   |
 *   0  +-------------------+ 100
 *      0         T        100
 *
 *  John Urbanic, PSC 2014
 *
 ************************************************/

#include <stdlib.h>
#include <stdio.h>
#include <math.h>
#include <sys/time.h>
#include "mpi.h"


#define GENERIC_MAX(x, y) ((x) > (y) ? (x) : (y))

#define ENSURE_int(i)   _Generic((i), int:   (i))
#define ENSURE_float(f) _Generic((f), float: (f))


#define MAX(type, x, y) \
  (type)GENERIC_MAX(ENSURE_##type(x), ENSURE_##type(y))


#define GENERIC_MIN(x, y) ((x) > (y) ? (y) : (x))

#define ENSURE_int(i)   _Generic((i), int:   (i))
#define ENSURE_float(f) _Generic((f), float: (f))


#define MIN(type, x, y) \
  (type)GENERIC_MIN(ENSURE_##type(x), ENSURE_##type(y))


#define MAX_THREADS 4
// size of plate
#define COLUMNS    1000
#define ROWS       1000

// largest permitted change in temp (This value takes about 3400 steps)
#define MAX_TEMP_ERROR 0.01
// Declare Temperature Arrays
double Temperature[ROWS+2][COLUMNS+2];      // temperature grid
double Temperature_last[ROWS+2][COLUMNS+2]; // temperature grid from last iteration


//   helper routines
void initialize(int rows,int cols,int istart,int iend, double Temperature_last[rows][cols]);
void track_progress(int iter, int rows, int cols,int istart,int iend,double Temperature[rows][cols]);


int main(int argc, char *argv[]) {
 
    // MPI Initialization
    int mpierr,np,rank,tag;
    mpierr = MPI_Init(&argc,&argv);
    mpierr = MPI_Comm_size(MPI_COMM_WORLD,&np);
    mpierr = MPI_Comm_rank(MPI_COMM_WORLD,&rank);
    MPI_Status status;
//    printf("np=%d,  rank=%d\n",np,rank);




    int i, j;                                            // grid indexes
    int max_iterations;                                  // number of iterations
    int iteration=1;                                     // current iteration
    double dt=100;                                       // largest change in t
    struct timeval start_time, stop_time, elapsed_time;  // timers

    max_iterations = 4000;

    gettimeofday(&start_time,NULL); // Unix timer


    // Columns of spatial variables to compute on based on MPI rank
    int rows,istart,iend;
    rows=(ROWS/np) + (rank<(ROWS%np));
    istart=rank*(ROWS/np)+MIN(int,rank,(ROWS%np))+1;
    iend=istart+rows-1; 
    printf("istart=%d, iend=%d, rows=%d\n",istart,iend,rows);





    initialize(ROWS+2,COLUMNS+2,istart,iend,Temperature_last);                   // initialize Temp_last including boundary conditions
    //omp_set_num_threads(MAX_THREADS);
    // do until error is minimal or until max steps
    while ( dt > MAX_TEMP_ERROR && iteration <= max_iterations ) {

        // main calculation: average my four neighbors
        //#pragma omp parallel for default(shared) private(i,j) 
        for(i = istart; i <= iend; i++) {
            for(j = 1; j <= COLUMNS; j++) {
                Temperature[i][j] = 0.25 * (Temperature_last[i+1][j] + Temperature[i-1][j] +
                                            Temperature_last[i][j+1] + Temperature[i][j-1]);
            }
        }
        

       // Halo Exchange
       if(rank%2){
	if(rank>0){
	  tag=0;
	  mpierr = MPI_Recv(&Temperature[istart-1],COLUMNS,MPI_DOUBLE,rank+1,tag,MPI_COMM_WORLD,&status);
	};
       }
       else{
	if(rank<(np-1)){	
          tag=0;
	  mpierr = MPI_Send(&Temperature[iend],COLUMNS,MPI_DOUBLE,rank+1,tag,MPI_COMM_WORLD);
	};
       }


        dt = 0.0; // reset largest temperature change

        // copy grid to old grid for next iteration and find latest dt
        //#pragma omp parallel for default(shared) private(i,j) reduction(max:dt)
        for(i = istart; i <= iend; i++){
            for(j = 1; j <= COLUMNS; j++){
	      dt = fmax( fabs(Temperature[i][j]-Temperature_last[i][j]), dt);
	      Temperature_last[i][j] = Temperature[i][j];
            }
        }

        // periodically print test values
        if((iteration % 100) == 0) {
 	    track_progress(iteration,ROWS+2,COLUMNS+2,istart,iend,Temperature);
        }

	iteration++;
    }

    gettimeofday(&stop_time,NULL);
    timersub(&stop_time, &start_time, &elapsed_time); // Unix time subtract routine

    printf("\nMax error at iteration %d was %f\n", iteration-1, dt);
    printf("Total time was %f seconds.\n", elapsed_time.tv_sec+elapsed_time.tv_usec/1000000.0);

    mpierr = MPI_Finalize();

}


// initialize plate and boundary conditions
// Temp_last is used to to start first iteration
void initialize(int rows,int cols,int istart,int iend,double Temperature_last[rows][cols]){

    int i,j;

    for(i = 0; i <= rows+1; i++){
        for (j = 0; j <= cols+1; j++){
            Temperature_last[i][j] = 0.0;
        }
    }

    // these boundary conditions never change throughout run

    // set left side to 0 and right to a linear increase
    
    for(i = istart; i <= iend; i++) {
        Temperature_last[i][0] = 0.0;
        Temperature_last[i][cols+1] = (100.0/rows)*i;
    }
    
    // set top to 0 and bottom to linear increase
    for(j = 0; j <= cols+1; j++) {
        Temperature_last[0][j] = 0.0;
        Temperature_last[rows+1][j] = (100.0/cols)*j;
    }
}


// print diagonal in bottom right corner where most action is
void track_progress(int iteration,int rows,int cols,int istart,int iend, double Temperature[rows][cols]) {

    int i;

    printf("---------- Iteration number: %d ------------\n", iteration);
    for(i = MAX(int,iend-5,1); i <= iend; i++) {
        printf("[%d,%d]: %5.2f  ", i, i, Temperature[i][i]);
    }
    printf("\n");
}
