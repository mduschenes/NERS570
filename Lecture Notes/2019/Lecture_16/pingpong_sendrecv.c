#include <stdio.h>
#include "mpi.h"

int main(int argc, char* argv[]) {

   int numprocs, rank;
   char pingpong[8] = "PINGPONG";
   int i, ir, partner_rank,sendr,recvr;

   MPI_Init(&argc, &argv);

   MPI_Comm_size(MPI_COMM_WORLD, &numprocs);
   MPI_Comm_rank(MPI_COMM_WORLD, &rank);
   partner_rank = (rank + 1) % 2;


   i = 0; ir = 0;

   while(i < 8)
   {
     sendr=i % 2;
     recvr=(i+1) % 2;

     //Play Ping Pong
     if(rank == sendr) {
       fprintf(stderr,"%c\n",pingpong[i]); //Print statement is "unbuffered"
       i++;
     }
     MPI_Sendrecv(&i , 1, MPI_INT, partner_rank, 0,
                  &ir, 1, MPI_INT, partner_rank,         0,
                  MPI_COMM_WORLD,MPI_STATUS_IGNORE);
     if(rank == recvr) {
       i=ir;
       fprintf(stderr,"That's %d hits!\n",i); //Print statement is "unbuffered"
     }

   }

   MPI_Finalize();
   return 0;
}