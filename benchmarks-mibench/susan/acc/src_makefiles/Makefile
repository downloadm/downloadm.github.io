all: susan

susan: susan.c
	$(INSTRU_TOOL) -o susan susan.c $(ASPECT_FILES_C) -Dinline= -lm $(LIBACC)

clean:
	rm -rf susan output*
