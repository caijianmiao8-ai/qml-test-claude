import QtQuick 6.5
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

import "icons" as Icons

Item {
    id: root
    // 主题 token（保持原命名）
    property var themeTokens

    signal minimizeRequested()
    signal fullscreenToggleRequested()
    signal closeRequested()

    implicitHeight: 56

    RowLayout {
        anchors.top: parent.top
        anchors.right: parent.right
        anchors.margins: 24
        spacing: 12

        IconButton {
            iconComponent: Icons.MinusIcon {}
            accessibleName: "Minimize"
            textColor: root.themeTokens ? root.themeTokens.textSecondary : "#94A3B8"
            hoverColor: root.themeTokens ? root.themeTokens.subtleHoverBackground : "#1AFFFFFF"
            onClicked: root.minimizeRequested()
        }

        IconButton {
            iconComponent: Icons.MaximizeIcon {}
            accessibleName: "Fullscreen"
            textColor: root.themeTokens ? root.themeTokens.textSecondary : "#94A3B8"
            hoverColor: root.themeTokens ? root.themeTokens.subtleHoverBackground : "#1AFFFFFF"
            onClicked: root.fullscreenToggleRequested()
        }

        IconButton {
            iconComponent: Icons.CloseIcon {}
            accessibleName: "Close"
            textColor: root.themeTokens ? root.themeTokens.dangerText : "#F87171"
            hoverColor: "#1AF87171"
            onClicked: root.closeRequested()
        }
    }

    // IconButton：基于 Button，自定义外观，但保留 clicked 信号
    component IconButton: Button {
        id: control

        // 用 Component 来承载图标组件，避免与 Button 自带 icon 冲突
        property Component iconComponent
        property string accessibleName: ""
        property color textColor: "#FFFFFF"
        property color hoverColor: "#26FFFFFF"

        implicitWidth: 32
        implicitHeight: 32

        // 圆角 + hover 高亮，保持你原来的苹果风
        background: Rectangle {
            radius: 10
            color: control.hovered ? control.hoverColor : "#00000000"
        }

        contentItem: Item {
            anchors.centerIn: parent
            width: 16
            height: 16
            implicitWidth: 16
            implicitHeight: 16

            Loader {
                anchors.centerIn: parent
                sourceComponent: control.iconComponent
                onItemChanged: {
                    if (item && item.hasOwnProperty("color")) {
                        item.color = control.textColor
                    }
                }
            }
        }

        Accessible.name: accessibleName
    }
}
