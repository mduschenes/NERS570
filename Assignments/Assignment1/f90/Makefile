CC 	:= gcc
CCF	:= gfortran
MKDIR 	:= mkdir -p
RMDIR 	:= rm -rf
ROOT 	:= .
FILE	:= 
SRC 	:= $(ROOT)
OBJ 	:= $(ROOT)
BIN		:= $(ROOT)
INCLUDE := $(ROOT)
EXT		:= c
EXTF	:= f90
EXTDEP	:= h
SRCS    := $(wildcard $(SRC)/$(FILE)*.$(EXT)) 
SRCSF	:= $(wildcard $(SRC)/$(FILE)*.$(EXTF))
OBJS    := $(patsubst $(SRC)/%.$(EXT),$(OBJ)/%.o,$(SRCS))
OBJSF	:= $(patsubst $(SRC)/%.$(EXTF),$(OBJ)/%.o,$(SRCSF))
EXES    := $(patsubst $(SRC)/%.$(EXT),$(OBJ)/%.out,$(SRCS))
EXESF   := $(patsubst $(SRC)/%.$(EXTF),$(OBJ)/%.out,$(SRCSF))

CFLAGS  :=
CFLAGSF	:=
DEPS = 

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

$(BIN)/%.out : $(OBJSF) | $(BIN)
	$(CCF) -o $@ $^ $(CFLAGSF)

$(OBJ)/%.o: $(SRC)/%.$(EXTF) | $(OBJ)
	$(CCF) -c -o $@ $< $(CFLAGSF)

# $(BIN)/%.out : $(OBJS) | $(BIN)
# 	$(CC) -o $@ $< $(CFLAGS)

# $(OBJ)/%.o: $(SRC)/%.$(EXT) | $(OBJ)
# 	$(CC) -c -o $@ $< $(CFLAGS)

$(ROOT) :
	$(MKDIR) $@

all :$(EXESF)
	@echo $(EXESF)
	@echo 
run : $(EXESF)
	./$< $(RUN_ARGS)

clean :
	$(RMDIR) $(OBJS)
	$(RMDIR) $(EXES)
