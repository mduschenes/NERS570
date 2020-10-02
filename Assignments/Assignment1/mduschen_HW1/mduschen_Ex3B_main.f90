! gcc -c -o mduschen_Ex3B.o mduschen_Ex3B.c
! gfortran -c -o mduschen_Ex3B_main.o mduschen_Ex3B_main.f90
! gfortran -o mduschen_Ex3B_main.out mduschen_Ex3B.o mduschen_Ex3B_main.o
! ./mduschen_Ex3B_main.out N

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





! Main function to accept N array dimension from command line
program main
 use indexing

 implicit None

 interface
  function IsPowerOfTwo(x) result(z)
   integer,intent(in) :: x
   integer:: z
  end function IsPowerOfTwo
 end interface
 ! integer,external :: IsPowerOfTwo

 INTERFACE
  SUBROUTINE z_order_c_(N,dim,arr) BIND(C)
    USE, INTRINSIC :: ISO_C_BINDING, ONLY: C_INT
    IMPLICIT NONE
    INTEGER(C_INT) :: N,dim
    integer(C_INT) :: arr(*)
  END SUBROUTINE z_order_c_
 END INTERFACE

 integer :: N = 0
 integer :: dim = 2
 integer :: size
 integer,allocatable :: arr(:)
 integer :: i,j
 character(len=4) :: Nstr = ""
 integer :: ioerr 

 !Variable for processing input 
 call get_command_argument(1,value=Nstr) 
 read(Nstr,*,iostat=ioerr) N
 
 if(ioerr /= 0) then
  write(*,*) 'Command argument "'//trim(Nstr)// & 
   '" does not appear to be an integer!' 
 stop 1 
 endif

!  Check if N allowed
 if (IsPowerOfTwo(N)/=1) then
  write(*,*) "ERROR: N not power of 2"
  stop 1
 end if

size = N**dim
allocate(arr(size))


! Linear order Index Array
! call L_order(N,dim,arr)
! write(*,*) "Linear Order"
! call printa(N,N,arr,"A")


! Z order Index Array
call z_order_c_(N,dim,arr)
! write(*,*) "Z Order"
call printa(N,N,arr,"A")

end program main


! Check if x is power of 2
function IsPowerOfTwo(x) result(z)
 integer, intent(in) :: x
 integer :: z
 if (x == 0) then
  z = 0
 else
  z = 1-iand(x,x-1)
 endif
end function IsPowerOfTwo


! Print out array of shape (N,M)
subroutine printa(N,M,arr,label)
 use indexing 
 implicit none

 integer,intent(in) :: N,M
 integer :: size
 integer :: dim = 2
 integer,intent(in) :: arr(*)
 character(len = *),intent(in) :: label
 integer, allocatable :: coords(:),sizes(:),subarr(:)
 integer :: z
 integer :: i,j
 allocate(coords(dim),sizes(dim),subarr(M))
 size = N*M
 sizes(1) = N
 sizes(2) = M
 ! character(len = 100) :: fmt
 do i=1,N
  do j=1,M
   coords = (/i,j/)
   z = lorder(dim,coords,sizes)
   subarr(j) = arr(z)
  end do
  if (i==1)then
   ! write(fmt, 10)N , "(i0, 1x)"
   ! 10 format('(', I2, A9, ')')
   ! ! write(*, fmt) (a(i)*b(i), i=1,n)
   write(*,*) label," = [",(subarr(j), j= 1,M),"    "    
  else if (i==N) then
   write(*,*) "     ",(subarr(j), j= 1,M)," ]"    
  else
   write(*,*) "     ",(subarr(j), j= 1,M),"  "
  end if   
 enddo
end subroutine printa

