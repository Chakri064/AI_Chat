QT += quick
TEMPLATE = app
CONFIG += c++17 console
CONFIG -= app_bundle
CONFIG -= qt warn_on
CONFIG += qt quick qml
QT += quickcontrols2

QT += core gui network
QT += core gui widgets network
QT += core gui widgets texttospeech


QT += core gui quick qml
# Optional: enable websockets by uncommenting the next line
# QT += websockets

# Enable high DPI scaling
DEFINES += QT_DEPRECATED_WARNINGS QT_DISABLE_DEPRECATED_BEFORE=0x060000
# You can make your code fail to compile if it uses deprecated APIs.
# In order to do so, uncomment the following line.
#DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x060000    # disables all the APIs deprecated before Qt 6.0.0

SOURCES += \
        chatengine.cpp \
        main.cpp \
        messagemodel.cpp \
        voiceengine.cpp

RESOURCES += qml.qrc

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

# Additional import path used to resolve QML modules just for Qt Quick Designer
QML_DESIGNER_IMPORT_PATH =

# Default rules for deployment.
qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target

HEADERS += \
    chatengine.h \
    messagemodel.h \
    utils.h \
    voiceengine.h
