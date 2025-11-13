import QtQuick 6.5
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

import RemoteDesktop 1.0
import "components" as Components
import "pages" as Pages
import "components/icons" as Icons
import "i18n/translations.js" as I18n

ApplicationWindow {
    id: window
    width: 1280
    height: 840
    visible: true
    title: "RemoteDesktop"

    property string lang: "zh"
    property bool darkMode: false
    property string currentTab: "home"
    property string version: "v2.0.1"

    // ① 先确保 ThemeStore.qml 已经删掉 `pragma Singleton`
    // ② 在这里实例化一个 ThemeStore
    ThemeStore {
        id: themeStore
    }

    // ③ 通过实例来拿 tokens
    readonly property var themeTokens: themeStore.tokens(darkMode)
    readonly property string pairingHint: I18n.t(lang, "pairingHintPC")

    ListModel {
        id: devicesModel
        ListElement { idValue: 1; name: "我的工作电脑"; ip: "192.168.1.100"; online: true; lastConnect: "2分钟前"; network: "LAN"; delay: "5ms"; os: "Windows 11" }
        ListElement { idValue: 2; name: "家里的MacBook"; ip: "192.168.1.105"; online: true; lastConnect: "10分钟前"; network: "P2P"; delay: "12ms"; os: "macOS 14" }
        ListElement { idValue: 3; name: "Windows台式机"; ip: "120.76.xxx.xxx"; online: false; lastConnect: "2小时前"; network: "Relay"; delay: "-"; os: "Windows 10" }
        ListElement { idValue: 4; name: "办公室主机"; ip: "10.0.0.50"; online: true; lastConnect: "1天前"; network: "LAN"; delay: "3ms"; os: "Windows 11" }
    }

    ListModel {
        id: controllersModel
        ListElement { idValue: "m1"; name: "iPhone 15 Pro"; type: "phone"; online: true; lastActive: "刚刚"; os: "iOS 18"; battery: "82%" }
        ListElement { idValue: "m2"; name: "iPad Air"; type: "tablet"; online: false; lastActive: "2小时前"; os: "iPadOS 18"; battery: "57%" }
    }

    background: Rectangle {
        anchors.fill: parent
        gradient: Gradient {
            GradientStop { position: 0.0; color: window.themeTokens.backgroundGradientStart }
            GradientStop { position: 1.0; color: window.themeTokens.backgroundGradientEnd }
        }
    }

    function t(key) {
        return I18n.t(lang, key)
    }

    property int onlineDevicesCount: {
        var count = 0
        for (var i = 0; i < devicesModel.count; ++i) {
            if (devicesModel.get(i).online) {
                count += 1
            }
        }
        return count
    }

    header: Item {}

    Item {
        id: shellContainer
        anchors.centerIn: parent
        width: window.visibility === Window.FullScreen
               ? parent.width
               : Math.min(parent.width - 96, 1280)
        height: window.visibility === Window.FullScreen
                ? parent.height
                : Math.min(parent.height - 96, 960)

        Rectangle {
            id: shell
            anchors.fill: parent
            radius: window.visibility === Window.FullScreen ? 0 : 24
            color: window.themeTokens.panelBackground
            border.color: window.themeTokens.panelBorderColor
            border.width: 1
            clip: true

            Components.PcTopBar {
                anchors.top: parent.top
                anchors.right: parent.right
                themeTokens: window.themeTokens
                onMinimizeRequested: window.showMinimized()
                onFullscreenToggleRequested: window.visibility =
                                                window.visibility === Window.FullScreen
                                                ? Window.Windowed
                                                : Window.FullScreen
                onCloseRequested: {
                    console.log("Close requested")
                    window.close()
                }
            }

            RowLayout {
                anchors.fill: parent
                anchors.topMargin: 80
                spacing: 0

                // ===== 左侧侧边栏 =====
                Rectangle {
                    Layout.preferredWidth: 256
                    Layout.fillHeight: true
                    color: window.themeTokens.panelBackground
                    border.color: window.themeTokens.panelBorderColor
                    border.width: 1

                    ColumnLayout {
                        anchors.fill: parent
                        spacing: 0

                        // 品牌区
                        Rectangle {
                            Layout.fillWidth: true
                            Layout.preferredHeight: 96
                            color: "transparent"

                            RowLayout {
                                anchors.fill: parent
                                anchors.margins: 24
                                spacing: 16

                                Rectangle {
                                    width: 48
                                    height: 48
                                    radius: 16
                                    gradient: Gradient {
                                        GradientStop { position: 0; color: window.themeTokens.accentGradientStart }
                                        GradientStop { position: 1; color: window.themeTokens.accentGradientEnd }
                                    }

                                    Icons.MonitorIcon {
                                        anchors.centerIn: parent
                                        size: 24
                                        color: "#FFFFFF"
                                    }
                                }

                                ColumnLayout {
                                    spacing: 4

                                    Text {
                                        text: window.t("appName")
                                        color: window.themeTokens.textPrimary
                                        font.pixelSize: 16
                                        font.weight: Font.DemiBold
                                    }
                                    Text {
                                        text: window.version
                                        color: window.themeTokens.textSecondary
                                        font.pixelSize: 11
                                    }
                                }
                            }
                        }

                        // 菜单列表
                        ScrollView {
                            Layout.fillWidth: true
                            Layout.fillHeight: true
                            clip: true
                            ScrollBar.vertical.policy: ScrollBar.AsNeeded

                            Item {
                                width: parent.width
                                implicitHeight: menuColumn.implicitHeight + 32

                                Column {
                                    id: menuColumn
                                    anchors.left: parent.left
                                    anchors.right: parent.right
                                    anchors.top: parent.top
                                    anchors.margins: 16
                                    spacing: 8

                                    MenuButton {
                                        pageId: "home"
                                        label: window.t("hostMenuHome")
                                        iconComponent: homeIcon
                                    }
                                    MenuButton {
                                        pageId: "devices"
                                        label: window.t("hostMenuDevices")
                                        iconComponent: devicesIcon
                                        badgeValue: devicesModel.count
                                    }
                                    MenuButton {
                                        pageId: "settings"
                                        label: window.t("hostMenuSettings")
                                        iconComponent: settingsIcon
                                    }
                                    MenuButton {
                                        pageId: "about"
                                        label: window.t("hostMenuAbout")
                                        iconComponent: infoIcon
                                    }
                                }
                            }
                        }

                        // 底部控制按钮
                        ColumnLayout {
                            Layout.fillWidth: true
                            Layout.preferredHeight: 180
                            spacing: 8
                            Layout.leftMargin: 16
                            Layout.rightMargin: 16
                            Layout.topMargin: 16
                            Layout.bottomMargin: 16

                            ControlButton {
                                label: window.t("language") + ": " + (window.lang === "zh" ? "中文" : "English")
                                iconComponent: globeIcon
                                onTriggered: window.lang = window.lang === "zh" ? "en" : "zh"
                            }

                            ControlButton {
                                label: window.darkMode ? window.t("lightMode") : window.t("darkMode")
                                iconComponent: window.darkMode ? sunIcon : moonIcon
                                onTriggered: window.darkMode = !window.darkMode
                            }

                            ControlButton {
                                label: window.t("leaveLogin")
                                iconComponent: logoutIcon
                                textColor: window.themeTokens.dangerText
                                hoverColor: "#1AF87171"
                                onTriggered: console.log("Sign out clicked")
                            }
                        }

                        Item { Layout.fillHeight: true }
                    }

                    // 图标组件
                    Component { id: homeIcon; Icons.HomeIcon { color: window.themeTokens.textPrimary } }
                    Component { id: devicesIcon; Icons.GridIcon { color: window.themeTokens.textPrimary } }
                    Component { id: settingsIcon; Icons.SettingsIcon { color: window.themeTokens.textPrimary } }
                    Component { id: infoIcon; Icons.InfoIcon { color: window.themeTokens.textPrimary } }
                    Component { id: globeIcon; Icons.GlobeIcon { color: window.themeTokens.textPrimary } }
                    Component { id: moonIcon; Icons.MoonIcon { color: window.themeTokens.textPrimary } }
                    Component { id: sunIcon; Icons.SunIcon { color: "#FBBF24" } }
                    Component { id: logoutIcon; Icons.LogOutIcon { color: window.themeTokens.dangerText } }
                }

                // ===== 右侧主内容区 =====
                Rectangle {
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                    color: "transparent"

                    Loader {
                        anchors.fill: parent
                        sourceComponent: currentTab === "home"
                                         ? homePage
                                         : currentTab === "devices"
                                           ? devicesPage
                                           : currentTab === "settings"
                                             ? settingsPage
                                             : aboutPage
                    }
                }
            }
        }
    }

    // ===== 各页面 Component 包装 =====

    Component {
        id: homePage
        Pages.PCHomeContent {
            themeTokens: window.themeTokens
            t: window.t
            lang: window.lang
            devicesModel: devicesModel
            pairingHint: window.pairingHint
            onlineDevicesCount: window.onlineDevicesCount
        }
    }

    Component {
        id: devicesPage
        Pages.PCDevicesContent {
            themeTokens: window.themeTokens
            t: window.t
            pairingHint: window.pairingHint
            devicesModel: devicesModel
            controllersModel: controllersModel
        }
    }

    Component {
        id: settingsPage
        Pages.PCSettingsContent {
            themeTokens: window.themeTokens
            t: window.t
        }
    }

    Component {
        id: aboutPage
        Pages.PCAboutContent {
            themeTokens: window.themeTokens
            t: window.t
        }
    }

    // ===== 侧边栏菜单按钮 =====
    // ===== 侧边栏菜单按钮（基于 Button，自定义外观） =====
    component MenuButton: Button {
        id: menuButton

        property string pageId: ""
        property var iconComponent
        property var badgeValue: undefined
        property string label: ""
        property bool active: window.currentTab === pageId

        implicitHeight: 44
        width: parent ? parent.width : implicitWidth

        background: Rectangle {
            radius: 14
            color: menuButton.active
                   ? window.themeTokens.sidebarActiveBackground
                   : "transparent"
            border.color: menuButton.active
                          ? window.themeTokens.panelBorderColor
                          : "transparent"
        }

        contentItem: RowLayout {
            anchors.fill: parent
            anchors.margins: 12
            spacing: 12

            Loader { sourceComponent: menuButton.iconComponent }

            Text {
                text: menuButton.label
                color: window.themeTokens.textPrimary
                font.pixelSize: 14
                font.weight: Font.Medium
            }

            Item { Layout.fillWidth: true }

            Label {
                visible: badgeValue !== undefined
                // ✅ 防止 text 是 undefined
                text: badgeValue !== undefined ? String(badgeValue) : ""
                font.pixelSize: 11
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                color: menuButton.active
                       ? window.themeTokens.accentGradientStart
                       : window.themeTokens.textSecondary
                padding: 4
                background: Rectangle {
                    radius: 8
                    color: menuButton.active
                           ? "#260A84FF"
                           : window.themeTokens.neutralBadgeBackground
                }
            }
        }

        onClicked: window.currentTab = pageId
    }


    // ===== 底部控制按钮 =====
    component ControlButton: Button {
        id: controlButton

        property var iconComponent
        property color textColor: window.themeTokens.textPrimary
        property color hoverColor: window.themeTokens.hoverBackground
        property string label: ""
        signal triggered()

        implicitHeight: 44
        width: parent ? parent.width : implicitWidth

        background: Rectangle {
            radius: 14
            color: controlButton.hovered
                   ? controlButton.hoverColor
                   : "transparent"
        }

        contentItem: RowLayout {
            anchors.fill: parent
            anchors.margins: 12
            spacing: 12

            Loader { sourceComponent: controlButton.iconComponent }

            Text {
                text: controlButton.label
                color: controlButton.textColor
                font.pixelSize: 14
                font.weight: Font.Medium
            }
        }

        onClicked: triggered()
    }
}
