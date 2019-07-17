#include <pthread.h>

// shold be a function pointer
void* child_function() {

    // exit with a return val to father
    pthread_exit(0);
}

int main() {

    // create child thread
    pthread_t child;
    pthread_create(&child, NULL, child_function, NULL);

    // wait util child exist, then I can exit
    pthread_join();
}
