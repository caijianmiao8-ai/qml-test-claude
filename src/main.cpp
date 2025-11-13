#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QCoreApplication>
#include <QDir>
#include <QDebug>
#include <QQuickStyle>   // ⭐ 新增：引入控件样式

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    // ⭐ 关键一步：使用 Basic（或 Fusion）风格，避免原生控件屏蔽你的 background 自定义
    QQuickStyle::setStyle("Basic");
    // 备选：QQuickStyle::setStyle("Fusion");
    // 不要用 "Windows" / "Universal" 之类的原生 style，会出现你之前那堆
    // “The current style does not support customization of this control” 的警告

    QQmlApplicationEngine engine;

    // 假设你的目录结构是：
    // 工程根/
    //   CMakeLists.txt
    //   src/
    //     main.cpp
    //     qml/
    //       Main.qml
    //
    // 可执行文件在：
    //   工程根/build/.../appRemoteDesktop.exe
    //
    // 那么从 exe 所在目录 回到工程根 再进 src/qml 就是 ../../src/qml/Main.qml

    const QString mainQmlPath =
        QDir(QCoreApplication::applicationDirPath())
            .absoluteFilePath("../../src/qml/Main.qml");

    const QUrl url = QUrl::fromLocalFile(mainQmlPath);

    qDebug() << "Loading QML from:" << url.toString();

    QObject::connect(
        &engine,
        &QQmlApplicationEngine::objectCreated,
        &app,
        [url](QObject *obj, const QUrl &objUrl) {
            if (!obj && url == objUrl)
                QCoreApplication::exit(-1);
        },
        Qt::QueuedConnection
        );

    engine.load(url);

    return app.exec();
}
