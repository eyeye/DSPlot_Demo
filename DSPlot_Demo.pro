#-------------------------------------------------
#
# Project created by QtCreator 2013-12-10T23:14:28
#
#-------------------------------------------------

QT       += core gui printsupport
CONFIG += c++11

greaterThan(QT_MAJOR_VERSION, 4): QT += widgets

TARGET = DSPlot_Demo
TEMPLATE = app


SOURCES += main.cpp\
        MainWindow.cpp \
    qcustomplot.cpp

HEADERS  += MainWindow.h \
    qcustomplot.h

FORMS    += MainWindow.ui



win32:CONFIG(release, debug|release): LIBS += -L$$PWD/../../cpp/aquila-lib/lib/release/ -lAquila
else:win32:CONFIG(debug, debug|release): LIBS += -L$$PWD/../../cpp/aquila-lib/lib/debug/ -lAquila
else:unix: LIBS += -L$$PWD/../../cpp/aquila-lib/lib/ -lAquila

INCLUDEPATH += $$PWD/../../cpp/aquila-lib/include
DEPENDPATH += $$PWD/../../cpp/aquila-lib/include

win32-g++:CONFIG(release, debug|release): PRE_TARGETDEPS += $$PWD/../../cpp/aquila-lib/lib/release/libAquila.a
else:win32-g++:CONFIG(debug, debug|release): PRE_TARGETDEPS += $$PWD/../../cpp/aquila-lib/lib/debug/libAquila.a
else:win32:!win32-g++:CONFIG(release, debug|release): PRE_TARGETDEPS += $$PWD/../../cpp/aquila-lib/lib/release/Aquila.lib
else:win32:!win32-g++:CONFIG(debug, debug|release): PRE_TARGETDEPS += $$PWD/../../cpp/aquila-lib/lib/debug/Aquila.lib
else:unix: PRE_TARGETDEPS += $$PWD/../../cpp/aquila-lib/lib/libAquila.a



win32:CONFIG(release, debug|release): LIBS += -L$$PWD/../../cpp/aquila-lib/lib/release/ -lOoura_fft
else:win32:CONFIG(debug, debug|release): LIBS += -L$$PWD/../../cpp/aquila-lib/lib/debug/ -lOoura_fft
else:unix: LIBS += -L$$PWD/../../cpp/aquila-lib/lib/ -lOoura_fft

INCLUDEPATH += $$PWD/../../cpp/aquila-lib/include
DEPENDPATH += $$PWD/../../cpp/aquila-lib/include

win32-g++:CONFIG(release, debug|release): PRE_TARGETDEPS += $$PWD/../../cpp/aquila-lib/lib/release/libOoura_fft.a
else:win32-g++:CONFIG(debug, debug|release): PRE_TARGETDEPS += $$PWD/../../cpp/aquila-lib/lib/debug/libOoura_fft.a
else:win32:!win32-g++:CONFIG(release, debug|release): PRE_TARGETDEPS += $$PWD/../../cpp/aquila-lib/lib/release/Ooura_fft.lib
else:win32:!win32-g++:CONFIG(debug, debug|release): PRE_TARGETDEPS += $$PWD/../../cpp/aquila-lib/lib/debug/Ooura_fft.lib
else:unix: PRE_TARGETDEPS += $$PWD/../../cpp/aquila-lib/lib/libOoura_fft.a
