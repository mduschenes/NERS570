PROGRAM main

!$  USE OMP_LIB

IMPLICIT NONE

  LOGICAL :: bool
  INTEGER :: rank,np,mpierr,tid,nt

  bool=.FALSE.
  mpierr=0
  tid=0
  nt=1

  rank=0
  np=1
  IF(rank == 0) WRITE(*,*) "MPI initialized? ",bool,mpierr
  
!$OMP PARALLEL
!$  nt=omp_get_num_threads()
!$  tid=omp_get_thread_num()
    WRITE(*,*) "Hello World from thread",tid,"out of",nt,"threads, on MPI",rank,"with",np,"processors"

  !$OMP END PARALLEL


ENDPROGRAM 
