import QtQuick
import "../.."

Item {
    id: root

    ListView {
        anchors.fill: parent
        spacing: 6
        model: NotifServer.history   // reads directly off the singleton
        delegate: NotifEntry {
            width: ListView.view.width
            notif: modelData
        }
    }
}
