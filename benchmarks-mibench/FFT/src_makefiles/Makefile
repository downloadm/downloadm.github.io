OBJ = main.o fftmisc.o  fourierf.o
FILE = main.c fftmisc.c  fourierf.c

all: fft

fft: ${OBJ} Makefile
	$(INSTRU_TOOL) ${OBJ} -o fft -lm
fftmisc.o: fftmisc.c
	$(INSTRU_TOOL) -c fftmisc.c
fourierf.o: fourierf.c
	$(INSTRU_TOOL) -c fourierf.c
main.o: main.c
	$(INSTRU_TOOL) -c main.c

clean:
	rm -rf *.o fft output*
