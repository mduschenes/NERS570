CC 		:= g++
CC_STATIC	:= ar
MKDIR 	:= mkdir -p
RMDIR 	:= rm -rf
ROOT 	:= .
FILESRC	:= 
FILESTATIC	:= libstatic
FILESHARED	:= libshared
SRC 	:= $(ROOT)
OBJ 	:= $(ROOT)
BIN		:= $(ROOT)
INCLUDE := $(ROOT)
EXT		:= cpp
EXTDEP	:= cpp
EXTOBJ	:= o
EXTEXE	:= out
EXTSTATIC	:=ar
EXTSHARED	:=so


SRCS    := $(wildcard $(SRC)/$(FILESRC)*.$(EXT)) 
DEPS 	:= tensor matrix QR
EXES	:= pde
DEPS    := $(patsubst %,$(SRC)/%.$(EXTDEP),$(DEPS))
OBJS    := $(patsubst $(SRC)/%.$(EXT),$(OBJ)/%.$(EXTOBJ),$(SRCS))
EXES    := $(patsubst %,$(OBJ)/%.$(EXTEXE),$(EXES))

CFLAGS  	:=
CLIBFLAGS	:= -fPIC
STATICFLAGS		:= -rcs

# If the first argument is "run"...
ifeq (run,$(firstword $(MAKECMDGOALS)))
  # use the rest as arguments for "run"
  RUN_ARGS := $(wordlist 2,$(words $(MAKECMDGOALS)),$(MAKECMDGOALS))
  # ...and turn them into do-nothing targets
  $(eval $(RUN_ARGS):;@:)
endif


.PHONY: all run clean

$(BIN)/%.$(EXTEXE) : $(OBJ)/%.$(EXTOBJ) $(DEPS) | $(BIN) 
	@echo $(DEPS)
	$(CC) -o $@ $^ $(CFLAGS)

$(OBJ)/%.$(EXTOBJ): $(SRC)/%.$(EXT) | $(OBJ)

	$(CC) -c -o $@ $^ $(CFLAGS)

$(ROOT) :
	$(MKDIR) $@

all : $(EXES)
	@echo $(OBJS)

run : $(EXES)
	./$< $(RUN_ARGS)


# run : main.$(EXTEXE)
# 	./$< $(RUN_ARGS)

clean :
#	$(RMDIR) $(OBJS)
#	$(RMDIR) $(EXES)
