import QtQuick
import "../.."
import "../../Services"

Rectangle {
  id: root
  required property var notif  
  
  color: Theme.dark
  border.width: 3
  border.color: Theme.border
  radius: 8
  implicitHeight: col.implicitHeight + 16

  Column {
    id: col
    anchors.fill: parent
    anchors.margins: 8
    spacing: 4

    Text {
      text: (root.notif.appName + ": " + root.notif.summary)
      font.family: Theme.font
      font.bold: true
      color: Theme.text
    }
    Text {
      visible: root.notif.body.length > 0
      text: root.notif.body
      font.family: Theme.font
      color: Theme.text
      wrapMode: Text.WordWrap
      width: parent.width
    }
  }
}
