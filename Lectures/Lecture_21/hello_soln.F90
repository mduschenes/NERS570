PROGRAM main

!$  USE OMP_LIB

IMPLICIT NONE

#ifdef HAVE_MPI
  include "mpif.h"
#endif

  LOGICAL :: bool
  INTEGER :: rank,np,mpierr,tid,nt

  bool=.FALSE.
  mpierr=0
  tid=0
  nt=1

#ifdef HAVE_MPI
  CALL MPI_Init(mpierr)
  CALL MPI_Initialized(bool,mpierr)
  CALL MPI_Comm_size(MPI_COMM_WORLD,np,mpierr)
  CALL MPI_Comm_rank(MPI_COMM_WORLD,rank,mpierr)
#else
  rank=0
  np=1
#endif
  IF(rank == 0) WRITE(*,*) "MPI initialized? ",bool,mpierr
  
!$OMP PARALLEL
!$  nt=omp_get_num_threads()
!$  tid=omp_get_thread_num()
    WRITE(*,*) "Hello World from thread",tid,"out of",nt,"threads, on MPI",rank,"with",np,"processors"

  !$OMP END PARALLEL
#ifdef HAVE_MPI
  CALL MPI_Finalize(mpierr)
#endif


ENDPROGRAM 
