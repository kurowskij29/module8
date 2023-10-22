All: calcSpeed 
LIB=libConversions.o
CC=gcc


calcSpeed: calcSpeed.o $(LIB)
	$(CC) $@.o $(LIB) -g -o $@

.s.o:
	$(CC) $(@:.o=.s) -g -c -o $@
