#include <time.h>

// get processor time

clock_t clock(void);

    // example:
        clock_t start_c, end_c;
        start_c = clock();
        // do something
        end_c = clock();
        unsigned long per = (end_c-start_c)/CLOCKS_PER_SEC;
