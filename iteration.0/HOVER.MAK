.AUTODEPEND

#		*Translator Definitions*
CC = bcc +HOVER.CFG
TASM = TASM
TLIB = tlib
TLINK = tlink
LIBPATH = C:\CPP3.1\LIB
INCLUDEPATH = C:\CPP3.1\INCLUDE


#		*Implicit Rules*
.c.obj:
  $(CC) -c {$< }

.cpp.obj:
  $(CC) -c {$< }

#		*List Macros*


EXE_dependencies =  \
 hovmain.obj \
 hovloop.obj \
 hovacts.obj \
 hovdraw.obj \
 hovscale.obj \
 hovtrace.obj \
 idlibc.obj \
 memmgr.obj \
 jm_sb.obj \
 idasm.obj \
 idasme.obj

#		*Explicit Rules*
hover.exe: hover.cfg $(EXE_dependencies)
  $(TLINK) /v/s/c/P-/L$(LIBPATH) @&&|
c0s.obj+
hovmain.obj+
hovloop.obj+
hovacts.obj+
hovdraw.obj+
hovscale.obj+
hovtrace.obj+
idlibc.obj+
memmgr.obj+
jm_sb.obj+
idasm.obj+
idasme.obj
hover,hover
emu.lib+
maths.lib+
cs.lib
|


#		*Individual File Dependencies*
hovmain.obj: hover.cfg hovmain.c 

hovloop.obj: hover.cfg hovloop.c 

hovacts.obj: hover.cfg hovacts.c 

hovdraw.obj: hover.cfg hovdraw.c 

hovscale.obj: hover.cfg hovscale.c 

hovtrace.obj: hover.cfg hovtrace.c 

idlibc.obj: hover.cfg idlibc.c 

memmgr.obj: hover.cfg memmgr.c 

jm_sb.obj: hover.cfg jm_sb.c 

idasm.obj: hover.cfg idasm.asm 
	$(TASM) /MX /ZI /O IDASM.ASM,IDASM.OBJ

idasme.obj: hover.cfg idasme.asm 
	$(TASM) /MX /ZI /O IDASME.ASM,IDASME.OBJ

#		*Compiler Configuration File*
hover.cfg: hover.mak
  copy &&|
-a
-v
-G
-O
-Z
-vi-
-H=HOVER.SYM
-Fc
-weas
-wpre
-I$(INCLUDEPATH)
-L$(LIBPATH)
-P-.C
| hover.cfg


