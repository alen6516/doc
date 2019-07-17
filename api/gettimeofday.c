#include <sys/time.h>

int gettimeofday(struct timeval *tv, struct timezone *tz);
    // get current time in usecs
    // usage:
    
        struct timeval start_t;
        struct timeval end_t;
        gettimeofday(&start_t, NULL);
        // do something
        gettimeofday(&end_t, NULL);

        unsigned long per = 1000000 * (end_t.tv_sec-start_t.tv_sec) + end_t.tv_usec-start_t.tv_usec;

