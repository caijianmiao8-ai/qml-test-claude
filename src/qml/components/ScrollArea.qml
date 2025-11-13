// src/qml/components/ScrollArea.qml
import QtQuick 6.5
import QtQuick.Controls 2.15

Item {
    id: root
    property var themeTokens
    default property alias contentData: contentItem.data

    Flickable {
        id: flick
        anchors.fill: parent
        contentWidth: width
        contentHeight: contentItem.implicitHeight
        clip: true

        Item {
            id: contentItem
            width: flick.width
        }

        ScrollBar.vertical: ScrollBar {
            policy: ScrollBar.AsNeeded
            anchors.right: parent.right
            width: 4
            contentItem: Rectangle {
                radius: width / 2
                color: root.themeTokens ? root.themeTokens.scrollGradientColor : "#22000000"
            }
        }
    }

    // 顶部渐隐
    Rectangle {
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        height: 24
        visible: flick.contentY > 0
        gradient: Gradient {
            GradientStop { position: 0.0; color: Qt.rgba(0, 0, 0, 0.06) }
            GradientStop { position: 1.0; color: Qt.rgba(0, 0, 0, 0.0) }
        }
    }

    // 底部渐隐
    Rectangle {
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        height: 24
        visible: flick.contentHeight - flick.height - flick.contentY > 1
        gradient: Gradient {
            GradientStop { position: 0.0; color: Qt.rgba(0, 0, 0, 0.0) }
            GradientStop { position: 1.0; color: Qt.rgba(0, 0, 0, 0.06) }
        }
    }
}
