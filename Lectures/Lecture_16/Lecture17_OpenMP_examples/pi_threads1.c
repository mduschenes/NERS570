#include <stdio.h>
#include <omp.h>

#define MAX_THREADS 4

static long num_steps = 100000000;
double step;

int main()
{
  int i,id;
  double x, pi, fsum = 0.0;
  double sum[MAX_THREADS];

  double start_time, run_time;

  step = 1.0/(double) num_steps;

  start_time = omp_get_wtime();

#pragma omp parallel num_threads(MAX_THREADS)
{
  id = omp_get_thread_num();

  sum[id] = 0.0;
  #pragma omp for
  for (i=1;i<= num_steps; i++){
      x = (i-0.5)*step;
    sum[id] = sum[id] + 4.0/(1.0+x*x);
  }
}

  for(i=0; i < MAX_THREADS; i++)
    fsum += sum[i];
  pi = step * fsum;

  run_time = omp_get_wtime() - start_time;

  printf("\n pi with %ld steps is %lf in %lf seconds\n ",num_steps,pi,run_time);
}
