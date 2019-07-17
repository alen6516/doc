#include <unistd.h>

unsigned int sleep(unsigned int seconds);
    // sleep in secs, during the sleep, cpu can be released for other task
    // see manpage


int usleep(useconds_t usec);
    // sleep in usecs, note 1 sec = 10^6 usec
    // in parameter we can simply put numbers like 100000 (0.1 sec) 
    // see manpage
    
// Note these functions are not accurate, sleep(1) is not exactly cost 1 sec
// consider calculate time period by cpu clock ( see clock() )
