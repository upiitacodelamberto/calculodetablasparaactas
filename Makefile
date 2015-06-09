INCLUDE_DIRS:= ./include
SOURCE_DIRS:= ./src ./asignatura 

CFILESCOMMON:= main.cpp Grupo.cpp
CFILESCIRCINTAN:= circuitosintegradosanalogicos.cpp
CFILESSIGNALSANDSYSTEMS:= signalsandsystems.cpp
#ASM_FILES:= startup_ARMCM4.S

INCLUDE_FLAGS:=$(patsubst %,-I%,$(INCLUDE_DIRS)) 
#TCHIP=TM4C123GH6PM
#CC=arm-none-eabi-gcc
#CC=avr-gcc
##CC=gcc
CC=g++
#OBJCOPY = avr-objcopy
#OBJDUMP = avr-objdump

#CFLAGS=-mthumb -mcpu=cortex-m4 -mfloat-abi=hard -mfpu=fpv4-sp-d16 -std=c99 -g -Wall
#CFLAGS=-mthumb -mmcu=atmega32 -mfloat-abi=hard -mfpu=fpv4-sp-d16 -std=c99 -g -Wall
#CFLAGS=-mmcu=atmega32 -std=c99 -g -Wall
##CFLAGS=-mmcu=atmega32 -std=gnu99 -g -Wall
#CFLAGS=-std=gnu99 -g -Wall
#CFLAGS=-std=c99 -g -Wall
CFLAGS=-g -Wall

#CPPFLAGS= $(INCLUDE_FLAGS) -D$(TCHIP)
#CPPFLAGS= $(INCLUDE_FLAGS) -D__AVR_LIBC_DEPRECATED_ENABLE__
CPPFLAGS= $(INCLUDE_FLAGS)
vpath %.h $(INCLUDE_DIRS)
vpath %.cpp *.o $(SOURCE_DIRS)
#vpath %.S device/source
#vpath %.o objects

COBJECTSCOMMON:= $(patsubst %.cpp,%.o,$(CFILESCOMMON))
COBJECTSCIRCINTAN:= $(patsubst %.cpp,%.o,$(CFILESCIRCINTAN))
COBJECTSSIGNALSANDSYSTEMS:= $(patsubst %.cpp,%.o,$(CFILESSIGNALSANDSYSTEMS))
#ASMOBJECTS:= $(patsubst %.S,%.o,$(ASM_FILES))

all:  circintan.out 
#all: circintan.out signalsandsystems.out

#objects:
#	mkdir objects
$(COBJECTSCOMMON):  %.o: %.cpp
	mkdir -p objectscommon
	$(CC) $(CFLAGS) $(CPPFLAGS) -c $< -o objectscommon/$@
$(COBJECTSCIRCINTAN): circuitosintegradosanalogicos.cpp
	mkdir -p objectscircuitosintegradosanalogicos
	$(CC) $(CFLAGS) $(CPPFLAGS) -c $< -o objectscircuitosintegradosanalogicos/$@
$(COBJECTSSIGNALSANDSYSTEMS): signalsandsystems.cpp
	mkdir -p objectssignalsandsystems
	$(CC) $(CFLAGS) $(CPPFLAGS) -c $< -o objectssignalsandsystems/$@


circintan.out: $(COBJECTSCOMMON) $(COBJECTSCIRCINTAN)
	mkdir -p bin
	$(CC) objectscommon/*.o objectscircuitosintegradosanalogicos/*.o -o bin/$@
signalsandsystems.out: $(COBJECTSCOMMON) $(COBJECTSSIGNALSANDSYSTEMS)
	$(CC) objectscommon/*.o objectssignalsandsystems/*.o -o bin/$@


.PHONY: clean rebuild 
clean:
	rm -fv bin/*
#	rm -frv objectscommon/*.o objectssotr/*.o objectsprogavanzada/*.o
	rm -frv objectscommon/*.o objectscircuitosintegradosanalogicos/*.o 
	rm -frv objectssignalsandsystems/*.o
	rm -rv objectscommon/ objectscircuitosintegradosanalogicos/
	rm -rv objectssignalsandsystems/

rebuild: clean all

