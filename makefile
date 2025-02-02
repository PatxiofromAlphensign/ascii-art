
# compiler name
CPP=g++

# flags
F=-Wall -std=c++11

# binary
BIN=ascii-art.app

# main
MAIN=./src/main.cpp

# headers
H=./src/headers

# library
LIB=./src/lib/bmp_reader.cpp ./src/lib/bmp_header.cpp ./src/lib/bmp_image.cpp ./src/lib/bmp_body.cpp ./src/lib/bmp_process.cpp

LIB_N=libascii_art.a

all: clean compile
clean:
	rm -rf build
	mkdir	build
compile:
	$(CPP) $(F) -o $(BIN) -I$(H) $(MAIN) $(LIB)

$(LIB_N): $(LIB) $(LIB_N) clean_objects
	g++ -c $(F) $(LIB)
	ar rcs $(@) $(shell ls *.o)
clean_objects:
	rm -f *.o
run:
	$(BIN)
valgrind:
	valgrind $(BIN)
run_socrates:
	$(BIN) in/socrates.bmp 1 2 > out/socrates.txt
valgrind_socrates:
	valgrind $(BIN) in/socrates.bmp 1 2 > out/socrates.txt
run_woman:
	$(BIN) in/woman.bmp 4 4 > out/woman.txt
valgrind_woman:
	valgrind $(BIN) in/woman.bmp 4 4 > out/woman.txt
run_js:
	$(BIN) in/js.bmp 4 4 > out/js.txt
valgrind_js:
	valgrind $(BIN) in/js.bmp 4 4 > out/js.txt
mov_to_libs:
