#include <pthread.h>
#include <stdio.h>
#include <unistd.h>

/**
 * This is an example to show how to use
 * pthread_cond_signal() and pthread_cond_wait()
 * in a producer and consumer model.
 */
pthread_mutex_t lock = PTHREAD_MUTEX_INITIALIZER;
pthread_cond_t cond = PTHREAD_COND_INITIALIZER;

int data_ready = 0;  // shared variable

void* producer(void* arg) {
    sleep(1); // simulate work
    pthread_mutex_lock(&lock);
    data_ready = 1;
    printf("Producer: data ready, signaling consumer\n");
    pthread_cond_signal(&cond); // notify waiting threads
    pthread_mutex_unlock(&lock);
    return NULL;
}

void* consumer(void* arg) {
    pthread_mutex_lock(&lock);
    while (!data_ready) {
        printf("Consumer: waiting for data...\n");
        pthread_cond_wait(&cond, &lock);
        // pthread_cond_wait will unlock the mutex while waiting,
        // and relock it before returning.
    }
    printf("Consumer: got the data!\n");
    pthread_mutex_unlock(&lock);
    return NULL;
}

int main() {
    pthread_t t1, t2;
    pthread_create(&t1, NULL, consumer, NULL);
    pthread_create(&t2, NULL, producer, NULL);

    pthread_join(t1, NULL);
    pthread_join(t2, NULL);

    pthread_mutex_destroy(&lock);
    pthread_cond_destroy(&cond);
    return 0;
}
