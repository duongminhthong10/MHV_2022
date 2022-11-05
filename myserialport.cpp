#include "myserialport.h"

MySerialPort::MySerialPort(QObject *parent)
    : QObject{parent}
{
    serial = new QSerialPort(this);
    openSerialPort();
}

void MySerialPort::openSerialPort()
{
    serial->setPortName(congPort);
    serial->setBaudRate(QSerialPort::Baud115200);
    serial->setDataBits(QSerialPort::Data8);
    serial->setParity(QSerialPort::NoParity);
    serial->setStopBits(QSerialPort::OneStop);
    serial->setFlowControl(QSerialPort::NoFlowControl);
    if (serial->open(QIODevice::ReadWrite)) {
        qDebug() << "Connectedd";
    } else {
        qDebug() << "error";
    }
}

void MySerialPort::closeSerialPort()
{
    if (serial->isOpen())
        serial->close();
    qDebug() << "disconnected";
}

void MySerialPort::writeData(const QByteArray &data)
{
    serial->write(data);
}
