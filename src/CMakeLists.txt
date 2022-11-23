
## General
set(CONFIG_INCLUDE "${CMAKE_BINARY_DIR}/config")
message(VERBOSE "Adding config directory to includes: ${CONFIG_INCLUDE}")

## Libraries

add_library(
  test_bed
  ${CMAKE_CURRENT_LIST_DIR}/test_bed.cpp
  )
target_include_directories(
  test_bed
  PUBLIC
    ${CONFIG_INCLUDE}
    ${CMAKE_CURRENT_LIST_DIR}
  )

## Executables
add_executable(
  test-bed
  ${CMAKE_CURRENT_LIST_DIR}/__main.cpp
  )
target_link_libraries(
  test-bed
  test_bed
  )
target_include_directories(
  test-bed
  PUBLIC
    ${CONFIG_INCLUDE}
    ${CMAKE_CURRENT_LIST_DIR}
  )

## Installation
install(
  TARGETS
    test-bed
    test_bed
  RUNTIME DESTINATION bin COMPONENT Runtime
  LIBRARY DESTINATION lib COMPONENT Runtime
  )
