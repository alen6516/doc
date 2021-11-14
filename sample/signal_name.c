/*
	 1 -> SIGHUP
	 2 -> SIGINT
	 3 -> SIGQUIT
	 4 -> SIGILL
	 5 -> SIGTRAP
	 6 -> SIGABRT
	 7 -> SIGEMT
	 8 -> SIGFPE
	 9 -> SIGKILL
	10 -> SIGBUS
	11 -> SIGSEGV
	12 -> SIGSYS
	13 -> SIGPIPE
	14 -> SIGALRM
	15 -> SIGTERM
	16 -> SIGURG
	17 -> SIGSTOP
	18 -> SIGTSTP
	19 -> SIGCONT
	20 -> SIGCHLD
	21 -> SIGTTIN
	22 -> SIGTTOU
	23 -> SIGIO
	24 -> SIGXCPU
	25 -> SIGXFSZ
	26 -> SIGVTALRM
	27 -> SIGPROF
	28 -> SIGWINCH
	29 -> SIGINFO
	30 -> SIGUSR1
	31 -> SIGUSR2
*/
#include <signal.h>
#include <string.h>
#include <stdio.h>
#include <stdlib.h>
#include <ctype.h>

void upcase(char *s)
{
    while (*s)
    {
        *s = toupper(*s);
        s++;        
    }
}

int main(void)
{    
    for (int sig = 1; sig < NSIG; sig++)
    {
        char *str = strdup(sys_signame[sig]);
        if (!str)
            return -1;

        upcase(str);
        printf("%2d -> SIG%s\n", sig, str);

        free(str);
    }

    return 0;
}
