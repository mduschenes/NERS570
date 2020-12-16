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
DEPS	:= physics io
DEPS    := $(patsubst %,$(SRC)/%.$(EXTDEP),$(DEPS))

# SRCS 	:= $(filter-out $(patsubst $(SRC)/%.$(EXTDEP),$(OBJ)/%.$(EXT),$(DEPS)),$(SRCS))
SRCSDEPS:= $(patsubst $(SRC)/%.$(EXTDEP),$(SRC)/%.$(EXTSRC),$(DEPS))
OBJS    := $(patsubst $(SRC)/%.$(EXTSRC),$(OBJ)/%.$(EXTOBJ),$(SRCS))
OBJSDEPS:= $(patsubst $(SRC)/%.$(EXTSRC),$(OBJ)/%.$(EXTOBJ),$(SRCSDEPS))
EXES    := $(patsubst $(SRC)/%.$(EXTSRC),$(OBJ)/%.$(EXTEXE),$(SRCS))

CFLAGS  := -fopenmp
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


# If the first argument is "plot"...
ifeq (plot,$(firstword $(MAKECMDGOALS)))
  # use the rest as arguments for "run"
  RUN_ARGS := $(wordlist 2,$(words $(MAKECMDGOALS)),$(MAKECMDGOALS))
  # ...and turn them into do-nothing targets
  $(eval $(RUN_ARGS):;@:)
endif


.PHONY: all run plot clean


$(BIN)/%.$(EXTEXE) : $(OBJ)/%.$(EXTOBJ) $(OBJSDEPS) | $(BIN) #$(OBJSDEPS)
	$(CC) -o $@ $^ $(CFLAGS)

$(OBJ)/%.$(EXTOBJ): $(SRC)/%.$(EXTSRC) | $(OBJ)
	$(CC) -c -o $@ $< $(CFLAGS)

$(ROOT) :
	$(MKDIR) $@

all : $(EXES)

run : $(EXES)
	./$< $(RUN_ARGS)

plot : run
	./plot.sh $(RUN_ARGS)
# 	./plot.py "data_d2_n100_q2_T1.000000_J-1.000000.csv" plot_energy_T1.pdf plot.json plot.mplstyle "energy_mean" "null"
# 	./plot.py "data_d2_n100_q2_T1.000000_J-1.000000.csv" plot_order_T1.pdf plot.json plot.mplstyle "order_mean" "null"

# 	./plot.py "data_d2_n100_q2_T5.000000_J-1.000000.csv" plot_energy_T5.pdf plot.json plot.mplstyle "energy_mean" "null"
# 	./plot.py "data_d2_n100_q2_T5.000000_J-1.000000.csv" plot_order_T5.pdf plot.json plot.mplstyle "order_mean" "null"

# 	./plot.py "data_d2_n100_q2_T1.134593_J-1.000000.csv" plot_energy_T1-134593.pdf plot.json plot.mplstyle "energy_mean" "null"
# 	./plot.py "data_d2_n100_q2_T1.134593_J-1.000000.csv" plot_order_T1-134593.pdf plot.json plot.mplstyle "order_mean" "null"	

clean :
	@echo
	$(RMDIR) $(OBJS)
	$(RMDIR) $(EXES)
