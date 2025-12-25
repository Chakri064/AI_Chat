#ifndef MESSAGEMODEL_H
#define MESSAGEMODEL_H

#include <QAbstractListModel>
#include <QVector>
#include <QString>
#include <QDateTime>

struct Message {
    QString text;
    QString sender; // "user" or "bot"
    QString time;    // <-- add this
    QDateTime timestamp;
};

class MessageModel : public QAbstractListModel {
    Q_OBJECT
public:
    enum Roles { TextRole = Qt::UserRole + 1, SenderRole, TimeRole, IsUserRole };
    explicit MessageModel(QObject* parent = nullptr);

    int rowCount(const QModelIndex& parent = QModelIndex()) const override;
    QVariant data(const QModelIndex& index, int role = Qt::DisplayRole) const override;
    QHash<int, QByteArray> roleNames() const override;

    Q_INVOKABLE void clear();
    void appendMessage(const Message& m);

private:
    QVector<Message> m_items;
};

#endif // MESSAGEMODEL_H
