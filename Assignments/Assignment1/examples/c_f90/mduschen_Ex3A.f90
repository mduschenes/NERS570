module indexing  
 use ISO_C_BINDING
 integer(c_int),parameter :: base = 1 
 contains

 ! Linear order of coords (i_{1},...,i_{dim}) for (2d) array (Naive operations)
 subroutine l_order(N,dim,arr)  bind(C,name="l_order_f_")
  implicit none
  integer(c_int),intent(in) :: N
  integer(c_int),intent(in) :: dim
  integer(c_int) :: size
  integer(c_int),intent(inout) :: arr(*)
  integer(c_int),allocatable :: coords(:),sizes(:)
  integer(c_int) :: i,j
  size = N**dim
  allocate(coords(dim),sizes(dim))
  do i=1,dim
   sizes(i) = N
  end do
  do i=1,size
   call position(i,N,dim,coords)
   arr(i) = lorder(dim,coords,sizes) + (base-1)
  end do
 end subroutine L_order

 ! z order of coords (i_{1},...,i_{dim}) for (2d) array (Bitwise operations)
 subroutine z_order_f(N,dim,arr) bind(C,name="z_order_f_")
  implicit none
  integer(c_int),intent(in) :: N
  integer(c_int),intent(in) :: dim
  integer(c_int) :: size
  integer(c_int),intent(inout) :: arr(*)
  integer(c_int),allocatable :: coords(:),sizes(:)
  integer(c_int) :: i,j
  size = N**dim
  allocate(coords(dim),sizes(dim))
  do i=1,dim
   sizes(i) = N
  end do
  do i=1,size
   call position(i,N,dim,coords)
   ! write (*,*) "COORS",i,coords
   arr(i) = zorder(dim,coords,sizes) + (base-1)
  end do
 end subroutine z_order_f

 ! z order of coords (i_{1},...,i_{dim}) (Bitwise operations)
 ! with sizes(N_{1},...,N_{dim}) 
 function zorder(dim,coords,sizes) result(z) bind(C,name="zorder_f_")
  implicit none
  integer(c_int),intent(in) :: dim
  integer(c_int),intent(in) :: coords(dim) 
  integer(c_int),intent(in) :: sizes(dim) 
  integer(c_int) :: zsize = 8*sizeof(dim)
  integer(c_int) :: x
  integer(c_int) :: z
  integer(c_int) :: i,j
  z = 0
  do i=0,zsize-1
   do j=1,dim
    x = iand(coords(dim-j+1)-1,ishft(1, i))
    z = ior(z,ishft(x,(i+j-1)))
   end do
  end do
  z = z + 1
 end function zorder


 ! Linear order of coords (i_{1},...,i_{dim}), 
 ! with sizes(N_{1},...,N_{dim}) 
 function lorder(dim,coords,sizes) result(z) bind(C,name="lorder_f_")
  implicit none
  integer(c_int),intent(in) :: dim
  integer(c_int),intent(in) :: coords(dim) 
  integer(c_int),intent(in) :: sizes(dim) 
  integer(c_int) :: size = 8*sizeof(dim)
  integer(c_int) :: x
  integer(c_int) :: z
  integer(c_int) :: i,j
  z = 1
  do i=1,dim
   x = 1
   do j=i,dim-1
    x = x*sizes(j)
   end do
   z = z + (coords(i)-1)*x
  end do
 end function lorder


 ! Coords (i_{1},...,i_{dim}) from linear index (Naive operations)
 subroutine position(z,N,dim,coords) bind(C,name="position_f_")
  implicit none
  integer(c_int),intent(in) :: z
  integer(c_int),intent(in) :: N
  integer(c_int),intent(in) :: dim
  integer(c_int),intent(inout) :: coords(dim)
  integer(c_int) :: i,j,L
  do i=1,dim
   L = 1
   do j=i,dim-1
    L = L*N
   end do
   coords(i) = mod((z-1)/L,N)+1
  end do 
 end subroutine position

 ! z order for explicit 2d function
 function z_order2d(i,j) result(z) bind(C,name="z_order2d_f_")
  implicit none
  integer(c_int),intent(in) :: i,j
  integer(c_int) :: dim = 2
  integer(c_int),allocatable :: coords(:),sizes(:)
  integer(c_int) :: z
  allocate(coords(dim))
  coords = (/ i,j /)
  sizes = (/ 0,0 /)
  z = zorder(dim,coords,sizes)
 end function z_order2d


end module indexing
