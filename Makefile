OBJS = main.o SwapChain.o PixelBuffer.o
CC = g++
DEBUG = -g
CFLAGS = -Wall -c $(DEBUG)
LFLAGS = -Wall $(DEBUG)
LIBS = -lSDL -lSDLmain -framework cocoa

all : ForFun

ForFun : $(OBJS)
	$(CC) $(LFLAGS) $(LIBS) $(HEADERS) $(OBJS) -o ForFun

PixelBuffer.o: src/Renderer/PixelBuffer.hpp src/Renderer/PixelBuffer.cpp
	$(CC) $(CFLAGS) src/Renderer/PixelBuffer.cpp

SwapChain.o: src/Renderer/SwapChain.hpp src/Renderer/PixelBuffer.hpp src/Renderer/SwapChain.cpp
	$(CC) $(CFLAGS) src/Renderer/SwapChain.cpp

main.o : src/Renderer/SwapChain.hpp src/Viewer/main.cpp
	$(CC) $(CFLAGS) src/Viewer/main.cpp

clean:
	rm *.o *~ ForFun