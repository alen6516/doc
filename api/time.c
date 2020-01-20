#include <time.h>
#include <stdio.h>

int main () {
    // get the system time
    time_t now = time(NULL);

    // or
    time_t raw_time;
    struct tm* timeinfo;
    time(&raw_time);
    timeinfo = localtime(&raw_time);
    printf ( "Current local time and date: %s", asctime (timeinfo) );
}
