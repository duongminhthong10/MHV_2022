#ifndef MYSERIALPORT_H
#define MYSERIALPORT_H

#include <QObject>
#include <QSerialPort>
#include "config.h"
#include <QDebug>
class MySerialPort : public QObject
{
    Q_OBJECT
public:
    explicit MySerialPort(QObject *parent = nullptr);
    QSerialPort *serial;
    void openSerialPort();
    void closeSerialPort();
    Q_INVOKABLE void writeData(const QByteArray &data);
signals:

};

#endif // MYSERIALPORT_H
