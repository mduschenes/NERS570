CC 		:= g++
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

#CFLAGS  := -lblas
#CFLAGS  := -lopenblas
CFLAGS  := -lmkl
DEPS 	:= blas.h

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

$(ROOT) :
	$(MKDIR) $@

all : $(EXES)

run : $(EXES)
	./$< $(RUN_ARGS)

clean :
	$(RMDIR) $(OBJS)
#	$(RMDIR) $(EXES)

