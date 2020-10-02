
// Reverse array
void reverse(int N,int arr[]);

// z order of coords (i_{0},...,i_{dim-1}) (Naive operations)
int zorder_naive( int const dim,int const coords[dim]);

// z order of coords (i_{0},...,i_{dim-1}) (Bitwise operations)
int zorder(int const dim, int const coords[dim],int const sizes[dim]);

// Linear order of coords (i_{0},...,i_{dim-1}), 
//  with sizes(N_{0},...,N_{dim-1})
int lorder(int const dim,int const coords[dim],int const sizes[dim]);

// z order of 2D coords (i,j) (Bitwise operations)
int z_order2D(int i,int j);

// Coords (i_{0},...,i_{dim-1}) from linear index (Naive operations)
void position(int z, int const N,int const dim,int coords[dim]);

// Linear order of coords (i_{0},...,i_{dim-1}) for (2d) array (Naive operations)
void L_order(const int N, const int dim,int arr[]);

// z order of coords (i_{0},...,i_{dim-1}) for (2d) array (Bitwise operations)
void Z_order(int const N, int const dim, int arr[]);