# Description
There are many files under /proc/<number>, this doc is to introduce their purpose

# Overview
cat /proc/<number>/maps
    * contains all actual dynamically linked libraries in this running app
    * as well as the mapping address of the process and the libs

cat /proc/<number>/cmdline
    * see the command line command

cat /proc/<number>/environ
    * 当前进程的环境变量列表，彼此间用空字符（NULL）隔开；变量用大写字母表示，其值用小写字母表示

cat /proc/<number>/exe
    * point to the path of the process' executable

cat /proc/<number>/fd
    * the file descriptors of the file opened by this process

cat /proc/cpuinfo
    * cpu info

cat /proc/loadavg
    * 5 columns in the output
        * avg CPU loading within 1 sec
        * avg CPU loading within 5 sec
        * avg CPU loading within 15 sec
        * number of threads that are scheduling by kerenl now / all alive kernel thread number
        * the most recent thread id create by kernel

cat /proc/meminfo
    * check memory status, used by free command

cat /proc/modules
    * list all kernel modules, 6 columns in the output:
        * module name
        * size of the module in memory
        * how many instances of this module are loaded
        * this module depends on which modules
        * the state of this module
            * live: already loaded
            * loading: being loaded
            * unloading: being unloaded
        * this module's offset in kerenl memory

cat /proc/devices
    * Text listing of major numbers and device groups.  This can be used by MAKEDEV scripts for consistency with the kernel.

cat /proc/version
    * check the following's version
        * linux
        * gcc
        * linker (ld)

/proc/sys/...
    * root can modify the file under sys to change kernel config
    * e.g.: $ echo 1 > /proc/sys/net/ipv4/ip_forward
        * enable ip routing function in kernel


# Options

# Example

