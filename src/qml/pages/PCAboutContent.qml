import QtQuick 6.5
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

import "../components" as Components
import "../components/icons" as Icons

Item {
    id: root
    property var themeTokens
    property var t

    Components.ScrollArea {
        anchors.fill: parent
        themeTokens: root.themeTokens

        ColumnLayout {
            Layout.fillWidth: true
            Layout.maximumWidth: 720
            Layout.alignment: Qt.AlignHCenter
            spacing: 32

            Item { Layout.preferredHeight: 24 }

            ColumnLayout {
                Layout.fillWidth: true
                Layout.alignment: Qt.AlignHCenter
                spacing: 16

                Rectangle {
                    width: 96
                    height: 96
                    radius: 24
                    color: "#330A84FF"
                    Layout.alignment: Qt.AlignHCenter
                    Icons.MonitorIcon {
                        anchors.centerIn: parent
                        size: 48
                        color: "#FFFFFF"
                    }
                }

                Text {
                    text: root.t ? root.t("appName") : "RemoteDesktop"
                    color: root.themeTokens ? root.themeTokens.textPrimary : "#111827"
                    font.pixelSize: 36
                    font.weight: Font.DemiBold
                    horizontalAlignment: Text.AlignHCenter
                }

                Text {
                    text: (root.t ? root.t("aboutTitle") : "Version") + " 2.0.1"
                    color: root.themeTokens ? root.themeTokens.textSecondary : "#64748B"
                    font.pixelSize: 20
                    horizontalAlignment: Text.AlignHCenter
                }

                Button {
                    Layout.alignment: Qt.AlignHCenter
                    background: Rectangle {
                        radius: 14
                        gradient: Gradient {
                            GradientStop { position: 0; color: root.themeTokens ? root.themeTokens.accentGradientStart : "#0A84FF" }
                            GradientStop { position: 1; color: root.themeTokens ? root.themeTokens.accentGradientEnd : "#0051C7" }
                        }
                    }
                    contentItem: Text {
                        anchors.centerIn: parent
                        text: root.t ? root.t("checkUpdate") : "Check"
                        color: root.themeTokens ? root.themeTokens.accentText : "#FFFFFF"
                        font.pixelSize: 14
                        font.weight: Font.Medium
                    }
                    padding: 12
                }
            }

            Components.GlassCard {
                themeTokens: root.themeTokens
                padding: 24
                Layout.fillWidth: true

                ColumnLayout {
                    Layout.fillWidth: true
                    spacing: 12
                    Text {
                        text: root.t ? root.t("changelog") : "Changelog"
                        color: root.themeTokens ? root.themeTokens.textPrimary : "#111827"
                        font.pixelSize: 18
                        font.weight: Font.DemiBold
                    }
                    Text {
                        text: "v2.0.1 (2024-10-24)"
                        color: root.themeTokens ? root.themeTokens.textPrimary : "#111827"
                        font.pixelSize: 14
                        font.weight: Font.Medium
                    }
                    Column {
                        spacing: 6
                        Text {
                            text: "• 优化网络连接稳定性 / Improved connection stability"
                            color: root.themeTokens ? root.themeTokens.textSecondary : "#64748B"
                            font.pixelSize: 13
                            wrapMode: Text.WordWrap
                        }
                        Text {
                            text: "• 修复部分已知问题 / Bug fixes"
                            color: root.themeTokens ? root.themeTokens.textSecondary : "#64748B"
                            font.pixelSize: 13
                            wrapMode: Text.WordWrap
                        }
                        Text {
                            text: "• 提升画质传输效率 / Better streaming quality"
                            color: root.themeTokens ? root.themeTokens.textSecondary : "#64748B"
                            font.pixelSize: 13
                            wrapMode: Text.WordWrap
                        }
                    }
                }
            }

            Components.GlassCard {
                themeTokens: root.themeTokens
                padding: 24
                Layout.fillWidth: true

                GridLayout {
                    Layout.fillWidth: true
                    columns: 2
                    columnSpacing: 24
                    rowSpacing: 12

                    Repeater {
                        model: [
                            { label: root.t ? root.t("operatingSystem") : "OS", value: root.t ? root.t("operatingSystemValue") : "Windows 11 Pro" },
                            { label: root.t ? root.t("buildVersion") : "Build", value: root.t ? root.t("buildVersionValue") : "22000.1219" }
                        ]
                        delegate: ColumnLayout {
                            Layout.fillWidth: true
                            spacing: 4
                            Text {
                                text: modelData.label
                                color: root.themeTokens ? root.themeTokens.textSecondary : "#64748B"
                                font.pixelSize: 13
                            }
                            Text {
                                text: modelData.value
                                color: root.themeTokens ? root.themeTokens.textPrimary : "#111827"
                                font.pixelSize: 16
                                font.weight: Font.Medium
                            }
                        }
                    }
                }
            }

            Item { Layout.preferredHeight: 40 }
        }
    }
}
