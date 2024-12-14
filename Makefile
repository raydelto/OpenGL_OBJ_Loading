LIBS = -L. \
	   -L./common/mingw32/lib \
      -lglew32 \
	  -lglfw3 \
	  -lopengl32 \
	  -lgdi32

INCLUDES = -I./common/includes -I./headers

OBJ = Texture2D.o \
	ShaderProgram.o \
	Mesh.o \
	Camera.o

WARNINGS=-w

FLAGS=-std=c++17

all: main.exe

Texture2D.o: src/Texture2D.cpp headers/Texture2D.h
	g++ -c src/Texture2D.cpp $(INCLUDES) $(WARNINGS) $(FLAGS)

ShaderProgram.o: src/ShaderProgram.cpp headers/ShaderProgram.h
	g++ -c src/ShaderProgram.cpp $(INCLUDES) $(WARNINGS) $(FLAGS)

Mesh.o: src/Mesh.cpp headers/Mesh.h
	g++ -c src/Mesh.cpp $(INCLUDES) $(WARNINGS) $(FLAGS)

Camera.o: src/Camera.cpp headers/Camera.h
	g++ -c src/Camera.cpp $(INCLUDES) $(WARNINGS) $(FLAGS)

main.exe: src/main.cpp $(OBJ)
	g++ src/main.cpp $(OBJ) $(LIBS) $(INCLUDES) -o main.exe $(WARNINGS) $(FLAGS)

clean:
	del *.o
	del main.exe
