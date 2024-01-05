all: rijndael

rijndael: aes.c aes.h aestab.h aesxam.c Makefile
	$(INSTRU_TOOL) -o rijndael aes.c aesxam.c $(ASPECT_FILES_C) -Dinline= $(LIBACC)

clean:
	rm -rf *.o rijndael output*
