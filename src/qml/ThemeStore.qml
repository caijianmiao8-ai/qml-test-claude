import QtQuick 6.5

QtObject {
    id: themeStoreRoot   // 可要可不要

    readonly property var lightTokens: ({
        backgroundGradientStart: "#F5F7FB",
        backgroundGradientEnd: "#E2E8F0",
        backgroundOverlay: "#FFFFFFFF",
        panelBackground: "#99FFFFFF",
        panelBorderColor: "#14000000",
        cardBackground: "#B3FFFFFF",
        cardBorderColor: "#14000000",
        cardShadowColor: "#1A000000",
        textPrimary: "#111827",
        textSecondary: "#64748B",
        accentGradientStart: "#0A84FF",
        accentGradientEnd: "#0051C7",
        accentText: "#FFFFFFFF",
        hoverBackground: "#0D000000",
        hoverText: "#111827",
        dividerColor: "#14000000",
        sidebarActiveBackground: "#0D000000",
        sidebarActiveShadow: "#26000000",
        subtleHoverBackground: "#14000000",
        successColor: "#34D399",
        successBadgeBackground: "#1F10B981",
        successBadgeBorder: "#3310B981",
        offlineBadgeBackground: "#0FFFFFFF",
        offlineBadgeBorder: "#1A000000",
        offlineBadgeText: "#64748B",
        dangerText: "#F87171",
        neutralBadgeBackground: "#0D000000",
        scrollGradientColor: "#14000000",
        accentShadowColor: "#260A84FF"
    })

    readonly property var darkTokens: ({
        backgroundGradientStart: "#282830",
        backgroundGradientEnd: "#0A0A0F",
        backgroundOverlay: "#FF0A0A0C",
        panelBackground: "#660F1118",
        panelBorderColor: "#33FFFFFF",
        cardBackground: "#660F1118",
        cardBorderColor: "#26FFFFFF",
        cardShadowColor: "#66000000",
        textPrimary: "#F1F5F9",
        textSecondary: "#94A3B8",
        accentGradientStart: "#0A84FF",
        accentGradientEnd: "#0051C7",
        accentText: "#FFFFFFFF",
        hoverBackground: "#26FFFFFF",
        hoverText: "#F8FAFC",
        dividerColor: "#26FFFFFF",
        sidebarActiveBackground: "#1AFFFFFF",
        sidebarActiveShadow: "#66000000",
        subtleHoverBackground: "#26000000",
        successColor: "#4ADE80",
        successBadgeBackground: "#2610B981",
        successBadgeBorder: "#3310B981",
        offlineBadgeBackground: "#19000000",
        offlineBadgeBorder: "#26000000",
        offlineBadgeText: "#94A3B8",
        dangerText: "#FCA5A5",
        neutralBadgeBackground: "#26000000",
        scrollGradientColor: "#26FFFFFF",
        accentShadowColor: "#330A84FF"
    })

    function tokens(darkMode) {
        return darkMode ? darkTokens : lightTokens;
    }
}
