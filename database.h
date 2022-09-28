#ifndef DATABASE_H
#define DATABASE_H

#include <QObject>
#include <QSql>
#include <QSqlDatabase>
#include <QSqlQuery>
#include <QSqlError>
#include <QDebug>

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
    Q_INVOKABLE QString queryTable(QString table,QString buildname,QString output);
private:
    QSqlDatabase db;

signals:

};

#endif // DATABASE_H
