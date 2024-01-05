FILE1 = bmhasrch.c  bmhisrch.c  bmhsrch.c  pbmsrch_small.c 
FILE2 = bmhasrch.c  bmhisrch.c  bmhsrch.c  pbmsrch_large.c 

all: search_small search_large

search_small: ${FILE1} Makefile
	$(INSTRU_TOOL) ${FILE1} $(ASPECT_FILES_C) -Dinline= -o search_small $(LIBACC)

search_large: ${FILE2} Makefile
	$(INSTRU_TOOL) ${FILE2} $(ASPECT_FILES_C) -Dinline= -o search_large $(LIBACC)

clean:
	rm -rf search_small search_large output*
