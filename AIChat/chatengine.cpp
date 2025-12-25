// #include "chatengine.h"
// #include <QUrlQuery>
// #include <QJsonDocument>
// #include <QJsonObject>
// #include <QJsonArray>
// #include <QTime>
// #include <QNetworkRequest>
// #include <QNetworkReply>
// #include <QDebug>

// ChatEngine::ChatEngine(QObject* parent)
//     : QObject(parent)
// {
//     m_manager = new QNetworkAccessManager(this);
//     connect(m_manager, &QNetworkAccessManager::finished,
//             this, &ChatEngine::handleNetworkReply);
// }

// void ChatEngine::sendUserMessage(const QString& text)
// {
//     if (text.isEmpty()) return;

//     // Add user message
//     Message userMessage;
//     userMessage.sender = "user";
//     userMessage.text = text;
//     userMessage.time = QTime::currentTime().toString("hh:mm");
//     m_model.appendMessage(userMessage);

//     // Show bot typing
//     m_botTyping = true;
//     emit botTypingChanged();

//     // Search DuckDuckGo asynchronously
//     searchDuckDuckGo(text);
// }

// void ChatEngine::searchDuckDuckGo(const QString& query)
// {
//     QUrl url("https://api.duckduckgo.com/");
//     QUrlQuery params;
//     params.addQueryItem("q", query);
//     params.addQueryItem("format", "json");
//     params.addQueryItem("no_redirect", "1");
//     params.addQueryItem("no_html", "1");
//     url.setQuery(params);

//     QNetworkRequest request(url);
//     request.setHeader(QNetworkRequest::UserAgentHeader, "QtBot/1.0");

//     m_manager->get(request);
// }

// void ChatEngine::handleNetworkReply(QNetworkReply* reply)
// {
//     if (!reply) return;

//     if (reply->error() != QNetworkReply::NoError) {
//         Message botMessage;
//         botMessage.sender = "bot";
//         botMessage.text = "Error fetching search results.";
//         botMessage.time = QTime::currentTime().toString("hh:mm");
//         m_model.appendMessage(botMessage);
//     } else {
//         QByteArray data = reply->readAll();
//         QString textResult = extractTextFromJson(data);

//         Message botMessage;
//         botMessage.sender = "bot";
//         botMessage.text = textResult.isEmpty() ? "No results found." : textResult;
//         botMessage.time = QTime::currentTime().toString("hh:mm");
//         m_model.appendMessage(botMessage);
//     }

//     m_botTyping = false;
//     emit botTypingChanged();

//     reply->deleteLater();
// }

// QString ChatEngine::extractTextFromJson(const QByteArray& json)
// {
//     QJsonDocument doc = QJsonDocument::fromJson(json);
//     if (!doc.isObject()) return "";

//     QJsonObject obj = doc.object();
//     QStringList results;

//     QString abstractText = obj.value("AbstractText").toString();
//     if (!abstractText.isEmpty()) results << abstractText;

//     QJsonArray topics = obj.value("RelatedTopics").toArray();
//     for (auto t : topics) {
//         if (t.isObject()) {
//             QString text = t.toObject().value("Text").toString();
//             if (!text.isEmpty()) results << text;
//         }
//     }

//     return results.mid(0, 3).join("\n\n");
// }

// void ChatEngine::setUseDarkMode(bool value)
// {
//     if (m_useDarkMode != value) {
//         m_useDarkMode = value;
//         emit useDarkModeChanged();
//     }
// }

#include "chatengine.h"
#include <QNetworkRequest>
#include <QNetworkReply>
#include <QUrlQuery>
#include <QJsonDocument>
#include <QJsonObject>
#include <QJsonArray>
#include <QTime>
#include <QDebug>

ChatEngine::ChatEngine(QObject* parent)
    : QObject(parent)
{
    m_manager = new QNetworkAccessManager(this);
    connect(m_manager, &QNetworkAccessManager::finished,
            this, &ChatEngine::handleNetworkReply);
}

void ChatEngine::sendUserMessage(const QString& text)
{
    if (text.isEmpty()) return;

    // Add user message
    Message userMessage;
    userMessage.sender = "user";
    userMessage.text = text;
    userMessage.time = QTime::currentTime().toString("hh:mm");
    m_model.appendMessage(userMessage);

    // Show bot typing
    m_botTyping = true;
    emit botTypingChanged();

    // Search DuckDuckGo asynchronously
    searchDuckDuckGo(text);
}

void ChatEngine::searchDuckDuckGo(const QString& query)
{
    QUrl url("https://api.duckduckgo.com/");
    QUrlQuery params;
    params.addQueryItem("q", query);
    params.addQueryItem("format", "json");
    params.addQueryItem("no_redirect", "1");
    params.addQueryItem("no_html", "1");
    url.setQuery(params);

    QNetworkRequest request(url);
    request.setHeader(QNetworkRequest::UserAgentHeader, "QtBot/1.0");

    m_manager->get(request);
}

void ChatEngine::handleNetworkReply(QNetworkReply* reply)
{
    if (!reply) return;

    if (reply->error() != QNetworkReply::NoError) {
        Message botMessage;
        botMessage.sender = "bot";
        botMessage.text = "Error fetching search results.";
        botMessage.time = QTime::currentTime().toString("hh:mm");
        m_model.appendMessage(botMessage);
    } else {
        QByteArray data = reply->readAll();
        QString textResult = extractTextFromJson(data);

        Message botMessage;
        botMessage.sender = "bot";
        botMessage.text = textResult.isEmpty() ? "No results found." : textResult;
        botMessage.time = QTime::currentTime().toString("hh:mm");
        m_model.appendMessage(botMessage);
    }

    m_botTyping = false;
    emit botTypingChanged();

    reply->deleteLater();
}

QString ChatEngine::extractTextFromJson(const QByteArray& json)
{
    QJsonDocument doc = QJsonDocument::fromJson(json);
    if (!doc.isObject()) return "";

    QJsonObject obj = doc.object();
    QStringList results;

    QString abstractText = obj.value("AbstractText").toString();
    if (!abstractText.isEmpty()) results << abstractText;

    QJsonArray topics = obj.value("RelatedTopics").toArray();
    for (auto t : topics) {
        if (t.isObject()) {
            QString text = t.toObject().value("Text").toString();
            if (!text.isEmpty()) results << text;
        }
    }

    return results.mid(0, 3).join("\n\n");  // Show first 3 results
}

void ChatEngine::setUseDarkMode(bool value)
{
    if (m_useDarkMode != value) {
        m_useDarkMode = value;
        emit useDarkModeChanged();
    }
}
