all: patricia

patricia: patricia.c patricia_test.c
	$(INSTRU_TOOL) patricia.c patricia_test.c -o patricia

clean:
	rm -rf patricia output*
