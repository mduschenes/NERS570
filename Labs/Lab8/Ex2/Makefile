CC 		:= gcc
CC1 		:= g++
MKDIR 	:= mkdir -p
RMDIR 	:= rm -rf
ROOT 	:= .
FILE	:= 
EXT	:= c
EXT1	:= cpp
EXTO	:= o
EXTEXE	:= out
SRC 	:= $(ROOT)
OBJ 	:= $(ROOT)
BIN	:= $(ROOT)
INCLUDE := $(ROOT)
SRCS    := $(wildcard $(SRC)/$(FILE)*.$(EXT))
SRCS1    := $(wildcard $(SRC)/$(FILE)*.$(EXT1))
OBJS    := $(patsubst $(SRC)/%.$(EXT),$(OBJ)/%.$(EXTO),$(SRCS))
OBJS1    := $(patsubst $(SRC)/%.$(EXT1),$(OBJ)/%.$(EXTO),$(SRCS1))
EXES    := $(patsubst $(SRC)/%.$(EXT),$(OBJ)/%.$(EXTEXE),$(SRCS))
EXES1    := $(patsubst $(SRC)/%.$(EXT1),$(OBJ)/%.$(EXTEXE),$(SRCS1))

#CFLAGS  := -lblas
#CFLAGS  := -lopenblas
#CFLAGS  := -lmkl
CFLAGS  := -mavx2 -mfma -Ofast -funroll-loops 
DEPS 	:= 
DEPS1	:= blas.h

.PHONY: all run clean

# If the first argument is "run"...
ifeq (run,$(firstword $(MAKECMDGOALS)))
  # use the rest as arguments for "run"
  RUN_ARGS := $(wordlist 2,$(words $(MAKECMDGOALS)),$(MAKECMDGOALS))
  # ...and turn them into do-nothing targets
  $(eval $(RUN_ARGS):;@:)
endif

$(BIN)/%.$(EXTEXE) : $(OBJS) | $(BIN)
	$(CC) -o $@ $< $(CFLAGS)

$(OBJ)/%.o: $(SRC)/%.c $(DEPS) | $(OBJ)
	$(CC) -c -o $@ $< $(CFLAGS)

$(OBJ)/%.s: $(SRC)/%.c $(DEPS) | $(OBJ)
	$(CC) -S -o $@ $< $(CFLAGS)

$(ROOT) :
	$(MKDIR) $@

all : $(EXES)

run : $(EXES)
	./$< $(RUN_ARGS)

assemble : 
clean :
	$(RMDIR) $(OBJS)
#	$(RMDIR) $(EXES)

