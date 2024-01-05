all: patricia

patricia: patricia.c patricia_test.c
	$(INSTRU_TOOL) patricia.c patricia_test.c $(ASPECT_FILES_C) -Dinline= -o patricia $(LIBACC)

clean:
	rm -rf patricia output*
