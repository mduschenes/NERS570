CC 	:= g++
MKDIR 	:= mkdir -p
RMDIR 	:= rm -rf
ROOT 	:= .
FILE	:= main
SRC 	:= $(ROOT)
OBJ 	:= $(ROOT)
BIN		:= $(ROOT)
INCLUDE := $(ROOT)
EXTSRC	:= cpp
EXTDEP	:= hpp
EXTOBJ	:= o
EXTEXE	:= out

SRCS    := $(wildcard $(SRC)/$(FILE)*.$(EXTSRC)) 
DEPS	:= physics
DEPS    := $(patsubst %,$(SRC)/%.$(EXTDEP),$(DEPS))

# SRCS 	:= $(filter-out $(patsubst $(SRC)/%.$(EXTDEP),$(OBJ)/%.$(EXT),$(DEPS)),$(SRCS))
SRCSDEPS:= $(patsubst $(SRC)/%.$(EXTDEP),$(SRC)/%.$(EXTSRC),$(DEPS))
OBJS    := $(patsubst $(SRC)/%.$(EXTSRC),$(OBJ)/%.$(EXTOBJ),$(SRCS))
OBJSDEPS:= $(patsubst $(SRC)/%.$(EXTSRC),$(OBJ)/%.$(EXTOBJ),$(SRCSDEPS))
EXES    := $(patsubst $(SRC)/%.$(EXTSRC),$(OBJ)/%.$(EXTEXE),$(SRCS))

CFLAGS  :=
CFLAGSF	:=

#%.o: %.$(EXT) $(DEPS)
#	$(CC) -c -o $@ $< $(CFLAGS)

# If the first argument is "run"...
ifeq (run,$(firstword $(MAKECMDGOALS)))
  # use the rest as arguments for "run"
  RUN_ARGS := $(wordlist 2,$(words $(MAKECMDGOALS)),$(MAKECMDGOALS))
  # ...and turn them into do-nothing targets
  $(eval $(RUN_ARGS):;@:)
endif


.PHONY: all run clean


$(BIN)/%.$(EXTEXE) : $(OBJ)/%.$(EXTOBJ) $(OBJSDEPS) | $(BIN) #$(OBJSDEPS)
	$(CC) -o $@ $^ $(CFLAGS)

$(OBJ)/%.$(EXTOBJ): $(SRC)/%.$(EXTSRC) | $(OBJ)
	$(CC) -c -o $@ $< $(CFLAGS)

$(ROOT) :
	$(MKDIR) $@

all : $(EXES)

run : $(EXES)
	./$< $(RUN_ARGS)

clean :
	$(RMDIR) $(OBJS)
	$(RMDIR) $(EXES)
