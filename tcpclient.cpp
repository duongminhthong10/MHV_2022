#include "tcpclient.h"
#include <QHostAddress>
#include <QNetworkInterface>
#include <QThread>
#include "config.h"
//int Cong1[120]={0};
//int Cong2[120]={0};
//int Cong[10][120] = {{0},{0}};

TcpClient::TcpClient(QObject *parent) : QObject(parent)
{
    client = new QTcpSocket[numEsp32];
    //qDebug() << "Anh Thong ba dao 2k";
}

void TcpClient::send(QString msg)
{
    connectToServer();
    //static QString sent;
    //if (sent == msg) return;
    QThread::msleep(100);
    for (int i = 0; i < numEsp32 ; i++)
    {
        (client + i)->write(msg.toUtf8());
    }
    //sent = msg;
//    qDebug () << "ok";
    exit();

}

void TcpClient::selectFloorOn(QString msgOnly, QString msg, QString index)
{
    connectToServer();
    QThread::msleep(100);
    for (int i = 0; i < numEsp32 ; i++)
    {
        if(index.toInt() == i)
        {
            (client + i)->write(msgOnly.toUtf8());
        }
        else
        {
            (client + i)->write(msg.toUtf8());
        }
    }
    exit();
}
void TcpClient::sendOnly(int ip, QString mess)
{
    onlyConnectServer(ip);
//    QString messOut = "DKTC_" + mess;
    (client + ip)->write(mess.toUtf8());
    onlyExit(ip);

}

void TcpClient::exit()
{
    //send("exit");
    for (int i = 0; i < numEsp32 ; i++)
    {
        (client + i)->close();
    }
}
QString TcpClient::intToQString(int a[120])
{
    QString My_String;
    for(int i=0; i < 120; i++)
    {
        My_String.append(QString::number(a[i]));
    }
    return My_String;
}

QString TcpClient::formatRequest(QString msg)
{
    QString str = "DKTC_"+msg;
    return str;
}

QByteArray TcpClient::toByteArray(QString &stringList)
{
    QByteArray msg=stringList.toUtf8();
    return msg;
}

void TcpClient::connectToServer()
{
    for (int i = 0; i < numEsp32 ; i++)
    {
        (client + i)->connectToHost(host + QString::number(155 + i), 8888);
    }
}

void TcpClient::onlyConnectServer(int id)
{
    (client + id)->connectToHost(host + QString::number(155 + id), 8888);
}

void TcpClient::onlyExit(int id)
{
    (client + id)->close();
}
