OBJ = main.o fftmisc.o  fourierf.o
FILE = main.c fftmisc.c  fourierf.c

all: fft

%.o: %.c
	$(INSTRU_TOOL) -Dinline= -c $^

fft: ${OBJ} Makefile $(ASPECT_FILES_O)
	$(INSTRU_TOOL) ${OBJ} $(ASPECT_FILES_O) -o fft -lm $(LIBACC)

fftmisc.o: fftmisc.c
	$(INSTRU_TOOL) -c fftmisc.c
fourierf.o: fourierf.c
	$(INSTRU_TOOL) -c fourierf.c
main.o: main.c
	$(INSTRU_TOOL) -c main.c

clean:
	rm -rf *.o fft output*
