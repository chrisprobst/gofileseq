######################################################################
# Automatically generated by qmake (2.01a) Thu Apr 28 23:48:17 2016
######################################################################

TEMPLATE = lib
TARGET = fileseq

INCLUDEPATH += $$PWD $$PWD/private
DEPENDPATH += $$PWD

QMAKE_MACOSX_DEPLOYMENT_TARGET = 10.6
CGO_CXXFLAGS = -fPIC

CONFIG -= app_bundle
CONFIG -= qt

# Input
HEADERS += fileseq.h \
    sequence.h \
    frameset.h \
    types.h \
    private/libgofileseq.h \
    private/fileseq_p.h

SOURCES += fileseq.cpp \
    sequence.cpp \
    frameset.cpp \
    private/fileseq_p.cpp

unix: QMAKE_CXXFLAGS += -fPIC
unix: QMAKE_LFLAGS += '-Wl,-rpath,\'\$$ORIGIN\''
unix: LIBS += -L$$PWD -lgofileseq

# build go deps
#

libgo_d.target = libgofileseq.so
libgo_d.commands = go build -buildmode=c-shared -o ./libgofileseq.so ./export
libgo_d.depends = FORCE

libgo_s.target = libgofileseq.a
libgo_s.commands = go build -buildmode=c-archive -o ./libgofileseq.a ./export
libgo_s.depends = FORCE

libgo_h.target = libgofileseq.h
libgo_h.commands = mv libgofileseq.h private/libgofileseq.h
libgo_h.depends = libgo_d libgo_s

PRE_TARGETDEPS += libgofileseq.so libgofileseq.a libgofileseq.h
QMAKE_EXTRA_TARGETS += libgo_d libgo_s libgo_h

# clean
#

QMAKE_CLEAN += libgofileseq.*
