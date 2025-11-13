// src/qml/components/PairingHintCard.qml
import QtQuick 6.5
import QtQuick.Layouts 1.15

import "icons" as Icons    // 复用你已有的图标组件
import "."                  // 同目录下的 GlassCard

Item {
    id: root

    property var themeTokens
    property string text: ""

    implicitWidth: hintCard.implicitWidth
    implicitHeight: hintCard.implicitHeight

    GlassCard {
        id: hintCard
        themeTokens: root.themeTokens
        radius: 22
        padding: 16
        width: parent.width

        RowLayout {
            anchors.fill: parent
            spacing: 12

            Rectangle {
                Layout.preferredWidth: 32
                Layout.preferredHeight: 32
                radius: 12
                color: "#F0F7FF"
                border.width: 0

                Icons.InfoIcon {
                    anchors.centerIn: parent
                    size: 16
                    color: "#0A84FF"
                }
            }

            Text {
                Layout.fillWidth: true
                text: root.text
                wrapMode: Text.Wrap
                color: root.themeTokens ? root.themeTokens.textSecondary : "#64748B"
                font.pixelSize: 12
                lineHeight: 1.5
            }
        }
    }
}
