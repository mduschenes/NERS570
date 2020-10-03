CC 		:= gcc
MKDIR 	:= mkdir -p
RMDIR 	:= rm -rf
ROOT 	:= .
FILE	:= 
SRC 	:= $(ROOT)
OBJ 	:= $(ROOT)
BIN		:= $(ROOT)
INCLUDE := $(ROOT)
SRCS    := $(wildcard $(SRC)/$(FILE)*.c)
OBJS    := $(patsubst $(SRC)/%.c,$(OBJ)/%.o,$(SRCS))
EXES    := $(patsubst $(SRC)/%.c,$(OBJ)/%.out,$(SRCS))

CFLAGS  :=
#DEPS = hellomake.h

#%.o: %.c $(DEPS)
#	$(CC) -c -o $@ $< $(CFLAGS)
#
#	.PHONY: all run clean
#
#	$(BIN)/%.out : $(OBJS) | $(BIN)
#		$(CC) -o $@ $< $(CFLAGS)
#
#		$(OBJ)/%.o: $(SRC)/%.c | $(OBJ)
#			$(CC) -c -o $@ $< $(CFLAGS)
#
#			$(ROOT) :
#				$(MKDIR) $@
#
#				all : $(EXES)
#
#				run : $(EXES)
#					./$<
#
#					clean :
#						$(RMDIR) $(OBJS)
#							$(RMDIR) $(EXES)

