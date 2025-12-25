// import QtQuick 2.15
// pragma Singleton

// QtObject {
//     id: theme

//     // Default to dark mode, but can be changed dynamically
//     property bool dark: true

//     // Colors automatically update when dark changes
//     readonly property color bg: dark ? "#111318" : "#FAFAFA"
//     readonly property color card: dark ? "#1A1C23" : "#FFFFFF"
//     readonly property color text: dark ? "#EDEDED" : "#1F2937"   // White in dark, dark in light
//     readonly property color subtext: dark ? "#9CA3AF" : "#4B5563"
//     readonly property color accent: dark ? "#6EE7B7" : "#0EA5E9"
//     readonly property color bubbleMine: dark ? "#2563EB" : "#DBEAFE"
//     readonly property color bubbleBot: dark ? "#374151" : "#E5E7EB"
//     readonly property color inputBg: dark ? "#0B0D12" : "#F3F4F6"
//     readonly property color border: dark ? "#2A2F3A" : "#E5E7EB"
// }
import QtQuick 2.15
pragma Singleton

QtObject {
    id: theme
    property bool dark: true

    readonly property color bg: dark ? "#111318" : "#FAFAFA"
    readonly property color card: dark ? "#1A1C23" : "#FFFFFF"
    readonly property color text: dark ? "#EDEDED" : "#1F2937"
    readonly property color subtext: dark ? "#9CA3AF" : "#4B5563"
    readonly property color bubbleMine: dark ? "#2563EB" : "#DBEAFE"
    readonly property color bubbleBot: dark ? "#374151" : "#E5E7EB"
    readonly property color inputBg: dark ? "#0B0D12" : "#F3F4F6"
    readonly property color border: dark ? "#2A2F3A" : "#E5E7EB"
}
