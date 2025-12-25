#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include <QQuickStyle>
#include "chatengine.h"
#include "voiceengine.h"


int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    // Use Fusion style for full customization
    QQuickStyle::setStyle("Fusion");

    // Backend Chat Engine
    ChatEngine chat;

    QQmlApplicationEngine engine;

    VoiceEngine voiceEngine;  // create instance
    engine.rootContext()->setContextProperty("VoiceEngine", &voiceEngine);

    // Expose ChatEngine to QML
    engine.rootContext()->setContextProperty("Chat", &chat);

    // Register Theme singleton
    qmlRegisterSingletonType(QUrl("qrc:/Theme.qml"), "AppTheme", 1, 0, "Theme");

    const QUrl url(QStringLiteral("qrc:/main.qml"));
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
                         if (!obj && url == objUrl) QCoreApplication::exit(-1);
                     }, Qt::QueuedConnection);

    engine.load(url);
    return app.exec();
}
