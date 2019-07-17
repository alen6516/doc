#include <signal.h>

bool KEEP = 1;

void int_handler() {
    KEEP = 0;
    printf("bye\n");
}

void tstp_handler() {
    printf("press ctrl-z\n");
}

void* child_threade() {

    while(KEEP) {
        //run
    }
}

int main () {

    // handle ctrl-c
    signal(SIGINT, int_handler);

    // handle ctrl-z
    signal(SIGTSTP, tstp_handler);
    

}
