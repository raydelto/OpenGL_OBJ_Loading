UNAME_S := $(shell uname -s)

LIBS = -L. \
	   -L./common/mingw32/lib \
      -lglew32 \
	  -lglfw3 \
	  -lopengl32 \
	  -lgdi32

INCLUDES = -I./common/includes -I./headers

OBJ = stb_image.o \
 	Texture2D.o \
	ShaderProgram.o \
	Mesh.o \
	Camera.o

WARNINGS=-Wall

FLAGS=-std=c++17

all: main

stb_image.o: third-party-source-code/stb_image.cpp
	g++ -c third-party-source-code/stb_image.cpp $(INCLUDES) $(FLAGS)

main: src/main.cpp $(OBJ)
	g++ src/main.cpp $(OBJ) $(LIBS) $(INCLUDES) -o main $(WARNINGS) $(FLAGS)

Texture2D.o: src/Texture2D.cpp headers/Texture2D.h
	g++ -c src/Texture2D.cpp $(INCLUDES) $(WARNINGS) $(FLAGS)

ShaderProgram.o: src/ShaderProgram.cpp headers/ShaderProgram.h
	g++ -c src/ShaderProgram.cpp $(INCLUDES) $(WARNINGS) $(FLAGS)

Mesh.o: src/Mesh.cpp headers/Mesh.h
	g++ -c src/Mesh.cpp $(INCLUDES) $(WARNINGS) $(FLAGS)

Camera.o: src/Camera.cpp headers/Camera.h
	g++ -c src/Camera.cpp $(INCLUDES) $(WARNINGS) $(FLAGS)

ifeq ($(UNAME_S),Darwin)
FRAMEWORKS=-framework OpenGL

LIBS= -L/opt/homebrew/opt/glfw/lib \
	  -lglfw

INCLUDES=-I./headers \
		-I/opt/homebrew/opt/glfw/include \
		-I./common/includes \
		-I/usr/local/include


SRC=third-party-source-code/glad.c
OBJ+=glad.o

glad.o: third-party-source-code/glad.c
	gcc -c third-party-source-code/glad.c $(INCLUDES) $(WARNINGS)

clean:
	rm -f *.o
	rm -f main
else

clean:
	del *.o
	del main.exe
endif
