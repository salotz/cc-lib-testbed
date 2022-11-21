cmake_minimum_required(VERSION 3.10)

project('test-bed')

# set to release+debug in case nothing was specified, more useful for consumer side
set(CMAKE_BUILD_TYPE ReleaseWithDebInfo)


## Targets


add_library(test_bed src/test_bed.cpp)
target_include_directories(test_bed PUBLIC
  "${CMAKE_CURRENT_BINARY_DIR}"
  "${CMAKE_CURRENT_SOURCE_DIR}"
  )

add_executable(test-bed src/__main.cpp src/test_bed.cpp)
target_link_libraries(test-bed test_bed)

install(TARGETS test-bed test_bed
        RUNTIME DESTINATION bin COMPONENT Runtime
        LIBRARY DESTINATION lib COMPONENT Runtime)

## Build Options
#
# All options here should be prefixed with 'THIS_' to indicate it is specific to
# this program and useful to the consumer. The prefix should be stripped for use
# in the actual source code since this distinction is relevant only to the build
# system.

option(THIS_DEBUG "Build with debug print and checks")

if(THIS_DEBUG)
  target_compile_definitions(test-bed PUBLIC DEBUG)
endif()
