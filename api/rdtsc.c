#include <stdint.h>

inline long long rdtsc(void) {
    unsigned low, high;
    asm volatile ("rdtsc" :"=a"(low), "=d"(high));
    return ((low) | (uint64_t)(high) << 32);
}

// get real processor time (clocks)
// example:
    unsigned long long start_r, end_r;
    start_r = rdtsc();
    // do something
    end_r = rdtsc();
    unsigned long long per = (start_r-end_r)/CPU_FREQUENCY
    
    // to find the cpu frequency, simple copy the output of command lscpu
