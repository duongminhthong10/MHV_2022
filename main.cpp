#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include "pdfprovider.h"
#include "database.h"
#include "tcpclient.h"
#include "myserialport.h"
int main(int argc, char *argv[])
{
#if QT_VERSION < QT_VERSION_CHECK(6, 0, 0)
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
#endif
    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;
    PdfProvider *pdfProvider  = new PdfProvider(QQuickImageProvider::Pixmap);
    database db;
    TcpClient tcpClient;
    MySerialPort uart;
    db.connectDB();
    engine.rootContext()->setContextProperty("Uart",&uart);
    engine.rootContext()->setContextProperty("TcpClient", &tcpClient);
    engine.rootContext()->setContextProperty("DataBase", &db);
    engine.rootContext()->setContextProperty("PdfProvider", pdfProvider);
    engine.addImageProvider(QLatin1String("pdfpage"), pdfProvider);

    engine.rootContext()->setContextProperty("ApplicationPath", qApp->applicationDirPath());
    const QUrl url(QStringLiteral("qrc:/main.qml"));
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);
    engine.load(url);

    return app.exec();
}
