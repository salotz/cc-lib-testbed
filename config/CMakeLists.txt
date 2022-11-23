## Build Options
#
# All options here should be prefixed with 'THIS_' to indicate it is specific to
# this program and useful to the consumer. Ideally the prefix should be stripped
# for use in the actual source code since this distinction is relevant only to
# the build system, but when using the config.h style this is not really
# possible.

option(THIS_LOGGING "Enable logging")

configure_file(
  config.h.in
  config.h
  @ONLY
  )

## Installation
install(
  FILES ${PROJECT_BINARY_DIR}/src/config.h
  DESTINATION src
  )
