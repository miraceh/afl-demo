# Compiler settings
CC=afl-clang-fast
CXX=afl-clang-fast++

# Target program
TARGET=demo
SRC=demo.cpp

# Compilation options
CXXFLAGS=-O2 -g
LDFLAGS=

.PHONY: build fuzz clean seeds check

# Check if AFL++ is installed
check:
	@which afl-fuzz >/dev/null 2>&1 && afl-fuzz --version || { echo "AFL++ is not installed. Please install AFL++ first!"; exit 1; }

# Build the target program (checks AFL++ first)
build: check $(SRC)
	$(CXX) $(CXXFLAGS) $(LDFLAGS) -o $(TARGET) $(SRC)

# Run AFL++ fuzzing
fuzz: build
	afl-fuzz -t 1500 -i seeds -o output -- ./$(TARGET)

# Generate seed files
seeds:
	mkdir -p seeds
	dd if=/dev/urandom of=seeds/seed_0 bs=64 count=10
	dd if=/dev/urandom of=seeds/seed_1 bs=64 count=10
	dd if=/dev/urandom of=seeds/seed_2 bs=64 count=10
	dd if=/dev/urandom of=seeds/seed_3 bs=64 count=10

# Remove and regenerate seed files
reseeds:
	rm -rf seeds && make seeds

# Clean generated files
clean:
	rm -f $(TARGET)
	rm -rf output seeds
