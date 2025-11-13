import QtQuick 6.5
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

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
                padding: 24
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

        implicitHeight: column.implicitHeight + bottomPadding
        Layout.fillWidth: true

        ColumnLayout {
            id: column
            anchors.left: parent.left
            anchors.right: toggleButton.left
            anchors.rightMargin: 16
            spacing: 4
            Text {
                id: labelText
                color: root.themeTokens ? root.themeTokens.textPrimary : "#111827"
                font.pixelSize: 16
                font.weight: Font.Medium
                wrapMode: Text.WordWrap
            }
            Text {
                id: descriptionText
                visible: descriptionText.text.length > 0
                color: root.themeTokens ? root.themeTokens.textSecondary : "#64748B"
                font.pixelSize: 13
                wrapMode: Text.WordWrap
            }
        }

        MouseArea {
            anchors.fill: parent
            onClicked: toggled()
        }

        IOSSwitch {
            id: toggleButton
            anchors.right: parent.right
            anchors.verticalCenter: column.verticalCenter
            value: parent.value
            onClicked: parent.toggled()
        }
    }

    component IOSSwitch: Item {
        property bool value: false
        signal clicked()
        implicitWidth: 44
        implicitHeight: 24

        Rectangle {
            anchors.fill: parent
            radius: height / 2
            color: value ? "#990A84FF" : "#3357636F"
        }
        Rectangle {
            width: 20
            height: 20
            radius: 10
            anchors.verticalCenter: parent.verticalCenter
            anchors.left: parent.left
            anchors.leftMargin: value ? parent.width - width - 4 : 4
            color: "#FFFFFFFF"
            Behavior on anchors.leftMargin { NumberAnimation { duration: 160; easing.type: Easing.InOutQuad } }
            Behavior on color { ColorAnimation { duration: 160 } }
        }
        MouseArea {
            anchors.fill: parent
            onClicked: { clicked(); mouse.accepted = true }
        }
    }
}
