#include <stdio.h>
#include <sched.h>
#include <omp.h>
int main ()  
{
  omp_set_num_threads(4);
   #pragma omp parallel
   {
      int tid = omp_get_thread_num();
      int cid = sched_getcpu();
      printf("Hello World from thread = %d on core = %d", tid,cid);
      printf(" with %d threads\n",omp_get_num_threads());
   }  
}

