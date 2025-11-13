// src/qml/pages/PCHomeContent.qml
import QtQuick 6.5
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

import "../components" as Components
import "../components/icons" as Icons

Item {
    id: root

    // 来自 Main.qml 的属性
    property var themeTokens
    property var t
    property string lang
    property var devicesModel
    property string pairingHint
    property int onlineDevicesCount: 0

    Flickable {
        id: flick
        anchors.fill: parent
        contentWidth: width
        contentHeight: contentColumn.implicitHeight + 64
        boundsBehavior: Flickable.StopAtBounds
        clip: true

        Column {
            id: contentColumn
            width: Math.min(flick.width - 64, 1120)
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: parent.top
            anchors.topMargin: 32
            spacing: 32

            // ===== 标题 & 副标题 =====
            Column {
                spacing: 8
                width: parent.width

                Text {
                    text: t ? t("welcomeBack") : "欢迎回来"
                    color: themeTokens.textPrimary
                    font.pixelSize: 36
                    font.weight: Font.DemiBold
                }

                Text {
                    text: t ? t("runningStatus") : "此电脑已准备好被远程接管（被控端）"
                    color: themeTokens.textSecondary
                    font.pixelSize: 14
                    wrapMode: Text.WordWrap
                }
            }

            // ===== 顶部提示玻璃条（PairingHintCard） =====
            Components.PairingHintCard {
                themeTokens: root.themeTokens
                text: root.pairingHint
                width: parent.width
            }

            // ===== 在线设备小卡片行 =====
            Flow {
                width: parent.width
                spacing: 24

                Components.GlassCard {
                    themeTokens: root.themeTokens
                    padding: 24
                    radius: 20
                    width: 260
                    height: 160

                    Column {
                        anchors.fill: parent
                        spacing: 12

                        Rectangle {
                            width: 48
                            height: 48
                            radius: 14
                            color: root.themeTokens.orangeBackground
                            antialiasing: true

                            Icons.MonitorIcon {
                                anchors.centerIn: parent
                                size: 24
                                color: root.themeTokens.orangeAccent
                            }
                        }

                        Text {
                            text: t ? t("onlineDevices") : "在线设备"
                            color: themeTokens.textSecondary
                            font.pixelSize: 14
                        }

                        Text {
                            text: onlineDevicesCount.toString()
                            color: root.themeTokens.orangeAccent
                            font.pixelSize: 30
                            font.weight: Font.DemiBold
                        }
                    }
                }
            }

            // ===== 本机信息大卡片 =====
            Components.GlassCard {
                themeTokens: root.themeTokens
                padding: 32
                radius: 20
                width: parent.width

                Column {
                    anchors.fill: parent
                    spacing: 24

                    Text {
                        text: t ? t("thisMachineInfo") : "本机信息"
                        color: themeTokens.textPrimary
                        font.pixelSize: 24
                        font.weight: Font.DemiBold
                    }

                    GridLayout {
                        columns: 2
                        rowSpacing: 24
                        columnSpacing: 64
                        width: parent.width

                        // 设备名称
                        Column {
                            Layout.fillWidth: true
                            spacing: 8

                            Text {
                                text: t ? t("deviceName") : "设备名称"
                                color: themeTokens.textSecondary
                                font.pixelSize: 14
                            }
                            Text {
                                text: "我的工作电脑"
                                color: themeTokens.textPrimary
                                font.pixelSize: 18
                                font.weight: Font.Medium
                            }
                        }

                        // 设备 ID
                        Column {
                            Layout.fillWidth: true
                            spacing: 8

                            Text {
                                text: t ? t("deviceId") : "设备ID"
                                color: themeTokens.textSecondary
                                font.pixelSize: 14
                            }
                            Text {
                                text: "RD-2024-10241502"
                                color: themeTokens.textPrimary
                                font.pixelSize: 18
                                font.family: "Monospace"
                            }
                        }

                        // 本机 IP
                        Column {
                            Layout.fillWidth: true
                            spacing: 8

                            Text {
                                text: t ? t("localIp") : "本机IP"
                                color: themeTokens.textSecondary
                                font.pixelSize: 14
                            }
                            Text {
                                text: "192.168.1.100"
                                color: themeTokens.textPrimary
                                font.pixelSize: 18
                                font.family: "Monospace"
                            }
                        }

                        // 网络状态
                        Column {
                            Layout.fillWidth: true
                            spacing: 8

                            Text {
                                text: t ? t("networkStatus") : "网络状态"
                                color: themeTokens.textSecondary
                                font.pixelSize: 14
                            }

                            Row {
                                spacing: 8

                                Rectangle {
                                    width: 10
                                    height: 10
                                    radius: 5
                                    color: root.themeTokens.successColor
                                    antialiasing: true

                                    SequentialAnimation on opacity {
                                        loops: Animation.Infinite
                                        NumberAnimation { to: 0.5; duration: 800 }
                                        NumberAnimation { to: 1.0; duration: 800 }
                                    }
                                }

                                Text {
                                    text: t ? t("lanOnline") : "局域网在线"
                                    color: root.themeTokens.successColor
                                    font.pixelSize: 18
                                    font.weight: Font.Medium
                                }
                            }
                        }
                    }
                }
            }

            // ===== 快速操作卡片 =====
            Components.GlassCard {
                themeTokens: root.themeTokens
                padding: 24
                radius: 20
                width: parent.width

                Column {
                    anchors.fill: parent
                    spacing: 16

                    Text {
                        text: t ? t("fastActions") : "快速操作"
                        color: themeTokens.textPrimary
                        font.pixelSize: 18
                        font.weight: Font.DemiBold
                    }

                    RowLayout {
                        width: parent.width
                        spacing: 16

                        // 设备管理
                        Rectangle {
                            Layout.fillWidth: true
                            Layout.preferredHeight: 100
                            radius: 14
                            color: themeTokens.panelBackground
                            border.color: themeTokens.panelBorderColor
                            border.width: 1
                            antialiasing: true

                            Column {
                                anchors.fill: parent
                                anchors.margins: 16
                                spacing: 8

                                Icons.GridIcon {
                                    size: 24
                                    color: themeTokens.accentGradientStart
                                }

                                Text {
                                    text: t ? t("deviceMgmt") : "设备管理"
                                    color: themeTokens.textPrimary
                                    font.pixelSize: 14
                                    font.weight: Font.Medium
                                }

                                Text {
                                    text: t ? t("viewAllDevices") : "查看已注册设备"
                                    color: themeTokens.textSecondary
                                    font.pixelSize: 12
                                    wrapMode: Text.WordWrap
                                }
                            }

                            MouseArea {
                                anchors.fill: parent
                                hoverEnabled: true
                                cursorShape: Qt.PointingHandCursor
                                onEntered: parent.color = themeTokens.hoverBackground
                                onExited: parent.color = themeTokens.panelBackground
                            }
                        }

                        // 系统设置
                        Rectangle {
                            Layout.fillWidth: true
                            Layout.preferredHeight: 100
                            radius: 14
                            color: themeTokens.panelBackground
                            border.color: themeTokens.panelBorderColor
                            border.width: 1
                            antialiasing: true

                            Column {
                                anchors.fill: parent
                                anchors.margins: 16
                                spacing: 8

                                Icons.SettingsIcon {
                                    size: 24
                                    color: themeTokens.purpleAccent
                                }

                                Text {
                                    text: t ? t("systemSettings") : "系统设置"
                                    color: themeTokens.textPrimary
                                    font.pixelSize: 14
                                    font.weight: Font.Medium
                                }

                                Text {
                                    text: t ? t("configureParams") : "配置参数"
                                    color: themeTokens.textSecondary
                                    font.pixelSize: 12
                                    wrapMode: Text.WordWrap
                                }
                            }

                            MouseArea {
                                anchors.fill: parent
                                hoverEnabled: true
                                cursorShape: Qt.PointingHandCursor
                                onEntered: parent.color = themeTokens.hoverBackground
                                onExited: parent.color = themeTokens.panelBackground
                            }
                        }
                    }
                }
            }

            Item { height: 32 } // 底部留一点空白
        }
    }
}
