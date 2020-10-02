! gfortran -c -o mduschen_Ex2B_main.o mduschen_Ex2B_main.f90 
! gfortran -c -o mduschen_Ex2B.o mduschen_Ex2B.f90 
! gfortran -o mduschen_Ex2B_main.out mduschen_Ex2B.o mduschen_Ex2B_main.o
! ./mduschen_Ex2B_main.out N

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
call Z_order(N,dim,arr)
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

