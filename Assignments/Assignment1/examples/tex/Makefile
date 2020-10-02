TEXCC	:= pdflatex
BIBCC	:= bibtex
MKDIR 	:= mkdir -p
RMDIR 	:= rm -rf
MVDIR 	:= mv
ODIR 	:= qpdfview --unique
ROOT 	:= .
FILE	:= 
SRC 	:= $(ROOT)/src
BIN		:= $(ROOT)
BUILD	:= $(ROOT)/build
CFLAGS  := --shell-escape
SRCS    := $(wildcard $(SRC)/$(FILE)*.tex)
BINS    := $(patsubst $(SRC)/%.tex,$(BIN)/%.pdf,$(SRCS))
INIT	:= export BIBINPUTS=$(SRC); export BSTINPUT=$(BUILD); export TEXMFOUTPUT=$(BUILD);
# OBJS    := $(patsubst $(SRC)/%.tex,$(OBJ)/%.o,$(SRCS))
# EXES    := $(patsubst $(SRC)/%.c,$(OBJ)/%.out,$(SRCS))
#DEPS = hellomake.h

#%.o: %.c $(DEPS)
#	$(CC) -c -o $@ $< $(CFLAGS)

.PHONY: all run clean

$(BIN)/%.pdf : $(SRC)/%.tex $(BUILD)/%.bbl | $(BUILD) $(BIN)
	@echo $<  
	@echo $(basename $<)
	@echo $(patsubst $(SRC)/%.tex,%.pdf,$<)
	@echo $(addprefix $(SRC)/%,.bib .cls .bst)
	for i in 1 2 3; do \
		$(INIT) $(TEXCC) -output-directory $(BUILD) $(basename $<); \
		$(INIT) $(BIBCC) $(patsubst $(SRC)/%.tex,$(BUILD)/%.tex,$<); \
	done

$(BUILD)/%.bbl : $(BUILD)/%.aux $(SRC)/%.bib
	$(INIT) $(BIBCC) $(patsubst $(SRC)/%.tex,$(BUILD)/%.tex,$<)
	

# 	$(MVDIR) $(patsubst $(BUILD)/%.pdf,$(BIN)/%.pdf,$@) $@


# $(BIN)/%.tex : $(SRC)/$(addsuffix .bib .cls .bst,%)

$(BIN) $(BUILD):
	$(MKDIR) $@

all : $(BINS)
	@echo $(BINS)
	@echo $(SRCS)

run : $(BIN)%/.pdf
	$(ODIR) $<
# clean :
# 	$(RMDIR) $(BUILD)/*
