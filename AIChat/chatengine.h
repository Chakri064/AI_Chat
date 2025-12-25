// #ifndef CHATENGINE_H
// #define CHATENGINE_H

// #include <QObject>
// #include <QNetworkAccessManager>
// #include "messagemodel.h"

// class ChatEngine : public QObject
// {
//     Q_OBJECT
//     Q_PROPERTY(bool botTyping READ botTyping NOTIFY botTypingChanged)
//     Q_PROPERTY(bool useDarkMode READ useDarkMode WRITE setUseDarkMode NOTIFY useDarkModeChanged)

// public:
//     explicit ChatEngine(QObject *parent = nullptr);

//     Q_INVOKABLE void sendUserMessage(const QString &text);
//     Q_INVOKABLE void clear() { m_model.clear(); }

//     MessageModel* model() { return &m_model; }

//     bool botTyping() const { return m_botTyping; }
//     bool useDarkMode() const { return m_useDarkMode; }
//     Q_INVOKABLE void setUseDarkMode(bool value); // declare as invokable

// private:
//     QNetworkAccessManager* m_manager;
//     MessageModel m_model;
//     bool m_botTyping = false;
//     bool m_useDarkMode = false;

//     void searchDuckDuckGo(const QString &query);
//     void handleNetworkReply(QNetworkReply* reply);
//     QString extractTextFromJson(const QByteArray& json);

// signals:
//     void botTypingChanged();
//     void useDarkModeChanged();
// };

// #endif // CHATENGINE_H

#ifndef CHATENGINE_H
#define CHATENGINE_H

#include <QObject>
#include <QNetworkAccessManager>
#include "messagemodel.h"

class ChatEngine : public QObject
{
    Q_OBJECT
    Q_PROPERTY(MessageModel* model READ model CONSTANT)
    Q_PROPERTY(bool botTyping READ botTyping NOTIFY botTypingChanged)
    Q_PROPERTY(bool useDarkMode READ useDarkMode WRITE setUseDarkMode NOTIFY useDarkModeChanged)

public:
    explicit ChatEngine(QObject* parent = nullptr);

    Q_INVOKABLE void sendUserMessage(const QString& text);
    Q_INVOKABLE void clear() { m_model.clear(); }

    MessageModel* model() { return &m_model; }
    bool botTyping() const { return m_botTyping; }

    bool useDarkMode() const { return m_useDarkMode; }
    void setUseDarkMode(bool value);

signals:
    void botTypingChanged();
    void useDarkModeChanged();

private:
    void searchDuckDuckGo(const QString& query);
    void handleNetworkReply(QNetworkReply* reply);
    QString extractTextFromJson(const QByteArray& json);

    QNetworkAccessManager* m_manager;
    MessageModel m_model;
    bool m_botTyping = false;
    bool m_useDarkMode = false;
};

#endif // CHATENGINE_H
