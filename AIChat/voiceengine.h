#ifndef VOICEENGINE_H
#define VOICEENGINE_H

#include <QObject>
#include <QString>
#include <windows.h>    // Must include first
#include <mmsystem.h>
#include <sapi.h>
#include <QtTextToSpeech/QTextToSpeech>

class VoiceEngine : public QObject
{
    Q_OBJECT
public:
    explicit VoiceEngine(QObject *parent = nullptr);

    Q_INVOKABLE void speak(const QString &text);   // TTS
    Q_INVOKABLE void startListening();             // STT
    Q_INVOKABLE void stopListening();

signals:
    void speechRecognized(const QString &text);
    void listeningStarted();
    void listeningStopped();

private:
    QTextToSpeech *m_speech;

    // Optional: Add Windows Speech API integration for STT
    void initSpeechRecognition();
};

#endif // VOICEENGINE_H
