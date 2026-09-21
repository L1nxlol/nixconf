import QtQuick
import "../../"
import "../../Services"

Rectangle {
  anchors.left: parent.left
  anchors.verticalCenter: parent.verticalCenter
  color: Theme.border
  radius: 20
  height: 24
  width: 58

  Timer {
    interval: 100000 
    onTriggered: {
      const total = 21081600
      const end = 1809302400
      const now = Date.now() / 1000
      const pct = Math.min(100, Math.max(0, (1 - (end - now) / total) * 100))
      countDown.text = "   " +  pct.toFixed(1) + "%"
    }
    running: true
    repeat: true 
  }

  Icon{
    // anchors.left: parent.left
    family: Theme.font
    size: 24
    color: Theme.highlight
    anchors.topMargin: 4
    anchors.leftMargin: 10

    icon: ""
  }

  Text {
    anchors.left: parent.left
    id: countDown 
    text: {
      const total = 21081600
      const end = 1809302400
      const now = Date.now() / 1000
      const pct = Math.min(100, Math.max(0, (1 - (end - now) / total) * 100))
      countDown.text = "   " + pct.toFixed(1) + "%"
    }   
    color: Theme.highlight
    font.family: Theme.font
    font.pixelSize: 12
    anchors.centerIn: parent
  }
}

