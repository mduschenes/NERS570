#include <stdio.h>
#include "mpi.h"
#include <omp.h>

int main(int argc, char* argv[]) {

   int numprocs, rank;
   int ithd,nthreads;

   MPI_Init(&argc, &argv);

   MPI_Comm_size(MPI_COMM_WORLD, &numprocs);
   MPI_Comm_rank(MPI_COMM_WORLD, &rank);

   ithd = 0;
   nthreads = 1;

   #pragma omp parallel default(shared) private(ithd)
   {
       ithd = omp_get_thread_num();
       nthreads = omp_get_num_threads();
       printf("Hello World from thread %d out of %d threads on process %d out of %d!\n",
         ithd,nthreads,rank,numprocs);
   }

   MPI_Finalize();
   return 0;
}