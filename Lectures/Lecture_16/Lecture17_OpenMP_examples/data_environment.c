#include <stdio.h>
#include <omp.h>
int main ()  
{
  int a;


  a=10;

  omp_set_num_threads(4);
   #pragma omp parallel
   {
      int id = omp_get_thread_num();
      printf("On thread = %d, a=%d\n", id, a);
   }  
}

