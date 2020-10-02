PROGRAM arrays
        USE ISO_FORTRAN_ENV !Defines OUTPUT_UNIT

        IMPLICIT NONE

        INTEGER :: i,j,n
        REAL(4) :: spArray(10,10)
        REAL(8) :: dpArray(10,10)
        
        WRITE(OUTPUT_UNIT,*) "Single Precision Literal",0.0
        WRITE(OUTPUT_UNIT,*) "Double Precision Literal",0.0d0

        spArray=0.0
        dpArray=0.0d0

        ! Initialize Values
        n=0
        DO i=1,10
                DO j=1,10
                        n=n+1
                        spArray(i,j)=REAL(n,4)
                        dpArray(i,j)=REAL(n,8)
                ENDDO
        ENDDO
        
        WRITE(OUTPUT_UNIT,*) spArray(:,1)
        WRITE(OUTPUT_UNIT,*) spArray(1,:)
        WRITE(OUTPUT_UNIT,*) dpArray(1:10,1)
        
END PROGRAM
