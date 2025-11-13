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
    property bool enableHoverEffect: false

    // 让使用者可以直接在 GlassCard 里面写内容
    default property alias content: contentItem.data

    implicitWidth: contentItem.implicitWidth + padding * 2
    implicitHeight: contentItem.implicitHeight + padding * 2

    // Hover state
    property bool hovered: false

    // 柔和的阴影效果
    DropShadow {
        anchors.fill: bg
        source: bg
        horizontalOffset: 0
        verticalOffset: enableHoverEffect && hovered ? 16 : 8
        radius: enableHoverEffect && hovered ? 24 : 16
        samples: 32
        color: root.themeTokens ? root.themeTokens.cardShadowColor : "#14000000"
        transparentBorder: true
        cached: true
        z: -1

        Behavior on verticalOffset {
            NumberAnimation { duration: 250; easing.type: Easing.OutCubic }
        }
        Behavior on radius {
            NumberAnimation { duration: 250; easing.type: Easing.OutCubic }
        }
    }

    Rectangle {
        id: bg
        anchors.fill: parent
        radius: root.radius
        color: root.themeTokens ? root.themeTokens.cardBackground : "#B3FFFFFF"
        border.color: root.themeTokens ? root.themeTokens.cardBorderColor : "#0D000000"
        border.width: 1
        antialiasing: true

        // Subtle scale on hover (matching React's hover effect)
        scale: enableHoverEffect && hovered ? 1.01 : 1.0
        Behavior on scale {
            NumberAnimation { duration: 250; easing.type: Easing.OutCubic }
        }
    }

    Item {
        id: contentItem
        anchors.fill: bg
        anchors.margins: padding
    }

    // Hover detection
    MouseArea {
        anchors.fill: parent
        hoverEnabled: enableHoverEffect
        onEntered: root.hovered = true
        onExited: root.hovered = false
        propagateComposedEvents: true
        onPressed: mouse.accepted = false
    }
}
