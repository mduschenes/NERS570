set(SOURCES
  matrix.cpp
)

add_subdirectory(src)

add_library(Mat ${SOURCES} )


enable_testing()

add_subdirectory(test)
