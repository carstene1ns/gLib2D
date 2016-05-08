PSPSDK = $(shell psp-config --pspsdk-path)
PSPDIR = $(shell psp-config --psp-prefix)

CFLAGS = -O2 -G0 -g

# optional features
PNG ?= 1
JPEG ?= 1
VFPU ?= 0
ifeq ($(PNG),0)
CFLAGS += -DNO_PNG
endif
ifeq ($(JPEG),0)
CFLAGS += -DNO_JPEG
endif
ifeq ($(VFPU),1)
CFLAGS += -DUSE_VFPU
endif

OBJS = glib2d.o
TARGET_LIB = libglib2d.a

include $(PSPSDK)/lib/build.mak

install: all
	mkdir -p $(PSPDIR)/include $(PSPDIR)/lib
	cp *.h $(PSPDIR)/include
	cp *.a $(PSPDIR)/lib
