#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QtWidgets>
#include <QtQuickWidgets>
#include <QWindow>
#include <QQmlEngine>

#include <QtQml>
#include "constants.h"

int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
    QApplication app(argc, argv);

    qmlRegisterType<GlobalConsts> ("GlobalConsts",1,0,"GlobalConsts");

    QQmlApplicationEngine engine;
    qmlRegisterSingletonType( QUrl("qrc:/Globals/Global.qml"), "NinepunchGlobals", 1, 0, "Globals" );
    engine.load(QUrl(QLatin1String("qrc:/main.qml")));

    qInfo("Running on %s\n", qPrintable(QSysInfo::kernelType()) );

    if (engine.rootObjects().isEmpty())
        return -1;

    if(engine.rootObjects().first()->isWindowType()){
        QWindow *window = (QWindow*)engine.rootObjects().first();
        //window->setFlags( window->flags() | Qt::FramelessWindowHint );
    }

    return app.exec();
}
