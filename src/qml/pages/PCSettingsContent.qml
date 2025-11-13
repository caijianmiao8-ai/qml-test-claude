import QtQuick 6.5
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import Qt5Compat.GraphicalEffects

import "../components" as Components

Item {
    id: root
    property var themeTokens
    property var t

    property bool autoLaunch: true
    property bool allowLan: true
    property bool lowLatency: false
    property bool allowNotifications: true

    Components.ScrollArea {
        anchors.fill: parent
        themeTokens: root.themeTokens

        ColumnLayout {
            Layout.fillWidth: true
            Layout.maximumWidth: 720
            Layout.alignment: Qt.AlignHCenter
            spacing: 32

            Item { Layout.preferredHeight: 24 }

            Text {
                text: root.t ? root.t("appSettings") : "Settings"
                color: root.themeTokens ? root.themeTokens.textPrimary : "#111827"
                font.pixelSize: 36
                font.weight: Font.DemiBold
            }

            Components.GlassCard {
                themeTokens: root.themeTokens
                padding: 0
                radius: 20
                Layout.fillWidth: true

                ColumnLayout {
                    Layout.fillWidth: true
                    spacing: 0

                    SettingRow {
                        label: root.t ? root.t("autoLaunch") : ""
                        description: root.t ? root.t("autoLaunchDesc") : ""
                        value: root.autoLaunch
                        onToggled: root.autoLaunch = !root.autoLaunch
                    }
                    Divider {}
                    SettingRow {
                        label: root.t ? root.t("allowLanDirect") : ""
                        description: root.t ? root.t("allowLanDirectDesc") : ""
                        value: root.allowLan
                        onToggled: root.allowLan = !root.allowLan
                    }
                    Divider {}
                    SettingRow {
                        label: root.t ? root.t("lowLatencyMode") : ""
                        description: root.t ? root.t("lowLatencyModeDesc") : ""
                        value: root.lowLatency
                        onToggled: root.lowLatency = !root.lowLatency
                    }
                    Divider {}
                    SettingRow {
                        label: root.t ? root.t("allowNotifications") : ""
                        description: root.t ? root.t("allowNotificationsDesc") : ""
                        value: root.allowNotifications
                        onToggled: root.allowNotifications = !root.allowNotifications
                        bottomPadding: 0
                    }
                }
            }

            Item { Layout.preferredHeight: 40 }
        }
    }

    component Divider: Rectangle {
        Layout.fillWidth: true
        height: 1
        color: root.themeTokens ? root.themeTokens.dividerColor : "#14000000"
    }

    component SettingRow: Item {
        property alias label: labelText.text
        property alias description: descriptionText.text
        property bool value: false
        property int bottomPadding: 16
        signal toggled()

        implicitHeight: column.implicitHeight + 32 + bottomPadding
        Layout.fillWidth: true

        ColumnLayout {
            id: column
            anchors.left: parent.left
            anchors.leftMargin: 24
            anchors.right: toggleButton.left
            anchors.rightMargin: 16
            anchors.top: parent.top
            anchors.topMargin: 16
            spacing: 4
            Text {
                id: labelText
                color: root.themeTokens ? root.themeTokens.textPrimary : "#111827"
                font.pixelSize: 14
                font.weight: Font.Medium
                wrapMode: Text.WordWrap
            }
            Text {
                id: descriptionText
                visible: descriptionText.text.length > 0
                color: root.themeTokens ? root.themeTokens.textSecondary : "#64748B"
                font.pixelSize: 12
                wrapMode: Text.WordWrap
            }
        }

        MouseArea {
            anchors.fill: parent
            cursorShape: Qt.PointingHandCursor
            onClicked: toggled()
        }

        IOSSwitch {
            id: toggleButton
            anchors.right: parent.right
            anchors.rightMargin: 24
            anchors.verticalCenter: column.verticalCenter
            value: parent.value
            onClicked: parent.toggled()
        }
    }

    component IOSSwitch: Item {
        property bool value: false
        signal clicked()
        implicitWidth: 51
        implicitHeight: 31

        Rectangle {
            anchors.fill: parent
            radius: height / 2
            color: value ? (root.themeTokens.accentGradientStart + "99") : "#4D9CA3AF"
            antialiasing: true

            Behavior on color {
                ColorAnimation { duration: 200; easing.type: Easing.InOutQuad }
            }
        }
        Rectangle {
            id: knob
            width: 27
            height: 27
            radius: 13.5
            anchors.verticalCenter: parent.verticalCenter
            x: value ? parent.width - width - 2 : 2
            color: "#FFFFFF"
            antialiasing: true

            layer.enabled: true
            layer.effect: DropShadow {
                horizontalOffset: 0
                verticalOffset: 2
                radius: 4
                samples: 9
                color: "#40000000"
                transparentBorder: true
            }

            Behavior on x {
                NumberAnimation { duration: 200; easing.type: Easing.InOutQuad }
            }
        }
        MouseArea {
            anchors.fill: parent
            cursorShape: Qt.PointingHandCursor
            onClicked: { clicked(); mouse.accepted = true }
        }
    }
}
