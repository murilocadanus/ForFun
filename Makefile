OBJS = ./bin/main.o ./bin/SwapChain.o ./bin/PixelBuffer.o ./bin/Bresenham.o ./bin/Vector3.o ./bin/Vector4.o
CC = g++
DEBUG = -g
CFLAGS = -Wall -c $(DEBUG)
LFLAGS = -Wall $(DEBUG)
LIBS = -lSDL -lSDLmain -framework cocoa

all : ForFun

ForFun : $(OBJS)
	$(CC) $(LFLAGS) $(LIBS) $(OBJS) -o bin/ForFun

./bin/Vector4.o: src/Math/Vector4.hpp src/Math/Vector4.cpp
	$(CC) $(CFLAGS) src/Math/Vector4.cpp -o ./bin/Vector4.o

./bin/Vector3.o: src/Math/Vector3.hpp src/Math/Vector3.cpp
	$(CC) $(CFLAGS) src/Math/Vector3.cpp -o ./bin/Vector3.o

./bin/Bresenham.o: src/Renderer/Bresenham.hpp src/Renderer/Bresenham.cpp
	$(CC) $(CFLAGS) src/Renderer/Bresenham.cpp -o ./bin/Bresenham.o

./bin/PixelBuffer.o: src/Renderer/Bresenham.hpp src/Renderer/PixelBuffer.hpp src/Renderer/PixelBuffer.cpp
	$(CC) $(CFLAGS) src/Renderer/PixelBuffer.cpp -o ./bin/PixelBuffer.o

./bin/SwapChain.o: src/Renderer/SwapChain.hpp src/Renderer/PixelBuffer.hpp src/Renderer/SwapChain.cpp
	$(CC) $(CFLAGS) src/Renderer/SwapChain.cpp -o ./bin/SwapChain.o

./bin/main.o : src/Renderer/SwapChain.hpp src/Viewer/main.cpp src/Renderer/Color.hpp
	$(CC) $(CFLAGS) src/Viewer/main.cpp -o ./bin/main.o

clean:
	rm -f ./bin/*.o ./bin/ForFun