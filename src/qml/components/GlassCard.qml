// src/qml/components/GlassCard.qml
import QtQuick 6.5
import QtQuick.Controls 2.15
import Qt5Compat.GraphicalEffects

Item {
    id: root

    // 外部传入的主题 token（Main.qml 里传的 themeTokens）
    property var themeTokens
    property real radius: 20
    property real padding: 24

    // 让使用者可以直接在 GlassCard 里面写内容
    default property alias content: contentItem.data

    implicitWidth: contentItem.implicitWidth + padding * 2
    implicitHeight: contentItem.implicitHeight + padding * 2

    // 阴影，模拟 Tailwind 里的 shadow-[0_30px_60px_rgba(0,0,0,0.06)]
    DropShadow {
        anchors.fill: bg
        source: bg
        horizontalOffset: 0
        verticalOffset: 22
        radius: 42
        samples: 32
        color: root.themeTokens ? root.themeTokens.cardShadowColor : "#1A000000"
        transparentBorder: true
        cached: true
        z: -1
    }

    Rectangle {
        id: bg
        anchors.fill: parent
        radius: root.radius
        color: root.themeTokens ? root.themeTokens.cardBackground : "#B3FFFFFF"
        border.color: root.themeTokens ? root.themeTokens.cardBorderColor : "#14000000"
        border.width: 1
        antialiasing: true
    }

    Item {
        id: contentItem
        anchors.fill: bg
        anchors.margins: padding
    }
}
