#include "database.h"

database::database(QObject *parent)
    : QObject{parent}
{
//    connectDB();
    Cong = new char[sobit];
    for (int i = 0; i < sobit; i++)
    {
        *(Cong+i) = '0';
    }
}

void database::connectDB()
{
    db=QSqlDatabase::addDatabase("QSQLITE");
//    db.setDatabaseName("database.db");
    db.setDatabaseName("D:/MHV_2022_Data/database/database.db");
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

QString database::queryDanhSachCong(QString table, QString buildname, QString floor, QString output)
{
    QSqlQuery query;
    query.prepare("SELECT * FROM " + table + " WHERE toa = (:buildname) AND tang = (:floor)");
    query.bindValue(":buildname", buildname);
    query.bindValue(":floor", floor);
    query.exec();
    while(query.next())
    {
        int cong = query.value(output).toInt();
        qDebug() << cong;
        dsCong.push_back(cong);
    }

    for(int i = 0; i < sobit; i++)
    {
        for (int j = 0; j < dsCong.size(); j++)
        {
            if (i == dsCong[j])
            {
                *(Cong+i) = '1';
                //j = dsCong.size();
                break;
            }
            else
            {
                *(Cong+i) = '0';
            }
        }
    }
    QString out = "";
    for (int i = 0; i < sobit; i++)
    {
        out.append(*(Cong + i));
    }
    dsCong.clear();
    return out;
}

QString database::queryCacLoaiPhong(QString table, QString buildname, QString floor, QString room, QString output)
{
    QSqlQuery query;
    query.prepare("SELECT * FROM " + table + " WHERE toa = (:buildname) AND tang = (:floor) AND loaiPhong = (:room)");
    query.bindValue(":buildname", buildname);
    query.bindValue(":floor", floor);
    query.bindValue(":room", room);
    query.exec();
    while(query.next())
    {
        int cong = query.value(output).toInt();
        qDebug() << cong;
        dsCong.push_back(cong);
    }

    for(int i = 0; i < sobit; i++)
    {
        for (int j = 0; j < dsCong.size(); j++)
        {
            if (i == dsCong[j])
            {
                *(Cong+i) = '1';
                //j = dsCong.size();
                break;
            }
            else
            {
                *(Cong+i) = '0';
            }
        }
    }
    QString out = "";
    for (int i = 0; i < sobit; i++)
    {
        out.append(*(Cong + i));
    }
    dsCong.clear();
    return out;
}

QString database::queryNoiThat(QString table, QString noiThat)
{
    QSqlQuery query;
    query.prepare("SELECT * FROM " + table +" WHERE NoiThat = (:noiThat)");
    query.bindValue(":noiThat", noiThat);
    if (!query.exec()) {
        qDebug() << "error query";
        qDebug() << query.lastError().text();
        return "";
    }
    else
    {
        query.next();
        return query.value("NumberImg").toString();
    }
}
