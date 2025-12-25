import QtQuick 2.15
import AppTheme 1.0

Item {
    id: bubbleWrapper
    property alias text: bubbleText.text
    property alias time: bubbleTime.text
    property bool isUser: false
    property int maxWidth: 400

    // Width fits to content but limited by maxWidth
    implicitWidth: Math.min(bubbleColumn.implicitWidth + 20, maxWidth)
    implicitHeight: bubbleColumn.implicitHeight + 12

    Row {
        anchors.fill: parent
        spacing: 0
        // Align based on sender
        layoutDirection: isUser ? Qt.RightToLeft : Qt.LeftToRight

        Rectangle {
            id: bubble
            radius: 10
            color: isUser ? Theme.bubbleMine : Theme.bubbleBot
            width: bubbleWrapper.implicitWidth
            height: bubbleWrapper.implicitHeight

            Column {
                id: bubbleColumn
                anchors.fill: parent
                anchors.margins: 10
                spacing: 4

                Text {
                    id: bubbleText
                    wrapMode: Text.Wrap
                    textFormat: Text.PlainText
                    color: Theme.text
                    font.pixelSize: 14
                    width: bubbleWrapper.maxWidth - 20
                }

                Text {
                    id: bubbleTime
                    font.pixelSize: 10
                    color: Theme.subtext
                    horizontalAlignment: Text.AlignRight
                    width: bubbleWrapper.maxWidth - 20
                }
            }
        }
    }
}
