FILE1 = qsort_small.c
FILE2 = qsort_large.c

all: qsort_small qsort_large

qsort_small: qsort_small.c Makefile
	$(INSTRU_TOOL) qsort_small.c $(ASPECT_FILES_C) -Dinline= -o qsort_small -lm $(LIBACC)
qsort_large: qsort_large.c Makefile
	$(INSTRU_TOOL) qsort_large.c $(ASPECT_FILES_C) -Dinline= -o qsort_large -lm $(LIBACC)

clean:
	rm -rf qsort_small qsort_large output*
