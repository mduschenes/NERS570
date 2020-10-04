CC 		:= gpp
MKDIR 	:= mkdir -p
RMDIR 	:= rm -rf
ROOT 	:= .
FILE	:= 
EXT		:= cpp
EXTO	:= o
EXTEXE	:= out
SRC 	:= $(ROOT)
OBJ 	:= $(ROOT)
BIN		:= $(ROOT)
INCLUDE := $(ROOT)
SRCS    := $(wildcard $(SRC)/$(FILE)*.$(EXT))
OBJS    := $(patsubst $(SRC)/%.$(EXT),$(OBJ)/%.$(EXTO),$(SRCS))
EXES    := $(patsubst $(SRC)/%.$(EXT),$(OBJ)/%.$(EXTEXE),$(SRCS))

CFLAGS  :=
DEPS 	:= blas.h

.PHONY: all run clean

$(BIN)/%.$(EXTEXE) : $(OBJS) | $(BIN)
	$(CC) -o $@ $< $(CFLAGS)

$(OBJ)/%.o: $(SRC)/%.c $(DEPS) | $(OBJ)
	$(CC) -c -o $@ $< $(CFLAGS)

$(ROOT) :
	$(MKDIR) $@

all : $(EXES)

run : $(EXES)
	./$<

clean :
	$(RMDIR) $(OBJS)
#	$(RMDIR) $(EXES)

