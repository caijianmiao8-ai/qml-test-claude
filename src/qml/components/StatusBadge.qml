import QtQuick 6.5
import QtQuick.Controls 2.15

Item {
    id: root
    property bool online: false
    property var themeTokens
    property string textOnline: "Online"
    property string textOffline: "Offline"
    implicitHeight: badge.implicitHeight
    implicitWidth: badge.implicitWidth

    Rectangle {
        id: badge
        radius: height / 2
        color: root.online
               ? (root.themeTokens ? root.themeTokens.successBadgeBackground : "#1F10B981")
               : (root.themeTokens ? root.themeTokens.offlineBadgeBackground : "#0FFFFFFF")
        border.width: 1
        border.color: root.online
                      ? (root.themeTokens ? root.themeTokens.successBadgeBorder : "#3310B981")
                      : (root.themeTokens ? root.themeTokens.offlineBadgeBorder : "#1A000000")
        anchors.fill: parent
        implicitHeight: 22
        implicitWidth: textItem.implicitWidth + dot.width + 16
        antialiasing: true
        layer.enabled: true
        layer.samples: 4

        Row {
            anchors.centerIn: parent
            spacing: 6

            Rectangle {
                id: dot
                width: 6
                height: 6
                radius: 3
                color: root.online ? (root.themeTokens ? root.themeTokens.successColor : "#34D399")
                                    : (root.themeTokens ? root.themeTokens.offlineBadgeText : "#94A3B8")
                SequentialAnimation on opacity {
                    running: root.online
                    loops: Animation.Infinite
                    NumberAnimation { from: 1; to: 0.4; duration: 800 }
                    NumberAnimation { from: 0.4; to: 1; duration: 800 }
                }
            }

            Text {
                id: textItem
                text: root.online ? root.textOnline : root.textOffline
                font.pixelSize: 11
                font.weight: Font.DemiBold
                color: root.online
                       ? (root.themeTokens ? root.themeTokens.successColor : "#34D399")
                       : (root.themeTokens ? root.themeTokens.offlineBadgeText : "#94A3B8")
            }
        }
    }
}
