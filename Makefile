##
## @file Makefile
##
## simple hellow world for cmocka Unit testing
##
## @author Dennis Addo ic16b026@technikum-wien.at
## @date 27/11/2017.
##
##
##
## Last Modified: $Author: Dennis $
##

##
## ------------------------------------------------------------- variables --
##


CC=gcc
CFLAGS=-DDEBUG -Wall -pedantic -Werror -Wextra -Wstrict-prototypes \
		-Wwrite-strings -fno-common -g -O3 -std=gnu11
CP=cp
CD=cd
MV=mv
GREP=grep
DOXYGEN=doxygen
OBJECTS1=helloCmocka.o


EXCLUDE_PATTERN=footrulewidth

##
## ----------------------------------------------------------------- rules --
##


%.o: %.c
	$(CC) $(CFLAGS) -c $<

##
## --------------------------------------------------------------- targets --
##

.PHONY: all
.DEFAULT_GAOL	:=all

all: helloCmocka

helloCmocka: $(OBJECTS1)
	$(CC) $^ -o $@ -lcmocka


.SILENT: clean freeshm
.PHONY: clean freeshm testall

##test all with force

cmock-install:
	xz -vv cmocka-1.1.0.tar
    tar vxf cmocka-1.1.0.tar
    cd cmocka-1.1.0
    mkdir build
    cd build
    cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release ..
    make
    sudo make install

testall:
	./helloCmocka

clean:
	$(RM) *.o *.d *~ helloCmocka

.PHONY: distclean

distclean: clean
	$(RM) -r build
