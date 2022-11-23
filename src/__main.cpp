#include "config.h"

#ifdef THIS_LOGGING
#include <iostream>
using namespace std;
#endif // THIS_LOGGING

#include "test_bed.h"

int
main(int argc, char* argv[])
{
  // log general information about the build
#ifdef THIS_LOGGING
  cout << "LOGGING::INFO:" << "Version" << TestBed_VERSION_MAJOR << "." << TestBed_VERSION_MINOR << endl;
  cout << "LOGGING::INFO:" << "Build Type: " << BUILD_TYPE << endl;
#endif // THIS_LOGGING

  // Run the core test library functions
  test_bed::test();

  return 0;
}
