all: rijndael

rijndael: aes.c aes.h aestab.h aesxam.c Makefile
	$(INSTRU_TOOL) -o rijndael aes.c aesxam.c

clean:
	rm -rf *.o rijndael output*
