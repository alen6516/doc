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

* execute gdb commands from file
    * $ gdb -x file
    * or from gdb console
        * (gdb) source file

* the return value of the last function will be stored in $eax
    * (gdb) p $eax

* command
    * adv LINE
        * execute until LINE

    * alias ir = info registers
        * set ir as alias to "info registers"
        * unlike bash, gdb alias can not involve arguments, eg: alias ir = info registers eax
            * use "ir eax"

    * tui
        * view code and command line
        * using ^x ^a to toggle TUI
        * in TUI mode, up/down arrow-key will apply on the upper window, one can use 
            * ^p ^n for prev/next command in lower window
            * ^b ^f to move curser back or forward
    
    * display
        * $ display/Ni $pc
            * show the next N asm instructions, N will be 1 if it is not defined
            * one can use this instruction with tui mode to check current src code with asm instruction
            * $ info display
                * show display config
            * $ disable display 1
                * disable a display

    * layout
        * $ layout asm
            * display asm in tui mode
        * $ layout src
            * display src code in tui mode
        * $ layout split
            * split gdb tui mode into 3 windows to show src, asm and commandline
            * can also be triggered by `^x 2`
                
    * l (list)
        * $ l FUNCTION_A
    * where
        * show where are we
    * b (breakpoint)
    * b NN if VAR > 10
        * condition break point
        * add break point on line NN when variable VAR > 10

    * b NN thread thread-ID
        * trace under certain thread NT
        * when stop, all threads are stop

    * add breakpoint in C code
        * #include <signal.h>
        * raise(SIGINT);

    * condition 2 if a==b
        * add condition to a existing breakpoint

    * ignore 2 10
        * ignore breakpoint 2 for 10 times

    * commands
        * let gdb do something automatically when hit a break point
        * e.g. auto add watchpoint to a local var once enter this function
            (gdb) break func
            (gdb) commands
            >   watch var
            >   continue
            > end

    * r (run)
        * $ r arg1 arg2 arg3
            * run with arguments

    * info
        * $ info b
            * see informatin of breakpoint
        * $ info threads
            * see information of threads
        * $ info sharedlibrary
            * see at which addr each library is loaded
        * $ info frame N
            * show more information about frame number N
        * $ info locals
            * show all local variable is this frame
        * $ info reg
            * show all register values
        * $ info macro CONST
            * show a constant defined by #define, but program must be compiled with -g3

    * disable
        * $ disable NUM
            * disable a breakpoint via its number

    * c (continue)
    * n (next)
        * execute util the next line in src code, note one line of src code maybe consist of several instructions
        * if we want to step 1 instruction by 1 instruction, we should use $ ni

    * ni
        * execute next asm instruction

    * p (print)
        * print variable value
        * $ p VAR
        * $ p /x VAR
            * print variable in hex
        * $ p /t VAR
            * print variable in binary

    * x
        * print variable in hex
        * $ x/gx
            * g means giant word (64-bits)
            * x means show in hex

        * $ x/3i $pc
            * show next 3 instructions

        * $ x/200b VAR
            * 200 means print 200 bytes, b means separate each byte

        * $ x/10i $rip-20
            * print 10 instructions from address of $rip-20

        * $ x/20w $rip-20
            * print 20 bytes and present in words from address of $rip-20

        * $ x/16 0x7f2b3a21b840-32
            * 16 means print 16 word, a word is 4 bytes (so total print 64 bytes)
            * print start from 0x7f2b3a21b840-32, note if use $var-32, the offset will be 32*sizeof(var)
            * (gdb) x/16w 0x7f2b3a21b840-32
                    0x7f2b3a21b820: 0x00000000      0x00000000      0x00000004      0x00000005
                    0x7f2b3a21b830: 0x00000000      0x00000000      0x00000004      0x1234567c
                    0x7f2b3a21b840: 0x1234567a      0x00000000      0x3a1f5010      0x00007f2b
                    0x7f2b3a21b850: 0x00000000      0x00000000      0x00000000      0x00000000

    * set
        * assign a value to a program variable
            * $ set VAR=100
        * create a gdb convenicence variable and increase it
            * $ set $var=1
            * $ set $var=$var+1
            * $ show conv

    - set environment LIBVA_DRIVER_NAME radeonsi
        * set environment variable

    - set scheduler-locking on/off
        * when tracing a multi-thread program, after a threat trigger the breakpoint, if not set scheduler lock on, when another thread trigger a breakpoint, gdb will transfer to this thread
        * when finish the trace under a thread, remember to set scheduler lock off, then the other thread can trigger a breakpoint 

    - set non-stop on
        * when debugging a multithreaded application, while a breakpoint hits, the debugger will freeze all the threads. You can tell the debugger to let the other threads continue run by this

    - set disassemble-next-line on/off
        * let gdb show the x86 instruction of next line

    - set disassembly-flavor att/intel
        * set x86 instruction syntax format 

    - set print elements 0
        * when printing a long string or array, by default it can not print whole variable, set this to enable

    - set print pretty on/off
        * print a data member line by line when print a object

    - set pagination off
        * disable gdb to ask "Type <return> to continue, or q <return> to quit"

    - set print repeats 0
        * gdb will omit repeated elements, set this to avoid

    - set history save on
    - set history size 4096
    - set history filename ~/.gdb_history
        * save gdb history to file

    - set follow-fork-mode child
    - set detach-on-fork on
        * when process call fork, system call, continue with the child
        * also detach other processes when process call fork

    * s (step)
        * when going to enter a function, use "$ s" to go into the function

    * bt (back trace)
        * check the call stack of function

    * finish
        * execute to the return of the caller of current function
        *  the return val will be stored in %rax

    * return VAL
        * discard current stack and return VAL

    * disassemble FUNCTION
        * disassemble the machone code of FUNCTION and show the assemble code

    * disassemble/m FUNCTION
        * show the assemble code and source code together
    
    * detach
        * detach the current process that is being debugged

    * disc (disconnect)
        * detach from remote debug

    * ptype STRUCT
        * see a struct's construction

    * watch VAR
        * only break on write
        * watch on an address
            * watch *0x10793ad0
        * watch a variable outside the local scope
            * $ watch -l localptr->member
                * localptr is a local variable, it will disappear after gdb leave the frame, but localptr->member is a varible that still exists, so use -l to continue the watch.
            * another way
                * $ watch *(type*) &localptr->member
        * watch point with condition
            * $ watch -l var if var == 9487
            
    * rwatch VAR
        * only break on read (access the memory)
        * cannot rwatch gdb variables, need to find their addr

    * awatch VAR
        * break on both read/write
        * cannot awatch gdb variables, nedd to find their addr

    * catch EVENT
        * set catchpoint to catch events like syscall, assert, exception, exec, fork, handlers, signal, ...
        * $ catch syscall 
            * break when catching system call

    * tcatch EVENT
        * Set a catchpoint that is enabled only for one stop. The catchpoint is automatically deleted after the first time the event is caught.

    * thread THREAD_ID
        * switch to specific thread, debugging on this thread
        * when this thread encounter a breakpoint, other threads still run

    * thread apply all bt
        * print all thread's bt

    * util
        * continue execution util the next start of loop

    * jump
        * jump LINENUM
        * jump *ADDR
        * jump +1

    * up
        * goto upper stack

    * down
        * goto under stack

    * frame N
        * goto frame N

    * add-symbol-file FILE ADDR
        * add a symbol file to certain address

    * show
        * $ show conv
            * show all convenicence variable in list

    * signal
        * send signal to the program
        * $ signal SIGINT

* parameter
    * usage
        * $ set PARA VALUE
    * help
        * $ help set ?
    * list of parameter
        * $ show listsize
            * how many lines a list will show
    * execute shell commnad
        * $ shell


* remote debug
    * when need it?
        * customer(target machine) only has ELF file, source code on the host machine
            * ELF file may still contain symbol table, so still can be debug, but cannot see every line
        * when do remote debug, symbol is loaded from local (dev machine), so one can set break point before it connect to remote target
    * config gdbserver and gdbclient
        * source code is in client, server only has executable file
        * step
            * on server, execute the file
            * on server, execute "$ gdbserver :PORT --attach `pidof PROCESS`"
                * or "$ gdbserver IP:PORT EXECUTABLE"
            * on client, enter gdb, execute "$ target remote SERVER_IP:PORT"

* .gdbinit
    * You can define it in .gdbinit file (in your debugging folder) and GDB loads and execute it automatically
    * You can also define your own macros
    ```
    define irg
        info registers
        info threads
    end

    define pdb
        print a1
        print a2
        call print_dbg()
    end

    echo "hi"
    b add
    commands
    print a1
    call print_dbg()
    ```

* debuginfod
    * ref
        * https://ubuntu.com/server/docs/debug-symbol-packages
        * https://ubuntu.com/server/docs/about-debuginfod
    * Since ubuntu 22.04, debuginfod is built-in service. With debuginfod active, we can debug apps or libs easily with symbols downloaded from ddebs pool. We don't need to build to get symbols.
        * http://ddebs.ubuntu.com/pool/universe/


# Options
-ex "command"
    * execute command after start gdb
    
# Example
$ gdb --tui ./a.out

$ gdb ./a.out -ex "show configuration"

$ gdb ./a.out core
    * using gdb to debug coredump

* disassemble empty main
    * code
        ```
        int main () {
            ;
        }
        ```
    * disas main
        ```
        Dump of assembler code for function main:
           0x00000000004004d6 <+0>:     push   %rbp
           0x00000000004004d7 <+1>:     mov    %rsp,%rbp
           0x00000000004004da <+4>:     mov    $0x0,%eax
           0x00000000004004df <+9>:     pop    %rbp
           0x00000000004004e0 <+10>:    retq
        End of assembler dump.
        (gdb)
        ```
* disassemble a function called foo
    $ gdb ./a.out -batch -ex 'disassemble foo'

