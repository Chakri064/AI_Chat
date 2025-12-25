import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

Rectangle {
    id: popup
    width: parent.width
    height: 200
    color: Theme.card
    border.color: Theme.border
    radius: 10
    visible: false
    z: 10

    signal emojiSelected(string emoji)

    GridView {
        id: emojiGrid
        anchors.fill: parent
        anchors.margins: 8
        cellWidth: 40
        cellHeight: 40
        model: ["😀","😃","😄","😁","😆","😅","😂","🤣","😊","😇",
                "🙂","🙃","😉","😌","😍","🥰","😘","😗","😙","😚",
                "😋","😛","😝","😜","🤪","🤨","🧐","🤓","😎","🤩"]
        delegate: ToolButton {
            text: modelData
            font.pixelSize: 24
            background: Rectangle { color: "transparent" }
            onClicked: {
                emojiSelected(text)
                popup.visible = false
            }
        }
    }

    function open() {
        popup.visible = true
    }

    function close() {
        popup.visible = false
    }
}
