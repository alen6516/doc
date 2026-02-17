# speficy fake targets. so make won't check if there is a file called "clean"
.PHONY: all clean install

# [target]: [dependency] [dependency]
# 		[rule]
#		[rule]
#
# [target]: [dependency]
# 		[rule]

CC = gcc
CFLAGS = -Wall -ansi -g
SRC = main.c a.c b.c
OBJS = $(SRC:.c=.o) # equals to main.o a.o b.o
EXE = myapp
INSTALL_PATH = /usr/local/myapp/

all: $(EXE) # define the final target

# Link object files to create the executable
$(EXE): $(OBJS)
	$(CC) -o $@ $^

$(EXE): $(OBJS)
	$(CC) $(OBJS) -o $@

# Rule for compiling C files into object files
%.o: %.c
	$(CC) $(CFLAGS) -c $< -o $@

main.o: main.c a.h
    $(CC) $(CFLAGS) -c -o $@ $<

a.o: a.c a.h
    $(CC) $(CFLAGS) -c -o $@ $<

b.o: b.c b.h
    $(CC) $(CFLAGS) -c -o $@ $<

# Install to path
install: myapp
    cp myapp app.doc $(INSTALL_PATH)

# Clean up build files
clean:
	rm -f $(EXE)
	rm -f $(OBJS)


# $? : Prerequisites that are newer than the target (used for dependencies) (eg, foo.c if newer)
# $@ : the target (eg, main.o)
# $* : current dependent object without extension filename (eg, foo)
# $< : current dependent object (eg, foo.c)
# $^ : All dependents (space-separated), with duplicates removed (eg, main.c foo.c)

# CFLAGS = -g -O2 -Wall -Werror -Wno-unused
# 	* C compile flag
#
# CFLAGS = -I/usr/include
# 	* specify the path to header files
#
# CXXFLAGS
# 	* C++ compile flag
#
# LDFLAS = -L/usr/lib
# 	* tell linker where to find lib
#
# LIBS = -lpthread
# 	* tell linker which lib to link
