SRCS  := $(wildcard *.asm)
EXECS := $(SRCS:.asm=)
ZIP:= sources.zip


all: $(EXECS) $(SRCS)

%: %.o
	ld -o $@ $<

%.o: %.asm
	yasm -f elf64 -g dwarf2 $< -o $@

zip:
	zip -j $(ZIP) $(SRCS) makefile 

clean:
	rm -f *.o $(EXECS) $(ZIP)