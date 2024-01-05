all: crc

crc: crc_32.c Makefile
	$(INSTRU_TOOL) crc_32.c -o crc 

clean:
	rm -rf crc output*
