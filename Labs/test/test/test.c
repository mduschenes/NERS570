#include <stdio.h>

// Define macros

#define PI 3.14159
#define RADTODEG(x) ((x)*57.29578)

int main()
{
	float x;
	x=RADTODEG(PI*0.5);
	printf("PI/2 radians to deg %0.6f\n",x);
	hellof();
	return 0;
}
