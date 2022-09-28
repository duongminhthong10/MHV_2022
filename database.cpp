#include "database.h"

database::database(QObject *parent)
    : QObject{parent}
{
//    connectDB();
}

void database::connectDB()
{
    db=QSqlDatabase::addDatabase("QSQLITE");
    db.setDatabaseName("C:/Users/84833/Desktop/MHV2022/database.db");
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
    return "";
}
