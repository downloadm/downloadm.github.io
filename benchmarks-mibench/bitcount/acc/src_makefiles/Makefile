FILE = bitcnt_1.c bitcnt_2.c bitcnt_3.c bitcnt_4.c bitcnts.c bitfiles.c bitstrng.c bstr_i.c 

all: bitcnts

bitcnts: ${FILE} Makefile
	$(INSTRU_TOOL) ${FILE} $(ASPECT_FILES_C) -Dinline= -o bitcnts $(LIBACC)

clean:
	rm -rf bitcnts output*
