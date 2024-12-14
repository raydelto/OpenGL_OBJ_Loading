LIBS = -L. \
	   -L./lib \
	   -L./common/mingw32/lib \
      -lglew32\
	  -lglfw3 \
	  -lopengl32 \
	  -lgdi32

INCLUDES = -I./common/mingw32/includes -I./headers

SRC = src/Texture2D.cpp \
	src/ShaderProgram.cpp \
	src/Mesh.cpp \
	src/Camera.cpp \
	src/main.cpp

OBJ = Texture2D.o \
	ShaderProgram.o \
	Mesh.o \
	Camera.o \
	main.o

WARNINGS=-w

FLAGS=-std=c++17

all:
	g++ -c $(SRC) $(INCLUDES) $(WARNINGS) $(FLAGS)
	g++ $(OBJ) $(LIBS) $(INCLUDES) -o main.exe $(WARNINGS) $(FLAGS)

clean:
	rm -f *.o
	rm -f main.exe
