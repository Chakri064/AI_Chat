// import QtQuick 2.15
// import QtQuick.Controls 2.15
// import QtQuick.Layouts 1.15
// import AppTheme 1.0

// ApplicationWindow {
//     id: window
//     width: 950
//     height: 700
//     visible: true
//     title: "RudrAI Text"
//     color: Theme.bg

//     // ================= Splash Screen =================
//     Rectangle {
//         id: splash
//         anchors.fill: parent
//         color: "#1B1B1B"
//         z: 1000

//         Label {
//             anchors.centerIn: parent
//             text: "RudrAI"
//             font.pixelSize: 48
//             font.bold: true
//             color: "#00BFFF"
//         }

//         Behavior on opacity { NumberAnimation { duration: 500 } }
//     }

//     Timer {
//         interval: 8000  // 2 seconds splash
//         running: true
//         repeat: false
//         onTriggered: {
//             splash.opacity = 0
//             splash.visible = false
//         }
//     }
//     // ================================================

//     header: ToolBar {
//         contentHeight: 56
//         background: Rectangle { color: Theme.card; border.color: Theme.border }

//         RowLayout {
//             anchors.fill: parent
//             spacing: 12
//             anchors.leftMargin: 12
//             anchors.rightMargin: 12  // balanced margins

//             Label {
//                 text: "🤖 RudrAI"
//                 color: Theme.text
//                 font.bold: true
//                 font.pixelSize: 20
//             }

//             Item { Layout.fillWidth: true }

//             Switch {
//                 id: themeSwitch
//                 checked: Theme.dark
//                 onToggled: Theme.dark = checked
//             }

//             Label {
//                 id: modeLabel
//                 text: Theme.dark ? "Light" : "Dark"
//                 color: Theme.text
//                 font.pixelSize: 14
//             }

//             ToolButton {
//                 font.pixelSize: 14
//                 onClicked: Chat.clear()
//                 Layout.alignment: Qt.AlignVCenter
//                 contentItem: Text {
//                     text: "Clear 🗑️"
//                     color: Theme.text
//                     font.pixelSize: 14
//                     verticalAlignment: Text.AlignVCenter
//                     horizontalAlignment: Text.AlignHCenter
//                 }
//             }
//         }

//         Connections {
//             target: Theme
//             function onDarkChanged() {
//                 modeLabel.text = Theme.dark ? "Light" : "Dark"
//             }
//         }
//     }

//     ColumnLayout {
//         anchors.fill: parent
//         anchors.margins: 10
//         spacing: 6

//         // Chat Area
//         Rectangle {
//             Layout.fillWidth: true
//             Layout.fillHeight: true
//             radius: 10
//             color: Theme.card
//             border.color: Theme.border

//             ListView {
//                 id: chatList
//                 anchors.fill: parent
//                 model: Chat.model
//                 spacing: 10
//                 clip: true

//                 delegate: ChatBubble {
//                     text: model.text
//                     time: model.time
//                     isUser: model.sender === "user"
//                     maxWidth: chatList.width * 1.0 // reduce extra right space
//                 }

//                 onCountChanged: positionViewAtEnd()
//             }
//         }

//         // Input Area
//         Rectangle {
//             Layout.fillWidth: true
//             Layout.preferredHeight: 70
//             radius: 35
//             color: Theme.inputBg
//             border.color: Theme.border

//             RowLayout {
//                 anchors.fill: parent
//                 anchors.leftMargin: 12
//                 anchors.rightMargin: 12
//                 anchors.topMargin: 8
//                 anchors.bottomMargin: 8
//                 spacing: 10

//                 TextField {
//                     id: inputField
//                     Layout.fillWidth: true
//                     placeholderText: "Type a message..."
//                     color: Theme.text
//                     placeholderTextColor: Theme.dark ? "#888888" : "#444444"
//                     font.pixelSize: 16
//                     wrapMode: Text.Wrap
//                     Keys.onReturnPressed: sendMessage()
//                     background: Rectangle { color: "transparent" }
//                 }

//                 ToolButton {
//                     id: emojiButton
//                     width: 48
//                     height: 48
//                     font.pixelSize: 22
//                     onClicked: emojiPopup.open()
//                     background: Rectangle {
//                         color: Theme.dark ? "#3C3C3C" : "#EDEDED"
//                         radius: 24
//                     }
//                     contentItem: Text {
//                         text: "😊"
//                         color: Theme.dark ? "#EDEDED" : "#333333"
//                         font.pixelSize: 22
//                         verticalAlignment: Text.AlignVCenter
//                         horizontalAlignment: Text.AlignHCenter
//                     }
//                 }

//                 ToolButton {
//                     id: sendButton
//                     width: 60
//                     height: 60
//                     font.pixelSize: 22
//                     onClicked: sendMessage()
//                     background: Rectangle {
//                         radius: 30
//                         color: Theme.dark ? "#2563EB" : "#3B82F6"
//                     }
//                     contentItem: Text {
//                         text: "➤"
//                         color: Theme.dark ? "#EDEDED" : "#FFFFFF"
//                         font.pixelSize: 22
//                         verticalAlignment: Text.AlignVCenter
//                         horizontalAlignment: Text.AlignHCenter
//                     }
//                 }
//             }

//             Popup {
//                 id: emojiPopup
//                 width: 320
//                 height: 200
//                 modal: true
//                 focus: true

//                 GridLayout {
//                     anchors.fill: parent
//                     columns: 8
//                     Repeater {
//                         model: ["😀","😃","😄","😁","😆","😅","😂","🤣",
//                                 "😊","😇","🙂","🙃","😉","😌","😍","🥰",
//                                 "😘","😗","😙","😚","😋","😛","😜","🤪",
//                                 "😎","🤩","🥳","😏","😒","😞","😔","😟"]
//                         Button {
//                             text: modelData
//                             font.pixelSize: 20
//                             onClicked: {
//                                 inputField.text += modelData
//                                 inputField.forceActiveFocus()
//                                 emojiPopup.close()
//                             }
//                         }
//                     }
//                 }
//             }
//         }
//     }

//     // Send message function
//     function sendMessage() {
//         if (inputField.text.length > 0) {
//             Chat.sendUserMessage(inputField.text)
//             inputField.text = ""
//         }
//     }

//     // Smooth Theme Transition
//     Behavior on color { ColorAnimation { duration: 300 } }
// }

import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import AppTheme 1.0

ApplicationWindow {
    id: window
    width: 950
    height: 700
    visible: true
    title: "RudrAI Text"
    color: Theme.bg

    // ================= Splash Screen =================
    Rectangle {
        id: splash
        anchors.fill: parent
        color: "#1B1B1B"
        z: 1000

        Label {
            anchors.centerIn: parent
            text: "RudrAI"
            font.pixelSize: 48
            font.bold: true
            color: "#00BFFF"
        }

        Behavior on opacity { NumberAnimation { duration: 500 } }
    }

    Timer {
        interval: 2000  // 2 seconds splash
        running: true
        repeat: false
        onTriggered: {
            splash.opacity = 0
            splash.visible = false
        }
    }
    // ================================================

    header: ToolBar {
        contentHeight: 56
        background: Rectangle { color: Theme.card; border.color: Theme.border }

        RowLayout {
            anchors.fill: parent
            spacing: 12
            anchors.leftMargin: 12
            anchors.rightMargin: 12

            Label {
                text: "🤖 RudrAI"
                color: Theme.text
                font.bold: true
                font.pixelSize: 20
            }

            Item { Layout.fillWidth: true }

            Switch {
                id: themeSwitch
                checked: Theme.dark
                onToggled: Theme.dark = checked
            }

            Label {
                id: modeLabel
                text: Theme.dark ? "Light" : "Dark"
                color: Theme.text
                font.pixelSize: 14
            }

            ToolButton {
                font.pixelSize: 14
                onClicked: Chat.clear()
                Layout.alignment: Qt.AlignVCenter
                contentItem: Text {
                    text: "Clear 🗑️"
                    color: Theme.text
                    font.pixelSize: 14
                    verticalAlignment: Text.AlignVCenter
                    horizontalAlignment: Text.AlignHCenter
                }
            }
        }

        Connections {
            target: Theme
            function onDarkChanged() {
                modeLabel.text = Theme.dark ? "Light" : "Dark"
            }
        }
    }

    ColumnLayout {
        anchors.fill: parent
        anchors.margins: 10
        spacing: 6

        // Chat Area
        Rectangle {
            Layout.fillWidth: true
            Layout.fillHeight: true
            radius: 10
            color: Theme.card
            border.color: Theme.border

            ListView {
                id: chatList
                anchors.fill: parent
                model: Chat.model
                spacing: 10
                clip: true

                delegate: ChatBubble {
                    text: model.text
                    time: model.time
                    isUser: model.sender === "user"
                    maxWidth: chatList.width * 1.0
                }

                onCountChanged: positionViewAtEnd()
            }
        }

        // Input Area
        Rectangle {
            Layout.fillWidth: true
            Layout.preferredHeight: 70
            radius: 35
            color: Theme.inputBg
            border.color: Theme.border

            RowLayout {
                anchors.fill: parent
                anchors.leftMargin: 12
                anchors.rightMargin: 12
                anchors.topMargin: 8
                anchors.bottomMargin: 8
                spacing: 10

                // Text Input
                TextField {
                    id: inputField
                    Layout.fillWidth: true
                    placeholderText: "Type a message..."
                    color: Theme.text
                    placeholderTextColor: Theme.dark ? "#888888" : "#444444"
                    font.pixelSize: 16
                    wrapMode: Text.Wrap
                    Keys.onReturnPressed: sendMessage()
                    background: Rectangle { color: "transparent" }
                }

                // Emoji Button
                ToolButton {
                    id: emojiButton
                    width: 48
                    height: 48
                    font.pixelSize: 22
                    onClicked: emojiPopup.open()
                    background: Rectangle {
                        color: Theme.dark ? "#3C3C3C" : "#EDEDED"
                        radius: 24
                    }
                    contentItem: Text {
                        text: "😊"
                        color: Theme.dark ? "#EDEDED" : "#333333"
                        font.pixelSize: 22
                        verticalAlignment: Text.AlignVCenter
                        horizontalAlignment: Text.AlignHCenter
                    }
                }

                // Microphone Button
                ToolButton {
                    id: micButton
                    width: 48
                    height: 48
                    font.pixelSize: 22
                    onClicked: VoiceEngine.startListening()
                    background: Rectangle {
                        color: Theme.dark ? "#3C3C3C" : "#EDEDED"
                        radius: 24
                    }
                    contentItem: Text {
                        text: "🎙️"
                        color: Theme.dark ? "#EDEDED" : "#333333"
                        font.pixelSize: 22
                        verticalAlignment: Text.AlignVCenter
                        horizontalAlignment: Text.AlignHCenter
                    }
                }

                // Send Button
                ToolButton {
                    id: sendButton
                    width: 60
                    height: 60
                    font.pixelSize: 22
                    onClicked: sendMessage()
                    background: Rectangle {
                        radius: 30
                        color: Theme.dark ? "#2563EB" : "#3B82F6"
                    }
                    contentItem: Text {
                        text: "➤"
                        color: Theme.dark ? "#EDEDED" : "#FFFFFF"
                        font.pixelSize: 22
                        verticalAlignment: Text.AlignVCenter
                        horizontalAlignment: Text.AlignHCenter
                    }
                }
            }

            // Emoji Popup
            Popup {
                id: emojiPopup
                width: 320
                height: 200
                modal: true
                focus: true

                GridLayout {
                    anchors.fill: parent
                    columns: 8
                    Repeater {
                        model: ["😀","😃","😄","😁","😆","😅","😂","🤣",
                                "😊","😇","🙂","🙃","😉","😌","😍","🥰",
                                "😘","😗","😙","😚","😋","😛","😜","🤪",
                                "😎","🤩","🥳","😏","😒","😞","😔","😟"]
                        Button {
                            text: modelData
                            font.pixelSize: 20
                            onClicked: {
                                inputField.text += modelData
                                inputField.forceActiveFocus()
                                emojiPopup.close()
                            }
                        }
                    }
                }
            }
        }
    }

    // Send message function
    function sendMessage() {
        if (inputField.text.length > 0) {
            Chat.sendUserMessage(inputField.text)
            inputField.text = ""
        }
    }

    // Connect VoiceEngine signals
    Connections {
        target: VoiceEngine
        function onListeningStarted() {
            console.log("Voice Listening started")
        }
        function onListeningStopped() {
            console.log("Voice Listening stopped")
        }
        function onSpeechRecognized(text) {
            console.log("Recognized text: " + text)
        }
    }

    // Smooth Theme Transition
    Behavior on color { ColorAnimation { duration: 300 } }
}
