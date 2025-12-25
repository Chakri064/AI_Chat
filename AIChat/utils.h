#ifndef UTILS_H
#define UTILS_H
#include <QString>
#include <QDateTime>
#include <QRandomGenerator>

inline QString nowString() {
    return QDateTime::currentDateTime().toString("hh:mm AP");
}

inline int randBetween(int a, int b) {
    return QRandomGenerator::global()->bounded(b - a + 1) + a;
}

#endif // UTILS_H
