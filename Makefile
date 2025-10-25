#Cursed makefile. Do not modify unless you know what you're doing.
CC := gcc
SRC_DIR := src
OBJ := FORGEWM
OBJ_DIR := /tmp/obj/$(OBJ)
BIN_DIR := bin
EXEC := forge_wm

TARGET ?= linux#Default build platform. 

# The cursed part of this makefile. 
SRC := $(shell find $(SRC_DIR) -name "*.c" )
OBJ := $(patsubst $(SRC_DIR)/%.c, $(OBJ_DIR)/%.o, $(SRC))

# Platform-specific compilation stuff.
#else ifeq ($(TARGET),linux)

OUT := $(BIN_DIR)/$(EXEC)
EXT :=
CFLAGS := -Wall -pedantic -Wpedantic -Wimplicit-function-declaration -Wextra -D$(TARGET) -Isrc
LDFLAGS := -lpthread -lX11

# else
# $(error Unknown target: $(TARGET))
# endif

# Compile && execute for the target platform.
.PHONY: all

all: $(OUT)
	@echo "Build successful :) , executing..."
	@echo "//////////////////////////"
	@echo "--- program output below:"
	@echo "Executing $(OUT) NOW."
	@$(OUT)

# Link step


$(OUT): $(OBJ)
	@mkdir -p $(BIN_DIR)
	$(CC) $(CFLAGS) $^ -o $@ $(LDFLAGS)

# Compile each .c -> .o

$(OBJ_DIR)/%.o: $(SRC_DIR)/%.c
	@mkdir -p $(dir $@)
	$(CC) $(CFLAGS) -c $< -o $@

# Clean build files

.PHONY: clean
clean:
	rm -rf $(OBJ_DIR) $(BIN_DIR)
