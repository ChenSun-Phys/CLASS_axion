#Some Makefile

MDIR := $(shell pwd)
WRKDIR = $(MDIR)/build

.base:
	if ! [ -a $(WRKDIR) ]; then mkdir $(WRKDIR) ; mkdir $(WRKDIR)/lib; fi;
	touch build/.base

vpath %.c source:tools:main:test
vpath %.o build
vpath .base build

CC       = gcc
CCFLAG   = -O2 
INCLUDES = ../include

%.o:  %.c .base
	cd $(WRKDIR);$(CC) $(CCFLAG) -I $(INCLUDES) -c ../$< -o $*.o

TOOLS = growTable.o dei_rkck.o tools_arrays.o

INPUT = input.o

PRECISION = precision.o

BACKGROUND = background.o

THERMO = thermodynamics.o

PERTURBATIONS = perturbations.o 

BESSEL = bessel.o

TRANSFER = transfer.o

PRIMORDIAL = primordial.o

SPECTRA = spectra.o

OUTPUT = output.o

CLASS = class.o

TEST_TRANSFER = test_transfer.o

TEST_BESSEL = test_bessel.o

TEST_PERTURBATIONS = test_perturbations.o

TEST_THERMODYNAMICS = test_thermodynamics.o

TEST_BACKGROUND = test_background.o

class: $(TOOLS) $(PRECISION) $(INPUT) $(BACKGROUND) $(THERMO) $(PERTURBATIONS) $(BESSEL) $(TRANSFER) $(PRIMORDIAL) $(SPECTRA) $(OUTPUT) $(CLASS)
	gcc -o  $@ $(addprefix build/,$(notdir $^)) -lm

test_transfer: $(TOOLS) $(PRECISION) $(INPUT) $(BACKGROUND) $(THERMO) $(PERTURBATIONS) $(BESSEL) $(TRANSFER) $(TEST_TRANSFER)
	gcc -o  $@ $(addprefix build/,$(notdir $^)) -lm

test_bessel: $(TOOLS) $(PRECISION) $(INPUT) $(BACKGROUND) $(THERMO) $(PERTURBATIONS) $(BESSEL) $(TEST_BESSEL)
	gcc -o  $@ $(addprefix build/,$(notdir $^)) -lm

test_bessel: $(TOOLS) $(PRECISION) $(INPUT) $(BACKGROUND) $(THERMO) $(PERTURBATIONS) $(BESSEL) $(TEST_BESSEL)
	gcc -o  $@ $(addprefix build/,$(notdir $^)) -lm

test_perturbations: $(TOOLS) $(PRECISION) $(INPUT) $(BACKGROUND) $(THERMO) $(PERTURBATIONS) $(TEST_PERTURBATIONS)
	gcc -o  $@ $(addprefix build/,$(notdir $^)) -lm

test_thermodynamics: $(TOOLS) $(PRECISION) $(INPUT) $(BACKGROUND) $(THERMO) $(TEST_THERMODYNAMICS)
	gcc -o  $@ $(addprefix build/,$(notdir $^)) -lm

test_background: $(TOOLS) $(PRECISION) $(INPUT) $(BACKGROUND) $(TEST_BACKGROUND)
	gcc -o  $@ $(addprefix build/,$(notdir $^)) -lm

clean: .base
	rm -rf $(WRKDIR);