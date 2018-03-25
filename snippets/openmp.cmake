# OpenMP
find_package( OpenMP )
if( OPENMP_FOUND )
    option( WITH_OPENMP "Whether to use parallel processing capabilities of OPENMP. ON/OFF" ON )
endif( OPENMP_FOUND )

if( OPENMP_FOUND AND WITH_OPENMP )
    message( STATUS "With OpenMP " )
    set ( CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -DMAX_OPENMP_NUM_THREADS=${PROCESSOR_COUNT} -DOPENMP_NUM_THREADS=${PROCESSOR_COUNT} ${OpenMP_CXX_FLAGS} -DOPENMP" )
    set ( CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -DMAX_OPENMP_NUM_THREADS=${PROCESSOR_COUNT} -DOPENMP_NUM_THREADS=${PROCESSOR_COUNT} ${OpenMP_CXX_FLAGS} ${OpenMP_C_FLAGS} -DOPENMP" )
else( OPENMP_FOUND AND WITH_OPENMP )
    message( STATUS "Without OpenMP" )
    set ( CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -DMAX_OPENMP_NUM_THREADS=1 -DOPENMP_NUM_THREADS=1" )
    set ( CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -DMAX_OPENMP_NUM_THREADS=1 -DOPENMP_NUM_THREADS=1" )
endif( OPENMP_FOUND AND WITH_OPENMP )
