All: calcSpeed testConverts
LIB=libConversions.o
CC=gcc


calcSpeed: calcSpeed.o $(LIB)
	$(CC) $@.o $(LIB) -g -o $@

testConverts: testConverts.o $(LIB)
	$(CC) $@.o $(LIB) -g -o $@


.s.o:
	$(CC) $(@:.o=.s) -g -c -o $@
