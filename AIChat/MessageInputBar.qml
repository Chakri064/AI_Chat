import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts

Rectangle {
    id: inputBar
    property alias text: field.text
    signal send()

    radius: 12
    color: Theme.inputBg
    border.color: Theme.border
    height: 56

    Row {
        anchors.fill: parent
        anchors.margins: 8
        spacing: 8

        TextField {
            id: field
            placeholderText: "Type a message..."
            font.pixelSize: 14
            color: Theme.text
            background: null
            anchors.verticalCenter: parent.verticalCenter
            Layout.fillWidth: true
            Keys.onReturnPressed: inputBar.send()
        }

        Button {
            text: "Send"
            onClicked: inputBar.send()
        }
    }
}
