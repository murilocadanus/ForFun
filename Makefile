OBJS = main.o SwapChain.o PixelBuffer.o Bresenham.o Vector3.o Vector4.o
CC = g++
DEBUG = -g
CFLAGS = -Wall -c $(DEBUG)
LFLAGS = -Wall $(DEBUG)
LIBS = -lSDL -lSDLmain -framework cocoa

all : ForFun

ForFun : $(OBJS)
	$(CC) $(LFLAGS) $(LIBS) $(HEADERS) $(OBJS) -o ForFun

Vector4.o: src/Math/Vector4.hpp src/Math/Vector4.cpp
	$(CC) $(CFLAGS) src/Math/Vector4.cpp

Vector3.o: src/Math/Vector3.hpp src/Math/Vector3.cpp
	$(CC) $(CFLAGS) src/Math/Vector3.cpp

Bresenham.o: src/Renderer/Bresenham.hpp src/Renderer/Bresenham.cpp
	$(CC) $(CFLAGS) src/Renderer/Bresenham.cpp

PixelBuffer.o: src/Renderer/Bresenham.hpp src/Renderer/PixelBuffer.hpp src/Renderer/PixelBuffer.cpp
	$(CC) $(CFLAGS) src/Renderer/PixelBuffer.cpp

SwapChain.o: src/Renderer/SwapChain.hpp src/Renderer/PixelBuffer.hpp src/Renderer/SwapChain.cpp
	$(CC) $(CFLAGS) src/Renderer/SwapChain.cpp

main.o : src/Renderer/SwapChain.hpp src/Viewer/main.cpp src/Renderer/Color.hpp src/Math/Vector3.hpp
	$(CC) $(CFLAGS) src/Viewer/main.cpp

clean:
	rm *.o ForFun