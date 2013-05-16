################################################################################
#
# Filename    : Makefile
# Description : Makefile used to build einkterm
# Created on  : 05/16/2013
#
#
################################################################################

CC = arm-none-linux-gnueabi-gcc

# EXTRALIBS = -l
EXTRADFLAGS = 
EXTRALIBS =
LIB_DIR = .

SOURCES = term.c
COMMSRCS = keyboard.c eink.c pty_hell.c


EXE = einkterm

PROGRAM = $(EXE)

TMP_COMMOBJS = $(foreach i,$(COMMSRCS),$i)

COMMOBJS = $(TMP_COMMOBJS:.c=.o)


all: $(PROGRAM)

$(PROGRAM) : $(COMMOBJS)
	$(CC)  $(DFLAGS) $(EXTRA_LINK_FLAGS) -L$(LIB_DIR) $(COMMOBJS) -o $(PROGRAM) $(SYSLIBS) $(SOURCES)


clean:
	rm -f $(PROGRAM) $(OBJECTS) $(COMMOBJS)

