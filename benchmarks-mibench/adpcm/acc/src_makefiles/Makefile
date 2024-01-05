#
# Makefile for adpcm and test programs
# -------------------

#####################################################################
# Added by C. Lee.
#
# On Sun machines, gcc need to be informed whether the machines have
# integer multipliers by specifying this option: -mv8.
#
# Also, on Sun machines, in order to use the SPIXTOOLS and SHADE,
# uncomment this option: -static.
#
CC = $(INSTRU_TOOL)
LFLAGS = -mv8
LFLAGS = $(LFLAGS) -static
#
# End of addition
######################################################################
# CFLAGS = -static -O3

# May need this on a sun:
# CFLAGS=-O -I/usr/demo/SOUND

ALLSRC=README adpcm.2 Makefile adpcm.h libst.h adpcm.c timing.c rawcaudio.c \
	rawdaudio.c suncaudio.c sgicaudio.c sgidaudio.c hello.adpcm.uu

all: adpcm.o rawcaudio rawdaudio timing

sgi: all sgicaudio sgidaudio

sun: all suncaudio sundaudio

%.o: %.c
	$(CC) $(CFLAGS) -Dinline= -c $^

suncaudio: suncaudio.o adpcm.o
	$(CC) adpcm.o suncaudio.o -o suncaudio -L/usr/demo/SOUND -laudio

sundaudio: suncaudio
	cp suncaudio sundaudio

sgicaudio: sgicaudio.o adpcm.o
	$(CC) sgicaudio.o adpcm.o -o sgicaudio -laudiofile -lm

sgidaudio: sgidaudio.o adpcm.o
	$(CC) sgidaudio.o adpcm.o -o sgidaudio -laudiofile -lm

rawcaudio: rawcaudio.o adpcm.o $(ASPECT_FILES_O)
	$(CC) $(CFLAGS) rawcaudio.o adpcm.o $(ASPECT_FILES_O) -o rawcaudio $(LIBACC)

rawdaudio: rawdaudio.o adpcm.o $(ASPECT_FILES_O)
	$(CC) $(CFLAGS) rawdaudio.o adpcm.o $(ASPECT_FILES_O) -o rawdaudio $(LIBACC)

timing: timing.o adpcm.o $(ASPECT_FILES_O)
	$(CC) $(CFLAGS) timing.o adpcm.o $(ASPECT_FILES_O) -o timing $(LIBACC)

adpcm.shar: $(ALLSRC)
	shar $(ALLSRC) > adpcm.shar

# Added by C. Lee
clean:
	rm -f *.o ; rm -f rawcaudio rawdaudio timing ; rm -f output*
