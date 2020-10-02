module indexing  
 integer,parameter :: base = 1
 
 contains

 ! Linear order of coords (i_{1},...,i_{dim}) for (2d) array (Naive operations)
 subroutine L_order(N,dim,arr) 
  implicit none
  integer,intent(in) :: N
  integer,intent(in) :: dim
  integer :: size
  integer,intent(inout) :: arr(*)
  integer,allocatable :: coords(:),sizes(:)
  integer :: i,j
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
 subroutine Z_order(N,dim,arr)
  implicit none
  integer,intent(in) :: N
  integer,intent(in) :: dim
  integer :: size
  integer,intent(inout) :: arr(*)
  integer,allocatable :: coords(:),sizes(:)
  integer :: i,j
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
 end subroutine Z_order

 ! z order of coords (i_{1},...,i_{dim}) (Bitwise operations)
 ! with sizes(N_{1},...,N_{dim}) 
 function zorder(dim,coords,sizes) result(z)
  implicit none
  integer,intent(in) :: dim
  integer,intent(in) :: coords(dim) 
  integer,intent(in) :: sizes(dim) 
  integer :: zsize = 8*sizeof(dim)
  integer :: x
  integer :: z
  integer :: i,j
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
 function lorder(dim,coords,sizes) result(z)
  implicit none
  integer,intent(in) :: dim
  integer,intent(in) :: coords(dim) 
  integer,intent(in) :: sizes(dim) 
  integer :: size = 8*sizeof(dim)
  integer :: x
  integer :: z
  integer :: i,j
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
 subroutine position(z,N,dim,coords)
  implicit none
  integer,intent(in) :: z
  integer,intent(in) :: N
  integer,intent(in) :: dim
  integer,intent(inout) :: coords(dim)
  integer :: i,j,L
  do i=1,dim
   L = 1
   do j=i,dim-1
    L = L*N
   end do
   coords(i) = mod((z-1)/L,N)+1
  end do 
 end subroutine position

 ! z order for explicit 2d function
 function z_order2D(i,j) result(z)
  implicit none
  integer,intent(in) :: i,j
  integer :: dim = 2
  integer,allocatable :: coords(:),sizes(:)
  integer :: z
  allocate(coords(dim))
  coords = (/ i,j /)
  sizes = (/ 0,0 /)
  z = zorder(dim,coords,sizes)
 end function z_order2D


end module indexing