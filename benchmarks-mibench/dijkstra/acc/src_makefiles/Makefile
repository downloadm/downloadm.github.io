all:  dijkstra_large dijkstra_small

dijkstra_large: dijkstra_large.c Makefile
	$(INSTRU_TOOL) dijkstra_large.c $(ASPECT_FILES_C) -Dinline= -o dijkstra_large $(LIBACC)

dijkstra_small: dijkstra_small.c Makefile
	$(INSTRU_TOOL) dijkstra_small.c $(ASPECT_FILES_C) -Dinline= -o dijkstra_small $(LIBACC)

clean:
	rm -rf dijkstra_large dijkstra_small output*
