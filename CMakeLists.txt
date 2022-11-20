cmake_minimum_required(VERSION 3.10)

project('test-bed')

# set to release+debug in case nothing was specified, more useful for consumer side
set(CMAKE_BUILD_TYPE ReleaseWithDebInfo)


add_executable(test_bed src/test_bed.cpp)
