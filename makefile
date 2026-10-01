# Compiler and Assembler settings
CC      := gcc
ASM     := yasm
CFLAGS  := -Wall -Wextra -O2
ASMFLAGS := -f elf64  # Use -f win64 for Windows, -f macho64 for macOS

# Target executable name
TARGET  := my_program

# Source files
C_SRCS   := main.c
ASM_SRCS := $(wildcard *.asm)

# Object files (placed in current directory)
C_OBJS   := $(C_SRCS:.c=.o)
ASM_OBJS := $(ASM_SRCS:.asm=.o)
OBJS     := $(C_OBJS) $(ASM_OBJS)


ZIP:= sources.zip

run: $(TARGET)
	./$(TARGET)

# Default rule: Build the executable
all: $(TARGET)

# Rule to link object files into the final executable
$(TARGET): $(OBJS)
	$(CC) $(CFLAGS) -o $@ $(OBJS)
	

# Rule to compile C source files to object files
%.o: %.c
	$(CC) $(CFLAGS) -c $< -o $@

# Rule to assemble Assembly source files to object files
%.o: %.asm
	$(ASM) $(ASMFLAGS) $< -o $@


zip:
	zip -j $(ZIP) $(ASM_SRCS) makefile 

# Clean rule to remove generated files
clean:
	rm -f $(OBJS) $(TARGET) $(ZIP)

# Declare non-file targets
.PHONY: all clean