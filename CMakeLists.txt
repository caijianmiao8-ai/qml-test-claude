cmake_minimum_required(VERSION 3.16)
project(RemoteDesktopQml LANGUAGES CXX)

set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTORCC ON)
set(CMAKE_AUTOUIC ON)

# 这里去掉 Qt5CompatGraphicalEffects 组件
find_package(Qt6 6.5 REQUIRED COMPONENTS
    Quick
    QuickControls2
    Qml
)

qt_standard_project_setup()

qt_add_executable(appRemoteDesktop
    src/main.cpp
)

qt_add_qml_module(appRemoteDesktop
    URI RemoteDesktop
    VERSION 1.0
    QML_FILES
        src/qml/Main.qml
        src/qml/ThemeStore.qml
        src/qml/components/GlassCard.qml
        src/qml/components/StatusBadge.qml
        src/qml/components/PairingHintCard.qml
        src/qml/components/ScrollArea.qml
        src/qml/components/PcTopBar.qml
        src/qml/pages/PCHomeContent.qml
        src/qml/pages/PCDevicesContent.qml
        src/qml/pages/PCSettingsContent.qml
        src/qml/pages/PCAboutContent.qml
        src/qml/components/icons/MonitorIcon.qml
        src/qml/components/icons/SmartphoneIcon.qml
        src/qml/components/icons/SettingsIcon.qml
        src/qml/components/icons/InfoIcon.qml
        src/qml/components/icons/GridIcon.qml
        src/qml/components/icons/HomeIcon.qml
        src/qml/components/icons/SearchIcon.qml
        src/qml/components/icons/FilterIcon.qml
        src/qml/components/icons/MinusIcon.qml
        src/qml/components/icons/MaximizeIcon.qml
        src/qml/components/icons/CloseIcon.qml
        src/qml/components/icons/LogOutIcon.qml
        src/qml/components/icons/MoonIcon.qml
        src/qml/components/icons/SunIcon.qml
        src/qml/components/icons/GlobeIcon.qml
        src/qml/components/icons/TrashIcon.qml
    RESOURCES
        src/qml/i18n/translations.js
)

# 这里也去掉 Qt6::Qt5CompatGraphicalEffects
target_link_libraries(appRemoteDesktop
    PRIVATE
        Qt6::Quick
        Qt6::QuickControls2
        Qt6::Qml
)
