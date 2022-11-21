# Metadata
cmake_minimum_required(VERSION 3.10)

project(TestBed VERSION 0.1)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED True)



# set to release+debug in case nothing was specified, more useful for consumer side
set(CMAKE_BUILD_TYPE ReleaseWithDebInfo)


## Targets

file(GLOB SOURCES src/*.cpp)
file(GLOB HEADERS include/*.h)


add_library(test_bed
  src/test_bed.cpp
  )
target_include_directories(
  test_bed PUBLIC
  "${CMAKE_CURRENT_BINARY_DIR}/include"
  "${CMAKE_CURRENT_SOURCE_DIR}/include"
  )

add_executable(test-bed ${SOURCES})
target_link_libraries(test-bed test_bed)

# install binaries
install(
  TARGETS test-bed test_bed
  RUNTIME DESTINATION bin COMPONENT Runtime
  LIBRARY DESTINATION lib COMPONENT Runtime
  )

# install headers
install(
  FILES ${HEADERS}
  DESTINATION include
  )
## Build Options
#
# All options here should be prefixed with 'THIS_' to indicate it is specific to
# this program and useful to the consumer. Ideally the prefix should be stripped
# for use in the actual source code since this distinction is relevant only to
# the build system, but when using the config.h style this is not really
# possible.

option(THIS_DEBUG "Build with debug print and checks")

# SNIPPET: directly using the build options, instead of the config.h
# if(THIS_DEBUG)
#   target_compile_definitions(test-bed PUBLIC DEBUG)
# endif()

configure_file(
  ${PROJECT_SOURCE_DIR}/include/config.h.in
  ${PROJECT_BINARY_DIR}/include/config.h
  @ONLY
  )

install(
  FILES ${PROJECT_BINARY_DIR}/include/config.h
  DESTINATION include
  )
