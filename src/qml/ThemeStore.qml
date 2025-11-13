import QtQuick 6.5

QtObject {
    id: themeStoreRoot   // 可要可不要

    readonly property var lightTokens: ({
        // Backgrounds - matching React's radial gradient & transparency
        backgroundGradientStart: "#F9FAFB",    // Very light gray-blue
        backgroundGradientEnd: "#E5E7EB",      // Light gray
        backgroundOverlay: "#FFFFFFFF",
        panelBackground: "#F2FFFFFF",          // bg-white/95 (more opaque)
        panelBorderColor: "#0D000000",         // border-black/5
        cardBackground: "#F2FFFFFF",           // bg-white/95 (more opaque for cards)
        cardBorderColor: "#14000000",          // border-black/8
        cardShadowColor: "#0F000000",          // shadow rgba(0,0,0,0.06)

        // Text colors - slate scale
        textPrimary: "#0F172A",                // text-slate-900
        textSecondary: "#64748B",              // text-slate-500

        // Accent colors - iOS blue gradient
        accentGradientStart: "#0A84FF",
        accentGradientEnd: "#0051C7",
        accentText: "#FFFFFFFF",
        accentShadowColor: "#260A84FF",

        // Interactive states
        hoverBackground: "#08000000",          // hover:bg-black/[0.03]
        activeBackground: "#0A000000",         // active state
        hoverText: "#0F172A",
        dividerColor: "#0D000000",             // border-black/5

        // Sidebar specific
        sidebarActiveBackground: "#0A000000",  // bg-black/[0.04]
        sidebarActiveShadow: "#0D000000",      // shadow-black/5
        subtleHoverBackground: "#0D000000",    // hover:bg-black/5

        // Status colors
        successColor: "#10B981",               // green-500
        successBadgeBackground: "#1F10B981",   // bg-green-400/12
        successBadgeBorder: "#3310B981",       // border-green-400/20
        offlineBadgeBackground: "#08FFFFFF",   // bg-white/[0.03]
        offlineBadgeBorder: "#1AFFFFFF",       // border-white/10
        offlineBadgeText: "#94A3B8",           // text-slate-400
        dangerText: "#F87171",                 // red-400
        dangerBackground: "#FEE2E2",           // red-50
        dangerBorder: "#FCA5A5",               // red-300

        // Misc
        neutralBadgeBackground: "#0D000000",
        scrollGradientColor: "#0D000000",
        orangeAccent: "#FB923C",               // orange-400
        orangeBackground: "#FFF3E6",
        purpleAccent: "#A855F7",               // purple-500
        yellowAccent: "#FBBF24"                // yellow-400
    })

    readonly property var darkTokens: ({
        // Backgrounds - matching React's radial gradient & transparency
        backgroundGradientStart: "#66505057",  // rgba(80,80,90,0.4)
        backgroundGradientEnd: "#E60A0A0C",    // rgba(10,10,12,0.9)
        backgroundOverlay: "#FF0A0A0C",
        panelBackground: "#0AFFFFFF",          // bg-white/[0.04]
        panelBorderColor: "#1AFFFFFF",         // border-white/10
        cardBackground: "#0DFFFFFF",           // bg-white/[0.05]
        cardBorderColor: "#1AFFFFFF",          // border-white/10
        cardShadowColor: "#CC000000",          // shadow rgba(0,0,0,0.8)

        // Text colors - slate scale
        textPrimary: "#F1F5F9",                // text-slate-100
        textSecondary: "#94A3B8",              // text-slate-400

        // Accent colors - iOS blue gradient
        accentGradientStart: "#0A84FF",
        accentGradientEnd: "#0051C7",
        accentText: "#FFFFFFFF",
        accentShadowColor: "#330A84FF",

        // Interactive states
        hoverBackground: "#12FFFFFF",          // hover:bg-white/[0.07]
        activeBackground: "#14FFFFFF",         // active state
        hoverText: "#F8FAFC",
        dividerColor: "#1AFFFFFF",             // border-white/10

        // Sidebar specific
        sidebarActiveBackground: "#14FFFFFF",  // bg-white/[0.08]
        sidebarActiveShadow: "#66000000",      // shadow-black/40
        subtleHoverBackground: "#1AFFFFFF",    // hover:bg-white/10

        // Status colors
        successColor: "#34D399",               // green-400
        successBadgeBackground: "#1F10B981",   // bg-green-400/12
        successBadgeBorder: "#3334D399",       // border-green-400/20
        offlineBadgeBackground: "#08FFFFFF",   // bg-white/[0.03]
        offlineBadgeBorder: "#1AFFFFFF",       // border-white/10
        offlineBadgeText: "#94A3B8",           // text-slate-400
        dangerText: "#F87171",                 // red-400
        dangerBackground: "#1AF87171",         // red with opacity
        dangerBorder: "#33F87171",             // red border

        // Misc
        neutralBadgeBackground: "#08FFFFFF",
        scrollGradientColor: "#0DFFFFFF",
        orangeAccent: "#FB923C",               // orange-400
        orangeBackground: "#1AFB923C",
        purpleAccent: "#A855F7",               // purple-400
        yellowAccent: "#FBBF24"                // yellow-400
    })

    function tokens(darkMode) {
        return darkMode ? darkTokens : lightTokens;
    }
}
