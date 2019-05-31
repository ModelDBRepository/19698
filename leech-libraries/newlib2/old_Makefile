# $Id: Libmake,v 1.6 1995/11/13 19:24:26 dhb Exp $
# ============================================
#
# Makefile for creating a new user library
#
# It is recommended that each library have its own makefile and
# its own subdirectory for clarity of organization.
# This subdirectory should contain all of the object files
# needed to compile the library as well as all header files,
# support files, and the script file for loading the library (e.g. userlib.g).
#
# The user should specify the values of the following makefile variables :
#
# LIBRARY_NAME
#	set this to the desired name of the library 
# FUNCTIONS
#	set this to the name of the file containing the list of
#	public function names in the library
#	NOTE: The FUNCTIONS file is not necessary in GENESIS 2.0
#             as public function names are added automatically when
#             referenced in the library startup script.  Functions
#             not referenced by an addfunc or object startup command
#             may be declared as public functions with the hashfunc
#             startup command.
#
#             If you are converting a 1.4 library to 2.0 you may use
#             the FUNCTIONS file by following the instructions below.
# STRUCTURES
#	set this to the name of the file containing the structure definitions
#	for objects in the library
# EXT_HEADER
#	set this to the name of the header file containing the appropriate
#	include references needed to compile the library files
# TARGET_OBJ
#	set this to the name of the library object which will be compiled
#	This is normally just the LIBRARY_NAME with 'lib.o' appended to it
# OBJECTS
#	list the user object files (with the .o extension) which will be 
#	a part of the library
#
# ============================================

LIBRARY_NAME 	= 	leech
STARTUP		=	SynGSlib.g
STRUCTURES 	= 	SynGS_struct.h
EXT_HEADER	= 	SynGS_ext.h
TARGET_OBJ	=	leechlib.o

OBJECTS = SynS_ron.o SynG_ron.o 


# If really you want to use a FUNCTIONS file you can by setting it
# here and uncommenting the FSYMBOLTAB and FSYMBOLTAB_C lines.  In
# all likelyhood you will not need the FUNCTIONS file at all.

#FUNCTIONS 	= 	examplefuncs
#FSYMBOLTAB	=	$(LIBRARY_NAME)_f@.o
#FSYMBOLTAB_C	=	$(LIBRARY_NAME)_f@.c

# ============================================
# everything below here should maintain itself
# ============================================

SHELL		=	/bin/sh

# GENINST is passed in from the Usermake makefile.  If you're not
# using Usermake, either edit your top level makefile to pass it
# in or hard code the GENESIS 2.0 installation directory here.

GENESIS		= 	$(GENINST)
GENESIS_LIB	= 	$(GENESIS)/lib
GENESIS_INCLUDE	= 	-I. -I$(GENESIS)/include
HEADERS 	=  	$(STRUCTURES)

default : $(TARGET_OBJ)

$(OBJECTS) : $(HEADERS) 

.c.o:
	$(CC) $(CFLAGS) $(GENESIS_INCLUDE) $< -c 

$(LIBRARY_NAME)_g@.c $(LIBRARY_NAME)_g@.h: $(STARTUP)
	- $(GENESIS_LIB)/code_g $(STARTUP) $(EXT_HEADER) $(LIBRARY_NAME)

# make the data structure section of the symbol table

$(LIBRARY_NAME)_d@.c : $(STRUCTURES) $(GENESIS_LIB)/code_sym
	- $(CPP) $(STRUCTURES) /tmp/$(STRUCTURES) $(GENESIS_INCLUDE)
	- $(GENESIS_LIB)/code_sym /tmp/$(STRUCTURES) $(LIBRARY_NAME) \
	  -I $(EXT_HEADER) -NI -o $(LIBRARY_NAME)_d@.c
	- rm /tmp/$(STRUCTURES)

# make the function list section of the symbol table

$(LIBRARY_NAME)_f@.c : $(FUNCTIONS) $(GENESIS_LIB)/code_func
	- $(GENESIS_LIB)/code_func $(FUNCTIONS) $(LIBRARY_NAME) \
	  > $(LIBRARY_NAME)_f@.c

# make the library header function

$(LIBRARY_NAME)_l@.c: $(LIBRARY_NAME)_g@.c $(LIBRARY_NAME)_d@.c $(FSYMBOLTAB_C) $(GENESIS_LIB)/code_lib $(OBJECTS)
	- $(GENESIS_LIB)/code_lib $(LIBRARY_NAME) -o $(LIBRARY_NAME)_l@.c

SYMBOLTAB = $(LIBRARY_NAME)_d@.o $(LIBRARY_NAME)_g@.o $(FSYMBOLTAB) $(LIBRARY_NAME)_l@.o

$(TARGET_OBJ): $(SYMBOLTAB) $(OBJECTS)
	ld -r -o $(TARGET_OBJ) $(OBJECTS) $(SYMBOLTAB)

clean:
	-(rm -rf *.o; rm -rf *@.[ch])
















