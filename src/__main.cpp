
// includes only needed when DEBUG mode is on
#ifdef DEBUG

#include <iostream>
using namespace std;

#endif // DEBUG

#include "test_bed.h"

int
main(int argc, char* argv[])
{
#ifdef DEBUG
  cout << "DEBUGGING" << endl;
#endif // DEBUG_BUILD

  test_bed::test();

  return 0;
}
