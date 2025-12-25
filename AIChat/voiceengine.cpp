#include "VoiceEngine.h"
#include <QDebug>

#ifdef Q_OS_WIN
#include <sapi.h>
#endif

VoiceEngine::VoiceEngine(QObject *parent) : QObject(parent)
{
    m_speech = new QTextToSpeech(this);
#ifdef Q_OS_WIN
    initSpeechRecognition();
#endif
}

void VoiceEngine::speak(const QString &text)
{
    if(m_speech)
        m_speech->say(text);
}

void VoiceEngine::startListening()
{
#ifdef Q_OS_WIN
    qDebug() << "Listening started (stub)";
#endif
    emit listeningStarted();
}

void VoiceEngine::stopListening()
{
#ifdef Q_OS_WIN
    qDebug() << "Listening stopped (stub)";
#endif
    emit listeningStopped();
}

void VoiceEngine::initSpeechRecognition()
{
#ifdef Q_OS_WIN
    // You can initialize Windows SAPI recognition here
    // Minimal stub: actual implementation requires COM objects
    qDebug() << "Speech Recognition Initialized (stub)";
#endif
}
