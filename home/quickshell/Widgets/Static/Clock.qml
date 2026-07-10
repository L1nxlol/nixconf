import QtQuick
import "../../"

Column {
  Timer {
    interval: 1000 
    onTriggered: {
      timeHM.text = Qt.formatDateTime(new Date(), "hh:mm")
      timeS.text = Qt.formatDateTime(new Date(), "ss")
    }
    running: true
    repeat: true 
  }

  Text {
    id: timeHM 
    text: Qt.formatDateTime(new Date(), "hh:mm")
    color: Theme.text 
    font.family: Theme.font
    font.pixelSize: 14
    anchors.horizontalCenter: parent.horizontalCenter
  }

  Text {
    id: timeS
    text: Qt.formatDateTime(new Date(), "ss")
    color: Theme.text 
    font.family: Theme.font
    font.pixelSize: 10
    anchors.horizontalCenter: parent.horizontalCenter
  }

  spacing: -3
}
