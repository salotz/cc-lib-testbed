# Metadata
cmake_minimum_required(VERSION 3.10)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_EXTENSIONS OFF)
set(CMAKE_CXX_STANDARD_REQUIRED True)

project(
  TestBed
  VERSION 0.1
  DESCRIPTION "A test bed for running C++ code and testing best practices."
  HOMEPAGE_URL "%%https://github.com/salotz/cc-lib-testbed%%"
  LANGUAGES CXX
  )

# SNIPPET: add flags for a debug build, e.g. extra debug symbols
# set(CMAKE_CXX_FLAGS_DEBUG
#   "${CMAKE_CXX_FLAGS_DEBUG}"
#   )

# Look here for build options that effect the compilation
add_subdirectory(config)

add_subdirectory(include)
add_subdirectory(src)

# Build options for things that do not effect the main project compilation, e.g.
# also build tests etc.


# SNIPPET: how to specify these
if(THIS_BUILD_TESTS)
  add_subdirectory(tests)
endif()
