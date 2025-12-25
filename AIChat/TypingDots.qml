import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15


Row {
    id: root
    spacing: 4
    property color dotColor: Theme.subtext
    Repeater {
        model: 3
        Rectangle {
            width: 6; height: 6; radius: 3
            color: root.dotColor
            SequentialAnimation on opacity {
                loops: Animation.Infinite
                running: true
                NumberAnimation { from: 0.2; to: 1.0; duration: 500; easing.type: Easing.InOutQuad }
                NumberAnimation { from: 1.0; to: 0.2; duration: 500; easing.type: Easing.InOutQuad }
                onStopped: parent.opacity = 1
            }
            anchors.verticalCenter: parent.verticalCenter
        }
    }
}
