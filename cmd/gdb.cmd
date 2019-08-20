# Description

# Overview
* step
    * $ gcc -g file.c
    * $ gdb ./a.out

* debug a running process
    * $ gdb -p PID
        * attach a running process (the process will step)
    * (gdb) detach
        * let the process keep running


* command
    * tui
        * view code and command line
        
    * l (list)
        * $ l FUNCTION_A
    * b (breakpoint)
    * b NN if VAR > 10
        * condition break point
        * add break point on line NN when variable VAR > 10
    * b NN thread thread-ID
        * trace under certain thread NT
        * when stop, all threads are stop
    * r (run)
    * info
        * $ info b
            * see informatin of breakpoint
        * $ info threads
            * see information of threads
    * disable
        * $ disable NUM
            * disable a breakpoint via its number
    * c (continue)
    * n (next)
    * p (print)
        * print variable value
        * $ p VAR
    * set
        * assign a value to a variable
        * $ set var VAR=100
    * s (step)
        * when going to enter a function, use "$ s" to go into the function

    * bt (back trace)
        * check the call stack of function

    * finish
        * finish current function context and breakpoint at the caller (return address)

    * disassemble FUNCTION
        * disassemble the machone code of FUNCTION and show the assemble code

    * ptype STRUCT
        * see a struct's construction

    * watch VAR
        * when VAR is written, set a breakpoint

    
    * thread THREAD_ID
        * switch to specific thread, debugging on this thread
        * when this thread encounter a breakpoint, other threads still run

    * up
        * goto upper stack
    * down
        * goto under stack

* parameter
    * usage
        * $ set PARA VALUE
    * help
        * $ help set ?
    * list of parameter
        * listsize
            * how many lines a list will show

* gdbserver and gdbclient
    * source code is in client, server only has executable file
    * step
        * on server, execute the file
        * on server, execute "$ gdbserver :PORT --attach RUNNING_PID"
        * on client, enter gdb, execute "$ target remote SERVER_IP:PORT"
        * to detach the debug, use "detach"

# Options
    
# Example
$ gdb --tui ./a.out

