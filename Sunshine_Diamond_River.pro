QT += quick concurrent quick sql
CONFIG += c++11

CONFIG += resources_big
# You can make your code fail to compile if it uses deprecated APIs.
# In order to do so, uncomment the following line.
#DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x060000    # disables all the APIs deprecated before Qt 6.0.0
DEFINES += QT_DEPRECATED_WARNINGS
SOURCES += \
        database.cpp \
        main.cpp \
        pdfprovider.cpp \
        tcpclient.cpp

RESOURCES += qml.qrc

TRANSLATIONS += \
    PdfView4Qt_zh_CN.ts
# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

# Additional import path used to resolve QML modules just for Qt Quick Designer
QML_DESIGNER_IMPORT_PATH =

# Default rules for deployment.
qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target

CONFIG += file_copies

pdfFile.files = $$PWD/pdf/anhGiaodien.pdf
pdfFile.path = $$OUT_PWD

dbFile.files = $$PWD/database/database.db
dbFile.path = $$OUT_PWD

COPIES += pdfFile dbFile

INCLUDEPATH += $$PWD/include
DEPENDPATH  += $$PWD/include

macx {
    LIBS += -L$$PWD/libs/mac/mupdf/ -lmupdf
    PRE_TARGETDEPS += $$PWD/libs/mac/mupdf/libmupdf.a

    LIBS += -L$$PWD/libs/mac/mupdf/ -lmupdf-third
    PRE_TARGETDEPS += $$PWD/libs/mac/mupdf/libmupdf-third.a
}

win32 {
    LIBS += -L$$PWD/libs/win/mupdf/ -llibmupdf
    PRE_TARGETDEPS += $$PWD/libs/win/mupdf/libmupdf.lib

    LIBS += -L$$PWD/libs/win/mupdf/ -llibresources
    PRE_TARGETDEPS += $$PWD/libs/win/mupdf/libresources.lib

    LIBS += -L$$PWD/libs/win/mupdf/ -llibthirdparty
    PRE_TARGETDEPS += $$PWD/libs/win/mupdf/libthirdparty.lib
}
#DISTFILES += \
#    PdfView4Qt_zh_CN.ts

HEADERS += \
    config.h \
    database.h \
    pdfprovider.h \
    tcpclient.h

DISTFILES +=
