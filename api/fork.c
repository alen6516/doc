#include <stdio.h>
#include <stdlib.h>
#include <sys/types.h>
#include <unistd.h>
#include <sys/wait.h>

int main(void)
{
    pid_t pid;
    int status;

    if ((pid = fork()) < 0) {
        perror("fork");
        exit(1);
    }

    /* Child */
    if (pid == 0) {
        exit(0);
	}

    /* Parent
     * Gives you time to observe the zombie using $ ps aux | grep 'Z'
	 * here child exits but parents have not called wait, so child become zombie
	 */
    sleep(10);

    /* ... and after that, parent wait(2)s its child's
     * exit status, and prints a relevant message. */
    pid = wait(&status);
    if (WIFEXITED(status))
        fprintf(stderr, "\n\t[%d]\tProcess %d exited with status %d.\n",
                (int) getpid(), pid, WEXITSTATUS(status));

    return 0;
}
