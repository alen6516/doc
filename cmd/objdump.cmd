# Description

# Overview

# Options
-M MODE
	"x86-64" or "i386" or "i8086"
	    Select disassembly for the given architecture.
	"intel" or "att"
		Select between intel syntax mode and AT&T syntax mode.
	"amd64" or "intel64"
	    Select between AMD64 ISA and Intel64 ISA.

-S
	display source code

# Example
$ objdump --debugging my_bin
    * show debugging symbols of a binary file

$ objdump -M intel -S main.o
    * use intel syntax, and display source code (need first compile with -g)
