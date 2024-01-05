FILE1 = basicmath_small.c   rad2deg.c  cubic.c   isqrt.c
FILE2 = basicmath_large.c   rad2deg.c  cubic.c   isqrt.c

all: basicmath_small basicmath_large

basicmath_small: ${FILE1} Makefile
	$(INSTRU_TOOL) ${FILE1} $(ASPECT_FILES_C) -Dinline= -o basicmath_small -lm $(LIBACC)
basicmath_large: ${FILE2} Makefile
	$(INSTRU_TOOL) ${FILE2} $(ASPECT_FILES_C) -Dinline= -o basicmath_large -lm $(LIBACC)

clean:
	rm -rf basicmath_small basicmath_large output*
