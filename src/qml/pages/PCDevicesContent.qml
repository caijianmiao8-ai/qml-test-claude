import QtQuick 6.5
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import Qt5Compat.GraphicalEffects

import "../components" as Components
import "../components/icons" as Icons

Item {
    id: root

    // 从 Main.qml 传入
    property var themeTokens
    property var t
    property string pairingHint: ""
    property var devicesModel      // ListModel
    property var controllersModel  // ListModel

    Components.ScrollArea {
        anchors.fill: parent
        themeTokens: root.themeTokens

        ColumnLayout {
            Layout.fillWidth: true
            spacing: 32
            Layout.alignment: Qt.AlignHCenter
            Layout.maximumWidth: 1120

            Item { Layout.preferredHeight: 24 }

            // 标题 + 搜索 / 筛选
            RowLayout {
                Layout.fillWidth: true
                spacing: 16

                ColumnLayout {
                    Layout.fillWidth: true
                    spacing: 8

                    Text {
                        text: root.t ? root.t("devicesPageTitle") : "Devices"
                        color: root.themeTokens ? root.themeTokens.textPrimary : "#111827"
                        font.pixelSize: 36
                        font.weight: Font.DemiBold
                    }
                    Text {
                        text: root.t ? root.t("devicesPageDesc") : ""
                        color: root.themeTokens ? root.themeTokens.textSecondary : "#64748B"
                        font.pixelSize: 14
                        wrapMode: Text.WordWrap
                        Layout.preferredWidth: parent.width * 0.7
                    }
                }

                RowLayout {
                    spacing: 12

                    // 搜索按钮（目前只是样式展示）
                    Button {
                        Layout.preferredHeight: 40
                        background: Rectangle {
                            radius: 14
                            color: root.themeTokens ? root.themeTokens.panelBackground : "#F9FAFB"
                            border.color: root.themeTokens ? root.themeTokens.panelBorderColor : "#E5E7EB"
                            border.width: 1
                        }
                        contentItem: RowLayout {
                            anchors.fill: parent
                            anchors.margins: 10
                            spacing: 6
                            Icons.SearchIcon {
                                size: 18
                                color: root.themeTokens ? root.themeTokens.textPrimary : "#111827"
                            }
                            Text {
                                text: root.t ? root.t("search") : "Search"
                                color: root.themeTokens ? root.themeTokens.textPrimary : "#111827"
                                font.pixelSize: 14
                                font.weight: Font.Medium
                            }
                        }
                    }

                    // 筛选按钮（同样只是样式）
                    Button {
                        Layout.preferredHeight: 40
                        background: Rectangle {
                            radius: 14
                            color: root.themeTokens ? root.themeTokens.panelBackground : "#F9FAFB"
                            border.color: root.themeTokens ? root.themeTokens.panelBorderColor : "#E5E7EB"
                            border.width: 1
                        }
                        contentItem: RowLayout {
                            anchors.fill: parent
                            anchors.margins: 10
                            spacing: 6
                            Icons.FilterIcon {
                                size: 18
                                color: root.themeTokens ? root.themeTokens.textPrimary : "#111827"
                            }
                            Text {
                                text: root.t ? root.t("filter") : "Filter"
                                color: root.themeTokens ? root.themeTokens.textPrimary : "#111827"
                                font.pixelSize: 14
                                font.weight: Font.Medium
                            }
                        }
                    }
                }
            }

            // 配对提示卡片
            Components.PairingHintCard {
                themeTokens: root.themeTokens
                text: root.pairingHint
                Layout.fillWidth: true
            }

            // ===== 可控制本机的设备 =====
            ColumnLayout {
                Layout.fillWidth: true
                spacing: 12

                Text {
                    text: root.t ? root.t("controllersTitle") : "Devices that can control this machine"
                    color: root.themeTokens ? root.themeTokens.textPrimary : "#111827"
                    font.pixelSize: 20
                    font.weight: Font.DemiBold
                }
                Text {
                    text: root.t ? root.t("controllersDesc") : ""
                    color: root.themeTokens ? root.themeTokens.textSecondary : "#64748B"
                    font.pixelSize: 13
                    wrapMode: Text.WordWrap
                }

                // 控制端设备卡片列表
                Flow {
                    Layout.fillWidth: true
                    spacing: 24

                    Repeater {
                        model: controllersModel

                        Components.GlassCard {
                            themeTokens: root.themeTokens
                            padding: 24
                            radius: 20
                            enableHoverEffect: true
                            implicitWidth: 420
                            implicitHeight: 260
                            Layout.preferredWidth: 420

                            ColumnLayout {
                                Layout.fillWidth: true
                                spacing: 16

                                RowLayout {
                                    Layout.fillWidth: true
                                    spacing: 16

                                    Rectangle {
                                        width: 64
                                        height: 64
                                        radius: 16
                                        antialiasing: true
                                        gradient: Gradient {
                                            GradientStop { position: 0; color: model.online ? root.themeTokens.accentGradientStart : "#94A3B8" }
                                            GradientStop { position: 1; color: model.online ? root.themeTokens.accentGradientEnd : "#6B7280" }
                                        }

                                        layer.enabled: model.online
                                        layer.effect: DropShadow {
                                            horizontalOffset: 0
                                            verticalOffset: 20
                                            radius: 40
                                            samples: 32
                                            color: "#260A84FF"
                                            transparentBorder: true
                                        }

                                        Icons.SmartphoneIcon {
                                            anchors.centerIn: parent
                                            size: 32
                                            color: "#FFFFFF"
                                        }
                                    }

                                    ColumnLayout {
                                        Layout.fillWidth: true
                                        spacing: 4

                                        Text {
                                            text: model.name
                                            color: root.themeTokens ? root.themeTokens.textPrimary : "#111827"
                                            font.pixelSize: 20
                                            font.weight: Font.DemiBold
                                            elide: Text.ElideRight
                                        }
                                        Text {
                                            text: model.os
                                            color: root.themeTokens ? root.themeTokens.textSecondary : "#64748B"
                                            font.pixelSize: 14
                                            elide: Text.ElideRight
                                        }
                                    }

                                    Components.StatusBadge {
                                        online: model.online
                                        themeTokens: root.themeTokens
                                        Layout.alignment: Qt.AlignTop
                                    }
                                }

                                ColumnLayout {
                                    Layout.fillWidth: true
                                    spacing: 8

                                    RowLayout {
                                        Layout.fillWidth: true
                                        spacing: 8
                                        Text {
                                            text: root.t ? root.t("lastActive") : "Last active"
                                            color: root.themeTokens ? root.themeTokens.textSecondary : "#6B7280"
                                            font.pixelSize: 14
                                        }
                                        Item { Layout.fillWidth: true }
                                        Text {
                                            text: model.lastActive
                                            color: root.themeTokens ? root.themeTokens.textPrimary : "#111827"
                                            font.pixelSize: 14
                                        }
                                    }
                                }

                                RowLayout {
                                    Layout.fillWidth: true
                                    spacing: 8
                                    Button {
                                        Layout.fillWidth: true
                                        Layout.preferredHeight: 40
                                        background: Rectangle {
                                            radius: 14
                                            color: root.themeTokens ? root.themeTokens.panelBackground : "#F9FAFB"
                                            border.color: root.themeTokens ? root.themeTokens.panelBorderColor : "#E5E7EB"
                                            border.width: 1
                                            antialiasing: true
                                        }
                                        contentItem: Text {
                                            anchors.centerIn: parent
                                            text: root.t ? root.t("manage") : "Manage"
                                            color: root.themeTokens ? root.themeTokens.textPrimary : "#111827"
                                            font.pixelSize: 14
                                            font.weight: Font.Medium
                                        }
                                    }

                                    Button {
                                        Layout.preferredWidth: 40
                                        Layout.preferredHeight: 40
                                        background: Rectangle {
                                            radius: 14
                                            color: root.themeTokens ? root.themeTokens.dangerBackground : "#FEE2E2"
                                            border.color: root.themeTokens ? root.themeTokens.dangerBorder : "#FCA5A5"
                                            border.width: 1
                                            antialiasing: true
                                        }
                                        contentItem: Icons.TrashIcon {
                                            anchors.centerIn: parent
                                            size: 16
                                            color: root.themeTokens ? root.themeTokens.dangerText : "#F87171"
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }

            // ===== 已注册的主机设备 =====
            ColumnLayout {
                Layout.fillWidth: true
                spacing: 12

                Text {
                    text: root.t ? root.t("registeredDevicesTitle") : "Registered devices"
                    color: root.themeTokens ? root.themeTokens.textPrimary : "#111827"
                    font.pixelSize: 20
                    font.weight: Font.DemiBold
                }
                Text {
                    text: root.t ? root.t("registeredDevicesDesc") : ""
                    color: root.themeTokens ? root.themeTokens.textSecondary : "#64748B"
                    font.pixelSize: 13
                    wrapMode: Text.WordWrap
                }

                Flow {
                    Layout.fillWidth: true
                    spacing: 24

                    Repeater {
                        model: devicesModel

                        Components.GlassCard {
                            themeTokens: root.themeTokens
                            padding: 24
                            radius: 20
                            enableHoverEffect: true
                            implicitWidth: 540
                            implicitHeight: 260
                            Layout.preferredWidth: 540

                            ColumnLayout {
                                Layout.fillWidth: true
                                spacing: 16

                                RowLayout {
                                    Layout.fillWidth: true
                                    spacing: 16

                                    Rectangle {
                                        width: 64
                                        height: 64
                                        radius: 16
                                        antialiasing: true
                                        gradient: Gradient {
                                            GradientStop { position: 0; color: model.online ? root.themeTokens.accentGradientStart : "#94A3B8" }
                                            GradientStop { position: 1; color: model.online ? root.themeTokens.accentGradientEnd : "#6B7280" }
                                        }

                                        layer.enabled: model.online
                                        layer.effect: DropShadow {
                                            horizontalOffset: 0
                                            verticalOffset: 20
                                            radius: 40
                                            samples: 32
                                            color: "#260A84FF"
                                            transparentBorder: true
                                        }

                                        Icons.MonitorIcon {
                                            anchors.centerIn: parent
                                            size: 32
                                            color: "#FFFFFF"
                                        }
                                    }

                                    ColumnLayout {
                                        Layout.fillWidth: true
                                        spacing: 4

                                        Text {
                                            text: model.name
                                            color: root.themeTokens ? root.themeTokens.textPrimary : "#111827"
                                            font.pixelSize: 20
                                            font.weight: Font.DemiBold
                                            elide: Text.ElideRight
                                        }
                                        Text {
                                            text: model.os
                                            color: root.themeTokens ? root.themeTokens.textSecondary : "#64748B"
                                            font.pixelSize: 14
                                            elide: Text.ElideRight
                                        }
                                    }

                                    Components.StatusBadge {
                                        online: model.online
                                        themeTokens: root.themeTokens
                                        Layout.alignment: Qt.AlignTop
                                    }
                                }

                                ColumnLayout {
                                    Layout.fillWidth: true
                                    spacing: 8

                                    RowLayout {
                                        Layout.fillWidth: true
                                        spacing: 8
                                        Text {
                                            text: root.t ? root.t("ipAddress") : "IP"
                                            color: root.themeTokens ? root.themeTokens.textSecondary : "#6B7280"
                                            font.pixelSize: 14
                                        }
                                        Item { Layout.fillWidth: true }
                                        Text {
                                            text: model.ip
                                            color: root.themeTokens ? root.themeTokens.textPrimary : "#111827"
                                            font.pixelSize: 14
                                            font.family: "Monospace"
                                        }
                                    }

                                    RowLayout {
                                        Layout.fillWidth: true
                                        spacing: 8
                                        Text {
                                            text: root.t ? root.t("lastSeen") : "Last seen"
                                            color: root.themeTokens ? root.themeTokens.textSecondary : "#6B7280"
                                            font.pixelSize: 14
                                        }
                                        Item { Layout.fillWidth: true }
                                        Text {
                                            text: model.lastConnect
                                            color: root.themeTokens ? root.themeTokens.textPrimary : "#111827"
                                            font.pixelSize: 14
                                        }
                                    }

                                    // 在线时显示网络模式 / 延迟
                                    ColumnLayout {
                                        Layout.fillWidth: true
                                        spacing: 8
                                        visible: model.online

                                        RowLayout {
                                            Layout.fillWidth: true
                                            spacing: 8
                                            Text {
                                                text: root.t ? root.t("netMode") : "Network"
                                                color: root.themeTokens ? root.themeTokens.textSecondary : "#6B7280"
                                                font.pixelSize: 14
                                            }
                                            Item { Layout.fillWidth: true }
                                            Text {
                                                text: model.network
                                                color: model.network === "LAN"
                                                       ? "#22C55E"
                                                       : (model.network === "P2P" ? "#22D3EE" : root.themeTokens.orangeAccent)
                                                font.pixelSize: 14
                                                font.weight: Font.Medium
                                            }
                                        }

                                        RowLayout {
                                            Layout.fillWidth: true
                                            spacing: 8
                                            Text {
                                                text: root.t ? root.t("delay") : "Delay"
                                                color: root.themeTokens ? root.themeTokens.textSecondary : "#6B7280"
                                                font.pixelSize: 14
                                            }
                                            Item { Layout.fillWidth: true }
                                            Text {
                                                text: model.delay
                                                color: root.themeTokens.successColor
                                                font.pixelSize: 14
                                                font.weight: Font.Medium
                                            }
                                        }
                                    }
                                }

                                RowLayout {
                                    Layout.fillWidth: true
                                    spacing: 8
                                    Button {
                                        Layout.fillWidth: true
                                        Layout.preferredHeight: 40
                                        background: Rectangle {
                                            radius: 14
                                            color: root.themeTokens ? root.themeTokens.panelBackground : "#F9FAFB"
                                            border.color: root.themeTokens ? root.themeTokens.panelBorderColor : "#E5E7EB"
                                            border.width: 1
                                            antialiasing: true
                                        }
                                        contentItem: Text {
                                            anchors.centerIn: parent
                                            text: root.t ? root.t("manage") : "Manage"
                                            color: root.themeTokens ? root.themeTokens.textPrimary : "#111827"
                                            font.pixelSize: 14
                                            font.weight: Font.Medium
                                        }
                                    }

                                    Button {
                                        Layout.preferredWidth: 40
                                        Layout.preferredHeight: 40
                                        background: Rectangle {
                                            radius: 14
                                            color: root.themeTokens ? root.themeTokens.dangerBackground : "#FEE2E2"
                                            border.color: root.themeTokens ? root.themeTokens.dangerBorder : "#FCA5A5"
                                            border.width: 1
                                            antialiasing: true
                                        }
                                        contentItem: Icons.TrashIcon {
                                            anchors.centerIn: parent
                                            size: 16
                                            color: root.themeTokens ? root.themeTokens.dangerText : "#F87171"
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }

            Item { Layout.preferredHeight: 40 }
        }
    }
}
