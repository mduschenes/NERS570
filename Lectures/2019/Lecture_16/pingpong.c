#include <stdio.h>
#include "mpi.h"

int main(int argc, char* argv[]) {

   int numprocs, rank;
   char pingpong[8] = "PINGPONG";
   int i, partner_rank;

   MPI_Init(&argc, &argv);

   MPI_Comm_size(MPI_COMM_WORLD, &numprocs);
   MPI_Comm_rank(MPI_COMM_WORLD, &rank);
   partner_rank = (rank + 1) % 2;

   i = 0;
   while(i < 8)
   {
     //Play Ping Pong
     if(rank == i % 2) {
       fprintf(stderr,"%c\n",pingpong[i]); //Print statement is "unbuffered"
       i++;
       MPI_Send(&i, 1, MPI_INT, partner_rank, 0,
         MPI_COMM_WORLD);
     } else {
       MPI_Recv(&i, 1, MPI_INT, partner_rank, 0,
         MPI_COMM_WORLD, MPI_STATUS_IGNORE);
       fprintf(stderr,"That's %d hits!\n",i); //Print statement is "unbuffered"
     }
   }

   MPI_Finalize();
   return 0;
}