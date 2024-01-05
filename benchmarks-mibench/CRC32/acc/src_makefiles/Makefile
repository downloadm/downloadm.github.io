all: crc

crc: crc_32.c Makefile
	$(INSTRU_TOOL) crc_32.c $(ASPECT_FILES_C) -Dinline= -o crc $(LIBACC)

clean:
	rm -rf crc output*
