# speficy fake targets. so make won't check if there is a file called "clean"
.PHONY: all clean install

# [target]: [dependency] [dependency]
# 		[rule]
#		[rule]
#
# [target]: [dependency]
# 		[rule]

all:

install: myapp app.doc
	cp myapp app.doc /usr/local/myapp

clean:
	rm -rf *.o

CC = gcc
CFLAGS = -Wall -ansi -g
SRC = main.c a.c b.c
OBJS = $(SRC:.c=.o) # equals to main.o a.o b.o
EXE = myapp
INSTALL_PATH = /usr/local/myapp/

all: $(EXE) # define the final target

$(EXE): $(OBJS)
	$(CC) $(OBJS) -o $@

main.o: main.c a.h
    $(CC) $(CFLAGS) -c -o $@ $<

a.o: a.c a.h
    $(CC) $(CFLAGS) -c -o $@ $<

b.o: b.c b.h
    $(CC) $(CFLAGS) -c -o $@ $<

install: myapp
    cp myapp app.doc $(INSTALL_PATH)

clean:
	rm -f $(EXE)
	rm -f $(OBJS)

# $? : 
# $@ : the target
# $* : current dependent object without extension filename
# $< : current dependent object

