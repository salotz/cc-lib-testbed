#include <iostream>

#include "test_bed.h"

using namespace std;

int
main(int argc, char* argv[])
{
#ifdef DEBUG_BUILD
    printf("DEBUGGING")


#endif // DEBUG_BUILD

    test_bed::test();

    return 0;
}
