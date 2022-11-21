#include "config.h"

// includes only needed when THIS_DEBUG mode is on
#ifdef THIS_DEBUG

#include <iostream>
using namespace std;

#endif // THIS_DEBUG


#include "test_bed.h"

int
main(int argc, char* argv[])
{
#ifdef THIS_DEBUG
  cout << "DEBUGGING:: " << "VERSION: " << TestBed_VERSION_MAJOR << "." << TestBed_VERSION_MINOR << endl;
#endif // THIS_DEBUG

  test_bed::test();

  return 0;
}
