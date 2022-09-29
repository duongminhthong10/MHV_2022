#include "database.h"

database::database(QObject *parent)
    : QObject{parent}
{
//    connectDB();
}

void database::connectDB()
{
    db=QSqlDatabase::addDatabase("QSQLITE");
    db.setDatabaseName("database.db");
    if(db.open())
    {
        qDebug() << "da connect db";
    }
    else
    {
        qDebug() << "Failed";
        return;
    }
}

void database::closeDB()
{
    db.close();
}

QString database::queryTable(QString table, QString buildname, QString output)
{
    QSqlQuery query;
    query.prepare("SELECT * FROM " + table +" WHERE buildingName = (:buildname)");
    query.bindValue(":buildname", buildname);
    if (!query.exec()) {
        qDebug() << "error query";
        qDebug() << query.lastError().text();
        return "";
    }
    else
    {
        query.next();
        return query.value(output).toString();
    }
}

QString database::queryFindTang(QString table, QString buildname, QString floor, QString output)
{
    QSqlQuery query;
    query.prepare("SELECT * FROM " + table +" WHERE buildingName = (:buildname) AND floor = (:floor)");
    query.bindValue(":buildname", buildname);
    query.bindValue(":floor", floor);
    if (!query.exec()) {
        qDebug() << "error query";
        qDebug() << query.lastError().text();
        return "";
    }
    else
    {
        query.next();
        return query.value(output).toString();
    }
}
