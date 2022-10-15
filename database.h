#ifndef DATABASE_H
#define DATABASE_H

#include <QObject>
#include <QSql>
#include <QSqlDatabase>
#include <QSqlQuery>
#include <QSqlError>
#include <QDebug>
#include "config.h"

#define DATABASE_HOSTNAME ""
#define DATABASE_NAME "database.db"
#define TABLEBUILDING "tblViewBuilding"
class database : public QObject
{
    Q_OBJECT
public:
    explicit database(QObject *parent = nullptr);
    ~database(){};
    void connectDB();
    void closeDB();
    // ham tim anh cac toa A, B, C,d...
    Q_INVOKABLE QString queryTable(QString table,QString buildname,QString output);
    // ham tim anh cac tang cua tung toa
    Q_INVOKABLE QString queryFindTang(QString table,QString buildname,QString floor,QString output);
    /*them*/
    QVector<int> dsCong;
    char *Cong;
    Q_INVOKABLE QString queryDanhSachCong(QString table, QString buildname, QString floor, QString output);
    Q_INVOKABLE QString queryCacLoaiPhong(QString table, QString buildname, QString floor, QString room, QString output);
private:
    QSqlDatabase db;

signals:

};

#endif // DATABASE_H
