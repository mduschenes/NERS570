#include <stdio.h>
#include <omp.h>
int main ()  
{
  int a;


  a=10;

  omp_set_num_threads(4);
   #pragma omp parallel shared(a) 
   {
      int id = omp_get_thread_num();
      if(id==1){
	a=11;
	};
      printf("On thread = %d, a=%d\n", id, a);
   }  
}

