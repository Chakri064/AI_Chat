#include "messagemodel.h"

MessageModel::MessageModel(QObject* parent) : QAbstractListModel(parent) {}

int MessageModel::rowCount(const QModelIndex& parent) const {
    if (parent.isValid()) return 0;
    return m_items.size();
}

QVariant MessageModel::data(const QModelIndex& index, int role) const {
    if (!index.isValid() || index.row() < 0 || index.row() >= m_items.size())
        return QVariant();

    const Message &m = m_items[index.row()];
    switch (role) {
    case TextRole: return m.text;
    case SenderRole: return m.sender;
    case TimeRole: return m.timestamp.toString("hh:mm AP");
    case IsUserRole: return m.sender == "user";
    }
    return QVariant();
}

QHash<int, QByteArray> MessageModel::roleNames() const {
    return {
        { TextRole, "text" },
        { SenderRole, "sender" },
        { TimeRole, "time" },
        { IsUserRole, "isUser" }
    };
}

void MessageModel::clear() {
    beginResetModel();
    m_items.clear();
    endResetModel();
}

void MessageModel::appendMessage(const Message& m) {
    beginInsertRows(QModelIndex(), m_items.size(), m_items.size());
    m_items.append(m);
    endInsertRows();
}
